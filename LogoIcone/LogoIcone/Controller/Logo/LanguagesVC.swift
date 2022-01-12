//
//  LanguagesVC.swift
//  LogoIcone
//
//  Created by Monafh on 08/06/1443 AH.
//

import UIKit

class LanguagesVC: UIViewController {

    
    @IBOutlet weak var Languages: UILabel!
    @IBOutlet weak var changLang: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        Languages.text = NSLocalizedString("Languages", comment: "")
        
    }
    
    @IBAction func changLanges(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
