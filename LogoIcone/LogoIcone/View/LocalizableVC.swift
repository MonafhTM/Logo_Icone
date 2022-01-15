//
//  theViewController.swift
//  LogoIcone
//
//  Created by Monafh on 08/06/1443 AH.
//

import UIKit

class LocalizableVC : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

//  extension for localizable the app to any language ...

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
