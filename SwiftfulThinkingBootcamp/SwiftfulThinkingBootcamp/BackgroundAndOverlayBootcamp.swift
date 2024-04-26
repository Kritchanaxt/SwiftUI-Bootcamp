//
//  BackgroundAndOverlayBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 8/4/2567 BE.
//

import SwiftUI

struct BackgroundAndOverlayBootcamp: View {
    var body: some View {
        //Text("Hello, World!")
            //.frame(width: 100, height: 100, alignment: .center)
            //.background(
                //Color.red
                //LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                //Circle()
                    //.fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    //.frame(width: 100, height: 100, alignment: .center)
            //)
            //.background(
                 //Circle()
                    //.fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
                    //.frame(width: 120, height: 120, alignment: .center)
            //)
        
        //Circle()
            //.fill(Color.pink)
            //.frame(width: 100, height: 100, alignment: .center)
            //.overlay(
                //Text("1")
                    //.font(.largeTitle)
                    //.foregroundColor(.white)
            //)
            //.background(
                //Circle()
            //.fill(Color.purple)
            //.frame(width: 150, height: 150)
            //)
        //Rectangle()
            //.frame(width: 100, height: 100)
            //.overlay(
                //Rectangle()
                    //.fill(Color.blue)
                    //.frame(width: 50, height: 50),
                //alignment: .topLeading //บนซ้าย
            //)
            //.background(
                 //Rectangle()
                    //.fill(Color.red)
                    //.frame(width: 150, height: 150),
                 //alignment: .bottomTrailing //บนขวา
            //)
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(Color.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple, Color.blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing))
                    .frame(width: 100, height: 100)
                    .shadow(color: .purple, radius: 10, x:0, y:10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                            .shadow(color: .black, radius: 20, x:0, y:1)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                        ,alignment: .bottomTrailing
                    )
            )
    }
}

#Preview {
    BackgroundAndOverlayBootcamp()
}
