//
//  SearchViewModel.swift
//  IosPr_Gram
//
//  Created by 이기혁 on 2024/06/17.
//

import Foundation

@Observable
class SearchViewModel{
    var users : [User] = []
    
    init(){
        Task{
            await loadAllUserData()
        }
    }
     
    func loadAllUserData() async {
        self.users = await AuthManager.shared.loadAllUserData() ?? []
    }
    
}
