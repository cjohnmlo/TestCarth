//
//  ELKA.swift
//  ELKAFramework
//
//  Created by Christian John Lo on 06/11/2018.
//  Copyright © 2018 Christian John Lo. All rights reserved.
//

import Foundation

final public class ELKA {
    
    public static let sharedInstance : ELKA? = ELKA()
    private(set) public var defaultTracker : Tracker?
    
    private init(){}
    
    public func tracker(withTrackingId : String) -> Tracker? {
        self.defaultTracker = Tracker(trackingId: withTrackingId)
        return self.defaultTracker
    }
    
}
