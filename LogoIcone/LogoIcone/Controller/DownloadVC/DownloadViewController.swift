//
//  DownloadViewController.swift
//  LogoIcone
//
//  Created by Monafh on 24/05/1443 AH.
//

import Foundation

import UIKit

class DownloadViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let idApp = "T9K6jZD17uI426YGYi85NRBqb74vc3qikziF9ZFNH7NilYpN62oDwPFl0Z82hCOL"
    var selectedIcon: Icon!
    var iconFormatElement : FormatElement?
    var seticonFormatElement : FormatElement?
    
    @IBOutlet weak var iconNameLabel: UILabel!
    @IBOutlet weak var showIcon: UIImageView!
    
    //    @IBOutlet weak var iconTagLabel: UILabel!
    //    @IBOutlet weak var resterSizes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        seticonFormatElement = iconFormatElement
        
        guard let url = URL(string: seticonFormatElement?.previewURL ?? "") else { return }
        downloadImage(imageView: showIcon, from: url)
        iconNameLabel.text = selectedIcon.tags.first
        
        inforUrl()
    }
    // MARK: - simple Request
    func simpleRequest(iconeId:Int) {
        let url = "https://api.iconfinder.com/v4/icons/"
        let urlRequest = NSMutableURLRequest(url: NSURL(string: "\(url)\(iconeId)")! as URL,cachePolicy: .useProtocolCachePolicy,timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"
        let headers = [
            "Accept": "application/json",
            "Authorization": "Bearer \(idApp)"
        ]
        urlRequest.allHTTPHeaderFields = headers
        // 5 - Send HTTP Request
        let task = URLSession.shared.dataTask(with: urlRequest as URLRequest) { (data, response, error) in
            // 6 - Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            // 7 - Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            // 8 - Convert HTTP Response Data to a simple String or to specific struct
            if let data = data, let icons = try? JSONDecoder().decode(Welcome.self, from: data) {
                print(data)
            }}
        task.resume()
    }
    
    // MARK: - Download Images
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(imageView:UIImageView,from url: URL) {
        print("Download .....")
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
    fileprivate func inforUrl() {
        //        for tag in selectedIcon.tags {
        ////            iconTagLabel.text?.append(" \(tag)")
        //        }
        //        for size in selectedIcon.vectorSizes {
        //            for siz in size.targetSizes{
        //                for si in siz {
        ////                    resterSizes.text?.append(" \(si)")
        //                }
        //            }
        //        }
    }
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    //MARK: - Add image to Library
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            showAlertWith(title: "Save error", message: error.localizedDescription)
        } else {
            showAlertWith(title: "Saved!", message: "Your image has been saved to your photos.")
        }
    }
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @IBAction func downloadImages(_ sender: Any) {
        
        UIImageWriteToSavedPhotosAlbum(showIcon.image!, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}
