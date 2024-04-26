//
//  StateBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

//@State เป็น property wrapper ที่ใช้เพื่อเก็บค่าของ state ของ view ซึ่งเมื่อค่าของ state เปลี่ยนแปลงจะทำการรีเรนเดอร์ view ใหม่เพื่อปรับปรุง UI ตามค่า state ที่เปลี่ยนแปลง

// หากไม่ใช้ @State จะไม่สามารถทำให้วิวสามารถอัปเดตตัวเองได้ ที่เกิดขึ้นในวิวย่อยจะไม่ส่งผลต่อการแสดงผลของวิวหลัก  

import SwiftUI

struct StateBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var myTitle: String = "My Title"
    @State var count: Int = 0
    
    var body: some View {
        ZStack {
            //background
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            // content
            VStack(spacing: 20) {
                Text(myTitle)
                    .font(.title)
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()
                
                HStack(spacing: 20) {
                    Button("BUTTON 1") {
                        backgroundColor = .red
                        myTitle = "BUTTON 1 was pressed"
                        count += 1
                    }
                    
                    Button("BUTTON 2") {
                        backgroundColor = .purple
                        myTitle = "BUTTON 2 was pressed"
                        count -= 1
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    StateBootcamp()
}
