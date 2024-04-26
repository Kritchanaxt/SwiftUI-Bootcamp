//
//  ImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

import SwiftUI

struct ImageBootcamp: View {
    var body: some View {
        Image("apple")
            //.renderingMode(.template)
            .resizable()
            //.aspectRatio(contentMode: .fill)
            //.scaledToFit()
            .scaledToFill()
            .frame(width: 300, height: 300)
            .foregroundColor(.blue)
            //.clipped()
            //.cornerRadius(150)
            //.clipShape(
                //Circle()
                //RoundedRectangle(cornerRadius: 25.0)
                //Ellipse()
            //)
    }
}

#Preview {
    ImageBootcamp()
}
