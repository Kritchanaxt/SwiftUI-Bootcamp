//
//  NativePopoverBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

// Popover: เป็นการแสดงเนื้อหาหรือตัวเลือกเพิ่มเติมโดยไม่ต้องเปิดหน้าจอเต็มจอ โดยสามารถเรียกใช้จากสถานะปุ่มหรือตัวเลือกเพื่อแสดงข้อมูลเพิ่มเติมหรือปฏิสัมพันธ์

// .last ใช้เพื่อเข้าถึงสมาชิกสุดท้ายในอาร์เรย์หรือคอลเล็กชัน

import SwiftUI

struct NativePopoverBootcamp: View {
    
    // สถานะเพื่อควบคุมการแสดงหรือซ่อน popover
    @State private var showPopover: Bool = false
    
    // อาร์เรย์สำหรับเก็บตัวเลือกของความคิดเห็น
    @State private var feedbackOptions: [String] = [
        "Very good 😁", "Average ☺️", "Very bad  😡"
    ]
    
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
            
            VStack {
        
                Spacer()
                
                Button("CLICK ME") {
                    showPopover.toggle()
                }
                .padding(20)
                .background(Color.yellow)
                
                // เนื้อหาของ popover
                .popover(isPresented: $showPopover, attachmentAnchor: .point(.bottom), content: {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 12, content: {
                            
                            // แสดงตัวเลือกของความคิดเห็น
                            ForEach(feedbackOptions, id: \.self) { option in
                                Button(option) {
                                    
                                }
                                
                                // เพิ่มเส้นคั่นระหว่างตัวเลือก
                                if option != feedbackOptions.last {
                                    Divider() // ใช้สร้างเส้นคั่นระหว่างข้อมูล
                                }
                            }
                        })
                        .padding()
                    }
                    // ตั้งรูปแบบการนำเสนอเป็น popover
                    .presentationCompactAdaptation(.popover)
                })
            }
        }
    }
}

#Preview {
    NativePopoverBootcamp()
}
