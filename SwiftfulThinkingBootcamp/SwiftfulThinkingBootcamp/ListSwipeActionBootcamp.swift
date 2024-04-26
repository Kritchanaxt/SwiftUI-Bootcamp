//
//  ListSwipeActionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// ListSwipeAction: ใช้เพื่อสร้างการกระทำที่สามารถเรียกใช้งานได้โดยการเลื่อนแถบข้างใน List view โดยมีฟังก์ชันการดำเนินการที่กำหนดไว้ล่วงหน้า เช่น การลบรายการ หรือการดำเนินการอื่น ๆ

// .allowsFullSwipe(true): อนุญาตให้การเลื่อนแถบด้านข้างสามารถเลื่อนไปถึงปลายทางได้

// .allowsFullSwipe(false): ปิดการอนุญาตให้เลื่อนแถบด้านข้างไปถึงปลายทาง


// Text($0.capitalized): ใช้ $0 ในการเข้าถึงแต่ละรายการในลูป ForEach และเปลี่ยนแต่ละรายการให้เป็นตัวพิมพ์ใหญ่ด้วยฟังก์ชัน capitalized


import SwiftUI

struct ListSwipeActionBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0.capitalized)
                    .swipeActions(edge: .trailing,allowsFullSwipe: true) {
                        Button("Archive") {
                            
                        }
                        .tint(.green) // ใช้เพื่อกำหนดสีของรายการ
                        
                        Button("Save") {
                            
                        }
                        .tint(.blue) // ใช้เพื่อกำหนดสีของรายการ
                        
                        Button("Junk") {
                            
                        }
                        .tint(.black) // ใช้เพื่อกำหนดสีของรายการ
                    }
                    .swipeActions(edge: .leading,allowsFullSwipe: false) {
                        Button("Share") {
                                
                        }
                        .tint(.yellow) // ใช้เพื่อกำหนดสีของรายการ
                    }
            }
//            .onDelete(perform: delete)
        }
    }
}

#Preview {
    ListSwipeActionBootcamp()
}
