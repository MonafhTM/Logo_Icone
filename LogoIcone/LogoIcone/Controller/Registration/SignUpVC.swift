//
//  SignUpVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        infoLBL.text = "Please create a strong password and at least 8 Characters"
        
    }
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            if let error = error {
                //show an alert
                print(error)
            }else {
                UserApi.addUser(password: password, uid: authResult?.user.uid ?? "", email: email)
                self.performSegue(withIdentifier: "goToCreatProfile", sender: nil)
            }
            
        }
    }
    
    @IBAction func signUpButt(_ sender: Any) {
        
    }
    
}

