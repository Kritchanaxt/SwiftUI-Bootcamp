//
//  IfLetGuardBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//

//if let
/*
 
- ใช้เมื่อคุณต้องการดึงค่า Optional และทำงานกับมันในขอบเขตของการทำงานเดียวกัน
- ใช้เมื่อคุณต้องการทำงานกับค่า Optional แต่ไม่จำเป็นต้องเลือกการออกจากฟังก์ชันหรือการโยกย้ายการควบคุม
- เหมาะสำหรับการดำเนินการที่ต้องการดึงค่า Optional และใช้งานโดยไม่มีข้อจำกัดหรือเงื่อนไขในการทำงาน
 
*/

// Guard
/*
 
- ใช้เมื่อคุณต้องการทำงานกับค่า Optional และมีขั้นตอนที่จะทำต่อเมื่อค่าเป็น nil
- ใช้เพื่อกำจัดการข้อผิดพลาดที่ไม่คาดคิดในระหว่างการทำงาน
- มักจะมีการใช้ return, throw, หรือ continue เพื่อออกจากการทำงานทันทีเมื่อเงื่อนไขไม่เป็นจริง
 
 */

// ProgressView()
/* 
 
 - ใช้สร้างวิว (View) ที่แสดงแถบความคืบหน้า (progress bar)
 - ใช้เพื่อแสดงการดำเนินการหรือการโหลดข้อมูล
 - โดยทั่วไปจะปรากฏเป็นวงกลมหมุนแสดงให้เห็นว่ามีการดำเนินการอยู่ในขณะนั้น
  
 */

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserID: String? = "WAVE" // nil
    @State var displaytext: String? = "Downloading" // nil
    @State var isLoading: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Here we are practicing safe coding!")
                
                if let text = displaytext {
                    Text(text)
                        .font(.title)
                }
                // DO NOT USER ! EVER !!!!
                // DO NOT FORCE UNWRAP VALUES
//                Text(displaytext)
//                    .font(.title)
                
                if isLoading {
                    ProgressView()
                }
                
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    func loadData() {
        if let userID = currentUserID { // ทำงานเมื่อ optionalValue มีค่า
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displaytext = "This is the new data! User id is: \(userID)"
                isLoading = false
            }
        } else {  // ทำงานเมื่อ optionalValue เป็น nil
            displaytext = "Error. There is no User ID!"
        }
    }
    
    func loadData2() {
        guard let userID = currentUserID else { // ทำงานเมื่อ optionalValue เป็น nil
            displaytext = "Error. There is no User ID!"
            return // หรือใช้ break, continue ตามที่เหมาะสม
        }
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // เรียกใช้งานหลังจากผ่านไป 3 วินาทีจากเวลาปัจจุบัน
            displaytext = "This is the new data! User id is: \(userID)"
            isLoading = false
        }
    }
}

#Preview {
    IfLetGuardBootcamp()
}
