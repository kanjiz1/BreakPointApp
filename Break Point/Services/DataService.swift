//
//  DataService.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/6/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import Foundation
import Firebase

//Firebase Database URL Method
let DB_BASE = Database.database().reference()

class DataService{
    static let instance = DataService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_GROUPS = DB_BASE.child("groups")
    private var _REF_FEED = DB_BASE.child("feed")
    
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    
    var REF_GROUPS: DatabaseReference{
        return _REF_GROUPS
    }
    
    var REF_FEED: DatabaseReference{
        return _REF_FEED
    }
    
    //Creating Users
    func createDBUSer(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    //Uploading Posts
    func uploadPosts(uploadPostWithMessage message: String, forUID uid:String, withGroup groupKey: String?, sendComplete: @escaping (_ status: Bool) -> ()){
        
        if groupKey != nil {
            // send to group's reference
        } else {
            //pass into the feed
            //Every Feed has a content and a sender ID
            REF_FEED.childByAutoId().updateChildValues(["content": message, "senderID": uid])
            sendComplete(true)
        }
    }
    
}
