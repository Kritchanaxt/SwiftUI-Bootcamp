//
//  SheetsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 13/4/2567 BE.
//

// @Environment คือ property wrapper ที่ใช้ในการเข้าถึงค่าที่อยู่ใน environment ของ view โดยตรง เช่น ขนาดและสีของ หรือการตั้งค่าการแสดงผลของอุปกรณ์ที่ใช้งาน (เช่น โหมดไฟฉุกเฉิน)

// .sheet ใช้สำหรับแสดง modal view หรือ view ที่ปรากฏขึ้นเหนือ view ที่กำลังแสดงอยู่ โดยใช้เมื่อต้องการแสดง view เพิ่มเติมในขณะที่ยังคงคง view หลักที่กำลังแสดงอยู่

// presentationMode เป็น environment value ที่ใช้ในการเข้าถึง presentation mode ของ view นั้น ๆ ซึ่งสามารถใช้ในการ dismiss view หรือ pop view controller ออกจาก navigation stack ได้

import SwiftUI

struct SheetsBootcamp: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                showSheet.toggle()
            }, label: {
                Text("Button")
                    .foregroundColor(.green)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            })
            .fullScreenCover(isPresented: $showSheet, content: {
                SecondScreen()
            })
            .sheet(isPresented: $showSheet, content: {
                SecondScreen()
            })
        }
    }
}

struct SecondScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)
            
            Button(action: {
                // การปิด modal หรือ sheet ที่เปิดอยู่
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

#Preview {
    SheetsBootcamp()
    // SecondScreen
}
