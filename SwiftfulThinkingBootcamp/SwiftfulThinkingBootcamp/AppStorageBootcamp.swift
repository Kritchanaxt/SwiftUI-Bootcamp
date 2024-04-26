//
//  AppStorageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 22/4/2567 BE.
//

// @AppStorage: ใช้เพื่อบันทึกค่าของคุณสมบัติไปยัง UserDefaults และอัปเดตค่านั้นๆ ในเวลาเดียวกับการเปลี่ยนแปลงที่เกิดขึ้น

// การใช้ @AppStorage ช่วยให้เราสามารถบันทึกและกู้คืนข้อมูลต่างๆ ได้อย่างสะดวก โดยไม่ต้องจัดการการเข้าถึง UserDefaults โดยตรงในแอปของเราเอง

import SwiftUI

struct AppStorageBootcamp: View {
    
    @AppStorage("name") var currentUserName: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currentUserName ?? "Add Name Here!")
            
            if let name = currentUserName {
                Text(name)
            }
            
            Button("Save" .uppercased()) {
                let name: String = "Emily"
                currentUserName = name
            }
        }
    }
}

#Preview {
    AppStorageBootcamp()
}
