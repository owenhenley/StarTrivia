//
//  VehicleAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

class VehicleAPI {
    
    func getVehicle(url: String, completion: @escaping (Vehicle?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                return completion(nil)
            }
            
            guard let data = data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let vehicle = try jsonDecoder.decode(Vehicle.self, from: data)
                completion(vehicle)
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
            }
        }.resume()
    }
}
