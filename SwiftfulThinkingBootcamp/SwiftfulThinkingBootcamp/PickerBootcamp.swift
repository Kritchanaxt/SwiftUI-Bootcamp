//
//  PickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 16/4/2567 BE.
//

// Picker ใช้เพื่อให้ผู้ใช้เลือกค่าจากตัวเลือกที่ให้มีอยู่หลายตัวเลือก โดย Picker สามารถใช้กับชนิดข้อมูลต่าง ๆ เช่น String, Int, หรือ Enum ได้

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "Most Recent"
    let filterOptions: [String] = [
        "Most Recent", "Most Poular", "Most Liked"
    ]
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor.red
        
        let attributes: [NSAttributedString.Key:Any] = [
            .foregroundColor : UIColor.white
        ]
        UISegmentedControl.appearance().setTitleTextAttributes(attributes, for: .selected)
    }
    
    
    var body: some View {
        
//        Picker(
//            selection: $selection,
//            label: Text("Picker"),
//            content: {
//                ForEach(filterOptions.indices) { index in
//                    Text(filterOptions[index])
//                        .tag(filterOptions[index])
//                }
//        })
//              .pickerStyle(SegmentedPickerStyle())
        
        Picker(
            selection: $selection,
            label:
                HStack {
                    Text("Filter:")
                    Text(selection)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
            ,
            content: {
                ForEach(filterOptions, id: \.self) { option in
                    HStack {
                        Text(option)
                        Image(systemName: "heart.fill")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 10)
                    .tag(option)
                }
            })
               .pickerStyle(MenuPickerStyle())
        
        
//        VStack {
//            HStack{
//                Text("Age:")
//                Text(selection)
//            }
//            
//            Picker(
//                selection: .constant(1),
//                label: Text("Picker"),
//                content: {
//                    ForEach(18..<100) { number in
//                        Text("\(number)")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .tag("\(number)")
//                    }
//            })
//            .pickerStyle(WheelPickerStyle())
//        }
    }
}

#Preview {
    PickerBootcamp()
}
