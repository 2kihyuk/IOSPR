//
//  BlueButtonView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//


import SwiftUI

struct BlueButtonView<Content: View> :View{
    @Environment(\.dismiss) var dismiss
    
    let label : Content
    let action : () -> Void
    
    init(action: @escaping () -> Void , @ViewBuilder label: () -> Content){
        self.label = label()
        self.action = action
        
    }
    
    var body : some View{
        Button{
            action()
        } label:{
            label
                .frame(width:363,height: 42)
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
        
    }
}
