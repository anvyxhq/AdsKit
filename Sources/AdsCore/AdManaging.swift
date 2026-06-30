//
//  AdManaging.swift
//  AdsKit
//
//  Created by AnhPT on 02/07/2026.
//

import SwiftUI

/// The reward returned when a user finishes a rewarded ad.
public struct AdReward: Sendable, Equatable {
    public let amount: Int
    public let type: String
    public init(amount: Int, type: String) {
        self.amount = amount
        self.type = type
    }
}

/// Provider-agnostic ads surface. The app depends on this protocol; a concrete
/// adapter (e.g. Google Mobile Ads) lives behind it, so screens stay SDK-free.
@MainActor
public protocol AdManaging: AnyObject {
    /// Whether ads should be shown at all (turn off for premium users).
    var isEnabled: Bool { get set }

    func start()

    func loadInterstitial() async
    /// Returns `true` if an interstitial was actually presented.
    @discardableResult
    func showInterstitial() async -> Bool

    func loadRewarded() async
    /// Presents a rewarded ad; returns the reward if the user earned it.
    func showRewarded() async -> AdReward?
}

/// No-op implementation used when ads are disabled (premium) or before wiring an
/// SDK. Lets you ship UI that calls the ad API without crashing.
@MainActor
public final class NullAdsManager: AdManaging {
    public var isEnabled: Bool = false
    public init() {}
    public func start() {}
    public func loadInterstitial() async {}
    public func showInterstitial() async -> Bool { false }
    public func loadRewarded() async {}
    public func showRewarded() async -> AdReward? { nil }
}
