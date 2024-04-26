//
//  introView.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 23/4/2567 BE.
//

import SwiftUI

struct introView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            // background
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))]),
                center: .topLeading, // ตำแหน่งศูนย์กลางของแถบสีเริ่มต้น (บนซ้าย)
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height) // รัศมีของแถบสีสุดท้าย
                .ignoresSafeArea()
            
            if currentUserSignedIn { // ตรวจสอบว่าผู้ใช้ปัจจุบันได้ลงชื่อเข้าใช้หรือไม่
                ProfileView() // ถ้าลงชื่อเข้าใช้แล้ว แสดง ProfileView
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top))) // ใช้การเปลี่ยนแปลงแบบไม่สมมาตรเมื่อเพิ่มและลบ ProfileView
            } else { // ถ้ายังไม่ได้ลงชื่อเข้าใช้ แสดง OnboardingView
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom))) // ใช้การเปลี่ยนแปลงแบบไม่สมมาตรเมื่อเพิ่มและลบ OnboardingView
            }
            
        }
    }
}

#Preview {
    introView()
}
