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
    
    static func setComment(uid : String , commentText : String , image : String ) {
        
        Firestore.firestore().collection("Comment").document().setData(Comment.setComment(text: commentText, image: image))
        Firestore.firestore().collection("Users").document(uid).collection("Comment").document().setData(Comment.setComment(text: commentText, image: image))
        
    }
    //1
    
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
    
    
    //2
    
    static func getPrivateComment (uid : String , completion: @escaping (Comment)-> Void){
        
        let refCommentPrivat = Firestore.firestore().collection("Users").document(uid).collection("Comment")
        refCommentPrivat.getDocuments { documents, error in
            
            if let error = error {
                print(error)
            }else {
                guard let documents = documents else {return }
                for document in documents.documents {
                    refCommentPrivat.document(document.documentID).getDocument { document, error in
                        if let error = error {
                            print(error)
                        }else {
                            if let document = document, document.exists {
                                let comment = Comment.getComment(dict: document.data()!)
                                completion(comment)
                            }
                        }
                    }
                }
            }
        }
    }
}


