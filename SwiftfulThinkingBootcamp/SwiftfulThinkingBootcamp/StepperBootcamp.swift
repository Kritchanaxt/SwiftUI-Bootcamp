//
//  StepperBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 17/4/2567 BE.
//

// Stepper เป็นอีกหนึ่งองค์ประกอบใน SwiftUI ที่ช่วยให้ผู้ใช้สามารถเพิ่มหรือลดค่าตัวเลขได้อย่างง่ายดาย

// CGFloat คือชนิดข้อมูลใน Swift ที่ใช้เก็บค่าทศนิยมแบบ floating-point ซึ่งใช้ในการระบุค่าที่มีเลขทศนิยม เช่น ความกว้างหรือความสูงของ View 

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    
    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 100 + widthIncrement, height: 100)
            
            Stepper("Stepper 2") {
                // increment
                widthIncrement += 10
            } onDecrement: {
                // derement
                widthIncrement -= 10
            }
        }
    }
    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

#Preview {
    StepperBootcamp()
}
