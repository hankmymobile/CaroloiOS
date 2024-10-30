//
//  AsyncClient.swift
//

import Foundation
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

import Auth0
import JWTDecode


class AsyncClient {
    
    static let codeSessionInvalid = 4000
    static let codeCreditSessionId = 1000
    static let codeTokenInvalid = 401
    static let codeSuccess = 200
    static let codeSuccess2 = 206
    static let codeNotCardApply = 1053

    var alamofireCarolo:  Alamofire.SessionManager?
    var consultingSession = false
    var closuresInWaitForSession: [((Bool) -> Void)] = []
    var closuresInWaitForToken: [((Bool) -> Void)] = []

    private init(){
    }
    
    static var shared = AsyncClient()
    
    func clearAllRequest(){
        if let alamofireCarolo = self.alamofireCarolo {
            alamofireCarolo.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
                sessionDataTask.forEach { $0.cancel() }
                uploadData.forEach { $0.cancel() }
                downloadData.forEach { $0.cancel() }
            }
        }
    }
    
    func downloadFile(fileName: String, downloadUrl: String, completion: @escaping (_ pathFile: String?) -> Void){
        
        let destinationPath: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0];
            let fileURL = documentsURL.appendingPathComponent("\(fileName).pdf")
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        Alamofire.download(downloadUrl, to: destinationPath)
            .downloadProgress { progress in
                
            }
            .responseData { response in
                switch response.result{
                case .success:
                    if response.destinationURL != nil, let filePath = response.destinationURL?.absoluteString {
                        completion(filePath)
                    }
                    break
                case .failure:
                    completion(nil)
                    break
                }
            }
    }
    
    func callService<T:Mappable>(requestModel: AsyncClientRequestModel, tokenIntent: Int = 0, successBlock: @escaping(_ dataResponse: T) -> Void, errorBlock: @escaping(Error, T?) -> Void)  {
        
    }
    
}

extension DataResponse{
    func cURL() -> String {
        let cURL = "curl -f"
        let method = "-X \(self.request?.httpMethod ?? "GET")"
        let url = self.request?.url.flatMap { "--url '\($0.absoluteString)'" }
        let data: String?

        let header = self.request?.allHTTPHeaderFields?
                .map { "-H '\($0): \($1)'" }
                .joined(separator: " ")
        
        if let httpBody = self.request?.httpBody, !httpBody.isEmpty {
                if let bodyString = String(data: httpBody, encoding: .utf8) { // json and plain text
                    let escaped = bodyString
                        .replacingOccurrences(of: "'", with: "'\\''")
                    data = "--data '\(escaped)'"
                } else { // Binary data
                    let hexString = httpBody
                        .map { String(format: "%02X", $0) }
                        .joined()
                    data = #"--data "$(echo '\#(hexString)' | xxd -p -r)""#
                }
            } else {
                data = nil
            }

            return [cURL, method, url, header, data]
                .compactMap { $0 }
                .joined(separator: " ")
        }
}
