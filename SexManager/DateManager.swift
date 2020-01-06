//
//  DateManager.swift
//  SexManager
//
//  Created by oneplay on 2020/1/6.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation

class DateManager{
    //计算当月天数
   func countOfDaysInCurrentMonth() ->Int {
    
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: Date())
        return (range?.length)!
    }
}
