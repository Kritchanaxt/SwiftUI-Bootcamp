//
//  SliderBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//

// Slider ใช้ในการเลือกค่าจากช่วงหนึ่งของค่าที่กำหนดไว้ โดยปกติแล้ว Slider จะมีการกำหนดค่าต่ำสุด (minimum value) และค่าสูงสุด (maximum value) เพื่อให้ผู้ใช้สามารถเลื่อนบน Slider เพื่อเลือกค่าตามต้องการ

import SwiftUI

struct SliderBootcamp: View {
    
    @State var sliderValue: Double = 3
    @State var color: Color = .red
    
    var body: some View {
        VStack {
            Text("Rating:")
                .font(.title)
            Text(
//                "\(sliderValue)"
                String(format: "%.1f", sliderValue)
            )
            .foregroundColor(color)
//            Slider(value: $sliderValue)
//            Slider(value: $sliderValue, in: 1...5)
//            Slider(value: $sliderValue, in: 1...5, step: 0.5)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                },
                minimumValueLabel:
                    Text("\t1")
                    .font(.largeTitle)
                    .foregroundColor(.blue)
                ,
                maximumValueLabel: 
                    Text("5\t")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                ,
                label: {
                    Text("Title")
                })
                .accentColor(.yellow)
        }
    }
}

#Preview {
    SliderBootcamp()
}
