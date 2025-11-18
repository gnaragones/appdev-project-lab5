//
//  AddParkView.swift
//  Lab5
//
//  Created by Gianna Aragones on 10/22/25.
//

import SwiftUI

struct AddParkView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ParkViewModel
    
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var description: String = ""
    @State private var latitude: String = ""
    @State private var longitude: String = ""
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Park Name", text: $name)
                TextField("Location", text: $location)
                TextField("Description", text: $description)
                TextField("Latitude", text: $latitude)
                TextField("Longitude", text: $longitude)
            }
            .navigationTitle("Add New Park")
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
                        let lat = Double(latitude) ?? 0
                        let lon = Double(longitude) ?? 0
                        let newPark = Park(name: name, location: location, description: description, latitude: lat, longitude: lon, imageName: "defaultPark")
                        viewModel.addPark(newPark)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel") {dismiss()}
                }
            }
        }
    }
}
