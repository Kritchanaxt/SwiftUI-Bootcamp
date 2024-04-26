//
//  ForEachBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

import SwiftUI

struct ForEachBootcamp: View {
    
    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    
    var body: some View {
        VStack {
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
            ForEach(0..<5) { index in
                Circle()
                    .frame(height: 50)
            }
        }
    }
}

#Preview {
    ForEachBootcamp()
}
