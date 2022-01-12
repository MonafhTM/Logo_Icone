//
//  TableMuneTVC.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import UIKit
import SideMenu


class TableMuneTVC: UITableViewController {

    
    var textFont = UIFont(name: "Helvetica Bold", size: 12)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.backgroundColor = .white
        tableView.backgroundView = UIImageView(image: UIImage(named: "SidMenu"))

    }
}
