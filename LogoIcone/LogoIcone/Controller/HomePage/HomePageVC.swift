//
//  ViewController.swift
//  LogoIcone
//
//  Created by Monafh on 21/05/1443 AH.

import UIKit

class HomePageVC: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var symbolImage: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var infoTitle: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: - Objects
    var pageTitle : String?
    var pageInfo : String?
    var imageShow : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        symbolImage.image = UIImage(named: "HomeImage")
        backgroundImage.image = UIImage(named: "Background")
        symbolImage.layer.cornerRadius = 20
        symbolImage.layer.borderWidth = 0.20
        
        setHomePageVaribles()
    }
    
    
    // MARK: - Custom Methods
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
    
    
    // MARK: - Action Methods
    
    // Boutten move to the First section in App (SearchIconVC) by perform ....
    
    @IBAction func startButt(_ sender: Any) {
        
        // Perform a transition to (SearchIconVC)
        performSegue(withIdentifier: "SearchIconSegue", sender: nil)
        
    }
    
    //  Boutten move to the Registration, SignIn Screan  ....
    
    @IBAction func registrationButt(_ sender: Any) {
        // Perform a transition to (SignIn)
        
        performSegue(withIdentifier: "RegistrationVCSegue", sender: nil)
        
    }
}

