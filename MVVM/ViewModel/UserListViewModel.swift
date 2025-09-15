//
//  UserListViewModel.swift
//  MVVM
//
//  Created by Minh on 5/9/25.
//

import Foundation

final class UserListViewModel {
    private let service: UserServiceProtocol
    private(set) var users:Obseverable<[User]> = Obseverable([])
    

    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }
    
    func loadUsers(){
        service.fetchUsers { [weak self] result in
            switch result{
            case .success(let users):
                self?.users.value = users
            case .failure(_):
                self?.users.value = []
            }
        }
    }

    func user(at index: Int) -> User? {
        guard users.value.indices.contains(index) else { return nil }
        return users.value[index]
    }
    
}
