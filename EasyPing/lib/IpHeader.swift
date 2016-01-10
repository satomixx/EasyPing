//
//  IpHeader.swift
//  connecting
//
//  Created by Satomi Suyama on 1/9/16.
//  Copyright © 2016 amysound. All rights reserved.
//

import Foundation

struct IpHeader {
    var verLen:UInt8 = 0
    var type:UInt8 = 0
    var len:UInt16 = 0
    var id:UInt16 = 0
    var flg:UInt16 = 0
    var ttl:UInt8 = 0
    var proto:UInt8 = 0
    var sum:UInt16 = 0
    var srcAddr:UInt32 = 0
    var dstAddr:UInt32 = 0
}

// Set 20 octed with no option
let IpHeaderLen = Int(sizeof(IpHeader))