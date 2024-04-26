//
//  SubmitTextFieldBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// Text: ใช้แสดงข้อความหรือข้อมูลบนอินเทอร์เฟซ

// print: ใช้สำหรับแสดงข้อความหรือข้อมูลใน Console ของ Xcode เพื่อใช้ในการตรวจสอบการทำงานและดูข้อมูลการทำงานของโปรแกรม

// SubmitTextField: ช่วยในการจัดการการยืนยันข้อมูลที่ผู้ใช้ป้อนใน TextField หรือ Form โดยเมื่อผู้ใช้กดปุ่ม Enter หรือ Done บนคีย์บอร์ด จะเรียกใช้ฟังก์ชันหรือการดำเนินการที่กำหนดเพื่อจัดการข้อมูลที่ผู้ใช้ป้อนและยืนยันไว้


import SwiftUI

struct SubmitTextFieldBootcamp: View {
    
    @State private var text: String = ""
    
    var body: some View {
        TextField("Placeholder...", text: $text)
            .submitLabel(.route)
            .onSubmit {
                print("Something to thr console!")
            }
        TextField("Placeholder...", text: $text)
            .submitLabel(.next)
            .onSubmit {
                print("Something to thr console!")
            }
        TextField("Placeholder...", text: $text)
            .submitLabel(.search)
            .onSubmit {
                print("Something to the console!")
            }
    }
}

#Preview {
    SubmitTextFieldBootcamp()
}
