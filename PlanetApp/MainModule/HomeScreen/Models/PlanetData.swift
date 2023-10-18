import Foundation

struct PlanetData {
    let name: String
    let description: String
    let imageName: String?
    let planetSceneName: String?
    let distance: String
    
    let detailInfo: DetailInfo
}

struct DetailInfo {
    let adjectives: String
    let aphelion: Int
    let perihelion: Int
    let eccentricity: Double
    let avgOrbitalSpeed: Double
    let satellites: String
    let discovererInfo: Discoverer
}

struct Discoverer {
    let discovererName: String
    let discovererImage: String
}
