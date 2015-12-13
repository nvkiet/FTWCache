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
 
License
--
This project is released under the MIT license. See LICENSE.md
