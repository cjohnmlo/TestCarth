//
//  UtilityManager.swift
//  ibssanalytics
//
//  Created by MIani Joy De Vera on 29/10/2018.
//  Copyright © 2018 MIani Joy De Vera. All rights reserved.
//

import Foundation
import UIKit

struct Logger {
    
    static func log(message: Any?, className: String ) {
        #if DEBUG
        if let theMessage = message {
            print("DEBUG_LOG || ", Date().getFormattedDate(),  ": ", className, "| ", theMessage)
        } else {
            print("DEBUG_LOG || ", Date().getFormattedDate(),  ": ", className, "| message has no content")
        }
        #endif
    }
}




