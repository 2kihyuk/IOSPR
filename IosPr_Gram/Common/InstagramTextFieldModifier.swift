//
//  InstagramTextFieldModifier.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/15.
//

import SwiftUI

struct InstagramTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View{
        content
            .textInputAutocapitalization(.never)
            .padding(12)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray,lineWidth: 1)
            }
            .padding(.horizontal)
    }
}
