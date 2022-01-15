//
//  UserApi.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.


import Foundation
import FirebaseFirestore
import FirebaseAuth
import UIKit


class UserApi {
    
    //    add user password & Email with uid to firstore by useing CreateUser Methods from UserModel ....
    
    static func addUser(password :String ,uid:String,email:String) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).setData(User.CreateUser( password: password, email: email ))
        
    }
    
    //    add profile Information to firstore by useing CreateProfile Methods from UserModel ....
    
    static func addProfileInfo (userName : String ,firstName :String,lastName :String, bio :String , age: Int ,gender : String, uid:String ,completion: @escaping (Bool) -> Void) {
        
        let refProfile = Firestore.firestore().collection("Users")
        
        refProfile.document(uid).setData( User.CreateProfile(userName:userName,firstName:firstName, lastName: lastName, bio: bio, age: age, gender: gender) , merge: true )
        completion(true)
    }
    
    //    methods to get user from firestore with use getUser Methods ....
    
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
    }
    
    //    methods to get Profile information from firestore with use getProfile Methods ....
    
    static func getProfile(uid:String,completion: @escaping (User) -> Void) {
        
        let refProfile = Firestore.firestore().collection("Users")
        
        refProfile.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getProfile(dict: document.data()!)
                completion(user)
                
            }
        }
    }
    
    //    Methods for Image Profile to add it in firestore by useing putImageProfile from User Model ..
    
    static func addImageProfile(uid:String,url:String) {
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.putImagePofile(imageProfile: url), merge: true)
        
    }
}

