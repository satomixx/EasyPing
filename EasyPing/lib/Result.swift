//
//  Result.swift
//  connecting
//
//  Created by Satomi Suyama on 1/9/16.
//  Copyright © 2016 amysound. All rights reserved.
//

import Foundation

class Result:NSObject{
    var id:Int = 0
    var srcAddr:String = "*"
    var hostName:String = "*"
    var icmpType:UInt8 = 255
    var msec:NSTimeInterval = 0
}