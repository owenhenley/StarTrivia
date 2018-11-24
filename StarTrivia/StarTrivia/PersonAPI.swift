//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

class PersonAPI {
    
    func getRandomPersonURLSession(id: Int, completion: @escaping PersonResponseConpletion) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
                return
            }
            
            print(response ?? "No Response")
            
            guard let data = data else { return }
            
            // Serialization
            do {
                let jsonAny = try JSONSerialization.jsonObject(with: data, options: [])
                // cast json into dictionary
                guard let json = jsonAny as? [String : Any] else { return }
                let person = self.parsePerson(json: json)
                DispatchQueue.main.async {
                    completion(person)
                }
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
                return
            }
        }.resume()
    }
    
    // Serialization Parse
    private func parsePerson(json: [String : Any]) -> Person {
        let name         = json["name"] as? String ?? ""
        let height       = json["height"] as? String ?? ""
        let mass         = json["mass"] as? String ?? ""
        let hair         = json["hair_color"] as? String ?? ""
        let birthYear    = json["birth_year"] as? String ?? ""
        let gender       = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmUrls     = json["films"] as? [String] ?? [String]()
        let vehicleUrls  = json["vehicles"] as? [String] ?? [String]()
        let starsipUrls  = json["starships"] as? [String] ?? [String]()
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starsipUrls)
    }
}
