//
//  PredatorMap.swift
//  JPApexPredator17
//
//  Created by Juan Camilo Victoria Pacheco on 3/06/24.
//

import SwiftUI
import MapKit

struct PredatorMap: View {
  let predators = Predators()
  
  @State var position: MapCameraPosition
  @State var satellite = false
  @State var displayModal = false
  @State private var cardOffset = UIScreen.main.bounds.height
  @State private var lastCardOffset = UIScreen.main.bounds.height
  
  var body: some View {
    ZStack{
      Map(position: $position) {
        ForEach(predators.apexPredators) { predator in
          Annotation(predator.name, coordinate: predator.location) {
            Button {
              displayModal.toggle()
            } label: {
              Image(predator.image)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .shadow(color: .white,radius: 3)
                .scaleEffect(x: -1)
            }
            .sheet(isPresented: $displayModal) {
              PredatorCard(predator: predator)
                .presentationDetents([.medium])
                .presentationDragIndicator(.hidden)
            }
          }
        }
      }
      .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
      .overlay(alignment: .bottomTrailing) {
        Button {
          satellite.toggle()
        } label: {
          Image(systemName: satellite ? "globe.americas.fill" : "globe.americas")
            .font(.largeTitle)
            .imageScale(.large)
            .padding(3)
            .background(.ultraThinMaterial)
            .clipShape(.rect(cornerRadius: 7))
            .shadow(radius: 3)
            .padding()
        }
      }
      .toolbarBackground(.automatic)
    }
  }
}

#Preview {
  PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 250, pitch: 80))
  )
  .preferredColorScheme(.dark)
  
}
