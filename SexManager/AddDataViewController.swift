//
//  AddDataViewController.swift
//  SexManager
//
//  Created by oneplay on 2020/1/8.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit
class AddDataViewController: mBasicViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows : Int = age.count
          if pickerView == mPlacePicker {
              countrows = self.Gender.count
          }

          return countrows
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          if pickerView == mTypePicker {
              let titleRow = age[row]
               return titleRow
          } else if pickerView == mPlacePicker {
              let titleRow = Gender[row]
              return titleRow
          }

          return ""
      }

      func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
          if pickerView == mTypePicker {
            mTypeLabel.text = self.age[row]
            
          } else if pickerView == mPlacePicker {
            mPlaceLabel.text = self.Gender[row]
            
          }
      }
    @IBAction func addButton(_ sender: Any) {
    }
    var age = ["10-20", "20-30", "30-40"]
    var Gender = ["Male", "Female"]
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


