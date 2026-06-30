0//
//  BannerAdView.swift
//  AdsKit
//
//  Created by AnhPT on 02/07/2026.
//

import SwiftUI

/// A SwiftUI wrapper that hosts a banner `UIView` supplied by your ad adapter,
/// keeping AdsCore free of any SDK import.
///
/// ```swift
/// BannerAdView { GoogleBannerFactory.make(unitID: id) }
///     .frame(height: 50)
/// ```
public struct BannerAdView: UIViewRepresentable {
    private let makeBanner: () -> UIView

    public init(makeBanner: @escaping () -> UIView) {
        self.makeBanner = makeBanner
    }

    public func makeUIView(context: Context) -> UIView {
        makeBanner()
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}
