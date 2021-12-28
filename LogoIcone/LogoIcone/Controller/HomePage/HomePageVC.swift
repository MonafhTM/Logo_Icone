//
//  ViewController.swift
//  LogoIcone
//
//  Created by Monafh on 21/05/1443 AH.
//

import UIKit

class HomePageVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLBL: UILabel!
    @IBOutlet weak var infoTitle: UILabel!
    
    var pageTitle : String?
    var pageInfo : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "HomeImage")
        //         Home Screen
        if let titel = pageTitle {
            titleLBL.text = titel
            
        }
        
        if let description = pageInfo {
            infoTitle.text = description
            
        }
    }
    
    @IBAction func startButt(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "MainViewController") as! MainViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func registrationButt(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignIn
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}

