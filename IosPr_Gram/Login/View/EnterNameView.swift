//
//  EnterNameView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import SwiftUI

struct EnterNameView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(SignupViewModel.self) var signupViewModel
    
    
    var body: some View {
        @Bindable var signupViewModel = signupViewModel
        SignupBackgroundView{
            VStack{
                Text("이름 입력")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom,5)
                
                TextField("이름을 입력하세요.",text: $signupViewModel.name)
                    .modifier(InstagramTextFieldModifier())
                
                NavigationLink{
                    EnterUserNameView()
                }label:{
                    Text("다음")
                        .frame(width:363,height: 42)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    EnterNameView()
}
