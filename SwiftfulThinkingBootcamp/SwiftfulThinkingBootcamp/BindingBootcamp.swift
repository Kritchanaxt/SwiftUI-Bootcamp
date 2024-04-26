//
//  BindingBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 13/4/2567 BE.
//

// @Binding เป็น property wrapper ที่ใช้สำหรับการผูกค่าระหว่างวิวที่ต่างกัน โดยทำให้การเปลี่ยนแปลงค่าในวิวหนึ่งสามารถส่งผลต่อค่าในวิวอื่นๆ ที่ผูกกับ @Binding ได้

//หากไม่ใช้ @Binding เพื่อผูกค่าระหว่างวิวย่อยและวิวหลัก การเปลี่ยนแปลงค่าในวิวย่อยจะไม่มีผลต่อค่าในวิวหลัก ซึ่งอาจทำให้ค่าในวิวหลักไม่ได้รับการอัปเดตตามที่คาดหวัง

import SwiftUI

struct BindingBootcamp: View {
    
    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"
    
    var body: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(title)
                    .foregroundColor(.white)
                
                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {
    
    @Binding var backgroundColor: Color
    @State var buttonColor: Color = Color.blue
    @Binding var title: String
    
    var body: some View {
        Button(action: {
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = "NEW TITLE!!"
        }, label: {
            Text("Button")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(10
                )
        })
    }
}

#Preview {
    BindingBootcamp()
}
