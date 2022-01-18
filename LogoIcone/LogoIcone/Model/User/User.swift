//
//  User.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.

import Foundation
import FirebaseAuth
import FirebaseFirestore
import UIKit

class User {
    
    var firstName:String?
    var lastName:String?
    var email: String?
    var userName: String?
    var bio: String?
    var age: Int?
    var gender: String?
    var password :String?
    
    
    
    
    var imageProfile : String?
    
}

extension User {
    
    
    // MARK: - Methods For creat & get User with Image Profile
    
    
    static func CreateUser(password:String,email:String) -> [String: Any] {
        
        let newUser = [
            "email" :email,
            "password" : password
        ] as [String : Any]
        
        return newUser
    }
    
    static func CreateProfile(userName : String ,firstName :String,lastName: String, bio :String , age: Int ,gender : String ) -> [String: Any] {
        
        let uesrProfile = [
            "userName" : userName ,
            "firstName" : firstName ,
            "lastName" : lastName,
            "bio" : bio ,
            "age" : age ,
            "gender" : gender,
        ] as [String : Any]
        
        return uesrProfile
    }
    
    //     --> to get user information
    
    static func getUser(dict: [String: Any]) -> User {
        
        let user = User()
        
        user.userName = dict["userName"] as? String
        user.email = dict["email"] as? String
        
        return user
    }
    static func getProfile(dict: [String: Any]) -> User {
        
        let user = User()
        
        user.userName = dict["userName"] as? String
        user.firstName = dict["firstName"] as? String
        user.lastName = dict["lastName"] as? String
        user.bio = dict["bio"] as? String
        user.age = dict["age"] as? Int
        user.gender = dict["gender"] as? String
        user.imageProfile = dict["imageProfile"] as? String
        
        return user
    }
    
    static func putImagePofile(imageProfile : String) -> [String: Any]{
        let newUser = ["imageProfile": imageProfile] as [String: Any]
        return newUser
    }
}

