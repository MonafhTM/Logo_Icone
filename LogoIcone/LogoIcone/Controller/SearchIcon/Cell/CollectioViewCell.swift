//
//  CollectioViewCell.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
//    Image outlet ..
    
    @IBOutlet weak var imageIcon: UIImageView!
    
    override func prepareForReuse() {
        
        imageIcon.image = nil
    }
}
