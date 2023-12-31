//
//  Bundle+Extensions.swift
//  MovieList
//
//  Created by Nileshkumar M. Prajapati on 2023/06/20.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T? {
            // 1. Locate JSON File
        guard let url = self.url(forResource: file, withExtension: nil) else {
            debugPrint("Failed to locate \(file) in bundle.")
            return nil
        }
        
            // 2. Create property for Data
        guard let data = try? Data(contentsOf: url) else {
            debugPrint("Failed to locate \(file) in bundle.")
            return nil
        }
        
            // 3. Create a property for Decoder
        let decoder = JSONDecoder()
        
            // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            debugPrint("Failed to locate \(file) in bundle.")
            return nil
        }
        
            // 5. Return ready-to-use data
        return loaded
    }
}
