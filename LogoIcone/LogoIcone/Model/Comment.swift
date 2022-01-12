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
    
    
}


extension Comment {
    
    static  func setComment (text : String , image : String  ) -> [String:Any] {
        
        return ["textComment": text  , "imageOfComment" :  image]
        
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
