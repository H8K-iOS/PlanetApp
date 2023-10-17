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
        PlanetData.init(name: "Mercury", description: "Lorem Ipsum has been the industry's", imageName: "Mercury", distanse: "1",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Venus", description: "Lorem Ipsum has been the industry's", imageName: "Venus", distanse: "2",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Earth", description: "Lorem Ipsum has been the industry's", imageName: "Earth", distanse: "3",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Mars", description: "Lorem Ipsum has been the industry's", imageName: "Mars", distanse: "4",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Jupiter", description: "Lorem Ipsum has been the industry's", imageName: "Jupiter", distanse: "5",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Saturn", description: "Lorem Ipsum has been the industry's", imageName: "Saturn", distanse: "6",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Uranus", description: "Lorem Ipsum has been the industry's", imageName: "Uranus", distanse: "7",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Neptune", description: "Lorem Ipsum has been the industry's", imageName: "Neptune", distanse: "8",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22")),
        
        PlanetData.init(name: "Pluto", description: "Lorem Ipsum has been the industry's", imageName: "Pluto", distanse: "9",
                        detailInfo: DetailInfo(adjectives: "",
                                               aphelion: 1,
                                               perihelion: 1,
                                               eccentricity: 11.1,
                                               avgOrbitalSpeed: 11.1,
                                               satellites: "22"))
    ]
    
}
