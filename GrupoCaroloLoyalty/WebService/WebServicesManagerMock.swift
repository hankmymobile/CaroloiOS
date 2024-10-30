//
//  WebServicesManagerCredit2Mock.swift
//

import Foundation

class WebServicesManagerMock: WebServicesManagerProtocol {
    
    func healthCheck(_ completion: @escaping (GetHealthCheckDto?) -> Void){
        let data = parseJson(jsonName: "health", model: GetHealthCheckDto.self)
        completion(data)
    }
    
    func getSession(_ completion: @escaping (GetSessionTokenDto?) -> Void) {
        completion(nil)
    }
    
    func clearAllRequest(){
        
    }

}

