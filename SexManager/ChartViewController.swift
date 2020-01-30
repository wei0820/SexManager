//
//  ChartViewController.swift
//  SexManager
//
//  Created by oneplay on 2019/12/25.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit
import AAInfographics
import Firebase
import FirebaseAuth
class ChartViewController: mBasicViewController{
    var chartType: AAChartType!
    var aaChartView: AAChartView!
    var aaChartModel : AAChartModel!
    var dayArray = Array<String>()
    var dateArray = Array<String>()
    var minArray = Array<String>()
    var strArray = Array<Int>()
    @IBOutlet weak var exit: UIButton!
    @IBAction func tool(_ sender: Any) {
        self.setAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
          for i in 1...DateManager.init().countOfDaysInCurrentMonth(){
            dayArray.append(String(i))
            
        }
        
        initCharView()

 
        
    }
    func getData(){
        FirebaseManager.SearchDatabase()
        for i in  userDefaults.array(forKey: "minArray")!{
            minArray.append(i as! String)
            print("minArray",i)
            
        }
        strArray = minArray.map { Int($0)! }

        
    }
    func initCharView(){
        aaChartView = AAChartView()
        let width = view.frame.size.width
        let height = view.frame.size.height
        aaChartView!.frame = CGRect(x: 0, y: 75, width: width, height: height)
        aaChartView.contentHeight = height - 40
        view.addSubview(aaChartView)
        aaChartView!.isClearBackgroundColor = true
        aaChartModel = AAChartModel().chartType(.line)
            .series([AASeriesElement()
                        .data(strArray)
                        ])
                   .title("城市天氣變化")//圖表主標題
            .subtitle(DateManager.getDateString())//圖表副標題
                .inverted(false)//是否翻轉圖形
                .yAxisTitle("分鐘")// Y 軸標題
                .legendEnabled(true)//是否啟用圖表的圖例(圖表底部的可點擊的小圓點)
                .tooltipValueSuffix("分鐘")//浮動提示框單位後綴
        .categories(dayArray)
        aaChartView?.aa_drawChartWithChartModel(aaChartModel)

        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func exit(_ sender: Any) {
        dissmissView()
    }

    func setAlert(){
        let controller = UIAlertController(title: "選單", message: "請選擇！", preferredStyle: .actionSheet)
        let names = ["加入", "列表"]
        for name in names {
           let action = UIAlertAction(title: name, style: .default) { (action) in
            if (action.title == "加入"){
                self.setJump(type: "addData")
    
                
            }
           }
           controller.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
    func addAlert(){
        let controller = UIAlertController(title: "數值", message: "請輸入資料", preferredStyle: .alert)
        controller.addTextField { (textField) in
              textField.placeholder = "分鐘"
              textField.keyboardType = UIKeyboardType.phonePad
               textField.borderStyle = .roundedRect
           }
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            let phone = (controller.textFields?[0].text)!
//            self.dateArray.append(phone)
//            self.addFireBaseDate()
        }
        controller.addAction(okAction)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
   
}
