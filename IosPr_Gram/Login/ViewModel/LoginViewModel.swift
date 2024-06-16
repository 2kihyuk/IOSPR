//
//  LoginViewModel.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import Foundation

@Observable
class LoginViewModel{
    var email=""
    var password=""
    
    func signin() async{
        await AuthManager.shared.signin(email: email, password: password)
    }
}
