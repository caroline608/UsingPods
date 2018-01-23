//
//  Photo.swift
//  UsingPods
//
//  Created by Alex Paul on 1/22/18.
//  Copyright © 2018 Alex Paul. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let title: String
    let url_m: URL
}

struct Results: Codable {
    let page: Int?
    let pages: Int
    let perpage: Int
    let total: String
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case page
        case pages
        case perpage
        case total
        case photos = "photo"
    }
}

struct Search: Codable {
    let results: Results
    enum CodingKeys: String, CodingKey {
        case results = "photos"
    }
}
