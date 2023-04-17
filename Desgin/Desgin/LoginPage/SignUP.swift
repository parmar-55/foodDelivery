//
//  ViewController.swift
//  DesignPageLogSin
//
//  Created by Demo 01 on 15/04/23.
//  Copyright © 2023 scs. All rights reserved.
//

import UIKit
import CoreData

class SignUP: UIViewController {


    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var comfirmPassword: UITextField!
    @IBOutlet weak var password: UITextField!
    var arr = [String]()
   
    @IBOutlet weak var signBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signBtn.layer.cornerRadius = 20
        
        nameText.layer.cornerRadius = 15.0
        nameText.layer.borderWidth = 2.0
        nameText.layer.borderColor = UIColor.black.cgColor
        
        emailtext.layer.cornerRadius = 15.0
        emailtext.layer.borderWidth = 2.0
        emailtext.layer.borderColor = UIColor.black.cgColor
        
        password.layer.cornerRadius = 15.0
        password.layer.borderWidth = 2.0
        password.layer.borderColor = UIColor.black.cgColor
     
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as? ViewController
//        vc?.navigationController?.pushViewController(vc!, animated: true)
//    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login") as? Login
        present(vc!, animated: true)
    }
    
}



extension SignUP
{
    
    @IBAction func registerButton(_ sender: Any) {
        guard let name = nameText.text, !name.isEmpty else
        {
            operAlert(message: "Please enter your name")
            return
        }
        guard let email = emailtext.text, !email.isEmpty else
        {
            operAlert(message: "Please enter your email")
            return
        }
        guard let password = password.text, !password.isEmpty else
        {
            operAlert(message: "Please enter your password")
            return
        }
        guard let confirmPass = comfirmPassword.text, !confirmPass.isEmpty else
        {
            operAlert(message: "Pleras enter your confirm password")
            return
        }
       
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let entity = NSEntityDescription.entity(forEntityName: "Desgin", in: context)
    let sign = NSManagedObject(entity: entity!, insertInto: context)
//    sign.setValue("", forKey: "name")
        sign.setValue(nameText.text, forKey: "name")
        sign.setValue(emailtext.text, forKey: "email")
//        sign.setValue(password.text, forKey: "password")
        sign.setValue(comfirmPassword.text, forKey: "confirm")
    
        do{
            try context.save()
             print("Save")
        }
        catch
        {
            print("error")
        }
    }
}


extension SignUP{
    func operAlert(message:String)
    {
        let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okay)
        present(alertController, animated:  true)
    }
}


extension SignUP
{
    
    func fetchData(){
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Sign")
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            for data in result{
                debugPrint((data as AnyObject).value(forKey: "name") as! String)
                debugPrint((data as AnyObject).value(forKey: "email") as! String)
                debugPrint((data as AnyObject).value(forKey: "password") as! String)
                self.arr.append(data as! String)
            }
        }catch{
            print("can't fetch")
        }
    }


}
