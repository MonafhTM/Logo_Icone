//
//  UserApi.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.


import Foundation
import FirebaseFirestore
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseStorage
import FirebaseStorageSwift
import UIKit


class UserApi {
    
    static func addUser(password :String ,uid:String,email:String) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).setData(User.CreateUser( password: password, email: email ))
        
    }
    
    static func addProfileInfo (userName : String ,firstName :String,lastName :String, bio :String , age: Int ,gender : String, uid:String ,completion: @escaping (Bool) -> Void) {
        
        let refProfile = Firestore.firestore().collection("Users")
        
        refProfile.document(uid).setData( User.CreateProfile(userName:userName,firstName:firstName, lastName: lastName, bio: bio, age: age, gender: gender) , merge: true )
        completion(true)
    }
    
    static func getUser(uid:String,completion: @escaping (User) -> Void) {
        
        let refUsers = Firestore.firestore().collection("Users")
        
        refUsers.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getUser(dict: document.data()!)
                completion(user)
            }
        }
    }
    
    static func getProfile(uid:String,completion: @escaping (User) -> Void) {
        
        let refProfile = Firestore.firestore().collection("Users")
        
        refProfile.document(uid).getDocument { document, error in
            if let document = document, document.exists {
                let user = User.getProfile(dict: document.data()!)
                completion(user)
                
            }
        }
    }
    
    
    static func addImageProfile(uid:String,url:String) {
        let refUsers = Firestore.firestore().collection("Users")
        refUsers.document(uid).setData(User.putImagePofile(imageProfile: url), merge: true)
        
    }
}

