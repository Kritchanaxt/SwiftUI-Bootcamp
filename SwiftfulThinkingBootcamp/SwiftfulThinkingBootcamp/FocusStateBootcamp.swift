//
//  FocusStateBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// FocusStateซ ช่วยในการจัดการสถานะของฟิลด์ และทำให้สามารถเข้าถึงฟิลด์ที่ได้โดยตรง ช่วยลดความซับซ้อนในการจัดการการโฟกัสขององค์ประกอบ

// Hashable: ใช้ในการเปรียบเทียบและแยกแยะวัตถุตามคุณสมบัติ ซึ่งมีเมธอดสำคัญคือ `hashValue` ที่ใช้ในการคำนวณค่าแฮช เพื่อระบุการแยกแยะวัตถุ สรุปคือ Hashable ช่วยให้เราสามารถเปรียบเทียบและจัดเรียงวัตถุได้อย่างมีประสิทธิภาพ

/*
 
let usernameIsValid = !username.isEmpty
let passwordIsValid = !password.isEmpty

- การตรวจสอบว่า `username` และ `password` โดยใช้ฟังก์ชัน isEmpty ใช้เพื่อตรวจสอบว่า(String)
 ว่างหรือไม่ ถ้าว่างจะคืนค่า true แต่ถ้าไม่ว่างจะคืนค่า false ดังนั้นการใช้ `!` หน้า isEmpty
 - จะทำให้ค่าที่ได้เป็น true เมื่อ `username` และ `password` ไม่ว่าง และ false
 - เมื่อมีการป้อนข้อมูลเข้าไปในทั้งสองช่องของ TextField ในกรณีที่มีการป้อนข้อมูลเข้ามาแล้วในทั้ง
 `username` และ `password` ให้ค่า true และในทางกลับกันจะคืนค่า false ถ้ามีบางค่าที่ว่าง
 
*/

import SwiftUI

struct FocusStateBootcamp: View {
    
    enum OnboardingFields: Hashable {
        case username
        case password
    }
    
//    @FocusState private var usernameInFocus: Bool
    @State private var username: String = ""
    
//    @FocusState private var passwordInFocus: Bool
    @State private var password: String = ""
    
    @FocusState private var fieldInFocus: OnboardingFields?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Add your name here...", text: $username)
                .focused($fieldInFocus, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            TextField("Add your password here...", text: $password)
                .focused($fieldInFocus, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)
            
            Button("SIGN UP 🚀") {
                // ตรวจสอบว่าชื่อผู้ใช้และรหัสผ่านไม่ว่าง
                let usernameIsValid = !username.isEmpty
                let passwordIsValid = !password.isEmpty
                
                if usernameIsValid && passwordIsValid {
                    print("SIGN UP")
                } else if usernameIsValid {
                    // ถ้าชื่อผู้ใช้ถูกต้อง แต่รหัสผ่านไม่ถูกต้อง ให้เลื่อนโฟกัสไปที่ TextField รหัสผ่าน
                    fieldInFocus = .password
//                    usernameInFocus = false
//                    passwordInFocus = true
                } else {
                    // ถ้าชื่อผู้ใช้ไม่ถูกต้อง ให้เลื่อนโฟกัสไปที่ TextField ชื่อผู้ใช้
                    fieldInFocus = .username
//                    usernameInFocus = true
//                    passwordInFocus = false
                }
            }
            
//            Button("TOGGLE FOCUS STATE") {
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.usernameInFocus = true
//            }
//        }
    }
}

#Preview {
    FocusStateBootcamp()
}
