# ``AnvyxAdsCore``

The vendor-neutral ads **core**: protocols and value types for showing ads and
managing consent, with no SDK dependency. Concrete network adapters (e.g. Google
Mobile Ads) live in a separate package.

## Overview

Program against ``AdManaging`` / ``ConsentManaging`` / ``AppOpenAdManaging`` so the
app never imports an ad SDK directly. Inject a real adapter in production, or the
``NullAdsManager`` / ``NullConsentManager`` no-ops in previews and tests.

```swift
let ads: any AdManaging = NullAdsManager()   // swap for the GMA adapter in the app
BannerAdView(makeBanner: adapter.makeBanner)
```

## Topics

### Ads
- ``AdManaging``
- ``AppOpenAdManaging``
- ``AdConfiguration``
- ``AdFormat``
- ``AdFrequencyCap``
- ``AdReward``
- ``AdEvent``
- ``BannerAdView``
- ``NullAdsManager``

### Consent
- ``ConsentManaging``
- ``ConsentStatus``
- ``NullConsentManager``
