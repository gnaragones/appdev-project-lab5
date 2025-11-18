//
//  ParkViewModel.swift
//  Lab5
//
//  Created by Gianna Aragones on 10/22/25.
//

import Foundation

class ParkViewModel: ObservableObject {
    @Published var parks: [Park]
    
    init(){
        parks = [
            Park(name: "Grand Canyon", location: "Arizona, USA", description: "Steep Canyon created by the Colorado River", latitude: 36.1069, longitude: -112.1129, imageName: "grandcanyon"),
            Park(name: "Joshua Tree", location: "California, USA", description: "Desert land with scattered Joshua trees", latitude: 34.1, longitude: 116.27, imageName: "joshuatree"),
            Park(name: "Yosemite", location: "California, USA", description: "Full of waterfalls and cliffs", latitude: 37.8651, longitude: -119.5383, imageName: "yosemite"),
            Park(name: "Yellowstone", location: "Wyoming, USA", description: "First ever national park", latitude: 44.4280, longitude: -110.5885, imageName: "yellowstone"),
            Park(name: "Zion", location: "Utah, USA", description: "Has narrow canyons and red cliffs", latitude: 37.2982, longitude: -113.0263, imageName: "zion")
        ]
    }
    
    func addPark(_ park: Park){
        parks.append(park)
    }
    
    func deletePark(at offsets: IndexSet){
        parks.remove(atOffsets: offsets)
    }
}
