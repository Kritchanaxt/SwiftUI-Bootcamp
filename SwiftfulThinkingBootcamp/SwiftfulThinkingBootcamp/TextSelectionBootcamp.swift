//
//  TextSelectionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// textSelection เป็น modifier ที่ใช้กับ Text view เพื่อให้สามารถเลือกข้อความได้ เราสามารถสร้าง extension ของ Text view เพื่อเพิ่มฟังก์ชันการเลือกข้อความได้

import SwiftUI

struct TextSelectionBootcamp: View {
    var body: some View {
        Text("Hello, World!")
            .textSelection(.enabled)
    }
}

#Preview {
    TextSelectionBootcamp()
}
