//
//  SignUpVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUp: UIViewController {
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLBL.text = "Sign up to LogoIcon"
        emailLBL.text = " Email"
        emailSignUp.placeholder = "Enter your Email"
        passwordLBL.text = " Password "
        password.placeholder = "your password"
        infoLBL.text = "Please create a strong password and at least 8 Characters"
        
    }
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            if let error = error {
                
                self.showAlertWith(title: "Error", message: "Try again")
                
                print(error)
            }else {
                UserApi.addUser(password: password, uid: authResult?.user.uid ?? "", email: email)
                
                let vc = self.storyboard?.instantiateViewController(identifier: "CreateProfileVC") as! CreateProfileVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
        }
    }
    
    @IBAction func signUpButt(_ sender: Any) {
        
        print("clicked signup")
        
        SignUp(email: emailSignUp.text ?? "", password: password.text ?? "")
        
    }
    func showAlertWith(title: String, message: String){
        let nameOfSerachAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        nameOfSerachAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(nameOfSerachAlert, animated: true)
    }
}

