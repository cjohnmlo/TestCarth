//
//  Session.swift
//  ELKA
//
//  Created by MIani Joy De Vera on 06/11/2018.
//  Copyright © 2018 MIani Joy De Vera. All rights reserved.
//

import Foundation

struct Session {
    
    static func createSessionId()->String! {
        let sessionId = NSUUID().uuidString.lowercased()
        saveSessionId(withString: sessionId)
        return sessionId
    }
    
    static func saveSessionId(withString sessionId: String) {
        let preferences = UserDefaults.standard
        preferences.set(sessionId, forKey: Constants.USER_DEFAULT_KEYS.SESSION_ID)
        
        if !preferences.synchronize() {
            Logger.log(message: Constants.ERROR_MESSAGES.SAVE_USER_DEFAULT_ERROR, className: "saveSessionId")
        }
    }
    
    static func getSessionId()->String! {
        let preferences = UserDefaults.standard
        let tempSessionId = preferences.string(forKey: Constants.USER_DEFAULT_KEYS.SESSION_ID)
        var tempSessionExpiry:Int64
        tempSessionExpiry = Int64(preferences.integer(forKey: Constants.USER_DEFAULT_KEYS.SESSION_EXPIRY))
        
        if tempSessionExpiry == 0 {
            tempSessionExpiry = createSessionExpiry()
        }
        
        if tempSessionId != nil &&
            (tempSessionExpiry > getTimeStamp()) {
            return tempSessionId
        } else {
            return createSessionId()
        }
    }
    
    static func createSessionExpiry()->Int64! {
        let expiryTimeStamp = Date().adding(minutes: 5).toMillis()
        return expiryTimeStamp
    }
    
    static func saveSessionExpiry(withExpiry sessionExpiry: Int64) {
        let preferences = UserDefaults.standard
        preferences.set(sessionExpiry, forKey: Constants.USER_DEFAULT_KEYS.SESSION_EXPIRY)
        
        if !preferences.synchronize() {
            Logger.log(message: Constants.ERROR_MESSAGES.SAVE_USER_DEFAULT_ERROR, className: "saveSessionExpiry")
        }
    }
    
    static func getSessionExpiry()->Int64! {
        let preferences = UserDefaults.standard
        var tempSessionExpiry:Int64
        tempSessionExpiry = Int64(preferences.integer(forKey: Constants.USER_DEFAULT_KEYS.SESSION_EXPIRY))
        
        if tempSessionExpiry == 0 || (tempSessionExpiry > getTimeStamp()){
            return createSessionExpiry()
        } else {
            return tempSessionExpiry
        }
    }
    
    static func getTimeStamp()->Int64! {
        let timeStamp = Date().toMillis()
        return timeStamp
    }
}

extension Date {
    func toMillis() -> Int64! {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func getFormattedDate()->String {
        let df = DateFormatter()
        df.dateFormat = "y-MM-dd H:m:ss.SSSS"
        
        return df.string(from: Date())
    }
}


