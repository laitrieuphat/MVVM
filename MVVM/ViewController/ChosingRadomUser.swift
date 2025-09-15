//
//  ChosingRadomUser.swift
//  MVVM
//
//  Created by Minh on 15/9/25.
//

import Foundation
import UIKit


class ChosingRadomUser: UIViewController {
    let chosingVM = ChosingRandomViewModel()
    
    var button :UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Chose Random User", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "Random User"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random User"
        indicator.startAnimating()
        view.backgroundColor = .systemBackground
        view.addSubview(button)
        view.addSubview(label)
        view.addSubview(indicator)
        
        // add constraints button and label at middle of screen
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            indicator.widthAnchor.constraint(equalToConstant: 50),
            indicator.heightAnchor.constraint(equalToConstant: 50),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 50),

            label.bottomAnchor.constraint(equalTo: button.topAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
        ])
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        bindingData()
    }
    
    func bindingData(){
        chosingVM.userName.bind { [weak self] userName in
            self?.label.text = userName
            self?.indicator.stopAnimating()
        }
    }
    
    
    @objc func buttonTapped() {
        // You can add any other logic here, like updating UI or performing data operations
        self.indicator.startAnimating()
        self.chosingVM.pickRandomUser()
    }
}
