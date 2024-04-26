//
//  ContentUnavailbleViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 26/4/2567 BE.
//

// MARK: ContentUnavailableView: ใช้เพื่อแสดงข้อความหรือ UI เมื่อข้อมูลไม่สามารถใช้งานได้หรือไม่มีอยู่

// MARK: #available: เป็นเงื่อนไขใน Swift ที่ช่วยให้คุณตรวจสอบเวอร์ชันของระบบปฏิบัติการก่อนที่จะดำเนินการต่อไป โดยช่วยให้คุณป้องกันการใช้งานคุณสมบัติในเวอร์ชันที่ไม่รองรับ และจัดการโค้ดให้เหมาะสมกับแต่ละเวอร์ชันของระบบปฏิบัติการได้อย่างยืดหยุ่น.

import SwiftUI

struct ContentUnavailbleViewBootcamp: View {
    var body: some View {
        if #available(iOS 17.0, *) {
//            ContentUnavailableView.search(text: "abc")
            ContentUnavailableView(
                "No Internet Connection",
                systemImage: "wifi.slash",
                description: Text("Please connect to the internet and try again try again."))
        } else {
//             FakeContentUnavailableView() เวอร์ชั่นเก่า
//             Fallback on earlier versions เวอร์ชั่นใหม่
            FallbackView()
        }
    }
}

struct FallbackView: View {
    var body: some View {
        Text("Content Unavailable")
    }
}

#Preview {
    ContentUnavailbleViewBootcamp()
}
