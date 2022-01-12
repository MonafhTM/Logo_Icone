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
import FirebaseStorage

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
    
    var theImage : String?
    
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
        
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        
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
                self.navigationController?.pushViewController(vc, animated: true)
                //                vc.modalPresentationStyle = .fullScreen
                //                self.present(vc, animated: true, completion: nil)
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
        
        profile(userName: userName.text ?? "" ,firstName: firsNametx.text ?? "" ,lastName: lastNametx.text ?? "", bio: biotx.text ?? "", age: age, gender: gendertx.text ?? "" )
        
        
    }
}

extension CreateProfileVC :   UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true){ [weak self ]in
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {return}
            
//            self?.imageProfile.image = image
//                                let image = info[.originalImage] as! UIImage
//            self?.caching.setImageFromCach(image, forKey: "url")
            self?.imageProfile.image = image
            guard let uid = Auth.auth().currentUser?.uid else {return }
            guard let imageData = image.pngData() else { return }
            self?.uploadFile(uid: uid, data: imageData)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //**
    
    func saveProfileImage(){
        
        guard let url = URL(string: self.theImage ?? "") else {return}
        if let data = try? Data(contentsOf: url){
            self.imageProfile.image = UIImage(data: data)
            
        }
        
    }
    func uploadFile(uid: String, data: Data) {
        
        let storageRef = Storage.storage().reference().child(uid)
        let metadatat = StorageMetadata()
        metadatat.contentType = "image/jpeg"
        
        storageRef.putData(data, metadata: metadatat) { (uploadData,error) in
            
            if error != nil {
                print(error!)
            } else {
                DispatchQueue.main.async {
                    storageRef.downloadURL { url, error in
                        if error != nil {
                            print(error!)
                        }else {
                            guard let url = url?.absoluteString else { return }
                            UserApi.addImageProfile(uid: uid, url: url)
                        }
                    }
                }
                
                
            }
        }
    }
}


