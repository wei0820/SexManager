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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLoginStatus()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let loginManager = LoginManager()
           loginManager.logIn(permissions: [.publicProfile, .userFriends,.email], viewController: self) { result in
               self.loginManagerDidComplete(result)
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
                    
                    print(accessToken.tokenString)
                    
                    print( Auth.auth().currentUser?.displayName)
                    print( Auth.auth().currentUser?.photoURL)
                    print("==============")
                    self.loginbtn.isHidden = true

                    
                }
            }else{
                loginbtn.isHidden = false
                
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
    func getError(S :String){
          let controller = UIAlertController(title: "發生錯誤", message: S, preferredStyle: .alert)
                     let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                     controller.addAction(okAction)
                     present(controller, animated: true, completion: nil)
      }}
