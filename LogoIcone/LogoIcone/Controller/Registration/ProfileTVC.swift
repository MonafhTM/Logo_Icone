//
//  ProfileVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit
import FirebaseAuth

class ProfileTVC: UITableViewController  {

    
    @IBOutlet weak var firsNameLBL: UILabel!
    @IBOutlet weak var lasNameLBL: UILabel!
    @IBOutlet weak var usersNameLBL: UILabel!
    @IBOutlet weak var genderProfailLBL: UILabel!
    @IBOutlet weak var ageProfailLBL: UILabel!
    @IBOutlet weak var bioLBL: UILabel!
    
    
    
    var getUser = User()
    var caching = CachingProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataProfile()
    }
    
    // MARK: - Loading Data ....
    
    func getDataProfile(){
        
        UserApi.getProfile(uid: Auth.auth().currentUser?.uid ?? "", completion: { user in
            self.firsNameLBL.text = user.firstName
            self.lasNameLBL.text = user.lastName
            self.usersNameLBL.text = user.userName
            self.genderProfailLBL.text = user.gender
            self.ageProfailLBL.text = "\(user.age ?? 0)"
            self.bioLBL.text = user.bio
        
        })
    }
    
}

