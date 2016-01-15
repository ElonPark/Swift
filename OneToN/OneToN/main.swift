//
//  main.swift
//  OneToN
//
//  Created by Nebula_MAC on 2016. 1. 16..
//  Copyright © 2016년 Nebula_MAC. All rights reserved.
//

import Foundation


func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
    if let string = rawString {
        return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    } else {
        return "Invalid input"
    }
}
let n = Int(input())
for i in 1...n! {
    print(i)
}


