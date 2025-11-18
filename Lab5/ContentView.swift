//
//  ContentView.swift
//  Lab5
//
//  Created by Gianna Aragones on 10/22/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ParkViewModel()
    @State private var showingAddPark = false
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(viewModel.parks.sorted(by: {$0.name < $1.name})) { park in
                    NavigationLink(destination: ParkDetailView(park: park)){
                        HStack{
                            Image(park.imageName)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            VStack(alignment: .leading){
                                Text(park.name)
                                    .font(.headline)
                                Text(park.location)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: viewModel.deletePark)
            }
            .navigationTitle("Favorite Parks")
            .toolbar{
                Button(action: { showingAddPark.toggle()}){
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddPark){
                AddParkView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
