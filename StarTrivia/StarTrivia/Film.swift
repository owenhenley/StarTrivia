//
//  Film.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/25/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

struct Film: Codable {
    let title: String
    let episode: Int
    let director: String
    let producer: String
    let releaseDate: String
    let overview: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case episode = "episode_id"
        case director
        case producer
        case releaseDate = "release_date"
        case overview = "opening_crawl"
    }
}
