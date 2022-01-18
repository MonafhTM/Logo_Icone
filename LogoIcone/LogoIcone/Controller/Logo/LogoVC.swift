//
//
import UIKit



class LogoVC: UIViewController {


    @IBOutlet weak var titelForLogoSection: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    
    // MARK: - Objects
    var brands : [Brandfetch] = []
    var urlLink = [
        "https://api.brandfetch.io/v2/brands/brandfetch.com", "https://api.brandfetch.io/v2/brands/spotify.com", "https://api.brandfetch.io/v2/brands/salesforce.com", "https://api.brandfetch.io/v2/brands/netflix.com", "https://api.brandfetch.io/v2/brands/github.com", "https://api.brandfetch.io/v2/brands/airbnb.com", "https://api.brandfetch.io/v2/brands/mailchimp.com", "https://api.brandfetch.io/v2/brands/figma.com", "https://api.brandfetch.io/v2/brands/reddit.com", "https://api.brandfetch.io/v2/brands/invision.com", "https://api.brandfetch.io/v2/brands/bitcoin.com", "https://api.brandfetch.io/v2/brands/uber.com", "https://api.brandfetch.io/v2/brands/zendesk.com", "https://api.brandfetch.io/v2/brands/webflow.com",  "https://api.brandfetch.io/v2/brands/asana.com",  "https://api.brandfetch.io/v2/brands/stripe.com",  "https://api.brandfetch.io/v2/brands/intercom.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        // subject for title Section ...

        titelForLogoSection.text = "Global Logo".localized
        
        for i in urlLink {
           print (simpleReqest(url: i))
        }
        let TapGesture = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
              view.addGestureRecognizer(TapGesture)
    }

    func simpleReqest(url : String) {
//        API key
//        let appId = "SrbY0wMaPciZhR7Q7m1Kfynns/P4G/NEu4gkqcHSbys=" //// spare Key
        let appId = "x51nS7J4Z/UOqscmGPtxhOnZC0ns8ZWVAWeM5fgVBuw="


        let request = NSMutableURLRequest(url: NSURL(string: "\(url)" )! as URL, cachePolicy: .useProtocolCachePolicy,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let headers = [ "Accept": "application/json", "Authorization": "Bearer \(appId)"
        ]
        request.allHTTPHeaderFields = headers

        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in

            // Handle Error
            if let error = error {
                print("Error took place \(error)")
                return
            }
            // Handle Empty Response
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")

            }

            if let data = data {
                // Hndle Empty Data

                let resoonseText = String(data: data, encoding: .utf8) ?? ""
                print(resoonseText)

//                 convert from null to string ...
                let cleantedText = resoonseText.replacingOccurrences(of: "\"originId\":null", with: "\"originId\":\"\"")

//                print(cleantedText)
                let formattedData = cleantedText.data(using: .utf8) ?? Data()

                do {
                    let brand = try JSONDecoder().decode(Brandfetch.self, from: formattedData)
//                    print(brand.name)
//                    print(brand.logos.first?.formats[0].src)
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

    // MARK: - Images Data ..

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

//MARK: - TableView

extension LogoVC : UITableViewDelegate , UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return brands.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LogoTVCell

        //        set name & description in cell ..

        cell.parentController = self
        cell.nameBrandsLBL.text = brands[indexPath.row].name
        cell.descriptionLBL.text = brands[indexPath.row].brandfetchDescription

        //        conversion Image ...

        guard let url = URL(string: brands[indexPath.row].logos[0].formats[0].src)  else { return UITableViewCell() }
        guard let url1 = URL(string: brands[indexPath.row].logos[1].formats[0].src)  else { return UITableViewCell() }


        showTheImage(imageView: cell.firstLogoBrands, from: url)
        showTheImage(imageView: cell.secondLogoBrands, from: url1)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 370

    }
    
    
    // MARK: - Alert message
    
    func showAlertWith(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK".localized, style: .default))
        present(ac, animated: true)
    }


}
