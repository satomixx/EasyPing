//
//  NetName.swift
//  connecting
//
//  Created by Satomi Suyama on 1/9/16.
//  Copyright © 2016 amysound. All rights reserved.
//

import Foundation

class NetName: NSObject {
    
//    class func toHost(ipAddr:String)->[String]{
//
//        let ipAddrEncodedOpt = ipAddr.dataUsingEncoding(NSUTF8StringEncoding)
//        
//        if let ipAddrEncoded = ipAddrEncodedOpt {
//            var storage = sockaddr_storage()
//            ipAddrEncoded.getBytes(&storage, length: sizeof(sockaddr_storage))
//            
//            if Int32(storage.ss_family) == AF_INET {
//                let addr4 = withUnsafePointer(&storage) { UnsafePointer<sockaddr_in>($0).memory }
//                
//                let host = CFHostCreateWithAddress(nil, addr4 as! CFDataRef)
//                print(host)
//                
//                
//                
////                // prints 74.125.239.132
////                print(String(CString: inet_ntoa(addr4.sin_addr), encoding: NSASCIIStringEncoding))
//            }
//        }
//        
////        let host = NSHost(address: ipAddr)
////        if(host.names.count>0){
////            return host.names
////        }
////        return [ipAddr]
//    }
    
    class func toAddr(hostname:String)->[String]{
        
        var returnArr = [String]()
        
        let host = CFHostCreateWithName(nil,hostname).takeRetainedValue()
        CFHostStartInfoResolution(host, .Addresses, nil)
        var success: DarwinBoolean = false
        if let addresses = CFHostGetAddressing(host, &success)?.takeUnretainedValue() as NSArray?,
            let theAddress = addresses.firstObject as? NSData {
                var hostname = [CChar](count: Int(NI_MAXHOST), repeatedValue: 0)
                if getnameinfo(UnsafePointer(theAddress.bytes), socklen_t(theAddress.length),
                    &hostname, socklen_t(hostname.count), nil, 0, NI_NUMERICHOST) == 0 {
                        if let numAddress = String.fromCString(hostname) {
                            print(numAddress)
                            returnArr = [numAddress]
                        }
                }
        }
        return returnArr
        
//        let host = NSHost(name: hostname)
//        
//        // 対象をIPv4アドレスのみに制限する
//        var ar:[String]=[]
//        for a in host.addresses {
//            if( a.componentsSeparatedByString(".").count == 4 ){
//                ar.append(a)
//            }
//        }
//        return ar
        
        //-------------------------------------------
        //addrinfo によるIPアドレス取得
        //-------------------------------------------
        //        var ar:[String]=[]
        //        var buf = [Int8](count:128,repeatedValue:0) // 文字列化するためのテンポラリ
        //
        //        var hints = addrinfo(ai_flags: 0, ai_family: AF_INET, ai_socktype: SOCK_STREAM, ai_protocol: IPPROTO_TCP, ai_addrlen: 0, ai_canonname: nil, ai_addr: nil, ai_next: nil)
        //
        //        var result = UnsafeMutablePointer<addrinfo>(nil)
        //        let error = getaddrinfo(hostname, UnsafePointer<Int8>(), &hints, &result)
        //        if(error == 0) {
        //            var res = result
        //            while( res != nil ){
        //                if( res.memory.ai_family == AF_INET ){
        //                    var sockaddrIn = Cast.direct(res.memory.ai_addr) as sockaddr_in
        //                    inet_ntop(AF_INET,&sockaddrIn.sin_addr, &buf, 128)
        //                    ar.append(String.fromCString(buf)!)
        //                }
        //                res = res.memory.ai_next
        //            }
        //            freeaddrinfo(result)
        //        }
        //        return ar
    }
}