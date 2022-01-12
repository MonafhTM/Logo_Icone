//
//  FavoriteTVCell.swift
//  LogoIcone
//
//  Created by Monafh on 02/06/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Kingfisher

class FavoriteTVCell: UITableViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var likeLogoIcon: UIImageView!
    @IBOutlet weak var commentLogoIcon: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.image = nil
        UserName.text = ""
        likeLogoIcon.image = nil
        commentLogoIcon.text = ""
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }    
}
