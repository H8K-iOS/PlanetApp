//
//  HomeViewModel.swift
//  PlanetApp
//
//  Created by Alexandr Alimov on 14/10/23.
//

import Foundation

//TODO: - Data API
final class HomeViewModel {
    var planetData: [PlanetData] = [
        PlanetData.init(name: "Mars", description: "desc1", imageName: "", distase: "1",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        PlanetData.init(name: "Venus", description: "desc2", imageName: "", distase: "2",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Earth", description: "desc3", imageName: "", distase: "1",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22"))
    ]
    
}
