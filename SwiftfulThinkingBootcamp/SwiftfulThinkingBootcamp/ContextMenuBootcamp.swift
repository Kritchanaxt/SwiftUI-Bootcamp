//
//  ContextMenuBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Nick Sarno on 1/29/21.
//

// .contextMenu(menuItems: {}) ใช้สร้าง Context Menu สำหรับแสดงตัวเลือกต่างๆ เมื่อผู้ใช้ทำการแตะค้างหรือคลิกขวาที่ View นั้นๆ โดยสามารถใส่ปุ่มหรือเนื้อหาต่างๆ เข้าไปในเมนูนี้ได้

import SwiftUI

struct ContextMenuBootcamp: View {
    
    @State var backgroundColor: Color = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Image(systemName: "house.fill")
                .font(.title)
            Text("Swiftful Thinking")
                .font(.headline)
            Text("How to use Context Menu")
                .font(.subheadline)
        }
        .foregroundColor(.white)
        .padding(30)
        .background(backgroundColor.cornerRadius(30))
        .contextMenu(menuItems: {
            Button(action: {
                    backgroundColor = .yellow
                }, label: {
                    Label("Share post", systemImage: "flame.fill")
                })
                
                Button(action: {
                    backgroundColor = .red
                }, label: {
                    Text("Report post")
                })
                
                Button(action: {
                    backgroundColor = .green
                }, label: {
                    HStack {
                        Text("Like post")
                        Image(systemName: "heart.fill")
                    }
                })
            })
    }
}

#Preview {
    ContextMenuBootcamp()
}
