# FTWCache
FTWCache is a small utility libray to support caching data in the disk so you can pull them when you need. The [original repo](https://github.com/FTW/FTWCache) is written in objective-c by [@khanlou](https://twitter.com/khanlou).  It has two class methods for setting and retrieving data:

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

Kiet Nguyen, nguyenvankiet.teaching@gmail.com

## License

FTWCache is released under the MIT license. See LICENSE.md
