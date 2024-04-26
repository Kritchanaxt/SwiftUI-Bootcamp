//
//  ButtonStylesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

import SwiftUI

struct ButtonStylesBootcamp: View {
    var body: some View {
        VStack {
            
            Button("Button Title") {
                
            }
            .frame(height: 65)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)
            
            Button("Button Title") {
                
            }
            .frame(height: 65)
            .frame(maxWidth: .infinity)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 20))
            .controlSize(.large)
//            .controlSize(.small)

            Button("Button Title") {
                
            }
            .frame(height: 65)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            
            Button("Button Title") {
                
            }
            .frame(height: 65)
            .frame(maxWidth: .infinity)
            .buttonStyle(.borderless)
        }
        .padding()
    }
}

#Preview {
    ButtonStylesBootcamp()
}
