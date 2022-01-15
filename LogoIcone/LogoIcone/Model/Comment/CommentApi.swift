//
//  CommentApi.swift
//  LogoIcone
//
//  Created by Monafh on 07/06/1443 AH.
//

import Foundation
import FirebaseFirestore
import Firebase


class CommentApi {
    

    static func setComment(uid : String , commentText : String , image : String, imageUser: String, userName: String ) {
        
        Firestore.firestore().collection("Comment").addDocument(data:Comment.setAllComment(textComment: commentText, imageOfComment: image, userName: userName, userImage: imageUser, uid: uid))
    }

    static func getPublicComment (completion: @escaping(Comment) -> Void ){

        Firestore.firestore().collection("Comment").getDocuments { documents, error in

            if let error = error {
                print(error)
            }else {
                guard let documents = documents else { return}
                for document in documents.documents {
                    Firestore.firestore().collection("Comment").document(document.documentID).getDocument { document, error in

                        if let error = error {
                            print(error)
                        } else {
                            if let document = document , document.exists{
                                let comment = Comment.getComment(dict: document.data()!)
                                completion(comment)
                            }

                        }

                    }

                }

            }

        }
    }

    static func getYourComments (uid : String , completion: @escaping (Comment)-> Void){
        
        let refCommentPrivat = Firestore.firestore().collection("Comment").whereField("uid", isEqualTo: uid)
        refCommentPrivat.getDocuments { documents, error in
            
            if let error = error {
                print(error)
            }else {
                guard let documents = documents else {return }
                for document in documents.documents {
                    let comment = Comment.getAllComment(dict: document.data())
                    completion(comment)
                }
            }
        }
    }
    
    //test
    static func getAllComments ( completion: @escaping (Comment)-> Void){
        
        let refCommentPrivat = Firestore.firestore().collection("Comment")
        
        refCommentPrivat.getDocuments { documents, error in
            
            if let error = error {
                print(error)
            }else {
                guard let documents = documents else {return }
                for document in documents.documents {
                    let comment = Comment.getAllComment(dict: document.data())
                    completion(comment)
                }
            }
        }
    }
    
    
}


