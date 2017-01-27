//
//  CommentData.swift
//  Instagram
//
//  Created by Kojiro Wakabayashi on 2017/01/27.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class CommentData: NSObject {
    var id: String?
    var postID: String?
    var name: String?
    var comment: String?
    var date: NSDate?
    
    let rootRef = FIRDatabase.database().reference()
//    let conditionRef = rootRef.child("posts")
    
    init(snapshot: FIRDataSnapshot, myId: String) {
        self.id = snapshot.key
        
  //      self.postID = conditionRef.id
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.name = valueDictionary["name"] as? String
        
        self.comment = valueDictionary["comment"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)

    }
}
