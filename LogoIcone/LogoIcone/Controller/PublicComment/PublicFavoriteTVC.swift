//
//  publicFavoriteTVC.swift
//  LogoIcone
//
//  Created by Monafh on 07/06/1443 AH.
//

import UIKit
import FirebaseAuth

class PublicFavoriteTVC: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var commentArray = [Comment]()
    var currentUser = [User]()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getDataProfile()
        getDataPublicComment()
        
        
    }
    
    func getDataPublicComment(){
        CommentApi.getPublicComment { comment in
            DispatchQueue.main.async {
                self.commentArray.append(comment)
                self.tableView.reloadData()
            }
        }
    }
    
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PublicFavoriteTVCell else {return UITableViewCell() }
        
        //        cell.userNamePublic.text = currentUser[indexPath.row].firstName
        cell.commentLBL.text = commentArray[indexPath.row].textComment
        
        guard let url = URL(string: commentArray[indexPath.row].imageOfComment ?? "") else {return UITableViewCell()}
        cell.iconeLikePublic.kf.setImage(with: url)
        //
//        guard let url = URL(string: currentUser[indexPath.row].imageProfile ?? "") else {return UITableViewCell () }
//        cell.imageUserPublic.kf.setImage(with: url)
        
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}

