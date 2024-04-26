//
//  ShapesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

// RoundedRectangle: เป็น Shape ที่ใช้สร้างสี่เหลี่ยมมุมกลมใน SwiftUI


import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        //Circle()
        //Ellipse()
        //Capsule(style: .circular)
        RoundedRectangle(cornerRadius: 10)
            //.fill(Color.green)
            //.foregroundColor(.pink)
            //.stroke()
            //.stroke(Color.red)
            //.stroke(Color.blue, lineWidth: 10).
            //.stroke(Color.orange, style:StrokeStyle(lineWidth: 30, lineCap: .round,dash: [30]))
            //.trim(from: 0.4, to: 1.0)
            //.stroke(Color.purple, lineWidth: 50)
            .frame(width: 200, height: 100)
    }
}

#Preview {
    ShapesBootcamp()
}
