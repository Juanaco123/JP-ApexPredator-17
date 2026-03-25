//
//  PredatorCard.swift
//  JPApexPredator17
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/24.
//

import SwiftUI

struct PredatorCard: View {
  var predator: ApexPredator
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack {
        Image(predator.type.rawValue)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(height: 100)
          .clipped()
          .overlay {
            LinearGradient(
              stops: [
                Gradient.Stop(color: .clear, location: 0.8),
                Gradient.Stop(color: .black, location: 1)
              ],
              startPoint: .top,
              endPoint: .bottom
            )
          }
        
        // Predator name
        Text(predator.name)
          .font(.largeTitle)
      }
      
      VStack(alignment: .leading) {
        Text("Appears in")
          .font(.title3)
          .fontWeight(.bold)
          .padding(6)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(Color.gray.opacity(0.7))
          .clipShape(.rect(cornerRadius: 6))
        
        // Predator movies
        ForEach(predator.movies, id: \.self) { movie in
          Text("• \(movie)")
            .font(.subheadline)
            .padding(6)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.gray.opacity(0.7))
            .clipShape(.rect(cornerRadius: 6))
          
        }
        
        Link(predator.link, destination: URL(string: predator.link)!)
          .font(.caption)
          .foregroundStyle(.blue)
          .padding(.top)
      }
      .padding(.horizontal)
      .padding(.bottom)
    }
    .clipShape(.rect(cornerRadius: 10))
    
  }
}

#Preview {
  PredatorCard(predator: Predators().apexPredators[7])
    .previewLayout(.sizeThatFits)
}
