import Foundation

final class PlanetDetailViewModel {
    let name: String
    let description: String
    let planetSceneName: String?
    let distance: String
    let adjectives: String
    let aphelion: Int
    let perihelion: Int
    let eccentricity: Double
    let avgOrbitalSpeed: Double
    let satellites: String
    let discovererName: String
    let discovererImage: String?
    
    init(_ planetData: PlanetData) {
        self.name = planetData.name
        self.description = planetData.description
        self.planetSceneName = (planetData.planetSceneName ?? "") + ".scn"
        self.distance = planetData.distance
        
        self.adjectives = planetData.detailInfo.adjectives
        self.aphelion = planetData.detailInfo.aphelion
        self.perihelion = planetData.detailInfo.perihelion
        self.eccentricity = planetData.detailInfo.eccentricity
        self.avgOrbitalSpeed = planetData.detailInfo.avgOrbitalSpeed
        self.satellites = planetData.detailInfo.satellites
        
        self.discovererName = planetData.detailInfo.discovererInfo.discovererName
        self.discovererImage = planetData.detailInfo.discovererInfo.discovererImage
    }
    
}
