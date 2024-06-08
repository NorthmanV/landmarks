//
//  ModelData.swift
//  Landmarks
//
//  Created by Ruslan Akberov on 02.06.2024.
//

import Foundation

@Observable
class ModelData {
    var landmarks: [Landmark] = load(fileName: "landmarkData.json")
    let hikes: [Hike] = load(fileName: "hikeData.json")
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    var features: [Landmark] {
        landmarks.filter(\.isFeatured)
    }
}

func load<T: Decodable>(fileName: String) -> T {
    
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
