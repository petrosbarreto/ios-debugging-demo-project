//
//  ApplicationViewController.swift
//  Debugging
//
//  Created by Renan Germano on 08/12/19.
//  Copyright © 2019 Renan Germano. All rights reserved.
//

import UIKit

class ApplicationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Login succeeded"
        label.font = UIFont.boldSystemFont(ofSize: 44)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}
