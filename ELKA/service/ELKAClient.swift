//
//  ELKAClient.swift
//  ELKA
//
//  Created by Christian John Lo on 07/11/2018.
//  Copyright © 2018 MIani Joy De Vera. All rights reserved.
//

import Foundation

internal struct ELKAClient {
    private static let elkaURL = URL(string: "https://non-prod-staging.southeastasia.cloudapp.azure.com/api/elka")
    static var elkaCustomURL : URL?
    
    static func postEvent(params: Dictionary<String, Any>) {
        
        guard let requestUrl = elkaURL else {
            return
        }
        Logger.log(message: params, className: "ELKAClient")
        let jsonData = try? JSONSerialization.data(withJSONObject: params)
        
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = jsonData
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                Logger.log(message: "Error", className: "Error")
            }
        }).resume()
    }
}
