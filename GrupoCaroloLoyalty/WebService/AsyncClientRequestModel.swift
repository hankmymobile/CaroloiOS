//
//  AsyncClientRequestModel.swift
//

import Foundation
import Alamofire

struct AsyncClientRequestModel {
    
    var service: ServiceCarolo = .HEALTH_CHECK
    var httpMethod: HttpMethod = .GET
    var requireSession: Bool = true
    var queryParams: [String: String]?
    var bodyParams: Parameters?
    var paramConcat: String?
    var key1: String?
    var key2: String?
    var key3: String?
    var headers: [String:String]?
    var reintents: Bool = true
    var timeRequest: Double?
    var brand: Bool = true
    var deviceId: Bool = true
    var profileId: Bool = false
    var jsonRawBody: [String]?

    enum ServiceCarolo {
        case TOKEN
        case HEALTH_CHECK
        case SESSION
        
        
        func getPath() -> String{
            switch self {
            case .TOKEN:
                return "/mw/v1/services/token"
            case .HEALTH_CHECK:
                return "/mw/v1/sessions/version"
            case .SESSION:
                return "/mw/v1/sessions"
            }
        }
    }
    
    enum HttpMethod: String {
        case GET
        case POST
        case PUT
        case DELETE
        
        func getMethod() -> Alamofire.HTTPMethod {
            switch self {
            case .GET: return .get
            case .POST: return .post
            case .PUT: return .put
            case .DELETE: return .delete
            }
        }
    }
    
    class RequestModelBuilder {
        
        private var requestModel = AsyncClientRequestModel()
        
        func service(service: ServiceCarolo) -> RequestModelBuilder {
            requestModel.service = service
            return self
        }
        
        func httpMethod(httpMethod: HttpMethod) -> RequestModelBuilder {
            requestModel.httpMethod = httpMethod
            return self
        }
        
        func requireSession(requireSession: Bool) -> RequestModelBuilder {
            requestModel.requireSession = requireSession
            return self
        }
        
        func queryParams(queryParams: [String: String]) -> RequestModelBuilder {
            requestModel.queryParams = queryParams
            return self
        }
        
        func bodyParams(bodyParams: Parameters) -> RequestModelBuilder{
            requestModel.bodyParams = bodyParams
            return self
        }
        
        func paramConcat(paramConcat: String) -> RequestModelBuilder{
            requestModel.paramConcat = paramConcat
            return self
        }
        
        func key1(key1: String) -> RequestModelBuilder{
            requestModel.key1 = key1
            return self
        }
        
        func key2(key2: String) -> RequestModelBuilder{
            requestModel.key2 = key2
            return self
        }
        
        func key3(key3: String) -> RequestModelBuilder{
            requestModel.key3 = key3
            return self
        }
        
        func headers(headers: [String:String]) -> RequestModelBuilder{
            requestModel.headers = headers
            return self
        }
        
        func reintents(reintents: Bool) -> RequestModelBuilder{
            requestModel.reintents = reintents
            return self
        }
        
        func timeRequest(timeRequest: Double) -> RequestModelBuilder{
            requestModel.timeRequest = timeRequest
            return self
        }
        
        func brand(brand: Bool) -> RequestModelBuilder{
            requestModel.brand = brand
            return self
        }
        
        func deviceId(deviceId: Bool) -> RequestModelBuilder{
            requestModel.deviceId = deviceId
            return self
        }
        
        func profileId(profileId: Bool) -> RequestModelBuilder{
            requestModel.profileId = profileId
            return self
        }
        
        func jsonRawBody(body: [String]) -> RequestModelBuilder{
            requestModel.jsonRawBody = body
            return self
        }
        
        func build() -> AsyncClientRequestModel{
            return requestModel
        }
    }
}
