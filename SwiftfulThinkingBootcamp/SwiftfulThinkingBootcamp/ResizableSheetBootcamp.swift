//
//  ResizableSheetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

/*
 MARK: .presentationDetents([.medium, .large]):
 กำหนดตำแหน่งหรือขนาดของการนำเสนอเป็น .medium
 และ .large ซึ่งเป็นขนาดที่ตั้งค่าไว้ล่วงหน้า
 
 MARK: .presentationDetents([.fraction(0.1), .medium, .large]):
 กำหนดขอบเขตของการนำเสนอเป็นสัดส่วนของหน้าจอ โดย .fraction(0.1) หมายถึง 10% 
 ของหน้าจอ .medium และ .large เป็นขนาดที่กำหนดไว้ล่วงหน้า
 
 MARK: .presentationDetents([.height(500)]):
 กำหนดขอบเขตของการนำเสนอเป็นความสูงที่แน่นอนคือ 500 พิกเซล
 
 MARK: .presentationDetents([.fraction(0.5), .medium, .large], selection: $detents):
 เพิ่มการเลือกของขอบเขตการนำเสนอโดยใช้ค่าที่ถูกเก็บไว้ในตัวแปร $detents ซึ่ง 
 .fraction(0.5) หมายถึง 50% ของหน้าจอ .medium และ .large
 เป็นขนาดที่กำหนดไว้ล่วงหน้า
 
 MARK: .interactiveDismissDisabled():
 ปิดการใช้งานการลากเพื่อปิดหน้าต่างหรือการถูกนำออกจากบริเวณโดยการแตะหรือเลื่อน
 เพื่อป้องกันการปิดหน้าต่างโดยไม่ตั้งใจ ย่อให้สั้นลง
 
 MARK: .presentationDragIndicator(.hidden):
 ซ่อนตัวบ่งชี้ลากที่ใช้เพื่อปิดหน้าต่างทำให้ไม่แสดงตัวบ่งชี้ลากในการนำเสนอ ย่อให้สั้นลง
 
 */

import SwiftUI

struct ResizableSheetBootcamp: View {
    
    @State private var showSheet: Bool = false
    @State private var detents: PresentationDetent = .large
    
    var body: some View {
        Button("Click me!") {
            showSheet.toggle()
        }
        .sheet(isPresented: $showSheet) {
            MyNextView(detents: $detents)
//                .presentationDetents([.medium, .large])
//                .presentationDetents([.fraction(0.1), .medium, .large])
//                .presentationDetents([.height(500)])
//                .presentationDetents([.fraction(0.5), .medium, .large], selection: $detents)
//                .interactiveDismissDisabled()
        }
//        .onAppear {
//            showSheet = true
//        }
    }
}

struct MyNextView: View {
    
    @Binding var detents: PresentationDetent
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Button("20%") {
                    detents = .fraction(0.2)
                }
                
                Button("MEDIUM") {
                    detents = .medium
                }
                
                Button("600 PX") {
                    detents = .height(600)
                }
                
                Button("LARGE") {
                    detents = .large
                }
            }
        }
        .presentationDetents([.fraction(0.2), .medium, .height(600), .large], selection: $detents)
        .presentationDragIndicator(.hidden)
    }
}

#Preview {
    ResizableSheetBootcamp()
}
