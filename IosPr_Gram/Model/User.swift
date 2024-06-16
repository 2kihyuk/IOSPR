//
//  User.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import Foundation
import FirebaseAuth

struct User: Codable , Identifiable{
    let id : String
    let email : String
    var username : String
    var name: String
    var bio : String?
    var profileImageUrl : String?
    
    var isFollowing: Bool?
    
    var userCountInfo : UserCountInfo?
    
    var isCurrentUser : Bool{
        guard let currentUserId = AuthManager.shared.currentUser?.id else {return false}
        if id == currentUserId {
            return true
        }else{
            return false
        }
    }
    
}


extension User {
    static var DUMMY_User : User = User(id: UUID().uuidString, email: "dummy@gmail.com", username: "dummy", name: "dummy")
}
