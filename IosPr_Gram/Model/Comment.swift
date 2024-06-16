//
//  Comment.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/17.
//

import Foundation

struct Comment: Codable, Identifiable{
    let id : String
    let commentText : String
    
    let postId : String
    let postUserId : String
    
    let commentUserId : String
    var commentUser : User?
    
    let date : Date  
    
}

extension Comment {
    static var DUMMY_Comment : Comment = Comment(id: UUID().uuidString, commentText: "test comment", postId: UUID().uuidString, postUserId: UUID().uuidString, commentUserId: UUID().uuidString, date: Date())
}
