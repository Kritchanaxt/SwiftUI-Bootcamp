//
//  NavigationStackBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

// NavigationView ใช้ในการแสดงหน้าต่าง
// NavigationLink ใช้ในการนำทางไปยังหน้าต่างที่ต้องการไปยังใน NavigationView

import SwiftUI

struct NavigationStackBootcamp: View {
    
    let fruits = ["Apple", "Orange", "Banana"]
    
    @State private var stackPath: [String] = []
    
    var body: some View {
        
        // NavigationStack ใช้เพื่อจัดการเส้นทาง โดย path ถูกผูกกับ @State private var stackPath
        NavigationStack(path: $stackPath) {
            ScrollView {
                VStack(spacing: 40) {
                    
                    // เมื่อคลิกปุ่ม "Super segue!" เส้นทางใหม่จะถูกเพิ่มลงใน stackPath โดยเพิ่ม "Coconut", "Watermelon", และ "Mango"
                    Button("Super segue!") {
                        stackPath.append(contentsOf: [
                            "Coconut", "Watermelon", "Mango"
                        ])
                    }
                    
                    ForEach(fruits, id: \.self) { fruit in 
                        // กำหนดการแสดง NavigationLink สำหรับผลไม้แต่ละชนิด
                        
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }
                    
                    ForEach(0..<5) { x in
                        // กำหนดการแสดง NavigationLink สำหรับตัวเลข โดยใช้ Text เป็นเนื้อหา
                        
                        NavigationLink(value: x) {
                            Text("Click me \(x)")
                        }
//                        
//                        NavigationLink(destination: {
//                            MySecondScreen(value: x)
//                        }, label: {
//                            Text("Click me \(x)")
//                        })
                    }
                }
            }
            .navigationTitle("Nav Bootcamp")
            .navigationDestination(for: Int.self) { value in //  กำหนดหน้าปลายทางสำหรับชนิดข้อมูล Int
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in //กำหนดหน้าปลายทางสำหรับชนิดข้อมูล String
                Text("ANOTHER SCREEN: \(value)")
            }
        }
    }
}

struct MySecondScreen: View {
    
    let value: Int
    
    // ใช้สำหรับกำหนดค่าให้กับตัวแปร value โดยรับค่าจำนวนเต็ม Int เข้ามา และกำหนดค่าให้กับ self.value ตามที่รับมา นอกจากนี้ฟังก์ชันยังมีคำสั่ง print เพื่อแสดงค่า value ที่ได้รับในหน้าจอ
    init(value: Int) {
        self.value = value
        print("INIT SCREEN: \(value )")
    }
    
    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavigationStackBootcamp()
}
