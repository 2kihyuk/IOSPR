//
//  ContentView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/11.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @State var isLogin = false
    @State var signupViewModel = SignupViewModel()
    
    var body: some View {
        
        VStack{
            Button{
                isLogin.toggle()
            }label:{
               
            }
            if AuthManager.shared.currentUser == nil{
                LoginView()
                    .environment(signupViewModel)
            }else{
               MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
