//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Kora on 15/04/2020.
//  Copyright © 2020 kbisewska. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
        
        print(username!)
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}
