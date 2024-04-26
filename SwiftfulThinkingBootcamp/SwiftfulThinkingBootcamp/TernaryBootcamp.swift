//
//  TernaryBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 13/4/2567 BE.
//

// (condition) ? true : false
// การเขียน short conditional 

import SwiftUI

struct TernaryBootcamp: View {
    
    @State var isStartingState: Bool = false
    
    var body: some View {
        VStack {
            Button("Button: \(isStartingState.description)") {
                isStartingState.toggle()
            }
            
            Text(isStartingState ? "STARTING STATE!!" : "ENDING STATE.")
           
            RoundedRectangle(cornerRadius: isStartingState ? 25 : 0)
                .fill(isStartingState == true ? Color.red : Color.blue)
                    .frame(
                        width: isStartingState ? 300 : 200,
                        height: isStartingState ? 300: 200)
            
            Spacer()
        }
    }
}

#Preview {
    TernaryBootcamp()
}
