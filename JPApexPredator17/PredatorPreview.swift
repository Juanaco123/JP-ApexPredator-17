//
//  PredatorPreview.swift
//  JPApexPredator17
//
//  Created by Juan Camilo Victoria Pacheco on 6/06/24.
//

import SwiftUI

struct PredatorPreview: View {
  let predator: ApexPredator
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
        Image(predator.type.rawValue)
          .resizable()
          .scaledToFill()
          .frame(width: geo.size.width, height: geo.size.height)
        
        Image(predator.image)
          .resizable()
          .scaledToFit()
          .frame(width: geo.size.width / 1.2, height: geo.size.height)
          .scaleEffect(x: -1)
          .shadow(color: .black,radius: 7)
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  PredatorPreview(predator: Predators().apexPredators[2])
}
