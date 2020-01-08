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
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
    }
    
    @IBAction func addButton(_ sender: Any) {
    }
    
    @IBOutlet weak var mTimeText: UITextField!
    @IBOutlet weak var mPlacePicker: UIPickerView!
    @IBOutlet weak var mTypePicker: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()


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


