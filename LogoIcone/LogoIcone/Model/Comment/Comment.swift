//
//  Comment.swift
//  LogoIcone
//
//  Created by Monafh on 07/06/1443 AH.
//

import Foundation




class Comment {
    
    var textComment : String?
    var imageOfComment : String?
    
    var userName : String?
    var userImage : String?
    
    
}

// create Method For set main  and All commint & get thim to call in CommentApi

extension Comment {
    
    static  func setComment (text : String , image : String ) -> [String:Any] {
        
        return ["textComment": text  ,
                "imageOfComment" :  image
        ]
    }
}

extension Comment {
    static func getComment(dict: [String: Any]) -> Comment {
        
        let comment = Comment()
        
        comment.textComment = dict["textComment"] as? String
        comment.imageOfComment = dict["imageOfComment"] as? String
        
        return comment
    }
}

//  extension For set All comment  ...

extension Comment {
    
    static func setAllComment (textComment :String , imageOfComment :String , userName : String , userImage: String, uid: String) -> [String:Any]{
        return ["textComment": textComment  ,
                "imageOfComment" : imageOfComment,
                "userName" : userName,
                "userImage" : userImage,
                "uid" : uid
        ]
    }
}
//  extension For get All comment  ...

extension Comment {
    
    static func getAllComment(dict: [String: Any]) -> Comment {
        
        let comment = Comment()
        
        comment.textComment = dict["textComment"] as? String
        comment.imageOfComment = dict["imageOfComment"] as? String
        
        comment.userName = dict["userName"] as? String
        comment.userImage = dict["userImage"] as? String
        
        return comment
    }
}


