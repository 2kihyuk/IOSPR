//
//  NewPostView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/11.
//

import SwiftUI
import PhotosUI

//struct NewPostView: View {
//    @Binding var tabIndex : Int
//    
//    @State var viewModel = NewPostViewModel()
//    
//    var body: some View {
//        VStack{
//            HStack{
//                Button{
//                    print("뒤로가기")
//                    tabIndex=0
//                }
//            label:{
//                Image(systemName: "chevron.left")
//                    .tint(.black)
//
//            }
//                Spacer()
//                Text("새 게시물")
//                    .font(.title2)
//                    .fontWeight(.semibold)
//                Spacer()
//            }
//            .padding(.horizontal)
//            
//            PhotosPicker(selection: $viewModel.selectedItem ){
//                if let image = self.viewModel.postImage{//self.postImage가 nill이 아니면, PhotosPicker로 사진을 장착한 후
//                    image
//                        .resizable()
////                        .aspectRatio(contentMode: .fill)
//                        .scaledToFill()
//                        .frame(maxWidth: .infinity, maxHeight:400)
//                        .clipped()
//                        
//                    
//                }else{//장착전
//                    Image(systemName: "photo.on.rectangle")
//                        .resizable()
////                        .scaledToFit()
//                        .aspectRatio(contentMode: .fit )
//                        .frame(width: 200, height: 200)
//                        .padding()
//                        .tint(.black)
//                        
//                    
//                }
//                    
//            }
//            .onChange(of: viewModel.selectedItem) { newValue in
//                Task{
//                    await viewModel.convertImage(item: newValue)
//                }
//               
//            }
//            
//            
//            TextField("문구를 수정하거나 설문을 추가하세요...", text: $viewModel.caption)
//                .padding()
//            Spacer()
//            Button{
//                print("사진 공유")
//                Task{
//                    await viewModel.uploadPost()
//                    viewModel.clearData()
//                    tabIndex = 0
//                }
//            }
//        label:{
//            Text("공유")
//                .frame(width: 363 , height: 42)
//                .foregroundStyle(.white)
//                .background(.blue)
//                .clipShape(RoundedRectangle(cornerRadius: 20))
//        }
//        .padding()
//
//            
//        }
//    }
//}
//
//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView(tabIndex : .constant(2))
//    }
//}

struct NewPostView: View {
    @Binding var tabIndex: Int
    @State var viewModel = NewPostViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    tabIndex = 0
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.black)
                }
                Spacer()
                Text("새 게시물")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)
            
            PhotosPicker(selection: $viewModel.selectedItem) {
                if let image = self.viewModel.postImage { //self.postImage가 nil이 아니면, photosPicker로 사진을 장착한 후
                    image
                        .resizable()
//                        .aspectRatio(contentMode: .fill)
                        .scaledToFill()
                    
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .clipped()

                    
                } else { //장착 전
                    Image(systemName: "photo.on.rectangle")
                        .resizable()
//                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                    
                        .frame(width: 200, height: 200)
                        .tint(.black)
                        .padding()
                }
            }
            .onChange(of: viewModel.selectedItem) { oldValue, newValue in
                Task {
                    await viewModel.convertImage(item: newValue)
                }
            }
            
            TextField("문구를 작성하거나 설문을 추가하세요...", text: $viewModel.caption)
                .padding()

            Spacer()
            
            Button {
                print("사진 공유")
                Task {
                    await viewModel.uploadPost()
                    viewModel.clearData()
                    tabIndex = 0
                }
            } label: {
                Text("공유")
                    .frame(width: 363, height: 42)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
    }
}

#Preview {
    NewPostView(tabIndex: .constant(2))
}
