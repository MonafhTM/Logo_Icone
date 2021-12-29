//
//  LogoVC.swift
//  LogoIcone
//
//  Created by Monafh on 25/05/1443 AH.
//

import UIKit

class LogoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var logoarr = [Logo]()

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
        tableView.dataSource = self

        logoarr.append(Logo(title: "A", photos: [UIImage(named: "Icon")!, UIImage(named: "Icon")!]))
        logoarr.append(Logo(title: "B", photos: [UIImage(named: "Icon")!, UIImage(named: "Icon")!]))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logoarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LogoTVCell
        return cell
    }
    
    
}

struct Logo {
    
    let title : String
    let photos : [UIImage]
    
}
