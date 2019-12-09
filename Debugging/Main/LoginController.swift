//
//  LoginController.swift
//  Debugging
//
//  Created by Renan Germano on 07/12/19.
//  Copyright © 2019 Renan Germano. All rights reserved.
//

import Foundation

// MARK: - Delegate

protocol LoginControllerDelegate {
    func loginControllerDelegateDidLogin()
    func loginControllerDelegate(didFailToLoginWithError error: String)
}

final class LoginController {
    
    // MARK: - Properties
    
    var delegate: LoginControllerDelegate?
    var counter: Int = 0
    
    // MARK: - Util functions
    
    func login(email: String?, password: String?) {
        
        guard email != nil, email?.isEmpty == false else {
            delegate?.loginControllerDelegate(didFailToLoginWithError: "Enter a valid e-mail.")
            return
        }
        
        
        
        guard password != nil, password?.isEmpty == false else {
            delegate?.loginControllerDelegate(didFailToLoginWithError: "Enter your password.")
            return
        }
        
        // Simulating assynchrnous call to login
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.counter += 1
            if self.counter >= 3 {
                self.counter = 0
                timer.invalidate()
                self.delegate?.loginControllerDelegateDidLogin()
            }
        }).fire()
        
    }
    
}
