//
//  APIError.swift
//  Assignment-1-CMP-1000
//
//  Created by Khadija Daruwala on 2023-01-25.
//

import Foundation
enum APIError: Error {
    case noInternet
    case invalidUrl
    case generic
    case success
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .success:
            return NSLocalizedString("Successfully received data", comment: "")
        case .invalidUrl:
            return NSLocalizedString("Invalid Url", comment: "")
        case .noInternet:
            return NSLocalizedString("Please check your internet connection", comment: "")
        case .generic:
            return NSLocalizedString("Something went wrong, please try again later", comment: "")
        }
    }
}
