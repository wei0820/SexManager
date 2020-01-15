//
//  SettingCenterViewController.swift
//  SexManager
//
//  Created by oneplay on 2020/1/15.
//  Copyright © 2020 JackPan. All rights reserved.
//

import UIKit

class SettingCenterViewController: mBasicViewController {
    var placeArray = Array<String>()
    var TypeArray = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addPlace_btn(_ sender: Any) {
    }
    @IBAction func addType_btn(_ sender: Any) {
    }
    @IBOutlet weak var typeText: UITextField!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBAction func exit_btn(_ sender: Any) {
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

}
