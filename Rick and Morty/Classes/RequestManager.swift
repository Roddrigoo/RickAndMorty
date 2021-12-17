//
//  ListRequest.swift
//  Rick and Morty
//
//  Created by Rodrigo Lourenço on 15/12/21.
//

import Foundation

class RequestManager {
    
    private let serverURL = "https://rickandmortyapi.com/api"
    
    func loadCharacters(completion: @escaping (_ items: [Character]?) -> Void) {
        
        if let apiURL = URL(string: "\(serverURL)/character") {
            
            URLSession.shared.dataTask(with: apiURL) { data, _, _ in
                
                if let data = data {
                    
                    let response = try? JSONDecoder().decode(APIResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        completion(response?.results)
                    }
                }else{
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }.resume()
        }
    }
}
