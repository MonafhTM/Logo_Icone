//
//  FavoriteVC.swift
//  LogoIcone
//
//  Created by Monafh on 02/06/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class YourCommentVC: UIViewController  {
    
    // MARK: - Outlets
    
    @IBOutlet weak var yourCommentTableView: UITableView!
    @IBOutlet weak var titleYourCommentLBL: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    // MARK: - Objects
    var commentArray = [Comment]()
    var currentUser = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleYourCommentLBL.text = "Your Comment".localized
        backgroundImage.image = UIImage(named: "Background")
        
        yourCommentTableView.delegate = self
        yourCommentTableView.dataSource = self
        getDataYourComments()
        getDataProfile()
    }
    
    // MARK: - Custom Methods
    
    fileprivate func getDataYourComments() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        CommentApi.getYourComments(uid : uid ,completion: { comment in
            DispatchQueue.main.async {
                self.commentArray.append(comment)
                self.yourCommentTableView.reloadData()
            }
        })
    }
    
    func getDataProfile(){
        
        UserApi.getProfile(uid:  Auth.auth().currentUser?.uid ?? "", completion: { user in
            DispatchQueue.main.async {
                self.currentUser = user
                self.yourCommentTableView.reloadData()
            }
        })
    }
}

extension YourCommentVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! YourCommentTVCell
        
        cell.commentLogoIcon.text = commentArray[indexPath.row].textComment
        cell.UserName.text = commentArray[indexPath.row].userName
        
        //
        guard let url = URL(string: commentArray[indexPath.row].imageOfComment ?? "") else {return UITableViewCell()}
        cell.likeLogoIcon.kf.setImage(with: url)
        //
        guard let url = URL(string: currentUser.imageProfile ?? "") else {return UITableViewCell () }
        cell.userImage.kf.setImage(with: url)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
