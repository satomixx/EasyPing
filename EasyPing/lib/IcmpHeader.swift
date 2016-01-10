//
//  IcmpHeader.swift
//  connecting
//
//  Created by Satomi Suyama on 1/9/16.
//  Copyright © 2016 amysound. All rights reserved.
//

import Foundation

struct IcmpHeader {
    var type:UInt8
    var code:UInt8
    var sum:UInt16
    var id:UInt16
    var seq:UInt16
}


// Add octed 56 payload to make packet size minimum 64
let IcmpHeaderLen = Int(sizeof(IcmpHeader))+56