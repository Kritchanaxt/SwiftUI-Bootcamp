//
//  ContentView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.title)
                .fontWeight(.thin)
                .padding()
            Text("Placeholder")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundColor(Color.red)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
