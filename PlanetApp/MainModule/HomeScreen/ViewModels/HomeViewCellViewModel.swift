import Foundation

final class HomeViewCellViewModel {
    
    var name: String
    var description: String
    var imageName: String?
    
    init(_ planetData: PlanetData) {
        self.name = planetData.name
        self.description = planetData.description
        self.imageName = planetData.imageName ?? ""
    }
}
