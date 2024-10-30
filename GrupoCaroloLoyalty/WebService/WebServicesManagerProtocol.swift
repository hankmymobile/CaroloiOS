//
//  WebServicesManagerCredit2Protocol.swift
//

import Foundation


protocol WebServicesManagerProtocol: AnyObject {
    
    func clearAllRequest()
    
    func healthCheck(_ completion: @escaping (GetHealthCheckDto?) -> Void)

}
