//
//  FirebaseManager.swift
//  SexManager
//
//  Created by oneplay on 2020/1/13.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation
import Firebase

class FirebaseManager {
    static let userDefaults = UserDefaults.standard

   static  func  addFireBaseDate(min: String , Type:String){
           var  id = userDefaults.value(forKey: "token")
           if ( id == nil){
              id =  UiManager.getUUID()
           }
           let reference: DatabaseReference! = Database.database().reference().child("Reviews").child(id as! String)
           let childRef = reference.childByAutoId() // 隨機生成的節點唯一識別碼，用來當儲存時的key值
           let dateReviewReference = reference.child(DateManager.getDateString2())
           // 新增節點資料
               var dateReview: [String : AnyObject] = [String : AnyObject]()
               dateReview["Id"] = id as AnyObject
               dateReview["Minute"] = min  as AnyObject
               dateReview["Type"] = Type as AnyObject
           dateReview["createDate"] = DateManager.getDateString2() as AnyObject
           dateReviewReference.updateChildValues(dateReview) { (err, ref) in
               if err != nil{
                   print("err： \(err!)")
                   return
               }
               
               print(ref.description())
           }

           
       }
    func SearchDatabase(){
        
        var  id = FirebaseManager.userDefaults.value(forKey: "token")
               if ( id == nil){
                  id =  UiManager.getUUID()
               }
        // 查詢節點資料
        Database.database().reference().child("Reviews").child(id as! String).observe(.childAdded, with: {
            (snapshot) in
            // childAdded逐筆呈現
            if let dictionaryData = snapshot.value as? [String: AnyObject]{
                print(dictionaryData)
                print(snapshot.key)
            }
            
        }, withCancel: nil)
    }
    
    func DeleteDatabase(){
        // 刪除節點資料
        
        var  id = FirebaseManager.userDefaults.value(forKey: "token")
               if ( id == nil){
                  id =  UiManager.getUUID()
               }
        Database.database().reference().child("Reviews").child(id as! String).removeValue { (error, ref) in
                  if error != nil{
                      print(error!)
                      return
                  }
                  
                  print("remove data success...")
              }
    }
}
