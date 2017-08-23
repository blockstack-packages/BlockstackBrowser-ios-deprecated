# BlockstackBrowser-ios

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
