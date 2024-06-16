//
//  Post.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/14.
//

import Foundation
import FirebaseFirestoreSwift

struct Post : Codable , Identifiable{
    let id : String
    let userId : String
    let caption : String
    var like : Int
    let imageUrl : String
    let date : Date
    
    var isLike : Bool?
    
    var user: User?
}


extension Post{
    static var DUMMY_Post : Post = Post(id: UUID().uuidString, userId: UUID().uuidString, caption: "test caption", like: 125, imageUrl:" https://firebasestorage.googleapis.com:443/v0/b/instagramclone-2ab19.appspot.com/o/images%2F5E2E4B74-B797-4ECC-88E1-4B0F6D043313?alt=media&token=0ab02293-8304-4af4-9917-cbcc5b1ba243", date: Date())
}
