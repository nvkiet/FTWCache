# FTWCache

[![Swift 2.1](https://img.shields.io/badge/Swift-2.1-orange.svg?style=flat)](https://developer.apple.com/swift/)
[![Platforms iOS](https://img.shields.io/badge/Platforms-iOS-lightgray.svg?style=flat)](https://developer.apple.com/swift/)
[![License MIT](https://img.shields.io/badge/License-MIT-lightgrey.svg?style=flat)](https://opensource.org/licenses/MIT)

FTWCache is a small utility library to support caching data locally so we can pull them when we need them. The [original repo](https://github.com/FTW/FTWCache) is written in objective-c by [@khanlou](https://twitter.com/khanlou). So I want to port the code to [swift 2](https://developer.apple.com/swift/) and support to install the library via [CocoaPods](http://cocoapods.org).

## Usage

FTWCache has two class methods for setting and retrieving data:

```swift
class func setObject(data: NSData, forKey key:String)
```

and

```swift
class func objectForKey(key: String) -> NSData?
```
and you can reset the cache with

```swift
class func resetCache()
```

It stores the files in your Caches folder in its own folder. The default expiration time is 7 days, but you can modify that if you need. 

It takes NSData objects, so anything you can format in that way (audio files, images, simple text) can be store in the cache. Note also that the system will also periodically flush the Caches folders of apps if it finds it needs more space.

## Installation

FTWCache is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FTWCache"
```

## Author

Kiet Nguyen - iOS blogger at http://vankiet.com/

## License

FTWCache is released under the MIT license. See LICENSE.md
