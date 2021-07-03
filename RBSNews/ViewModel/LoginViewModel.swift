//
//  LoginViewModel.swift
//  RBSNews
//
//  Created by naeem alabboodi on 6/28/21.
//

import UIKit

class LongInViewModel {
    let expectedUsername = "rbs"
    let expectedPassword = "1234"
   
    func checkValdity(userName:String? , passwrod:String? ) ->String? {
        
        guard  let username = userName, !username.isEmpty, let password = passwrod,!password.isEmpty else {
           let message =  "Please input credentials."
            return message
        }
        guard   expectedUsername == username else {
           
            return "Username is invalid."
        }
        guard expectedPassword == passwrod else {
        
           return "Password is invalid."
        }
        return nil
    }
    
   
    
    
    
}
