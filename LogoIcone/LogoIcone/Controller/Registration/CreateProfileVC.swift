//
//  CreateProfileVC.swift
//  LogoIcone
//
//  Created by Monafh on 23/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import PhotosUI

class CreateProfileVC: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var usersNameLBL: UILabel!
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var firstNameLBL: UILabel!
    @IBOutlet weak var firsNametx: UITextField!
    
    @IBOutlet weak var lastNameLBL: UILabel!
    @IBOutlet weak var lastNametx: UITextField!
    
    @IBOutlet weak var bioLBL: UILabel!
    @IBOutlet weak var biotx: UITextField!
    
    
    @IBOutlet weak var ageLBL: UILabel!
    @IBOutlet weak var agetx: UITextField!
    
    
    @IBOutlet weak var genderLBL: UILabel!
    @IBOutlet weak var gendertx: UITextField!
    
    let imagePicker = UIImagePickerController()
    private let caching = CachingProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersNameLBL.text = "User Name "
        userName.placeholder = "Enter your userName "
        firstNameLBL.text = "First Name"
        firsNametx.placeholder = "Write first name"
        lastNameLBL.text = "Last Name"
        lastNametx.placeholder = "write last name "
        bioLBL.text = "Bio"
        biotx.placeholder = "your own space to write"
        ageLBL.text = "AGE"
        genderLBL.text = "Gender"
        gendertx.placeholder = "male , Female"
        
        
        userName.delegate = self
        firsNametx.delegate = self
        lastNametx.delegate = self
        biotx.delegate = self
        agetx.delegate = self
        imagePicker.delegate = self
        
    }
    
//  MARK: - Load Image From Caching
    
    override func viewWillAppear(_ animated: Bool) {
        let image = caching.getImage(forKey: "url")
        guard let image = image else { return }
        self.imageProfile.image = image
    }
    func profile(userName :String, firstName :String, lastName :String, bio :String , age: Int ,gender : String) {
        
        UserApi.addProfileInfo(userName: userName ,firstName: firstName, lastName: lastName, bio: bio, age: age, gender: gender, uid: Auth.auth().currentUser?.uid ?? "")
        { cheak in
            if cheak {
                print("Done")
                //
//                self.performSegue(withIdentifier: "saveProfile", sender: nil)
                
                let vc = self.storyboard?.instantiateViewController(identifier: "saveProfile") as! ProfileTVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            } else{
                print("ther is error")
            }
        }
    }
    
    @IBAction func choseImage(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    @IBAction func save(_ sender: Any) {
    
        
        // casting to string
        guard let age = Int(agetx.text ?? "nil") else {return }
        
        profile(userName: userName.text ?? "" ,firstName: firsNametx.text ?? "" ,lastName: lastNametx.text ?? "", bio: biotx.text ?? "", age: age, gender: gendertx.text ?? "")
    }
}

extension CreateProfileVC :   UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true, completion: nil)
        
        let image = info[.originalImage] as! UIImage
        self.caching.setImageFromCach(image, forKey: "url")
        self.imageProfile.image = image
        
    }
}
