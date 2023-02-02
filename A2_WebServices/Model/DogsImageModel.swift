//
//  DogsImageModel.swift
//  Assignment-2-CMP-1000
//
//  Created by Khadija Daruwala on 2023-02-01.
//

import Foundation
struct DogsImageModel : Codable {
    let status : String?
    let message : [String]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        message = try values.decodeIfPresent([String].self, forKey: .message)
    }
}
