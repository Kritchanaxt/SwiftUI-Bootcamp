//
//  PaddingAndSpacerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 8/4/2567 BE.
//

//padding: เป็น modifier ที่ใช้เพิ่มพื้นที่ว่างรอบขอบของ View เพื่อปรับหน้าตาและระยะห่างขององค์ประกอบ UI

import SwiftUI

struct PaddingAndSpacerBootcamp: View {
    var body: some View {
//        Text("Hello, World! This is fun.")
//            .background(Color.yellow)
//            //.padding()
//            .padding(.all, 10)
//            .padding(.leading, 20)
//            .background(Color.blue)
        
//        Text("Hello, World!")
//            .font(.largeTitle)
//            .fontWeight(.semibold)
//            .frame(maxWidth: .infinity, alignment: .leading)
//            .background(Color.red)
//            .padding(.leading, 20)
        
        VStack(alignment: .leading){
            Text("Hello, World!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 20)
            
            Text("This is the description of what we will do on this screen. It is multiple lines and we will align the text to the leading edge")
        }
        .padding()
        .padding(.vertical, 10) // จะเพิ่มการเว้นระหว่างขอบแนวตั้งทั้งสองข้าง
        .background(
            Color.white
                .cornerRadius(10) // จะเพิ่มมุมโค้ง
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 10,
                    x: 0.0, y: 10)
        )
        .padding(.horizontal, 10) //จะเพิ่มการเว้นระหว่างขอบแนวนอนทั้งสองข้าง
    }
}

#Preview {
    PaddingAndSpacerBootcamp()
}
