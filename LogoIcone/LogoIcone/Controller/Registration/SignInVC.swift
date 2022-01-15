//
//  SignInVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignInVC : UIViewController {
    
    
    // MARK: - Outlets
    //    TextField For Sign in ......
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var userNameLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var signInBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLBL.text = "Welcome".localized
        userNameLBL.text = "E-mail Or username".localized
        email.placeholder = "Your Email ".localized
        passwordLBL.text = "Password".localized
        password.placeholder = "Enter password".localized
        signInBackground.image = UIImage(named: "SignIn")
        
    }
    
    
    // MARK: - Custom Methods For signIn
    
    func SignIn(email: String,password:String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                
                self?.showAlart(titale: "Error".localized, masge: "error is \((error.localizedDescription)) ".localized)
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
    
    // MARK: - Action Methods
    
    @IBAction func signInButt(_ sender: Any) {
        
        
        SignIn(email: email.text ?? "", password: password.text ?? "")
        
    }
    
    @IBAction func SignUp(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: nil)
        
    }
    
    
    // MARK: - Alert message
    
    func showAlart(titale : String , masge : String) {
        let alart = UIAlertController(title: titale, message: masge, preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK".localized, style: .default, handler: nil)
        alart.addAction(OK)
        present(alart, animated: true , completion: nil)
        
    }
}
