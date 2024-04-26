//
//  ListBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 14/4/2567 BE.
//

// indices ใช้เพื่อเข้าถึงตำแหน่งของแต่ละสมาชิกในคอลเลคชันใน SwiftUI โดยใช้ค่าตำแหน่งในการดำเนินการอื่น ๆ ในการทำซ้ำ

//การใช้ indices ใน SwiftUI ช่วยให้เราสามารถเข้าถึงตำแหน่งของแต่ละสมาชิกในคอลเลคชันเพื่อใช้ในการดำเนินการต่าง ๆ ภายในการทำซ้ำ เช่น ลบหรือแก้ไขข้อมูล

// .padding(.vertical) ใช้เพื่อกำหนดการเติมช่องว่างให้กับวิวในทิศทางดิ่ง (vertical) เท่านั้น ซึ่งหมายความว่าจะมีการเพิ่มช่องว่างด้านบนและด้านล่างของวิวเท่านั้น เราสามารถกำหนดระยะห่างให้กับสมาชิกของวิวได้ในทิศทางดิ่งเพียงอย่างเดียวในแต่ละด้านของวิวที่เรากำหนด

// IndexSet เป็นชนิดข้อมูลใน Swift ที่ใช้เก็บชุดของดัชนี (index) ที่ไม่ซ้ำกันของคอลเลกชันข้อมูล เช่น อาร์เรย์หรือลิสต์ โดยมักจะใช้ในการระบุตำแหน่งของข้อมูลที่จะดำเนินการ เช่น การลบหรือเลื่อนข้อมูล มักใช้งานร่วมกับการจัดการกับข้อมูลที่เป็นลำดับ และในการระบุว่าข้อมูลอยู่ในที่นั้นหรือไม่

/*
 
 .listStyle(InsetGroupedListStyle()) ใช้เป็น modifier เพื่อกำหนดลักษณะการแสดงรายการใน
 List โดยให้มีลักษณะเหมือนกับรายการที่แสดงในแอปพลิเคชันที่มีกลุ่มย่อย (subgroups)
 และมีการเย็บรวมกันเป็นกลุ่มหลัก (group)

 การใช้ .listStyle(InsetGroupedListStyle()) จะทำให้รายการใน List
 มีการแบ่งกลุ่มและมีการจัดรูปแบบเส้นของเส้นขอบ
 
*/


import SwiftUI

struct ListBootcamp: View {
    
    @State var fruits: [String] = [
        "apple", "orange", "banana", "peach"
    ]
    
    @State var veggies: [String] = [
        "tomato", "potato", "carrot"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(
                    header: 
                        HStack {
                            Text("Fruits")
                            Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.orange)
                ) {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.vertical)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.mint)
                }
                
                Section(header: 
                            Text("Veggies")
                               .foregroundColor(.purple)
                ) {
                    ForEach(veggies, id: \.self) { veggies in
                        Text(veggies.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .listStyle(SidebarListStyle())             .navigationTitle("Grocery List")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
        }
        .accentColor(.red)
    }
    
    var addButton: some View {
        Button("Add", action: {
            add()
        })
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func add() {
        fruits.append("Coconut")
    }
}

#Preview {
    ListBootcamp()
}
