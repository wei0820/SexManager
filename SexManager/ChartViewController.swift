//
//  ChartViewController.swift
//  SexManager
//
//  Created by oneplay on 2019/12/25.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit
import AAInfographics
class ChartViewController: mBasicViewController {
    var chartType: AAChartType!
    var aaChartView: AAChartView!
    var aaChartModel : AAChartModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCharView()
    }
    func initCharView(){
        aaChartView = AAChartView()
        let width = view.frame.size.width
        let height = view.frame.size.height
        aaChartView!.frame = CGRect(x: 0, y: 60, width: width, height: height)
        aaChartView.contentHeight = height - 20
        view.addSubview(aaChartView)
        aaChartView!.isClearBackgroundColor = true
        aaChartView.delegate = self as! AAChartViewDelegate
        
        aaChartModel = AAChartModel().chartType(chartType)
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func setRightButton(s: String){
            // 導覽列右邊按鈕
            
            let rightButton = UIBarButtonItem(
                title:s,
                style:.plain,
                target:self,
                action:#selector(ChartViewController.setting))
            // 加到導覽列中
            self.navigationItem.rightBarButtonItem = rightButton
        }
        @objc func setting() {
    //        var isAnonymous = userDefaults.value(forKey: "userID")
    //        if((isAnonymous) != nil){
    //            setAlert()
    //            return
    //
    //        }

            
        }
    func setLiftButton(s: String){
            // 導覽列右邊按鈕
            
            let rightButton = UIBarButtonItem(
                title:s,
                style:.plain,
                target:self,
                action:#selector(ChartViewController.setlift))
            // 加到導覽列中
        self.navigationItem.leftBarButtonItem = rightButton
        }
        @objc func setlift() {
    //        var isAnonymous = userDefaults.value(forKey: "userID")
    //        if((isAnonymous) != nil){
    //            setAlert()
    //            return
    //
    //        }

            
        }
    
}
