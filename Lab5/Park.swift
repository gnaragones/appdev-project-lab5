//
//  Park.swift
//  Lab5
//
//  Created by Gianna Aragones on 10/22/25.
//

import Foundation
import MapKit

struct Park: Identifiable{
    let id = UUID()
    var name: String
    var location: String
    var description: String
    var latitude: Double
    var longitude: Double
    var imageName: String
}
