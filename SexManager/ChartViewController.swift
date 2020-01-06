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
    var dayArray = Array<String>()

    @IBOutlet weak var exit: UIButton!
    @IBAction func tool(_ sender: Any) {
        self.setAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initCharView()
          for i in 1...DateManager.init().countOfDaysInCurrentMonth(){
            dayArray.append(String(i))
            
        }
        
        dayArray.forEach { (i) in
            print(i)
        }
        
        
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
//       .series([
//                   AASeriesElement()
//                       .name("東京")
//                       .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]),
//                   AASeriesElement()
//                       .name("紐約")
//                       .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]),
//                   AASeriesElement()
//                       .name("柏林")
//                       .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]),
//                   AASeriesElement()
//                       .name("倫敦")
//                       .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]),
//                       ])
        .series([AASeriesElement()
                        .name("東京")
                        .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6])
                        ])
                   .title("城市天氣變化")//圖表主標題
                .subtitle("2020年09月18日")//圖表副標題
                .inverted(false)//是否翻轉圖形
                .yAxisTitle("攝氏度")// Y 軸標題
                .legendEnabled(true)//是否啟用圖表的圖例(圖表底部的可點擊的小圓點)
                .tooltipValueSuffix("攝氏度")//浮動提示框單位後綴
        .categories(["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                               "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"])
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
        let controller = UIAlertController(title: "設定", message: "請選擇！", preferredStyle: .actionSheet)
        let names = ["小龍女", "中龍女", "大龍女"]
        for name in names {
           let action = UIAlertAction(title: name, style: .default) { (action) in
              print(action.title)
           }
           controller.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
    }
    
}
