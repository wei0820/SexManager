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
class ChartViewController: mBasicViewController {
    var chartType: AAChartType!
    var aaChartView: AAChartView!
    var aaChartModel : AAChartModel!
    var dayArray = Array<String>()
    var dateArray = Array<String>()
    

    @IBOutlet weak var exit: UIButton!
    @IBAction func tool(_ sender: Any) {
        self.setAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
          for i in 1...DateManager.init().countOfDaysInCurrentMonth(){
            dayArray.append(String(i))
            
        }
        initCharView()

 
        
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
                        .data([7.0, 6.9, 9.5, 14.5, 18.2])
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
                self.addAlert()
                
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
    
    func  addFireBaseDate(min: String , Type:String){
        var  id = userDefaults.value(forKey: "token")
        if ( id == nil){
           id =  UiManager.getUUID()
        }
        let reference: DatabaseReference! = Database.database().reference().child("movieReviews").child(id as! String)
        let childRef = reference.childByAutoId() // 隨機生成的節點唯一識別碼，用來當儲存時的key值
        let dateReviewReference = reference.child(DateManager.getDateString2())

    
        
        // 新增節點資料
            var dateReview: [String : AnyObject] = [String : AnyObject]()
            dateReview["Id"] = id as AnyObject
            dateReview["Minute"] = min  as AnyObject
            dateReview["Type"] = Type as AnyObject
        dateReview["createDate"] = DateManager.getDateString2() as AnyObject
        dateReviewReference.updateChildValues(dateReview) { (err, ref) in
            if err != nil{
                print("err： \(err!)")
                return
            }
            
            print(ref.description())
        }

        
    }
}
