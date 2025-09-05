//
//  UserListViewController.swift
//  MVVM
//
//  Created by Minh on 5/9/25.
//

import UIKit

class UserListViewController: UIViewController {
    
    private let viewModel = UserListViewModel()
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "User"
         view.backgroundColor = .systemBackground
         setupTableView()
         bindViewModel()
         viewModel.loadUsers()


        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func bindViewModel() {
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
    }
}

extension UserListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let user = viewModel.user(at: indexPath.row) {
            cell.textLabel?.text = "\(user.name) — \(user.email)"
            cell.accessoryType = .disclosureIndicator
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Example: simple detail alert
        if let user = viewModel.user(at: indexPath.row) {
            let alert = UIAlertController(title: user.name, message: user.email, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
    
