//
//  FeedViewModel.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/16.
//

//import Foundation
//import Firebase
//
//@Observable
//class FeedViewModel {
//    
//    var posts: [Post] = []
//    
//    init() {
//        Task {
//            await loadAllPosts()
//        }
//    }
//    
//    func loadAllPosts() async {
//        do {
//            let documents = try await Firestore.firestore().collection("posts").getDocuments().documents
//                
//            //방법1
//            var posts: [Post] = []
//            for document in documents {
//                let post = try document.data(as: Post.self)
//                posts.append(post)
//            }
//            self.posts = posts
//            //방법2
////            self.posts = try documents.map({ document in
////                return try document.data(as: Post.self)
////            })
//            //방법3
////            self.posts = try documents.compactMap({ document in
////                return try document.data(as: Post.self)
////            })
//        } catch {
//            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
//        }
//    }
//}



//import Foundation
//import Firebase
//import FirebaseFirestoreSwift
//import FirebaseFirestore
//
//@Observable
//class FeedViewModel {
//    
//    var posts: [Post] = []
//    
//    init() {
//        Task {
//            await loadAllPosts()
//        }
//    }
//    
//    func loadAllPosts() async {
//        do {
//            let documents = try await Firestore.firestore().collection("posts").getDocuments().documents
//            //방법1
////            var posts: [Post] = []
////            for document in documents {
////                let post = try document.data(as: Post.self)
////                posts.append(post)
////            }
////            self.posts = posts
//            //방법2
////            self.posts = try documents.map({ document in
////                return try document.data(as: Post.self)
////            })
//            //방법3
//            self.posts = try documents.compactMap({ document in
//                return try document.data(as: Post.self)
//            })
//        } catch {
//            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
//        }
//    }
//}


import Foundation
import Firebase
import FirebaseFirestoreSwift

class FeedViewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    
    init() {
        Task {
            await loadAllPosts()
        }
    }
    
    func loadAllPosts() async {
//        guard let posts = await PostManager.loadAllPosts() else {return}
//        self.posts = posts
        do {
            let querySnapshot = try await Firestore.firestore().collection("posts").order(by: "date", descending: true).getDocuments()
            let documents = querySnapshot.documents
            
            var posts: [Post] = []
            for document in documents {
                do {
                    let post = try document.data(as: Post.self)
                    posts.append(post)
                } catch {
                    print("DEBUG: Failed to parse post with error \(error.localizedDescription)")
                }
            }
            self.posts = posts
            
        } catch {
            print("DEBUG: Failed to load user posts with error \(error.localizedDescription)")
        }
    }
}


