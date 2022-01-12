//
//  LogoTVCCell.swift
//  LogoIcone
//
//  Created by Monafh on 25/05/1443 AH.
//

import UIKit

class LogoTVCell: UITableViewCell {

    var brands : [Brandfetch] = []
    
    @IBOutlet weak var nameBrandsLBL: UILabel!
    @IBOutlet weak var firstLogoBrands: UIImageView!
    @IBOutlet weak var secondLogoBrands: UIImageView!
    @IBOutlet weak var titelLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titelLBL.text = "Description"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
