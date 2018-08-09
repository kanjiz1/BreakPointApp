//
//  Message.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/7/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation

class Message {
    private var _content: String!
    private var _senderID: String!
    
    var content: String{
        return _content
    }
    
    var senderID: String {
        return _senderID
    }
    
    init(content: String, senderID: String) {
        self._content = content
        self._senderID = senderID
    }
}
