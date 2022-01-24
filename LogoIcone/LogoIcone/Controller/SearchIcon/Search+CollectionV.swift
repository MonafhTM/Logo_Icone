//
//  PVC+CollectionV.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import Foundation
import UIKit

extension SearchVC: UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    
    // MARK: - collection View data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("icons_Objects:\(icons_Objects.count)")
        return icons_Objects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        //        convert from url to string ...
        
        guard let url = URL(string: icons_Objects[indexPath.row].rasterSizes[8].formats[0].previewURL) else { return UICollectionViewCell() }
        
        downloadImage(imageView: cell.imageIcon, from: url)
        
        return cell
    }
    
    //     method to move when select on image cell ...
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        iconFormatElement = icons_Objects[indexPath.row].rasterSizes[8].formats[0]
        
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "toDetals", sender: collectionView.cellForItem(at: indexPath))
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("it's move ...")
    }
    //     methods for control level cell ....
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4  , height: collectionView.frame.height/4   )
    }
    
    // MARK: - prepare Methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? DownloadIconVC
        vc?.selectedIcon = icons_Objects[selectedIndex]
        vc?.iconFormatElement = iconFormatElement
        
    }
}

