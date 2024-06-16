//
//  ImageFitAndFillView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/12.
//

import SwiftUI

struct ImageFitAndFillView: View {
    var body: some View {
        VStack{
            Image(systemName:"trash.square.fill")
            
            Rectangle()
                .frame(width: 200, height:100)
            Image(systemName: "trash.square.fill")
                .resizable()
                .frame(width: 200,height: 100)
            Image(systemName: "trash.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,height: 100)
                .border(.pink,width:2)
            Image(systemName: "trash.square.fill")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200,height: 100)
                .border(.blue,width:1)
                .clipped()
            
            
        }
    }
}

struct ImageFitAndFillView_Previews: PreviewProvider {
    static var previews: some View {
        ImageFitAndFillView()
    }
}
