//
//  Constants.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit
import Alamofire

let BLACK_BG   = UIColor.black.withAlphaComponent(0.5).cgColor
let BASE_URL   = "https://swapi.co/api/"
let PERSON_URL = BASE_URL + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
