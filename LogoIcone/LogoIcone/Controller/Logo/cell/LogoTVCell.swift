//
//  LogoTVCCell.swift
//  LogoIcone
//
//  Created by Monafh on 25/05/1443 AH.


import UIKit

class LogoTVCell: UITableViewCell {
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameBrandsLBL: UILabel!
    @IBOutlet weak var firstLogoBrands: UIImageView!
    @IBOutlet weak var secondLogoBrands: UIImageView!
    @IBOutlet weak var titelLBL: UILabel!
    @IBOutlet weak var descriptionLBL: UILabel!
    
    
    // MARK: - Objects
    
    var brands : [Brandfetch] = []
    var parentController : LogoVC!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        subject for titel Label ...
        
        titelLBL.text = "Description".localized
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    //MARK: - Add image to Library ...
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        
        if let error = error {
            // we got back an error!
            
            showAlertWith(title: "Save error".localized, message: error.localizedDescription)
        } else {
            showAlertWith(title: "Saved!".localized, message: "Your image has been saved to your photos.".localized)
        }
    }
    
    // MARK: - Alert message
    
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK".localized, style: .default))
        parentController.present(ac, animated: true)
    }

    
    // MARK: - Action Methods
    
    
    @IBAction func save(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(firstLogoBrands.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        UIImageWriteToSavedPhotosAlbum(secondLogoBrands.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

