//
//  AuthManager.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import Foundation
import FirebaseAuth
import Firebase

//@Observable
//class AuthManager{
//    
//    static let shared = AuthManager()
//    
//    var currentAuthUser : FirebaseAuth.User?
//    var currentUser: User?
//    
//    init(){
//        currentAuthUser = Auth.auth().currentUser
//        Task{
//            await loadUserData()
//        }
//    }
//    
//    func createUser(email : String , password : String , name : String , username : String ) async{
//        print("email :", email)
//        print("password :", password)
//        print("name :", name)
//        print("username :", username)
//        
//        do{
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            currentAuthUser = result.user
//            guard let userId = currentAuthUser?.uid else{return}
//            await uploadUserData(userId: userId, email: email, username: username, name: name)
//        } catch{
//            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
//        }
//    }
//    
//    func uploadUserData(userId : String, email : String, username : String, name:String ) async{
//        let user = User(id:userId, email: email, username: username,name: name )
//        self.currentUser = user
//        do{
//            let encodedUser = try Firestore.Encoder().encode(user)
//            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
//        }catch{
//            print("DEBUG: Failed to upload user data with error \(error.localizedDescription)")
//        }
//        
//    }
//    
//    func signin(email:String, password : String)async{
//        do{
//            let result = try await Auth.auth().signIn(withEmail: email, password: password)
//            currentAuthUser = result.user
//            await loadUserData()
//        }catch{
//            print("DEBUG: Failed to login with error \(error.localizedDescription)")
//        }
//        
//    }
//    
//    func loadUserData() async {
//        guard let userId = self.currentAuthUser?.uid else {return}
//        do{
//            self.currentUser = try await Firestore.firestore().collection("users").document(userId).getDocument(as : User.self)
//            print("currentUser: ", currentUser)
//            let result = try await Firestore.firestore().collection("users").document(userId).getDocument()
//            print(result.data())
//        }catch{
//            print("DEBUG: Failed to load user data with error \(error.localizedDescription)")
//        }
//    }
//    
//    func signout(){
//        do{
//            try Auth.auth().signOut()
//            currentAuthUser = nil
//            
//        }catch{
//            print("DEBUG : Failed to sign out with error \(error.localizedDescription)")
//        }
//    }
//}
//


@Observable
class AuthManager {
    
    static let shared = AuthManager()
    
    var currentAuthUser: FirebaseAuth.User?
    var currentUser: User?
    
    init() {
        currentAuthUser = Auth.auth().currentUser
        Task {
            await loadCurrentUserData()
        }
    }
    
    func createUser(email: String, password: String, name: String, username: String) async {
        print("email:", email)
        print("password:", password)
        print("name:", name)
        print("username:", username)
        
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            currentAuthUser = result.user
            guard let userId = currentAuthUser?.uid else { return }
            await uploadUserData(userId: userId, email: email, username: username, name: name)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func uploadUserData(userId: String, email: String, username: String, name: String) async {
        let user = User(id: userId, email: email, username: username, name: name)
        self.currentUser = user
        do {
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
        } catch {
            print("DEBUG: Failed to upload user data with error \(error.localizedDescription)")
        }
    }
    
    func signin(email: String, password: String) async {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            currentAuthUser = result.user
            await loadCurrentUserData()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func loadCurrentUserData() async {
        guard let userId = self.currentAuthUser?.uid else { return }
        do {
            self.currentUser = try await Firestore.firestore().collection("users").document(userId).getDocument(as: User.self)
            
            let result = try await Firestore.firestore().collection("users").document(userId).getDocument()
           
        } catch {
            print("DEBUG: Failed to load user data with error \(error.localizedDescription)")
        }
    }
    
    
    
    func loadUserData(userId : String) async ->User?{
       
        do {
            let user = try await Firestore.firestore().collection("users").document(userId).getDocument(as: User.self)
            return user
          
           
        } catch {
            print("DEBUG: Failed to load user data with error \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadAllUserData() async -> [User]?{
        
        do{
            let documents = try await Firestore.firestore().collection("users").getDocuments().documents
            
            let users = try documents.compactMap { document in
                return try document.data(as: User.self)
            }
            return users
        }catch{
            print("DEBUG: Failed to load all user data with error \(error.localizedDescription)")
            return nil
        }
    }
    
   
    func signout() {
        do {
            try Auth.auth().signOut()
            currentAuthUser = nil
            currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
}


extension AuthManager{
    func follow(userId : String?) async{
        guard let currentUserId = currentUser?.id else {return}
        guard let userId else {return}
        
        do{
            async let _ = try await Firestore.firestore()
                .collection("following")
                .document(currentUserId)
                .collection("user-following")
                .document(userId)
                .setData([:])
            
            async let _ = try await Firestore.firestore()
                .collection("follower")
                .document(userId)
                .collection("user-follower")
                .document(currentUserId)
                .setData([:])
        }catch{
            print("DEBUG: Failed to save follow data with error \(error.localizedDescription)")
        }
    }
    
    func unfollow(userId : String?) async{
        guard let currentUserId = currentUser?.id else {return}
        guard let userId else {return}
        do{
            async let _ = try await Firestore.firestore()
                .collection("following")
                .document(currentUserId)
                .collection("user-following")
                .document(userId)
                .delete()
            
            async let _ = try await Firestore.firestore()
                .collection("follower")
                .document(userId)
                .collection("user-follower")
                .document(currentUserId)
                .delete()
        }catch{
            print("DEBUG: Failed to delete follow data with error \(error.localizedDescription)")
        }
    }
    
    func checkFollow(userId : String?) async -> Bool{
        guard let currentUserId = currentUser?.id else {return false}
        guard let userId else {return false} 
        
        do{
            let isFollowing = try await Firestore.firestore()
                .collection("following")
                .document(currentUserId)
                .collection("user-following")
                .document(userId)
                .getDocument()
                .exists
            return isFollowing
            
        }catch{
            print("DEBUG: Failed to delete follow data with error \(error.localizedDescription)")
            return false
        }

    }
}
