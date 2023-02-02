//
//  APIUrl.swift
//  Assignment-1-CMP-1000
//
//  Created by Khadija Daruwala on 2023-01-25.
//

import Foundation
class APIUrl {
    static let shared = APIUrl()
    
    let allDogsAPI = "https://dog.ceo/api/breeds/list/all"
    let randomDogImageAPI = "https://dog.ceo/api/breeds/image/random"
    let breedImageAPI = "https://dog.ceo/api/breed/"
}
