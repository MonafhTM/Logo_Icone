//
//  CachingProfileManager.swift
//  LogoIcone
//
//  Created by Monafh on 23/05/1443 AH.

import UIKit

// MARK: - Caching ..

class CachingProfileManager {
    
    let cache = NSCache<NSString, UIImage>()
    var imageKeys: NSString = NSString(string: "Key")
    
    func imageURL(forKey key: String) -> URL{
        let decumentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let decumentsDirectory = decumentsDirectories.first!
        return decumentsDirectory.appendingPathComponent(key)
    }
    func getImage(forKey key: String) -> UIImage?{
        if let existingImage = cache.object(forKey: key as NSString){
            return existingImage
        }
        let url = imageURL(forKey: key)
        guard let imageFromDisk = UIImage(contentsOfFile: url.path) else { return nil }
        cache.setObject(imageFromDisk, forKey: key as NSString)
        return imageFromDisk
    }
}
