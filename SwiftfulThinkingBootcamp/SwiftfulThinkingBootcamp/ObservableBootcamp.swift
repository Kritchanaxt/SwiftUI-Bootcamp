//
//  ObservableBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 26/4/2567 BE.
//

// MARK: Observable

/*
 
 MARK: @ObservableObject
 - ใช้ในการติดตามและแจ้งให้ View ทราบเมื่อมีการเปลี่ยนแปลงในค่าของอ็อบเจกต์ที่เป็น ObservableObject'
 - โดยมักใช้ @Published เพื่อระบุ property ที่ต้องการติดตามการเปลี่ยนแปลง
 - ส่วน @ObservedObject ใช้เพื่อเชื่อมโยงอ็อบเจกต์ ObservableObject กับ View เพื่อให้ View สามารถอัปเดต UI ตามข้อมูลในอ็อบเจกต์นั้นได้

 MARK: การใช้ @ObservableObject และ @ObservedObject
 - เหมาะสำหรับการจัดการข้อมูลและสถานะในแอปพลิเคชัน โดยอ็อบเจกต์ที่มีการใช้งานบ่อยๆ
 เช่น ViewModels, Models, หรือ Data Repositories
 - สามารถใช้ @ObservableObject และ `@ObservedObject` เพื่อให้ View สามารถแสดง UI
 ที่สอดคล้องกับข้อมูลและสถานะปัจจุบันของแอปพลิเคชันได้อย่างถูกต้อง
 
 */



// MARK: First

import SwiftUI

@Observable class ObservableViewModel {
    
    var title: String = "Some title"
}

struct ObservableBootcamp: View {
    
    @State private var viewModel = ObservableViewModel()
    
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            SomeChildView(viewModel: $viewModel)
            
            SomeThirdView()
        }
        .environment(viewModel)
    }
}

struct SomeChildView: View {
    
    @Binding var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "asdkkvlawdnv;odsv"
        }
    }
}

struct SomeThirdView: View {
    
    @Environment(ObservableViewModel.self) var viewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third view!!"
        }
    }
}

/* MARK: Second

import SwiftUI

    // แก้ @Observable เป็น ObservableObject
    class ObservableViewModel: ObservableObject {
    
    // ใส่ @Published เพื่อให้สามารถตรวจสอบการเปลี่ยนแปลงได้
    @Published var title: String = "Some title"
 
}

struct ObservableBootcamp: View {
    
    @StateObject private var viewModel = ObservableViewModel()
 
    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "new title!"
            }
            SomeChildView(viewModel: $viewModel)
            
            SomeThirdView()
        }
        .environmentObject(viewModel)
    }
}

struct SomeChildView: View {
    
    @Binding var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "asdkkvlawdnv;odsv"
        }
    }
}

struct SomeThirdView: View {
    
    @EnvironmentObject var viewModel: ObservableViewModel
    
    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third view!!"
        }
    }
}

*/

/*

MARK: 1. โค้ดแรก
 - ObservableViewModel ถูกประกาศด้วย @Observable ซึ่งไม่ถูกต้องใน Swift และ SwiftUI แทนที่ควรใช้ ObservableObject แทน
 - การกำหนด ObservableBootcamp ใช้ @State สำหรับ viewModel ซึ่งไม่ใช่วิธีที่ถูกต้องในกรณีที่เรามีอ็อบเจกต์ที่ถูกสร้างแบบ ObservableObject
 - การใช้ .environment() ในส่วนที่กำหนดภายใน VStack ซึ่งไม่ถูกต้องในการโยนอ็อบเจกต์เข้าไปเพื่อใช้เป็น environment
    
MARK: 2. ในโค้ดที่สอง
 - ObservableViewModel ถูกประกาศด้วย ObservableObject ซึ่งถูกต้อง
 - ObservableBootcamp ใช้ @StateObject สำหรับ viewModel ซึ่งเหมาะสมในกรณีที่มีอ็อบเจกต์ที่เป็น ObservableObject
 - ใช้ .environmentObject() เพื่อใส่ viewModel เป็น environment object ซึ่งถูกต้องในการส่งอ็อบเจกต์ไปยังอ็อบเจกต์อื่นผ่าน environment

 MARK: ดังนั้นโค้ดที่สองถูกต้องและถูกนำมาปรับให้ถูกต้องตามหลักของ SwiftUI
 
 */



#Preview {
    ObservableBootcamp()
}
