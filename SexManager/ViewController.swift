//
//  ViewController.swift
//  SexManager
//
//  Created by oneplay on 2019/12/24.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit

class ViewController: mBasicViewController {

    @IBOutlet weak var descriptionbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseManager.SearchDatabase()
        // Do any additional setup after loading the view.
   
    }
    @IBAction func chart(_ sender: Any) {
        setJump(type: "chart")
    }
    @IBAction func next(_ sender: Any) {
        
        setJump(type: "next")

    }
    
    @IBAction func member(_ sender: Any) {
            
        setJump(type: "member")
        
        
    }
    
}

