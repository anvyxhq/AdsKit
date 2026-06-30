# AdsKit

A provider-agnostic advertising layer for iOS. `AdsCore` defines the abstraction — screens depend on a protocol, not on an ad SDK — so you can plug in Google Mobile Ads (or any network) behind it and toggle ads off for premium users.

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/iOS-16%2B-blue.svg)](https://developer.apple.com/ios/)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)

## Features

- **`AdManaging`** — the ads surface: interstitial, rewarded, and an `isEnabled` switch.
- **`NullAdsManager`** — a no-op implementation for premium users or pre-integration.
- **`AdConfiguration`** — ad unit IDs, including Google's public test IDs.
- **`BannerAdView`** — a SwiftUI host for an SDK-supplied banner `UIView`.

## Installation

```swift
.package(url: "https://github.com/anvyxhq/AdsKit.git", from: "1.0.0")
```

## Usage

```swift
import AdsCore

// Inject NullAdsManager for premium users, or your Google adapter otherwise.
let ads: AdManaging = purchases.hasActiveEntitlement ? NullAdsManager() : myGoogleAdsManager
ads.start()

await ads.loadInterstitial()
await ads.showInterstitial()

if let reward = await ads.showRewarded() {
    grant(reward.amount)
}
```

## Adding a concrete adapter

Conform to `AdManaging` in a small adapter that imports the
[Google Mobile Ads SDK](https://github.com/googleads/swift-package-manager-google-mobile-ads),
and host the banner via `BannerAdView { /* return GADBannerView */ }`. Keeping the SDK in
the adapter (or the app) means the rest of your codebase only ever sees `AdsCore`.

## Requirements

- iOS 17.0+ · Swift 5.9+

## License

MIT
