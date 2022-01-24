//
//  publicFavoriteCell.swift
//  LogoIcone
//
//  Created by Monafh on 07/06/1443 AH.
//

import UIKit
import Kingfisher

class PublicFavoriteTVCell: UITableViewCell {
    
    
    // MARK: - Outlets
    @IBOutlet weak var imageUserPublic: UIImageView!
    @IBOutlet weak var userNamePublic: UILabel!
    @IBOutlet weak var iconeLikePublic: UIImageView!
    @IBOutlet weak var commentLBL: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImage.image = UIImage(named: "CommentAny")
        imageUserPublic.layer.cornerRadius = imageUserPublic.frame.height / 2
//
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
        
                imageUserPublic.image = nil
                userNamePublic.text = ""
                iconeLikePublic.image = nil
                commentLBL.text = ""
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
