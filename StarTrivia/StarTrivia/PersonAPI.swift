//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    // Request with Alamofire and Codable
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
                return
            }
            
            guard let data = response.data else { completion(nil); return }
            let jsonDecoder = JSONDecoder()
            
            do {
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
                return
            }
        }
    }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Alamfire and SwiftyJSON
    // func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //     guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
    //
    //     Alamofire.request(url).responseJSON { (response) in
    //         if let error = response.result.error {
    //             print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
    //             completion(nil)
    //             return
    //         }
    //
    //         guard let data = response.data else { completion(nil); return }
    //
    //         do {
    //             let json = try JSON(data: data)
    //             let person = self.parsePersonSwifty(json: json)
    //             completion(person)
    //         } catch {
    //             print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
    //             completion(nil)
    //             return
    //         }
    //     }
    // }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Mark: - SwiftyJSON Parse
    // private func parsePersonSwifty(json: JSON) -> Person {
    //     let name         = json["name"].stringValue
    //     let height       = json["height"].stringValue
    //     let mass         = json["mass"].stringValue
    //     let hair         = json["hair_color"].stringValue
    //     let birthYear    = json["birth_year"].stringValue
    //     let gender       = json["gender"].stringValue
    //     let homeworldUrl = json["homeworld"].stringValue
    //     let filmUrls     = json["films"].arrayValue.map { $0.stringValue }
    //     let vehicleUrls  = json["vehicles"].arrayValue.map { $0.stringValue }
    //     let starsipUrls  = json["starships"].arrayValue.map { $0.stringValue }
    // 
    //     return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starsipUrls)
    // }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Request using Alamofire
    // func getRandomPersonAlamofire(id: Int, completion: @escaping PersonResponseCompletion) {
    //     guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
    //
    //     Alamofire.request(url).responseJSON { (response) in
    //         if let error = response.result.error {
    //             print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
    //             completion(nil)
    //             return
    //         }
    //
    //         guard let json = response.result.value as? [String : Any] else { completion(nil); return }
    //         let person = self.parsePerson(json: json)
    //         completion(person)
    //     }
    // }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // MARK: - Request using URLSession JSON Serialization
    
    // func getRandomPersonURLSession(id: Int, completion: @escaping PersonResponseCompletion) {
    //
    //     guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
    //
    //     URLSession.shared.dataTask(with: url) { (data, response, error) in
    //         if let error = error {
    //             print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
    //             completion(nil)
    //             return
    //         }
    //
    //         print(response ?? "No Response")
    //
    //         guard let data = data else { return }
    //
    //         do {
    //             let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
    //             // cast json into dictionary
    //             guard let json = jsonAny as? [String : Any] else { return }
    //             let person = self.parsePerson(json: json)
    //             DispatchQueue.main.async {
    //                 completion(person)
    //             }
    //         } catch {
    //             print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
    //             completion(nil)
    //             return
    //         }
    //     }.resume()
    // }
    
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // Mark: - Serialization Parse
    // private func parsePerson(json: [String : Any]) -> Person {
    //     let name         = json["name"] as? String ?? ""
    //     let height       = json["height"] as? String ?? ""
    //     let mass         = json["mass"] as? String ?? ""
    //     let hair         = json["hair_color"] as? String ?? ""
    //     let birthYear    = json["birth_year"] as? String ?? ""
    //     let gender       = json["gender"] as? String ?? ""
    //     let homeworldUrl = json["homeworld"] as? String ?? ""
    //     let filmUrls     = json["films"] as? [String] ?? [String]()
    //     let vehicleUrls  = json["vehicles"] as? [String] ?? [String]()
    //     let starsipUrls  = json["starships"] as? [String] ?? [String]()
    //
    //     return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starsipUrls)
    // }
}
