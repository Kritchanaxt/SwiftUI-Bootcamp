//
//  AnyLayoutBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

/*
MARK: AnyLayout
 - เป็นการใช้งาน View โดยไม่ต้องระบุชนิดของ View นั้นๆ ล่วงหน้า นั้นเป็นที่นิยมในกรณีที่ต้องการรวม View
 หลายๆ อย่างเข้าด้วยกันและไม่ต้องการระบุชนิดแต่ละอย่างไว้ล่วงหน้า

MARK: .horizontalSizeClass
 - เป็น Environment Key ที่ใช้เพื่อเข้าถึงข้อมูลเกี่ยวกับ" ขนาดแนวนอน" ของอุปกรณ์ มีค่าได้แก่ compact, regular, 
 และ unspecified ซึ่งช่วยในการปรับแสดงผลให้เหมาะสมกับขนาดแนวนอนของอุปกรณ์ที่ใช้งาน
 
MARK: .verticalSizeClass
 - เป็น Environment Key ที่ใช้เพื่อเข้าถึงข้อมูลเกี่ยวกับ "ขนาดแนวตั้ง" ของอุปกรณ์ มีค่าได้แก่ compact,
 regular, และ unspecified ซึ่งช่วยในการปรับแสดงผลให้เหมาะสมกับขนาดแนวตั้งของอุปกรณ์ที่ใช้งาน
 
MARK: .compact: 
 - อยู่ในโหมดที่มีพื้นที่จอจำกัด เช่น iPhone แบบ landscape หรือแสดงผลบนอุปกรณ์ที่มีขนาดจอเล็ก
 
MARK: .regular:
 - อยู่ในโหมดที่มีพื้นที่จอกว้างขึ้น เช่น iPad แบบ portrait
 
MARK: .unspecified:
 - ไม่ได้ระบุโหมดของพื้นที่จอ หรือไม่สามารถระบุได้ในขณะนั้น

MARK: .debugDescription
- คือ property ที่ใช้ในการเรียกดูข้อมูล debug ของอ็อบเจกต์ใน Swift โดยจะแสดงข้อมูลเกี่ยวกับตัวแปร โครงสร้าง หรือสถานะต่างๆ ภายในอ็อบเจกต์นั้น ๆ ออกมา
 
*/

import SwiftUI

// https://useyourloaf.com/blog/size-classes/

struct AnyLayoutBootcamp: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
            
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout {
                Text("Alpha")
                Text("Beta")
                Text("Gamma")
            }
            
            if horizontalSizeClass == .compact {
                VStack {
                    Text("Alpha")
                    Text("Beta")
                    Text("Gamma")
                }
            } else {
                HStack {
                    Text("Alpha")
                    Text("Beta")
                    Text("Gamma")
                }
            }
        }
    }
}

#Preview {
    AnyLayoutBootcamp()
}
