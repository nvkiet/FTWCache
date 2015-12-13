# FTWCache
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
