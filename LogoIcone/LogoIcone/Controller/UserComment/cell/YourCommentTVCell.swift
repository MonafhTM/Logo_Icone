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

class YourCommentTVCell: UITableViewCell {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var UserName: UILabel!
    @IBOutlet weak var likeLogoIcon: UIImageView!
    @IBOutlet weak var commentLogoIcon: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        backgroundImage.image = UIImage(named: "CommentAny")
        userImage.layer.cornerRadius = userImage.frame.height / 2
        

        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImage.image = nil
        UserName.text = ""
        likeLogoIcon.image = nil
        commentLogoIcon.text = ""
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }    
}
