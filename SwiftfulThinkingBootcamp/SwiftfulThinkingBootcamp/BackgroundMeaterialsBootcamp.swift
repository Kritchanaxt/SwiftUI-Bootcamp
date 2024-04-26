//
//  BackgroundMeaterialsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

import SwiftUI

struct BackgroundMeaterialsBootcamp: View {
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .padding()
                Spacer()
            }
            .frame(height: 350)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
//            .background(.ultraThickMaterial)
//            .background(.regularMaterial)
//            .background(.thickMaterial)
//            .background(.thinMaterial)
//            .background(Color.black.opacity(0.5))
            .cornerRadius(30)
        }
        .ignoresSafeArea()
        .background(
            Image("Eyehole")
        )
    }
}

#Preview {
    BackgroundMeaterialsBootcamp()
}
