//
//  GetHealthCheckDto.swift
//

import Foundation
import ObjectMapper

class GetHealthCheckDto: Mappable{
    
    var code: Int?
    var description: String?
    var status: Status?
    var data: String?

    required init?(map: Map){}
    
    func mapping(map: Map) {
        status <- map["status"]
        code <- map["code"]
        description <- map["description"]
        data <- map["data"]
    }
}
