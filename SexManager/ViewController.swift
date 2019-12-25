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
        // Do any additional setup after loading the view.
   
    }
    @IBAction func next(_ sender: Any) {
        
        if let controller = storyboard?.instantiateViewController(withIdentifier: "next") {
                 present(controller, animated: true, completion: nil)
             }
    }
    

}

