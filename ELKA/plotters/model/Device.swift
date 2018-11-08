//
//  Device.swift
//  ELKA
//
//  Created by MIani Joy De Vera on 06/11/2018.
//  Copyright © 2018 MIani Joy De Vera. All rights reserved.
//

import Foundation
import UIKit

struct Device {
    static let deviceBrand : String = "Apple"
    static let deviceModel : String = UIDevice.current.model
    static let deviceManufacturer : String = "Apple"
    static let language : String = Locale.current.languageCode!
    static let os : String = "iOS"
    static let osVersion : String = UIDevice.current.systemVersion
    static let screenWidth : Float = Float(UIScreen.main.bounds.width)
    static let screenHeight: Float = Float(UIScreen.main.bounds.height)
}



