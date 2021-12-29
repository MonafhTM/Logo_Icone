//
//  LogoTVCCell.swift
//  LogoIcone
//
//  Created by Monafh on 25/05/1443 AH.
//

import UIKit

class LogoTVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var title = ""
    var arr = []
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    

}
