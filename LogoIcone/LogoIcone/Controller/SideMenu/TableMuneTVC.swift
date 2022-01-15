//
//  TableMuneTVC.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import UIKit
import SideMenu


class TableMuneTVC: UITableViewController {
    
    
    var textFont = UIFont(name: "Helvetica Bold", size: 15
    )!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "SidMenu1"))
        
    }
}
