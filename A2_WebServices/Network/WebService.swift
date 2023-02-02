//
//  WebService.swift
//  Assignment-1-CMP-1000
//
//  Created by Khadija Daruwala on 2023-01-25.
//

import Foundation

class WebService {
    
    static func getDogBreed(urlString: String) async throws -> [String: [String]] {
        guard
            let url = URL(string: urlString)
        else { throw APIError.invalidUrl }
        
        let (data, _) = try await
        URLSession.shared.data(from: url)
        
        
        let decoder = JSONDecoder()
        
        let response = try decoder.decode(DogsModel.self, from: data)
        let dogsList =  response.message!
        
        return dogsList
    }
}
