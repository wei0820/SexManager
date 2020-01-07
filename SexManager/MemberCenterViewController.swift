//
//  MemberCenterViewController.swift
//  SexManager
//
//  Created by oneplay on 2019/12/25.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FacebookLogin
import FacebookCore
class MemberCenterViewController: mBasicViewController {
    @IBOutlet weak var loginbtn: UIButton!
    var islogin :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLoginStatus()
  
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func login(_ sender: Any) {
        if (islogin == false){
            let loginManager = LoginManager()
                     loginManager.logIn(permissions: [.publicProfile, .userFriends,.email], viewController: self) { result in
                         self.loginManagerDidComplete(result)
                     }
        }else{
            logout()
        }
      
        
    }
    func loginManagerDidComplete(_ result: LoginResult) {
        switch result {
        case .cancelled: break
        case .failed(let error): break
        case .success(let grantedPermissions, _, _):
            getLoginStatus()
            break
            
            
        }
    }
    
    func getLoginStatus(){
  
            if let accessToken = AccessToken.current {
                // User is logged in, use 'accessToken' here.
                let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
                
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error {
                        self.getError(S: error.localizedDescription)

                        // ...
                        return
                    }
                    // User is signed in
                    self.userDefaults.set(accessToken.tokenString, forKey: "token")
                    print(accessToken.tokenString)
                    
                    print( Auth.auth().currentUser?.displayName)
                    print( Auth.auth().currentUser?.photoURL)
                    print("==============")
                    self.loginbtn.setTitle("登出", for: .normal)
                    self.islogin = true

                    
                }
            }else{
                self.loginbtn.setTitle("登入", for: .normal)
                islogin = false

        }
            }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func logout(){
        do {
            try Auth.auth().signOut()
        } catch let error {
            // handle error here
            print("Error trying to sign out of Firebase: \(error.localizedDescription)")
        }
    }
    func getError(S :String){
          let controller = UIAlertController(title: "發生錯誤", message: S, preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                     controller.addAction(okAction)
                     present(controller, animated: true, completion: nil)
      }
    

    
}
