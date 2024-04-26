//
//  GreadientsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

import SwiftUI

struct GreadientsBootcamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                // Color.red
                //LinearGradient(
                   // gradient: Gradient(colors: [Color.red, Color.blue, Color.orange, Color.purple]),
                   // startPoint: .topLeading,
                   // endPoint: .bottom)
               // RadialGradient(
                   // gradient: Gradient(colors: [Color.red, Color.blue]),
                   // center: .topLeading,
                   // startRadius: 5,
                   // endRadius: 400)
                AngularGradient(
                    gradient: Gradient(colors: [Color.blue, Color.green]),
                    center: .topLeading,
                    angle: .degrees(150 + 50))
            )
            .frame(width: 300, height: 200)
    }
}

#Preview {
    GreadientsBootcamp()
}
