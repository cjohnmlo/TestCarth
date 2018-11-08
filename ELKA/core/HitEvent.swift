//
//  HitEvent.swift
//  ELKAFramework
//
//  Created by Christian John Lo on 07/11/2018.
//  Copyright © 2018 Christian John Lo. All rights reserved.
//

import Foundation

public struct HitEvent : ELKASendableEvent {
    
    internal var channel : String? = "test"
    internal var sessionId : String?
    internal var timeStamp : Double?
    internal var type : String? = nil
    internal var label : String? = nil
    internal var category : String? = nil
    internal var sessionExpiry: Int64?
    
    internal var payload: Dictionary<String, Any>?
    
    public init(action : String?, label: String?, category: String?, payload: Dictionary<String, Any>?) {
        self.type = action
        self.label = label
        self.category = category
        self.payload = payload
        self.sessionId = Session.getSessionId()
        self.sessionExpiry = Session.getSessionExpiry()
        self.timeStamp = Date().timeIntervalSince1970 * 1000
    }
    
    private init(){}
}
