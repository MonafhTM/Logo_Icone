//
//  ViewController.swift
//  LogoIcone
//
//  Created by Monafh on 21/05/1443 AH.

import UIKit

class HomePageVC: UIViewController {
    
    //  objects That used and define the avribles ...
    
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var infoTitle: UILabel!
    
    var pageTitle : String?
    var pageInfo : String?
    var imageShow : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        symbolImage.image = UIImage(named: "HomeImage")
        symbolImage.layer.cornerRadius = 20
        symbolImage.layer.borderWidth = 0.20
        
        setHomePageVaribles()
    }
    
    //    set the Objects to the varibles
    
    fileprivate func setHomePageVaribles() {
        
        if let titel = pageTitle {
            titleLBL.text = titel
        }
        
        if let description = pageInfo {
            infoTitle.text = description
        }
        
        if let image = imageShow {
            symbolImage.image = image
        }
    }
    
    // Boutten move to the First section in App (SearchIcon) ....
    
    @IBAction func startButt(_ sender: Any) {
        
        performSegue(withIdentifier: "SearchIconSegue", sender: nil)
        
    }
    
    //  Boutten move to the Registration, SignIn   ....
    
    @IBAction func registrationButt(_ sender: Any) {
        
        
        performSegue(withIdentifier: "RegistrationVCSegue", sender: nil)
        
    }
}

