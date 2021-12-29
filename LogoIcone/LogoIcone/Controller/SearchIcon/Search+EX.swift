//
//  PVC+.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import Foundation
import UIKit



extension SearchVC {
    
    //    MARK: - simple Request
    func simpleReqest(nameOfTheSerach: String, size: Int){
        let url = "https://api.iconfinder.com/v4/icons/search"
        let request = NSMutableURLRequest(url: NSURL(string: "\(url)?query=\(nameOfTheSerach)&count=30")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        request.httpMethod = "GET"
        let headers = [ "Accept": "application/json", "Authorization": "Bearer \(idApp)"
        ]
        request.allHTTPHeaderFields = headers
        
        //    ----------------------------------
        
        //  Send HTTP Request
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            //  Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
                //                print("Response HTTP Status code: \(response.description)")
                
            }
            //  Convert HTTP Response Data to a simple String or to specific struct
            if let data = data, let icons = try? JSONDecoder().decode(Welcome.self, from: data) {
                
                for i in icons.icons {
                    DispatchQueue.main.async {
                        self.icons_Objects.append(i)
                        self.myCollectionView.reloadData()
                    }
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Download Images
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(imageView:UIImageView,from url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            // always update the UI from the main thread
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)
            }
        }
    }
}
