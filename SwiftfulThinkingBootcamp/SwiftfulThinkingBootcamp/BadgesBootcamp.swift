//
//  BadgesBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// TabView ใช้ในการแสดงข้อมูลหลายๆ หน้า (หรือแท็บ) ในรูปแบบของแท็บบาร์ โดยสามารถเปลี่ยนแท็บได้โดยการแตะหรือเลื่อนไปทางซ้ายหรือขวา

// Badges: ใช้ Badge modifier กับ Text view เพื่อแสดงตัวเลขหรือตัวอักษรที่อยู่ในหลักของแบรนด์

import SwiftUI

struct BadgesBootcamp: View {
    var body: some View {
        
//        List {
//            Text("Hello, world!")
//                .badge(5)
//            Text("Hello, world!")
//            Text("Hello, world!")
//            Text("Hello, world!")
//        }
        
                TabView {
                    Color.red
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("New")
                        }
                        .badge(0)
                    
                    Color.green
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("YOYO")
                        }
                        .badge(0)
                    
                    Color.blue
                        .tabItem {
                            Image(systemName: "heart.fill")
                            Text("Hello")
                        }
                        .badge(0)
                }
    }
}

#Preview {
    BadgesBootcamp()
}
