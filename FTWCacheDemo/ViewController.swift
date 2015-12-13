//
//  ViewController.swift
//  FTWCache
//
//  Created by Kiet Nguyen on 12/13/15.
//  Copyright © 2015 Kiet Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImageFromURL(self.textField.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loadImageFromURL(URL: String) {
        let imageURL = NSURL(string: URL)
        let key = URL.md5Hash()
        
        guard let data = FTWCache.objectForKey(key) else {
            self.imageView.image = UIImage(named: "img_def")
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), { () -> Void in
                let imgData = NSData(contentsOfURL: imageURL!)
                FTWCache.setObject(imgData!, forKey: key)
                let image = UIImage(data: imgData!)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.imageView.image = image
                })
            })
            return
        }
        
        let image = UIImage(data: data)
        self.imageView.image = image
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        self.loadImageFromURL(self.textField.text!)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
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

