0//
//  AdConfiguration.swift
//  AdsKit
//
//  Created by AnhPT on 02/07/2026.
//

import Foundation

/// The set of ad unit identifiers an app uses. Keep production IDs out of source
/// control where you can; Google's public test IDs are provided for development.
public struct AdConfiguration: Sendable {
    public var appOpenID: String?
    public var bannerID: String?
    public var interstitialID: String?
    public var rewardedID: String?

    public init(
        appOpenID: String? = nil,
        bannerID: String? = nil,
        interstitialID: String? = nil,
        rewardedID: String? = nil
    ) {
        self.appOpenID = appOpenID
        self.bannerID = bannerID
        self.interstitialID = interstitialID
        self.rewardedID = rewardedID
    }

    /// Google's official sample unit IDs — safe to use while developing.
    public static let test = AdConfiguration(
        appOpenID: "ca-app-pub-3940256099942544/5575463023",
        bannerID: "ca-app-pub-3940256099942544/2934735716",
        interstitialID: "ca-app-pub-3940256099942544/4411468910",
        rewardedID: "ca-app-pub-3940256099942544/1712485313"
    )
}
