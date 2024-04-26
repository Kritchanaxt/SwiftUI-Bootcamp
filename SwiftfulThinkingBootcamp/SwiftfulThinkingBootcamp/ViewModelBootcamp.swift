//
//  ViewModelBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 22/4/2567 BE.
//

/*
  
 MARK: @ObservedObject
 - ใช้เพื่อเชื่อมต่อ View กับอ็อบเจกต์ ObservableObject
 เพื่อติดตามการเปลี่ยนแปลงของข้อมูลภายในอ็อบเจกต์
 
 MARK: @StateObject
 ใช้เพื่อสร้างอ็อบเจกต์ ObservableObject และใช้ใน View 
 โดยอ็อบเจกต์นี้จะถูกเก็บไว้และสร้างเพียงครั้งเดียวเมื่อ View ถูกสร้างขึ้น
 
 */

import SwiftUI

// MARK: Model
struct FruitModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let count: Int
}

// MARK: ViewModel
class FruitViewModel: ObservableObject {
    
    @Published var fruitArray: [FruitModel] = [] // ข้อมูลของผลไม้
    @Published var isLoading: Bool = false // สถานะการโหลดข้อมูล
    
    init() {
        getFruits() // เมื่อสร้าง ViewModel ให้ดึงข้อมูลผลไม้
    }
    
    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)
        
        isLoading = true // เริ่มต้นโหลดข้อมูล
        
        // จำลองการโหลดข้อมูลด้วยการหน่วงเวลา
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false // สิ้นสุดการโหลดข้อมูล
        }
    }
    
    // ลบผลไม้
    func deleteFruit(index: IndexSet){
        fruitArray.remove(atOffsets: index)
    }
    
}

// MARK: VIEW
struct ViewModelBootcamp: View {
    
    // @StateObject -> USE THIS ON CREATION / INIT
    // @ObservedObject -> USE THIS FOR SUBVIEWS
    
    // ViewModel สำหรับผลไม้
    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()
    
    var body: some View {
        NavigationView {
            List {
                
                // แสดง ProgressView ขณะโหลดข้อมูล
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    // แสดงรายการของผลไม้
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit) // ให้สามารถลบผลไม้ได้
                }
             }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit List")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: RandomScreen(fruitViewModel: fruitViewModel),
                                        label: {
                                            Image(systemName: "arrow.right")
                                                .font(.headline )
                                        })
            )
//            .onAppear {
//                fruitViewModel.getFruits() // เมื่อแสดงหน้าจอให้ดึงข้อมูลผลไม้
//            }
        }
    }
}

// MARK: RANDOMSCREEN
struct RandomScreen: View {

    @Environment(\.presentationMode) var presentationMode
    
    // การใช้ @ObservedObject เพื่อติดตามการเปลี่ยนแปลงในอ็อบเจกต์
    @ObservedObject var fruitViewModel: FruitViewModel

    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                        .foregroundColor(.white)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    ViewModelBootcamp()
//    RandomScreen()
}
