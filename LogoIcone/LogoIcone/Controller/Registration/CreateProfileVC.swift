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
    
    
    // MARK: - Outlets
    
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
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    // MARK: - Objects
    
    var theImage : String?
    let imagePicker = UIImagePickerController()

    fileprivate func notificationTextFiled() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationTextFiled()

        usersNameLBL.text = "User Name ".localized
        userName.placeholder = "Enter your userName ".localized
        firstNameLBL.text = "First Name".localized
        firsNametx.placeholder = "Write first name".localized
        lastNameLBL.text = "Last Name".localized
        lastNametx.placeholder = "write last name ".localized
        bioLBL.text = "Bio".localized
        biotx.placeholder = "your own space to write".localized
        ageLBL.text = "AGE".localized
        genderLBL.text = "Gender".localized
        gendertx.placeholder = "male , Female".localized
        backgroundImage.image = UIImage(named: "createProfile")
        backgroundView.image = UIImage(named: "creatProfiles")
        
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        
        userName.delegate = self
        firsNametx.delegate = self
        lastNametx.delegate = self
        biotx.delegate = self
        agetx.delegate = self
        imagePicker.delegate = self
        
        let TapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
              view.addGestureRecognizer(TapGesture)
        getDataFromProfile()
    }
    
    func profile(userName :String, firstName :String, lastName :String, bio :String , age: Int ,gender : String) {
        
        UserApi.addProfileInfo(userName: userName ,firstName: firstName, lastName: lastName, bio: bio, age: age, gender: gender, uid: Auth.auth().currentUser?.uid ?? "")
        { cheak in
            if cheak {
                print("Done")
                self.dismiss(animated: true, completion: nil)
                //self.navigationController?.popViewController(animated: true)
//
//                let vc = self.storyboard?.instantiateViewController(identifier: "saveProfile") as! ProfileTVC
//                self.navigationController?.pushViewController(vc, animated: true)
//
            } else{
                print("ther is error")
            }
        }
    }
    
    func getDataFromProfile(){
        
        if Auth.auth().currentUser?.uid == nil {
            performSegue(withIdentifier: "signup", sender: nil)
        } else {
            UserApi.getProfile(uid: Auth.auth().currentUser?.uid ?? "", completion: { user in
                self.firsNametx.text = user.firstName
                self.lastNametx.text = user.lastName
                self.userName.text = user.userName
                self.gendertx.text = user.gender
                self.agetx.text = "\(user.age ?? 0)"
                self.biotx.text = user.bio
                // guard
                guard let url = URL(string: user.imageProfile ?? "") else {return}
                self.imageProfile.kf.setImage(with: url , options: [.cacheOriginalImage])
            })
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func choseImage(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        
        // casting to string
        guard let age = Int(agetx.text ?? "nil") else {return }
        
        profile(userName: userName.text ?? "" ,firstName: firsNametx.text ?? "" ,lastName: lastNametx.text ?? "", bio: biotx.text ?? "", age: age, gender: gendertx.text ?? "" )
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}

extension CreateProfileVC :   UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss(animated: true){ [weak self ]in
            guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            else {return}
            
            self?.imageProfile.image = image
            guard let uid = Auth.auth().currentUser?.uid else {return }
            guard let imageData = image.pngData() else { return }
            self?.uploadFile(uid: uid, data: imageData)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
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
