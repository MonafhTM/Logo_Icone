//
//  ProfileVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Kingfisher
class ProfileTVC: UITableViewController  {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var firsNameLBL: UILabel!
    @IBOutlet weak var lasNameLBL: UILabel!
    @IBOutlet weak var usersNameLBL: UILabel!
    @IBOutlet weak var genderProfailLBL: UILabel!
    @IBOutlet weak var ageProfailLBL: UILabel!
    @IBOutlet weak var bioLBL: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    
    // MARK: - Objects
    
    var getUser = User()
    var caching = CachingProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataProfile()
        
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
    }
    
    // MARK: - Loading Data ....
    
    func getDataProfile(){
        
        if Auth.auth().currentUser?.uid == nil {
            performSegue(withIdentifier: "signup", sender: nil)
        } else {
            UserApi.getProfile(uid: Auth.auth().currentUser?.uid ?? "", completion: { user in
                self.firsNameLBL.text = user.firstName
                self.lasNameLBL.text = user.lastName
                self.usersNameLBL.text = user.userName
                self.genderProfailLBL.text = user.gender
                self.ageProfailLBL.text = "\(user.age ?? 0)"
                self.bioLBL.text = user.bio
                // guard
                guard let url = URL(string: user.imageProfile ?? "") else {return}
                self.imageProfile.kf.setImage(with: url , options: [.cacheOriginalImage])
            })
        }
    }
    
    // MARK: - signOut ....
    
    func signOut() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out:", signOutError)
        }
        print ("signout")
        
    }
    
    // MARK: - Action Methods
    
    @IBAction func signOut(_ sender: Any) {
        
        signOut()
        performSegue(withIdentifier: "signup", sender: nil)
        
    }
}
