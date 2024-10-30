//
//  AsyncClientNetworkError.swift
//

import Foundation

enum AsyncClientNetworkError: String, Error {
    case invalidURL
    case jsonDecoder
    case serializationFailed
    case generic
    case httpResponseError
    case statusCodeError
    case tokenUnavailable
    case maximumIntents
}
