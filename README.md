# BlockstackBrowser-ios

**This package is deprecated and will no longer work with the modern Blockstack platform.**

Please use the [official Blockstack iOS SDK](https://github.com/blockstack/blockstack-ios).

An alpha version of the full native blockstack browser for iOS. This version of the browser incorporates most of the functionality from the web version of blockstack browser. The big difference between this version and the web is that data is persisted locally rather than on-chain.

## What works:
- UI for most core functionality
- Private key / mnenonic / public key / address generation
- Login persistence by saving password encrypted version of user's passphrase to the user's keychain (non-transferable to other devices)
- Profile creation, editing and persistence
- Blockstack user search and display with external links
- the ability for 3rd party applications to request authorization through this app, using the BlockstackCoreApi Pod (see https://github.com/BedKin/BlockstackCoreApi-iOS) and return the user's profile
- File storage provider authorization (dropbox, google drive, amazon cloud drive)
- Onboarding and account restoration
- Account functions: delete, backup, restore, change password
- Verify user password and retrieve passphrase and calculate private key for transaction signing
- QR Code generation and scanning for send / receive addresses
- BTC to USD price converter

## What's missing:
- ability to check user's wallet BTC balance
- ability to send funds
- id name registration
- linking of external accounts (facebook, twitter, github)
- generating and returning temporary restricted file provider tokens for 3rd party app logins to write to storage
- reading and writing profile's to chain
- writing external provider keys to chain
- "Api Settings" page

## XCode 9 warning

This app is written in Swift 4 and must be run with Xcode 9+ (currently in beta see developer.apple.com/ios to download)

## Alamofire build error

Because the dropbox sdk references a specific version of alamofire that is not compatible with swift 4, we must make a small change after running our pod install to get past a compile error in Alamofire's sdk.

- After running pod install and installing pods, open BlockstackBrowser.xcworkspace in Xcode9
- From the Project / File explorer on the left pane, select the Pods project, this will reveal all of the Pod targets, which are all of the pod libraries installed in the Browser.
- we need to customize the build seeings for the Alamofire library and get it to compile it with Swift 3.2, a backwards compatible version of swift 4. Start by selecting the AlamoFire library target.
- then select the build settings tab and use the search bar below it to search for the swift language version setting. Set it to Swift 3.2


