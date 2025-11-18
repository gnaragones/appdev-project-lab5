//
//  ParkDetailView.swift
//  Lab5
//
//  Created by Gianna Aragones on 10/22/25.
//

import SwiftUI
import MapKit

struct LandMarkItem: Identifiable {
    let id = UUID()
    let mapItem: MKMapItem
}

struct ParkDetailView: View {
    var park: Park
    @State private var region: MKCoordinateRegion
    @State private var searchQuery = ""
    @State private var landmarks: [LandMarkItem] = []
    
    init(park: Park){
        self.park = park
        _region = State(initialValue: MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: park.latitude, longitude: park.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        ))
    }
    
    var body: some View{
        ScrollView{
            Image(park.imageName)
                .resizable()
                .scaledToFit()
            Text(park.description)
                .padding()
            TextField("Search nearby (e.g. coffee, pizza)", text: $searchQuery, onCommit: searchPlaces)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Map(
                coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: false,
                annotationItems: landmarks
            ) { item in
                MapMarker(coordinate: item.mapItem.placemark.coordinate, tint: .blue)
            }
            .frame(height: 300)
        }
        .navigationTitle(park.name)
    }
    
    func searchPlaces(){
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = searchQuery
        request.region = region
        
        let search = MKLocalSearch(request: request)
        search.start { response, _ in
            guard let response = response else {return}
            landmarks = response.mapItems.map{ LandMarkItem(mapItem: $0)}
        }
    }
}
