//
//  StarshipAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/25/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation
import Alamofire

class StarshipAPI {
    
    func getStarship(url: String, completion: @escaping (Starship?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                return completion(nil)
            }
            
            guard let data = response.data else { return }
            let jsonDecoder = JSONDecoder()
            do {
                let starship = try jsonDecoder.decode(Starship.self, from: data)
                completion(starship)
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
            }
        }
    }
}
