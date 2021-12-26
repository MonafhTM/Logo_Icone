//
//  ProfileVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuBtn.target = self.revealViewController()
        sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
    }
    
}
