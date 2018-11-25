//
//  FilmAPI.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/25/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import Foundation

class FilmAPI {
    
    func getFilms(url: String, completion: @escaping (Film?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                return completion(nil)
            }
            
            guard let data = data else { return completion(nil) }
            let jsonDecoder = JSONDecoder()
            do {
                let film = try jsonDecoder.decode(Film.self, from: data)
                completion(film)
            } catch {
                print("❌ ERROR in \(#file), \(#function), \(error),\(error.localizedDescription) ❌")
                completion(nil)
            }
        }.resume()
    }
}
