//
//  Tracker.swift
//  ELKAFramework
//
//  Created by Christian John Lo on 06/11/2018.
//  Copyright © 2018 Christian John Lo. All rights reserved.
//

import Foundation

public class Tracker {
    
    private var trackingId : String
    public var currentPage : String {
        didSet {
            log(event: HitEvent(action: "page view", label: nil, category: nil, payload: nil))
        }
    }
    
    private let deviceBrand = Device.deviceBrand
    private let deviceHeight = Device.screenHeight
    private let deviceWidth = Device.screenWidth
    private let deviceManufacturer = Device.deviceManufacturer
    private let deviceModel = Device.deviceModel
    private let os = Device.os
    private let osVersion = Device.osVersion
    private let language = Device.language
    
    init(trackingId : String) {
        self.trackingId = trackingId
        self.currentPage = "initial-page"
    }
    
    public func log(hitEvent: HitEvent) {
        log(event: hitEvent)
    }

    fileprivate func log(event: ELKASendableEvent) {
        
        var params : Dictionary<String, Any> = [:]
        
        if let type = event.type {
            params["type"] = type
        }
        
        if let label = event.label {
            params["label"] = label
        }
        
        if let category = event.category {
            params["category"] = category
        }
        
        if let payload = event.payload {
            params["payload"] = payload
        }
        
        if let channel = event.channel {
            params["channel"] = channel
        }
        
        if let sessionId = event.sessionId {
            params["sessionId"] = sessionId
        }
        
        if let sessionExpiry = event.sessionExpiry {
            params["sessionExpiry"] = sessionExpiry
        }
        
        params["currentPage"] = self.currentPage
        params["deviceBrand"] = self.deviceBrand
        params["deviceHeight"] = self.deviceHeight
        params["deviceWidth"] = self.deviceWidth
        params["deviceManufacturer"] = self.deviceManufacturer
        params["deviceModel"] = self.deviceModel
        params["os"] = self.os
        params["osVersion"] = self.osVersion
        params["language"] = self.language
        
        ELKAClient.postEvent(params: params)
    }
}
