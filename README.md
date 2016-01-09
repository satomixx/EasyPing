# EasyPing
EasyPing

# Sample

- ViewController.swift

```swift
import UIKit

class ViewController: UIViewController, PingDelegate {

    var isFinish = false
    var results = [Dictionary<String, Any>]()
    var max = 30 // max hop
    
    let url = "www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT)
        
        let ping = Ping()
        ping.delegate = self

        for i in 0 ... max {
            dispatch_async(queue, {
                ping.send(self.url, id: i, ttl: UInt32(i+1), max: self.max)
            })
        }
  }
```
