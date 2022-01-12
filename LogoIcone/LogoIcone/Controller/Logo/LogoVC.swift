

import UIKit

class LogoVC: UIViewController {
    

    var brands : [Brandfetch] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        tableView.delegate = self
        tableView.dataSource = self
        
//        array from url .......
        
        simpleReqest(url:"https://api.brandfetch.io/v2/brands/brandfetch.com")
        simpleReqest(url:"https://api.brandfetch.io/v2/brands/spotify.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/salesforce.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/netflix.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/github.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/airbnb.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/mailchimp.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/figma.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/reddit.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/invision.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/bitcoin.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/uber.com" )
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/zendesk.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/webflow.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/asana.com")
//        simpleReqest(url: "https://api.brandfetch.io/v2/brands/stripe.com")
//        simpleReqest(url:"https://api.brandfetch.io/v2/brands/intercom.com")
//
        
    }
    
    func simpleReqest(url : String) {
        let appId = "an+siC4JT31Qjfb/rq/oke2SI7aEGi+Y/dt4f6b5xpU="

        
        
        let request = NSMutableURLRequest(url: NSURL(string: url )! as URL, cachePolicy: .useProtocolCachePolicy,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let headers = [ "Accept": "application/json", "Authorization": "Bearer \(appId)"
        ]
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
           
            if let error = error {
                print("Error took place \(error)")
                return
            }
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
                
            }
            if let data = data {
                
                
                let resoonseText = String(data: data, encoding: .utf8) ?? ""
                print(resoonseText)
                let cleantedText = resoonseText.replacingOccurrences(of: "\"originId\":null", with: "\"originId\":\"\"")
                print(cleantedText)
                let formattedData = cleantedText.data(using: .utf8) ?? Data()
                
                do {
                let brand = try JSONDecoder().decode(Brandfetch.self, from: formattedData)
            
                    
                print(brand.name)
                print(brand.logos.first?.formats[0].src)
                self.brands.append(brand)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                    
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
    // MARK: - Images
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func showTheImage(imageView:UIImageView,from url: URL) {
      
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
          
            DispatchQueue.main.async() {
                imageView.image = UIImage(data: data)

            }
        }
        
    }
}
//
extension LogoVC : UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return brands.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LogoTVCell

        cell.nameBrandsLBL.text = brands[indexPath.row].name
        cell.descriptionLBL.text = brands[indexPath.row].brandfetchDescription

        guard let url = URL(string: brands[indexPath.row].logos[0].formats[0].src)  else { return UITableViewCell() }
        
        guard let url1 = URL(string: brands[indexPath.row].logos[1].formats[1].src)  else { return UITableViewCell() }

//                print(url)

        showTheImage(imageView: cell.firstLogoBrands, from: url)
        showTheImage(imageView: cell.secondLogoBrands, from: url1)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370
        
    }

}
