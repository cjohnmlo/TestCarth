//
//  ELKAEvent.swift
//  ELKAFramework
//
//  Created by Christian John Lo on 06/11/2018.
//  Copyright © 2018 Christian John Lo. All rights reserved.
//

import Foundation

internal protocol ELKASendableEvent {
    
    var channel : String? {get set}
    var sessionId : String? {get set}
    var sessionExpiry : Int64? {get set}
    var timeStamp : Double? {get set}
    var type : String? {get set}
    var label : String? {get set}
    var category : String? {get set}
    
    var payload : Dictionary<String, Any>? {get set}
}

