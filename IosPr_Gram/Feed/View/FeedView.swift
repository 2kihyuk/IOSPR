//
//  FeedView.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/16.
//

//import SwiftUI
//
//struct FeedView: View {
//    @State var viewModel = FeedViewModel()
//    
//    var body: some View {
//        ScrollView {
//            VStack{
//                HStack{
//                    Image("instagramLogo2")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 110)
//                    Spacer()
//                    Image(systemName:"heart")
//                        .imageScale(.large)
//                    Image(systemName:"paperplane")
//                        .imageScale(.large)
//                    
//                }
//                .padding(.horizontal)
//                
//                ForEach(viewModel.posts){ post in
//                     
//                    let _ = print("posts Print : ", post)
//                    
//                }
////                FeedCellView()
////                FeedCellView()
////                FeedCellView()
////                
//                Spacer()
//            }
//        }
//    }
//}
//
//#Preview {
//    FeedView()
//}

//import SwiftUI
//
//struct FeedView: View {
//    @State var viewModel = FeedViewModel()
//    
//    var body: some View {
//        ScrollView {
//            VStack {
//                HStack {
//                    Image("instagramLogo2")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 110)
//                    Spacer()
//                    Image(systemName: "heart")
//                        .imageScale(.large)
//                    Image(systemName: "paperplane")
//                        .imageScale(.large)
//                }
//                .padding(.horizontal)
//                
//                ForEach(viewModel.posts) { post in
//                    FeedCellView(post: post)
//                }
//                
//                Spacer()
//            }
//        }
//        .refreshable {
//            await viewModel.loadAllPosts()
//        }
//        .task {
//            await viewModel.loadAllPosts()
//        }
//    }
//}
//
//#Preview {
//    FeedView()
//}

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            
            
            ScrollView {
                VStack {
                    HStack {
                        Image("IOSPR_GRAM")
                        
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110)
                        Spacer()
                        Button{
                            AuthManager.shared.signout()
                            }label:{
                            Text("로그아웃")
                                }
                        Image(systemName: "heart")
                            .imageScale(.large)
                        Image(systemName: "paperplane")
                            .imageScale(.large)
                    }
                    .padding(.horizontal)
                    
                    LazyVStack{
                        ForEach(viewModel.posts) { post in
                            FeedCellView(post: post)
                        }
                    }
                    Spacer()
                }
            }
            .refreshable {
                await viewModel.loadAllPosts()
            }
            .task {
                await viewModel.loadAllPosts()
            }
        }
    }
}
