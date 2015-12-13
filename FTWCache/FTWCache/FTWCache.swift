//
//  FTWCache.swift
//  FTWCache
//
//  Created by Kiet Nguyen on 12/13/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import UIKit

class FTWCache: NSObject {
    static let cacheTime: Double = 604800
    
    class func resetCache() {
        do {
            try NSFileManager.defaultManager().removeItemAtPath(FTWCache.cacheDirectory())
        } catch {
        }
    }
    
    private class func cacheDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        var cacheDirectory = paths[0]
        cacheDirectory = (cacheDirectory as NSString).stringByAppendingPathComponent("FTWCaches")
        return cacheDirectory
    }
    
    class func objectForKey(key: String) -> NSData? {
        let fileManager = NSFileManager.defaultManager()
        let fileName = (FTWCache.cacheDirectory() as NSString).stringByAppendingPathComponent(key)
        
        guard let _: Bool? = fileManager.fileExistsAtPath(fileName) else {
            return nil
        }
        
        let modificationDate = ((try? fileManager.attributesOfItemAtPath(fileName)) as NSDictionary?)?.objectForKey(NSFileModificationDate) as?  NSDate
        if modificationDate?.timeIntervalSinceNow > cacheTime {
            do {
                try fileManager.removeItemAtPath(fileName)
            } catch {
            }
            return nil
        }
        
        let data = NSData(contentsOfFile: fileName)
        return data
    }
    
    class func setObject(data: NSData, forKey key:String) {
        let fileManager = NSFileManager.defaultManager()
        let fileName = (FTWCache.cacheDirectory() as NSString).stringByAppendingPathComponent(key)
        
        var isDir: ObjCBool = true
        if !fileManager.fileExistsAtPath(FTWCache.cacheDirectory(), isDirectory: &isDir) {
            do {
                try fileManager.createDirectoryAtPath(FTWCache.cacheDirectory(), withIntermediateDirectories: false, attributes: nil)
            } catch {
            }
        }
        
        data.writeToFile(fileName, atomically: true)
    }
}

extension String {
    func md5Hash() -> String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.destroy()
        
        return String(format: hash as String)
    }
}

