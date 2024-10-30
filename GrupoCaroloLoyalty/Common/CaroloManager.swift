//
//  CaroloManager.swift
//

import Foundation
import SwiftKeychainWrapper

class CaroloManager {
    
    static var shared = CaroloManager()
        
    let keychainWrapper = KeychainWrapper(serviceName: KeychainWrapper.standard.serviceName)
    private var maximumIntents = 0
    private var timeRequest: Double = 120
    
    private init(){
        
    }
    
    func getTimeRequest() -> Double{
        if timeRequest == 0 {
            timeRequest = Double(15)
        }
        return timeRequest
    }
    
    func getMaximumIntens() -> Int {
        
        if maximumIntents == 0 {
            maximumIntents = Int(2)
        }
        
        if maximumIntents < 1 {
            maximumIntents = 1
        }
        return maximumIntents
    }
    
    func getMaximumIntensForToken() -> Int {
        return 2
    }
    
    func isMock() -> Bool {
        return false
    }
    
  
    func endpointCarolo() -> String {
        
        return ""
    }
    
    func defaultValueSwitchesCards() -> Bool {
        //AppConfig.sharedInstance.number(forKey: .???))
        return true
    }
    
    func getToken() -> String? {
        return keychainWrapper.string(forKey: "token")
    }
    
    func setToken(token: String?) -> Void {
        keychainWrapper.set(token ?? "", forKey: "token")
    }
    
    
}

