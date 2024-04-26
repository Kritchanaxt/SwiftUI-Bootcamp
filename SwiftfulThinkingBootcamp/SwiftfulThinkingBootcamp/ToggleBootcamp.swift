//
//  ToggleBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 16/4/2567 BE.
//

//Toggle ใช้เพื่อสร้างองค์ประกอบที่ใช้ในการเปิดหรือปิดสถานะ โดยมักใช้ในการเปิดหรือปิดค่าบางอย่าง เช่น การเปิดหรือปิดสถานะของการเปิด/ปิดไฟ หรือการเปิด/ปิดโหมดที่มีค่าสองสถานะ


import SwiftUI

struct ToggleBootcamp: View {
    
    @State var toggleIsOn: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                Text("statis:")
                Text(toggleIsOn ? "Online" : "Offline")
            }
            .font(.title)
            
            Toggle(
                isOn: $toggleIsOn,
                label: {
                Text("Label")
            })
            .toggleStyle(SwitchToggleStyle(tint: Color.purple))
            
            Spacer()
        }
        .padding(.horizontal, 100)
    }
}

#Preview {
    ToggleBootcamp()
}
