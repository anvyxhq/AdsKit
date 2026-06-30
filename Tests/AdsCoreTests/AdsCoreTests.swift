//
//  AdsCoreTests.swift
//  AdsKit
//
//  Created by AnhPT on 02/07/2026.
//

import XCTest
@testable import AdsCore

@MainActor
final class AdsCoreTests: XCTestCase {
    func testTestConfigHasUnits() {
        XCTAssertNotNil(AdConfiguration.test.bannerID)
        XCTAssertNotNil(AdConfiguration.test.interstitialID)
    }

    func testNullManagerNeverShows() async {
        let manager = NullAdsManager()
        let shown = await manager.showInterstitial()
        XCTAssertFalse(shown)
        let reward = await manager.showRewarded()
        XCTAssertNil(reward)
    }
}
