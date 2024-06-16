//
//  SignupBackgroundView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import SwiftUI

struct SignupBackgroundView<Content: View> :View{
    @Environment(\.dismiss) var dismiss
     
    let content : Content
    
    init(@ViewBuilder content: () -> Content){
        self.content = content()
        
    }
    
    var body : some View{
        ZStack{
            GradientBackgroundView()
            content
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

