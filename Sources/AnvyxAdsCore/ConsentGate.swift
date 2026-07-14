//
//  ConsentGate.swift
//  AdsKit
//
//  Created by AnhPT on 14/07/2026.
//

#if canImport(SwiftUI)
import SwiftUI

/// Drives a GDPR/UMP consent flow through any ``ConsentManaging``: on appear it
/// requests consent (presenting the form when required) and only shows `content`
/// once ads may be requested, rendering `placeholder` while it resolves.
///
/// ```swift
/// ConsentGate(consentManager) {
///     BannerAdView(...)          // shown once canRequestAds
/// }
/// ```
@MainActor
public struct ConsentGate<Content: View, Placeholder: View>: View {
    private let manager: any ConsentManaging
    private let content: () -> Content
    private let placeholder: () -> Placeholder
    @State private var resolved = false

    public init(
        _ manager: any ConsentManaging,
        @ViewBuilder content: @escaping () -> Content,
        @ViewBuilder placeholder: @escaping () -> Placeholder = { ProgressView() }
    ) {
        self.manager = manager
        self.content = content
        self.placeholder = placeholder
    }

    public var body: some View {
        Group {
            if resolved { content() } else { placeholder() }
        }
        .task {
            if manager.status == .unknown || manager.status == .required {
                _ = await manager.requestConsent()
            }
            resolved = true
        }
    }
}

public extension View {
    /// Re-present the consent form (e.g. from a "Privacy options" button).
    func requestConsentAction(_ manager: any ConsentManaging) -> some View {
        // Convenience so call sites don't need their own Task boilerplate.
        modifier(RequestConsentModifier(manager: manager))
    }
}

private struct RequestConsentModifier: ViewModifier {
    let manager: any ConsentManaging
    func body(content: Content) -> some View {
        content.onTapGesture { Task { _ = await manager.requestConsent() } }
    }
}
#endif
