//
//  ResponseStatus.swift
//

import Foundation
import ObjectMapper

class Status: Mappable{
    var status: String?
    var statusCode: Int?
    var errorDescription: String?
    var datailedErrorDescription : String?
    
    required init?(map: Map){
    }
    
    init(status : String, statusCode : Int, errorDescription : String, detailedErrorDescription : String) {
        self.status = status
        self.statusCode = statusCode
        self.errorDescription = errorDescription
        self.datailedErrorDescription = detailedErrorDescription
    }
    
    func mapping(map: Map){
        status <- map["status"]
        statusCode <- map["statusCode"]
        errorDescription <- map["errorDescription"]
        datailedErrorDescription <- map["detailedErrorDescription"]
    }
}

class StatusObject: Mappable{
    var status: Status?
    var message: String?
    
    required init?(map: Map){}
    
    func mapping(map: Map){
        status <- map["status"]
        message <- map["message"]
    }
}

