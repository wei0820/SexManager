//
//  CalViewController.swift
//  SexManager
//
//  Created by oneplay on 2019/12/26.
//  Copyright © 2019 JackPan. All rights reserved.
//

import UIKit
import FSCalendar
class CalViewController: mBasicViewController ,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance{

    @IBOutlet weak var cal: FSCalendar!
   var dateFormatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter
    }()
    var dateFormatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        cal.dataSource = self
        cal.delegate = self
        cal.locale = Locale(identifier: "zh-TW")
        cal.allowsMultipleSelection = true
        cal.swipeToChooseGesture.isEnabled = true
        cal.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesSingleUpperCase]
        cal.appearance.headerDateFormat = "yyyy年MM月"
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

}
