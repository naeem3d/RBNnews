//
//  ViewController.swift
//  RBSNews
//
//  RBS Tests Project on 12/10/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    let loginViewModel = LongInViewModel()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Login screen"
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        if let message = loginViewModel.checkValdity(userName: usernameTextField.text, passwrod: passwordTextField.text){
            Utility.shared.showAlert(self, "Alert", message)
            return
        }
    
        navigateToHomeScreen()
       
    }
    
    func navigateToHomeScreen() {
        if let newsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "NewsViewController") as? NewsViewController {
            if let navigation = navigationController {
                navigation.pushViewController(newsViewController, animated: true)
            }
        }
    }
    
}

