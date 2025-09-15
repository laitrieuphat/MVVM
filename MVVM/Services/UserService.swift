//
//  UserService.swift
//  MVVM
//
//  Created by Minh on 5/9/25.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
}

final class UserService: UserServiceProtocol {
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Simulate network delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let users = [
                User(id: 1, name: "Alice", email: "alice@example.com"),
                User(id: 2, name: "Bob", email: "bob@example.com"),
                User(id: 3, name: "Rol", email: "carol@example.com"),
                User(id: 4, name: "Alice", email: "alice@example.com"),
                User(id: 5, name: "Aob", email: "bob@example.com"),
                User(id: 6, name: "Carol", email: "carol@example.com")
            ]
            DispatchQueue.main.async{
                completion(.success(users))
            }
        }
    }
}
