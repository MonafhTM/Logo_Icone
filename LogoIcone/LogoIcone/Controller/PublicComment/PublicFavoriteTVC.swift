//
//  publicFavoriteTVC.swift
//  LogoIcone
//
//  Created by Monafh on 07/06/1443 AH.
//

import UIKit
import FirebaseAuth

class PublicFavoriteTVC: UIViewController {
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var allComment: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: - Objects
    
    var commentArray = [Comment]()
    var currentUser = [User]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        allComment.text = "Public".localized
        backgroundImage.image = UIImage(named: "Background")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        CommentApi.getAllComments( completion: { comment in
            self.commentArray.append(comment)
            self.tableView.reloadData()
        })
    }
    
    // MARK: - Custom Methods
    
    func getDataProfile(){
        
        UserApi.getProfile(uid:  Auth.auth().currentUser?.uid ?? "" , completion: { user in
            DispatchQueue.main.async {
                self.currentUser.append(user)
                self.tableView.reloadData()
            }
        })
    }
}


extension PublicFavoriteTVC : UITableViewDelegate ,UITableViewDataSource {
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PublicFavoriteTVCell else {return UITableViewCell() }
        
        
        cell.userNamePublic.text = commentArray[indexPath.row].userName
        cell.commentLBL.text = commentArray[indexPath.row].textComment
        
        
        guard let url = URL(string: commentArray[indexPath.row].imageOfComment ?? "") else {return UITableViewCell()}
        cell.iconeLikePublic.kf.setImage(with: url)
        
        // image For User >>>>>
        
        guard let url = URL(string: commentArray[indexPath.row].userImage ?? "") else {return UITableViewCell () }
        cell.imageUserPublic.kf.setImage(with : url)
        
        return cell
        
    }
    //    control heigh in cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

