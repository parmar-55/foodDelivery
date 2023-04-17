//
//  Login.swift
//  Desgin
//
//  Created by Demo 01 on 15/04/23.
//  Copyright © 2023 scs. All rights reserved.
//

import UIKit

class Login: UIViewController {

    
    @IBOutlet weak var loginEmail: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func registerEvent(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUP") as? SignUP
        present(vc!, animated: true)

    }
    
    @IBAction func loginBtn(_ sender: Any)
    {
        guard let e = loginEmail.text, !e.isEmpty else
        {
            operAlert(message: "Please enter your email")
            return
        }
        guard let p = passwordLogin.text, !p.isEmpty else
        {
            operAlert(message: "Please enter your password")
            return
        }
        
            print("Save")
    }
    func operAlert(message:String)
    {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okay)
        present(alertController, animated:  true)
    }
    
    
}

