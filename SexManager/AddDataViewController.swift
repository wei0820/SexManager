//
//  AddDataViewController.swift
//  SexManager
//
//  Created by oneplay on 2020/1/8.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit
class AddDataViewController: mBasicViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = type.count
          if pickerView == mPlacePicker {
              countrows = self.place.count
          }

          return countrows
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          if pickerView == mTypePicker {
              let titleRow = type[row]
               return titleRow
          } else if pickerView == mPlacePicker {
              let titleRow = place[row]
              return titleRow
          }

          return ""
      }

      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          if pickerView == mTypePicker {
            mTypeLabel.text = self.type[row]
            
          } else if pickerView == mPlacePicker {
            mPlaceLabel.text = self.place[row]
            
          }
      }
    @IBAction func addButton(_ sender: Any) {
    }
    var type = ["10-20", "20-30", "30-40"]
    var place = ["Male", "Female"]
    @IBOutlet weak var mTypeLabel: UILabel!
    @IBOutlet weak var mPlaceLabel: UILabel!
    
    @IBOutlet weak var mTimeLabel: UILabel!
    @IBOutlet weak var mTimeText: UITextField!
    @IBOutlet weak var mPlacePicker: UIPickerView!
    @IBOutlet weak var mTypePicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mPlacePicker.delegate = self
        mTypePicker.delegate = self
        mPlacePicker.dataSource = self
        mTypePicker.dataSource = self
        mTimeText.borderStyle = .roundedRect
        mTimeText.delegate = self
        mTimeText.keyboardType = .numberPad


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
        mTimeLabel.text = textField.text!
       }
    
       // 按下Return後會反應的事件
       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
           textField.resignFirstResponder()
        mTimeLabel.text = textField.text!

           return false
       }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func shaerLine(){
        let message: String! = "法蘭克： 大家午安"
               
               // 將訊息編碼成 UTF-8 格式
               let encodeMessage = message.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
               
               let lineURL = URL(string: "line://msg/text/" + encodeMessage!) // 分享訊息的 URL Scheme
               
               if UIApplication.shared.canOpenURL(lineURL!) {
                   UIApplication.shared.open(lineURL!, options: [:], completionHandler: nil)
               } else {
                   // 若沒安裝 Line 則導到 App Store(id443904275 為 Line App 的 ID)
                   let lineURL = URL(string: "itms-apps://itunes.apple.com/app/id443904275")!
                   UIApplication.shared.open(lineURL, options: [:], completionHandler: nil)
               }
    }
    func shareLineFriendorGroup(){
        let lineURL = URL(string: "line://ti/p/@ptv5457z") // Line 群組或朋友 ID
               
               if UIApplication.shared.canOpenURL(lineURL!) {
                   UIApplication.shared.open(lineURL!, options: [:], completionHandler: nil)
               } else {
                   // 若沒安裝 Line 則導到 App Store(id443904275 為 Line App 的 ID)
                   let lineURL = URL(string: "itms-apps://itunes.apple.com/app/id443904275")!
                   UIApplication.shared.open(lineURL, options: [:], completionHandler: nil)
               }
    }
        // Do any additional setup after loading the view.
    }
    
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


