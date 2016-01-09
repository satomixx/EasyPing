//
//  Cast.swift
//  connecting
//
//  Created by Satomi Suyama on 1/9/16.
//  Copyright © 2016 amysound. All rights reserved.
//

import Foundation

class Cast:NSObject{
    
    // 指定バイト数のUInt8ポインタに変換する
    class func ptr(p:UnsafePointer<Void>,len:Int) -> UnsafePointer<UInt8> {
        let data = NSData(bytes: p, length: len)
        return UnsafePointer<UInt8>(data.bytes)
    }
    
    // 型を指定して直接キャストする
    class func direct<T>(data:UnsafePointer<Void>) -> T{
        let d = NSData(bytes: data, length: sizeof(T))
        return UnsafePointer<T>(d.bytes).memory
    }
}