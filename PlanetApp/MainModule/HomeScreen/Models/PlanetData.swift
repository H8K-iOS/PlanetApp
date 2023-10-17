//
//  PlanetData.swift
//  PlanetApp
//
//  Created by Alexandr Alimov on 14/10/23.
//

import Foundation

struct PlanetData {
    let name: String
    let description: String
    let imageName: String?
    let distanse: String
    
    let detailInfo: DetailInfo
}

struct DetailInfo {
    let adjectives: String
    let aphelion: Int
    let perihelion: Int
    let eccentricity: Double
    let avgOrbitalSpeed: Double
    let satellites: String

}

struct Discoverer {
    let name: String
    let discovererImage: String
}
