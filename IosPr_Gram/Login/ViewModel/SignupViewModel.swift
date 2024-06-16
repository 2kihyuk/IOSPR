//
//  SignupViewModel.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import Foundation
import FirebaseAuth

@Observable
class SignupViewModel{
    var email = ""
    var password = ""
    var name = ""
    var username = ""
    
//    var currentUserSession : FirebaseAuth.User?
//    
//    func createUser() async{
//        print("email :", email)
//        print("password :", password)
//        print("name :", name)
//        print("username :", username)
//        
//        
//        do{
//            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            
//            currentUserSession = result.user
//           
//        } catch{
//            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
//        }
//        
    func createUser() async{
        await AuthManager.shared.createUser(email: email, password: password, name: name, username: username)
        email=""
        password=""
        name=""
        username="" 
        
    }
}

