//
//  PVC.swift
//  LogoIcone
//
//  Created by Monafh on 23/05/1443 AH.

import UIKit

class SearchVC: UIViewController , UISearchBarDelegate{
    
    @IBOutlet weak var titleForSearch: UILabel!
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let idApp = "T9K6jZD17uI426YGYi85NRBqb74vc3qikziF9ZFNH7NilYpN62oDwPFl0Z82hCOL"
    var icons_Objects: [Icon] = []
    var iconId: String?
    var iconFormatElement: FormatElement?
    var selectedIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        titleForSearch.text = "Look For Icone :".localized
        searchBar.placeholder = "Search here Please".localized
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let nameOfTheSerach = ""
        
        if nameOfTheSerach == "arrow" || nameOfTheSerach == "Arrow"  {
            
            showAlertWith(title: "Error", message: "Search about Something else")
            
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
    
    func showAlertWith(title: String, message: String){
        let nameOfSerachAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        nameOfSerachAlert.addAction(UIAlertAction(title: "OK", style: .default))
        present(nameOfSerachAlert, animated: true)
    }
}

