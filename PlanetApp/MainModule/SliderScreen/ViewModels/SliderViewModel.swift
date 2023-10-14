import Foundation
import UIKit

class SliderViewModel {
    
    private(set) var sliderData: [SliderData] = [
        //MOC Data
        SliderData.init(tittle: "Hello there!", subText: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.", animationName: "n1"),
        SliderData.init(tittle: "What's the point of this app?", subText: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.", animationName: "n2"),
        SliderData.init(tittle: "Let's start our trip!", subText: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered.", animationName: "n3"),
    ]
    
    //TODO: - api data
    init() {
        
    }
    
}
