//
//  Vehicles.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

struct Vehicle {
    let name: String
    let model: String
    let manufacturer: String
    let cost: String
    let length: String
    let speed: String
    let passengers: String
    
    enum CodingKeys: String, CodingKey {
       case name
       case model
       case manufacturer
       case cost = "cost_in_credits"
       case length
       case speed = "max_atmosphering_speed"
       case crew
       case passengers
    }
}
