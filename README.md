# BlockstackBrowser-ios

A prototype version of the full native blockstack browser for iOS. While only considered a prototype in its current stage it does incorporate the following:

- a basic UI mocking the web blockstack browser
- the ability for 3rd party applications to request authorization through this app, using the BlockstackCoreApi Pod (see https://github.com/BedKin/BlockstackCoreApi-iOS)
- a simple user search mechanism to call the blockstack core api and search for and display existing users through the Blockstack Core API pod

##XCode 9 warning

This app is written in Swift 4 and must be run with Xcode 9+ (currently in beta see developer.apple.com/ios to download)

 Note: If you get errors compiling alamofire, this is due to the beta status. To resolve these errors, select your podfile and modify alamo fire target to build with swift 3.2
