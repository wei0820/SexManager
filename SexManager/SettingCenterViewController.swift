//
//  SettingCenterViewController.swift
//  SexManager
//
//  Created by oneplay on 2020/1/15.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class SettingCenterViewController: mBasicViewController ,UITextFieldDelegate{
    var placeArray = Array<String>()
    var TypeArray = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkData()
        placeText.delegate = self
        typeText.delegate = self
        placeText.returnKeyType = .done
        typeText.returnKeyType = .done
        placeText.clearButtonMode = .whileEditing
        typeText.clearButtonMode = .whileEditing


        // Do any additional setup after loading the view.
    }
    @IBAction func addPlace_btn(_ sender: Any) {
        placeText.resignFirstResponder()

    }
    
    @IBAction func addType_btn(_ sender: Any) {
        typeText.resignFirstResponder()

    }
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBAction func exit_btn(_ sender: Any) {
        dissmissView()
        
        
    }
    @IBOutlet weak var placeText: UITextField!
    
    @IBOutlet weak var placeLabel: UILabel!
    /*
     @IBAction func typeText(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func clearbtn(_ sender: Any) {
        placeArray.removeAll()
        TypeArray.removeAll()
        typeLabel.text = "目前數量："
        placeLabel.text = "目前數量："


    }
    func checkData(){
        
        if(userDefaults.array(forKey: "typeArray") != nil){
            var typeNum : Int = userDefaults.array(forKey: "typeArray")!.count
            typeLabel.text = "目前數量：" + String(typeNum)
        }else{
            typeLabel.text = "目前數量："

        }
        if(userDefaults.array(forKey: "placeArray") != nil ){
            var placenum : Int = userDefaults.array(forKey: "placeArray")!.count
            placeLabel.text = "目前數量：" + String(placenum)
            
        }else{
            placeLabel.text = "目前數量："

        }

        
        
    }
  //_ textField
      // 開始進入編輯狀態
          func textFieldDidBeginEditing(_ textField: UITextField){
          }
       
          // 可能進入結束編輯狀態
          func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       
              return true
          }
       
          // 結束編輯狀態(意指完成輸入或離開焦點)
          func textFieldDidEndEditing(_ textField: UITextField) {
            if(textField == placeText){
                print("placeText")
                print(placeText.text)
                if(userDefaults.array(forKey: "placeArray") != nil ){
                    placeArray = userDefaults.array(forKey: "placeArray") as! [String]
                    placeArray.append(placeText.text!)
                    userDefaults.set(placeArray, forKey: "placeArray")

                    for s in placeArray{
                        print(s)
                    }
                }else{
                    placeArray.append(placeText.text!)
                    userDefaults.set(placeArray, forKey: "placeArray")
                }
         
                

            }
            if(textField == typeText){
                print("typeText")
                print(typeText.text)
                if(userDefaults.array(forKey: "typeArray") != nil ){
                             TypeArray = userDefaults.array(forKey: "typeArray") as! [String]
                             TypeArray.append(typeText.text!)
                             userDefaults.set(TypeArray, forKey: "typeArray")

                             for s in TypeArray{
                                 print(s)
                             }
                         }else{
                             TypeArray.append(typeText.text!)
                             userDefaults.set(TypeArray, forKey: "typeArray")
                         }
                
            }
            
          }
       
          // 按下Return後會反應的事件
          func textFieldShouldReturn(_ textField: UITextField) -> Bool {
              //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
              textField.resignFirstResponder()

              return false
          }
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
}
