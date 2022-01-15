//
//  PVC.swift
//  LogoIcone
//
//  Created by Monafh on 23/05/1443 AH.

import UIKit

class SearchVC: UIViewController , UISearchBarDelegate{
    
    
    
    // MARK: - Outlets
    @IBOutlet weak var titleForSearch: UILabel!
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    
    // MARK: - Objects
    
    var icons_Objects: [Icon] = []
    var iconId: String?
    var iconFormatElement: FormatElement?
    var selectedIndex = 0
    var searchBarCancel = false
    
    //     API Key .
    let idApp = "T9K6jZD17uI426YGYi85NRBqb74vc3qikziF9ZFNH7NilYpN62oDwPFl0Z82hCOL"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.image = UIImage(named: "Background")
        searchBar.delegate = self
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        titleForSearch.text = "Look For Icone :".localized
        searchBar.placeholder = "Search here Please".localized
        
    }
    
    // MARK: - search Bar Methods
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let nameOfTheSerach = ""
        
        if nameOfTheSerach != "Arrow"  {
            
            //             Alert massage ...
            showAlertWith(title: "Error".localized, message: "Search about Something else".localized)
            
        }else{
            
            icons_Objects.removeAll()
            myCollectionView.reloadData()
            simpleReqest(nameOfTheSerach: searchBar.text ?? "", size: 8)
        }
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        icons_Objects.removeAll()
        myCollectionView.reloadData()
        simpleReqest(nameOfTheSerach: searchBar.text ?? "" , size: 8)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBarCancel = false
        searchBar.text = ""
        myCollectionView.reloadData()
        
    }
    
    // MARK: - Alert message
    
    func showAlertWith(title: String, message: String){
        let nameOfSerachAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        nameOfSerachAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(nameOfSerachAlert, animated: true)
    }
}
