//
//  DefaultCreditDto.swift
//

import Foundation
import ObjectMapper

class DefaultDto: Mappable{
    
    var code: Int?
    var description: String?
    var status: Status?

    required init?(map: Map){}
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        description <- map["description"]
    }
}
