//
//  Constants.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation

let AUTH_VC = "AuthVC"
let LOGIN_VC = "LoginVC"
let FEED_CELL = "feedCell"
let CREATE_GROUPS_VC = "createGroupsVC"
let USER_CELL = "userCell"
let GROUP_CELL = "groupCell"
let GROUP_FEED_CELL = "groupFeedCell"
let GROUP_FEED_VC = "GroupFeedVC"

public func randomString(_ n: Int) -> String
{
    let a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    
    var s = ""
    
    for _ in 0..<n
    {
        let r = Int(arc4random_uniform(UInt32(a.characters.count)))
        
        s += String(a[a.index(a.startIndex, offsetBy: r)])
    }
    
    return s
}
