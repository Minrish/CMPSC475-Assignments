//
//  Pokemon+Decodable.swift
//  Pokemon Wiki
//
//  Created by Bert Yan on 2/14/22.
//

import Foundation

extension Pokemon {
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case types
        case height
        case weight
        case weaknesses
        
        // Assignment 5
        case prev_evolution
        case next_evolution
        
        // Not in .json
        case captured
    }
    
    // Initial values
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        types = try values.decode([PokemonType].self, forKey: .types)
        height = try values.decode(Double.self, forKey: .height)
        weight = try values.decode(Double.self, forKey: .weight)
        weaknesses = try values.decode([PokemonType].self, forKey: .weaknesses)
        
        // Assginment 5
        prev_evolution = try values.decodeIfPresent([Int].self, forKey: .prev_evolution)
        next_evolution = try values.decodeIfPresent([Int].self, forKey: .next_evolution)
        captured = try values.decodeIfPresent(Bool.self, forKey: .captured)  ?? false
    }
    
}
