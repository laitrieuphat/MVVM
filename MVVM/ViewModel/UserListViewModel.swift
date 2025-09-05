//
//  UserListViewModel.swift
//  MVVM
//
//  Created by Minh on 5/9/25.
//

import Foundation

final class UserListViewModel {
    private let service: UserServiceProtocol
    private(set) var users:[User] = []
    var onUpdate: (() -> Void)?
    

    init(service: UserServiceProtocol = UserService()) {
        self.service = service
    }
    
    func loadUsers(){
        service.fetchUsers { [weak self] result in
            switch result{
            case .success(let users):
                self?.users = users
                self?.onUpdate?()
            case .failure(_):
                self?.users = []
                self?.onUpdate?()
            }
        }
    }

    func user(at index: Int) -> User? {
        guard users.indices.contains(index) else { return nil }
        return users[index]
    }
    
    
}
