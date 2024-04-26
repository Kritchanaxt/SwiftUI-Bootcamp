//
//  NavigationSplitViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 26/4/2567 BE.
//
 
/*
 MARK: NavigationSplitViewVisibility
 - ใช้กำหนดความสามารถในการแสดงแถบข้างใน NavigationSplitView
 .all = แสดงแถบข้างทั้งหมด
 .primary = แสดงแถบข้างหลักเท่านั้น
 .none = ไม่แสดงแถบข้างเลย
 
 MARK: NavigationSplitView 
 - ใช้เพื่อแสดงหน้าจอแบบแยกและเชื่อมโยงระหว่างหน้าจอหลัก หน้าจอย่อย และรายละเอียด

 MARK: .rawValue
 - ใช้เพื่อเข้าถึงค่า raw ของ enum ซึ่งเป็น String ในกรณีนี้
 
 MARK: .capitalized 
 - ใช้เพื่อทำให้ตัวอักษรแรกของ String เป็นตัวใหญ่
 
 MARK: $visibility
 - คือ Binding ที่ใช้ในการเก็บค่าของ property หรือ state และช่วยให้สามารถอัปเดตค่าของ state ได้


 */


import SwiftUI

// NavigationSplitView -> iPad, MacOS, VisionOS

struct NavigationSplitViewBootcamp: View {
    
    @State private var visibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: FoodCategory? = nil
    @State private var selectedFruit: Fruit? = nil

    var body: some View {
        
        // กำหนด NavigationSplitView โดยใช้ columnVisibility เป็นตัวแปรที่ผูกกับการประเมินประเภทการแสดงของคอลัมน์
        NavigationSplitView(columnVisibility: $visibility) {
            
            // สร้าง List ที่แสดงรายการของ FoodCategory และใช้ NavigationLink เพื่อเชื่อมโยงไปยังแต่ละหมวดอาหาร
            List(FoodCategory.allCases, id: \.rawValue, selection: $selectedCategory) { category in
                NavigationLink(category.rawValue.capitalized, value: category)
            }
            .navigationTitle("Categories")
        } content: {
            // แสดงรายการหมวดหมู่อาหารถูกเลือก
            if let selectedCategory {
                Group {
                    switch selectedCategory {
                    case .fruits:
                        
                        // สร้าง List ที่แสดงรายการของผลไม้และใช้ NavigationLink เพื่อเชื่อมโยงไปยังแต่ละชนิดของผลไม้
                        List(Fruit.allCases, id: \.rawValue, selection: $selectedFruit) { fruit in
                            NavigationLink(fruit.rawValue.capitalized, value: fruit)
                        }
                    case .vegetables:
                        EmptyView()  // ใช้เพื่อสร้างวิวที่ว่างเปล่า
                    case .meats:
                        EmptyView() // ใช้เพื่อสร้างวิวที่ว่างเปล่า
                    }
                }
                // กำหนด navigationTitle สำหรับแต่ละหน้าตามหมวดหมู่หรือผลไม้ที่ถูกเลือก
                .navigationTitle(selectedCategory.rawValue.capitalized)
            } else {
                Text("Select a category to begin!")
            }
        } detail: {
            // แสดงรายละเอียดของผลไม้ที่ถูกเลือก
            if let selectedFruit {
                Text("You selected: \(selectedFruit.rawValue)")
                    .font(.largeTitle)
                    .navigationTitle(selectedFruit.rawValue.capitalized)
            } else {
                Text("Select something!")
            }
        }
        // ใช้รูปแบบการแสดงผลแบบที่มีน้ำหนักที่ดีระหว่างส่วนหน้าจอหลักและรายละเอียด
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    NavigationSplitViewBootcamp()
}


// สร้าง Enumeration สำหรับหมวดหมู่อาหารและผลไม้
enum FoodCategory: String, CaseIterable {
    case fruits, vegetables, meats
}
enum Fruit: String, CaseIterable {
    case apple, banana, orange
}
