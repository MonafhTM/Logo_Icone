//
//  SignUpVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SignUpVC: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var emailSignUp: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var emailLBL: UILabel!
    @IBOutlet weak var passwordLBL: UILabel!
    @IBOutlet weak var infoLBL: UILabel!
    @IBOutlet weak var signUpBackground: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLBL.text = "Sign up to LogoIcon".localized
        emailLBL.text = " Email".localized
        emailSignUp.placeholder = "Enter your Email".localized
        passwordLBL.text = " Password ".localized
        password.placeholder = "your password".localized
        infoLBL.text = "Please create a strong password and at least 8 Characters".localized
        signUpBackground.image = UIImage(named: "SignUp")
        
        let TapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
              view.addGestureRecognizer(TapGesture)
        
    }
    
    
    // MARK: - Custom Methods For SignUp
    
    func SignUp(email: String,password:String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            print("email:\(String(describing: authResult?.user.email))")
            print("uid:\(String(describing: authResult?.user.uid))")
            
            if let error = error {
                
                self.showAlertWith(title: "Error".localized, message: "Try again".localized)
                
                print(error)
            }else {
                UserApi.addUser(password: password, uid: authResult?.user.uid ?? "", email: email)
                self.performSegue(withIdentifier: "toSignupDetals", sender: nil)
                
            }
        }
    }
    
    
    // MARK: - Action Methods
    
    @IBAction func signUpButt(_ sender: Any) {
        
        print("clicked signup")
        
        SignUp(email: emailSignUp.text ?? "", password: password.text ?? "")
        
    }
    
    // MARK: - Alert message
    
    func showAlertWith(title: String, message: String){
        let nameOfSerachAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        nameOfSerachAlert.addAction(UIAlertAction(title: "OK".localized, style: .default))
        present(nameOfSerachAlert, animated: true)
    }
}

