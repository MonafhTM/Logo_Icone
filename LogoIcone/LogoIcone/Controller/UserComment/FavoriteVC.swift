//
//  FavoriteVC.swift
//  LogoIcone
//
//  Created by Monafh on 02/06/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore


class FavoriteVC: UIViewController  {
    
    var commentArray = [Comment]()
    var currentUser = User()
    
    @IBOutlet weak var favoriteTableView: UITableView!
    

    @IBOutlet weak var titleYourCommentLBL: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleYourCommentLBL.text = "Your Comment".localized
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        getDataPrivatComments()
        getDataProfile()
    }
  
    fileprivate func getDataPrivatComments() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        CommentApi.getMyComments(uid : uid ,completion: { comment in
            DispatchQueue.main.async {
                self.commentArray.append(comment)
                self.favoriteTableView.reloadData()
            }
        })
    }
  
    func getDataProfile(){
        
        UserApi.getProfile(uid:  Auth.auth().currentUser?.uid ?? "", completion: { user in
            DispatchQueue.main.async {
                self.currentUser = user
                self.favoriteTableView.reloadData()
            }
            
            
        })
        
    }

    
}

extension FavoriteVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! FavoriteTVCell
        
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
