//
//  ChosingRandomViewModel.swift
//  MVVM
//
//  Created by Minh on 15/9/25.
//

import Foundation

final class ChosingRandomViewModel{
    var userName: Obseverable<String> = Obseverable("Random User")
    
    private let service: UserServiceProtocol
    
    
    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }
    
    func pickRandomUser(){
        service.fetchUsers { [weak self] result in
            switch result{
            case .success(let users):
                // lấy 1 user ngẩu nhiên trong mảng users
                if let randomUser = users.randomElement(){
                    self?.userName.value = randomUser.name
                } else {
                    self?.userName.value = "No User"
                }
            case.failure(let error):
                self?.userName.value = "Error: \(error.localizedDescription)"
            }
        }
    }
}
