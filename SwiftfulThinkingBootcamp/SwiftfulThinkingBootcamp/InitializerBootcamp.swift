//
//  InitializerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 10/4/2567 BE.
//

// Initializer (ตัวกำหนดเริ่มต้น) เป็นเมท็อดพิเศษในคลาสหรือโครงสร้างใน Swift ที่ใช้สำหรับกำหนดค่าเริ่มต้นให้กับ properties โดยจะถูกเรียกใช้โดยอัตโนมัติเมื่อมีการสร้าง instance ของคลาสหรือโครงสร้างนั้นๆ

import SwiftUI

struct InitializerBootcamp: View {
    
    let backgroundColor: Color
    let count: Int
    let title: String
    
    init(count: Int, fruit: Fruit) {
        self.count = count
        
        if fruit == .apple {
            self.title = "Apples"
            self.backgroundColor = .red
        } else if fruit == .orange {
            self.title = "Oranges"
            self.backgroundColor = .orange
        } else {
            self.title = "Grapes"
            self.backgroundColor = .purple
        }
    }
    
    enum Fruit {
        case apple
        case orange
        case grape
    }
    
    var body: some View {
        VStack(spacing: nil){
            Text("\(count)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .underline()
            
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: 100, height: 100)
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

#Preview {
    HStack {
        InitializerBootcamp(count: 100, fruit: .apple)
        InitializerBootcamp(count: 46, fruit: .orange)
        InitializerBootcamp(count: 88, fruit: .grape)
    }
}
