//
//  HomeworldAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldAPI {
    
    func getHomeWorld(url: String, completion: @escaping (Homeworld?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                completion(homeworld)
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
            }
        }
    }
}
