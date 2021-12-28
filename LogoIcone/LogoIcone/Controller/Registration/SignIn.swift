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
        
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
        }
    }
    
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print(error.localizedDescription)
            }
            if authResult?.user.email != nil {
                
            }
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            // ...
        }
    }
    
    @IBAction func signInButt(_ sender: Any) {

        
        SignIn(email: email.text ?? "", password: password.text ?? "")

    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "SignUpViewController") as! SignUp
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}
