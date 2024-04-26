//
//  ProfileView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 23/4/2567 BE.
//

import SwiftUI

struct ProfileView: View {
    
    // ใช้ @AppStorage เพื่อบันทึกค่าใน UserDefaults โดยอัตโนมัติ
    @AppStorage("name") var currentUserName: String? // ชื่อของผู้ใช้ปัจจุบัน
    @AppStorage("age") var currentUserAge: Int? // อายุของผู้ใช้ปัจจุบัน
    @AppStorage("gender") var currentUserGender: String? // เพศของผู้ใช้ปัจจุบัน
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    // สถานะการลงชื่อเข้าใช้ของผู้ใช้ปัจจุบัน (เริ่มต้นเป็น false และเปลี่ยนเป็น true เมื่อผู้ใช้ลงชื่อเข้าใช้)
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .resizable() // ทำให้ขนาดใหญ่
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            // แสดงชื่อผู้ใช้ หรือข้อความ "Your name here" หากไม่มีชื่อ
            Text(currentUserName ?? "Your name here")
            
            // แสดงอายุของผู้ใช้ หรือข้อความ "0 years old" หากไม่มีข้อมูล
            Text("This user is \(currentUserAge ?? 0) years old!")
            
            // แสดงเพศของผู้ใช้ หรือข้อความ "unknown" หากไม่มีข้อมูล
            Text("Their gender is \(currentUserGender ?? "unknown")")
            
            // ปุ่ม "SIGN OUT" สำหรับออกจากระบบ
            Text("SIGN OUT")
                .foregroundColor(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .onTapGesture {
                    signOut()
                }
        }
        .font(.title)
        .foregroundColor(.purple)
        .padding() // เพิ่มช่องว่างรอบขอบ
        .padding(.vertical, 40) // เพิ่มช่องว่างด้านบนและด้านล่าง
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
    
    func signOut() {
        currentUserName = nil // เคลียร์ค่า currentUserName
        currentUserAge = nil // เคลียร์ค่า currentUserAge
        currentUserGender = nil // เคลียร์ค่า currentUserGender
        withAnimation(.spring()) {
            currentUserSignedIn = false 
            // ตั้งค่า currentUserSignedIn เป็น false โดยใช้ animation แบบ spring
        }
    }

}

#Preview {
    ProfileView()
}
