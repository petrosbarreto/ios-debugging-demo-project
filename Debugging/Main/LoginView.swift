//
//  ViewController.swift
//  Debugging
//
//  Created by Renan Germano on 07/12/19.
//  Copyright © 2019 Renan Germano. All rights reserved.
//

/*
 
 TODO: - Bugs
 
 - [ ] Aperto “Confirm” e não acontece nada. (O botão deveria mudar de estado e o login feito)
 - [ ] Label de erro não some nunca.
 - [ ] Label de erro está sempre mostrando a mesma mensagem.
 - [ ] Precisa validar se o e-mail contem somente um @.
 
 */

import UIKit

class LoginView: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var icon: UIImageView!
    @IBOutlet private weak var email: UITextField!
    @IBOutlet private weak var password: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var confirm: UIButton!
    
    // MARK: - Properties
    
    private var controller: LoginController!
    private var error: String? {
        didSet {
            errorLabel.text = "Login Error"
            
            if error != nil {
                errorLabel.isHidden = false
            } else {
                errorLabel.isHidden = true
            }
        }
    }
    
    // MARK: - Life cicle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controller = LoginController()
        
        
        confirm.layer.cornerRadius = confirm.frame.size.height * 0.5
    }
    
    // MARK: - Actions
    
    @IBAction func didPressConfirm(_ sender: Any) {
        
        email.resignFirstResponder()
        password.resignFirstResponder()
        let userEmail = email.text
        let userPassword = password.text
        
        controller.login(email: userEmail, password: userPassword)
        
    }
    
    // MARK: - Aux functions
    
    private func updateViews(active: Bool) {
        [email, password].forEach {  $0?.isEnabled = active }
        confirm.isEnabled = active
        confirm.alpha = active ? 1 : 0.5
        confirm.setTitle(active ? "Confirm" : "Loading", for: UIControl.State())
    }
    
}

extension LoginView: LoginControllerDelegate {
    
    func loginControllerDelegateDidLogin() {
        updateViews(active: true)
        
        /*
         Uncomment to go to the success login view controller
         present(ApplicationViewController(), animated: true, completion: nil)
        */
        
    }
    
    func loginControllerDelegate(didFailToLoginWithError error: String) {
        
        updateViews(active: true)
        self.error = error
        
    }

}

