//
//  SignInVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignIn : UIViewController {
    
    //    TextField For Sign in ......
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var userNameLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLBL.text = "Welcome"
        userNameLBL.text = "E-mail Or username"
        email.placeholder = "Your Email "
        passwordLBL.text = "Password"
        password.placeholder = "Enter password"
        //
        //        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
        //        }
    }
    
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                
                self?.showAlart(titale: "Error", masge: "error is \((error.localizedDescription)) ")
                print(error.localizedDescription)
            }
            if authResult?.user.email != nil {
                
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            self?.dismiss(animated: true, completion: nil)
            self?.performSegue(withIdentifier: "ShowSearch", sender: nil)
            
        }
    }
    
    @IBAction func signInButt(_ sender: Any) {
        
        
        SignIn(email: email.text ?? "", password: password.text ?? "")
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: nil)
        
    }
    func showAlart(titale : String , masge : String) {
        let alart = UIAlertController(title: titale, message: masge, preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alart.addAction(OK)
        present(alart, animated: true , completion: nil)
        
    }
}
