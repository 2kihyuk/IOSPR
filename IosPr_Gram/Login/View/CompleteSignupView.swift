//
//  CompleteSignupView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(SignupViewModel.self) var signupViewModel
    
    
    var body: some View {
        @Bindable var signupViewModel = signupViewModel
        ZStack{
            GradientBackgroundView()
            VStack{
                Image("instagramLogo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                
                Spacer()
                
                Image(systemName:"person.circle.fill")
                    .resizable()
                    .frame(width: 172,height: 172)
                    .foregroundStyle(Color.gray)
                    .opacity(0.5)
                    .overlay{
                        Circle()
                            .stroke(Color.gray,lineWidth: 2)
                            .opacity(0.5)
                            .frame(width: 185,height: 185)
                    }
                
                Text("\(signupViewModel.username)님 IOSPRgram에 오신것을 환영합니다.")
                    .font(.title)
                    .padding(.top,30)
                    .padding(.horizontal)
                
                Spacer()
            
                BlueButtonView{
                    Task{
                        await signupViewModel.createUser()
                    }
                }label:{
                    Text("완료")
                        
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement:.topBarLeading){
                Button{
                    dismiss()
                } label: {
                    Image(systemName:"chevron.left")
                        .tint(.black)
                }
            }
        }
    }
}

#Preview {
    CompleteSignupView()
}
