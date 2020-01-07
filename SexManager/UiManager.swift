//
//  UiManager.swift
//  SexManager
//
//  Created by oneplay on 2020/1/7.
//  Copyright © 2020 JackPan. All rights reserved.
//

import Foundation
import UIKit

class UiManager {
    
    static func getUUID() -> String{
        let uuid = UIDevice.current.identifierForVendor?.uuidString ?? UUID().uuidString
        return uuid
    }
    
}
