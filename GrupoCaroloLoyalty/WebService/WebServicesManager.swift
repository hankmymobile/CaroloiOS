//
//  WebServicesManagerCredit2.swift
//

import Foundation
import Alamofire

import AlamofireObjectMapper
import ObjectMapper

class WebServicesManager: WebServicesManagerProtocol {
    
    let concurrentQueue = DispatchQueue(label: "caroloService", attributes: .concurrent)
    let timeCacheResponse = 0.05
    
    func clearAllRequest(){
        concurrentQueue.async {
            AsyncClient.shared.clearAllRequest()
        }
    }
    
    func healthCheck(_ completion: @escaping (GetHealthCheckDto?) -> Void){
        
        let requestModel = AsyncClientRequestModel.RequestModelBuilder()
            .service(service: .HEALTH_CHECK)
            .requireSession(requireSession: false)
            .build()
        
        self.callService(requestModel: requestModel, successBlock: {
            (response: GetHealthCheckDto?) in
            completion(response)
        })
    }
    
    private func callService<T:Mappable>(requestModel: AsyncClientRequestModel, successBlock: @escaping(_ dataResponse: T?) -> Void) {
        concurrentQueue.async {
            AsyncClient.shared.callService(requestModel: requestModel, successBlock: {
                (response: T) in
                DispatchQueue.main.async{
                    successBlock(response)
                }
            }, errorBlock: {_, errorResponse  in
                DispatchQueue.main.async{
                    successBlock(errorResponse)
                }
            })
        }
    }
    
}

