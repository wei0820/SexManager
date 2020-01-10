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
        mTimeText.keyboardType = .numberPad
        mTimeText.borderStyle = .roundedRect
        mTimeText.clearButtonMode = .whileEditing
        mTimeText.returnKeyType = .done
        mTimeText.delegate = self
        
        
        


        }
    

       // 結束編輯狀態(意指完成輸入或離開焦點)
       func textFieldDidEndEditing(textField: UITextField) {
        print("textFieldDidEndEditing:" + textField.text!)
       }
    
       // 按下Return後會反應的事件
       func textFieldShouldReturn(textField: UITextField) -> Bool {
           //利用此方式讓按下Return後會Toogle 鍵盤讓它消失
           textField.resignFirstResponder()
           print("按下Return")
           return false
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


