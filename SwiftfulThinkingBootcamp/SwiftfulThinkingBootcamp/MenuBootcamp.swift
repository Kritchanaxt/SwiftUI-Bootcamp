//
//  MenuBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

// Menu เป็นวิธีที่ดีในการแสดงตัวเลือกหลาย ๆ รายการในแบบต่าง ๆ ซึ่งสามารถเรียกใช้ได้จากแถบเมนู หรือการแสดงตามคลิกขวา เป็นต้น



import SwiftUI

struct MenuBootcamp: View {
    var body: some View {
        Menu("Click me!") {
            Button("One") {
                
            }
            Button("Two") {
                
            }
            Button("Three") {
                
            }
            Button("Four") {
                
            }
        }
    }
}

#Preview {
    MenuBootcamp()
}
