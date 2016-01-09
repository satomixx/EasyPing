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

// パケットの最小サイズ64になるように56オクテットのペーロードを追加
let IcmpHeaderLen = Int(sizeof(IcmpHeader))+56