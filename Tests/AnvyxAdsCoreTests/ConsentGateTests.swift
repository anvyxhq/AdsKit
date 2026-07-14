//
//  ConsentGateTests.swift
//  AdsKit
//
//  Created by AnhPT on 14/07/2026.
//

import XCTest
import SwiftUI
@testable import AnvyxAdsCore

@MainActor
final class ConsentGateTests: XCTestCase {
    func testConstructsWithNullManager() {
        _ = ConsentGate(NullConsentManager()) {
            Text("Ad")
        }
        XCTAssertEqual(NullConsentManager().status, .notRequired)
    }

    func testNullManagerCanRequestAds() {
        XCTAssertTrue(NullConsentManager().canRequestAds)
    }
}
