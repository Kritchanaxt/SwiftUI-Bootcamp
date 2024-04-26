//
//  ViewThatFitsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

/* 
 
MARK: ViewThatFits
 - ใช้กำหนดขนาดของ View ให้พอดีกับข้อมูลที่มีอยู่และจะทำให้ View ปรับขนาดให้พอดีกับพื้นที่ที่มีอยู่
 ไม่ทำให้เกินขอบเขตที่กำหนดไว้ในโครงสร้างของ View นั้นๆ
 
*/

import SwiftUI

struct ViewThatFitsBootcamp: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            ViewThatFits {
                Text("This is some text that I would like to display to the user!")
                Text("This is some text that I would like to display!")
                Text("This is some text!")
            }
        }
        .frame(height: 300)
        .padding(50) // ข้อความจะแสดงตามพื้นที่ทีกำหนด
        .font(.headline)
    }
}

#Preview {
    ViewThatFitsBootcamp()
}
