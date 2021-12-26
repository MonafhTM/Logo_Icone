//
//  SectionViewController.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit

class SectionViewController: UIViewController {


    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Menu Button Tint Color
        navigationController?.navigationBar.tintColor = .white

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
    }
}
