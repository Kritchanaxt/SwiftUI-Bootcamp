//
//  GroupBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

/*
 MARK: Group
 
 1.ใช้เพื่อรวม Views หลาย ๆ อันเข้าด้วยกัน
 2.ใช้เพื่อรวม Modifier ที่ต้องการใช้กับ Views หลาย ๆ อัน
 3.ใช้ในการจัดการแสดงผลแบบเงื่อนไข

 */

import SwiftUI

struct GroupBootcamp: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, World!")
            
            Group {
                Text("Hello, World!")
                Text("Hello, World!")
            }
            .font(.largeTitle)
            .foregroundColor(.green)
        }
        .foregroundColor(.red)
        .font(.headline)
    }
}

#Preview {
    GroupBootcamp()
}
