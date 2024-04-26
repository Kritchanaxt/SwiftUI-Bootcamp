//
//  DatePickerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 16/4/2567 BE.
//

// CompactDatePickerStyle() ใช้เพื่อแสดงตัวเลือกวันที่ในรูปแบบที่มีขนาดเล็กและเข้ากันได้กับพื้นที่ที่จำกัด โดยมีการเลือกวันที่ผ่านการแสดงคีย์บอร์ดตัวเลือกที่เกี่ยวข้อง ซึ่งเหมาะสำหรับการใช้งานบนอุปกรณ์ที่มีขนาดจอเล็กหรือการแสดงในพื้นที่ที่มีขนาดจำกัด เช่น แถวหัวข้อขนาดเล็กหรือเมนูตัวเลือก

// GraphicalDatePickerStyle() ใช้เพื่อแสดงตัวเลือกวันที่ในรูปแบบกราฟิก ซึ่งให้ผู้ใช้เลือกวันที่โดยการแตะหรือคลิกเมาส์เพื่อเลื่อนเพื่อเลือก มันเหมาะสำหรับการใช้งานบนอุปกรณ์ที่มีพื้นที่หรือการแสดงผลที่มีขนาดใหญ่

// WheelDatePickerStyle() ใช้เพื่อแสดงตัวเลือกวันที่ในรูปแบบของล้อ ซึ่งผู้ใช้สามารถเลื่อนล้อเพื่อเลือกวันที่ที่ต้องการได้ มันมักจะใช้กับอุปกรณ์ที่มีหน้าจอขนาดใหญ่

// DateComponents: ใช้สำหรับสร้างหรือแยกส่วนของวันที่และเวลา เช่น วันที่, เดือน, ปี, ชั่วโมง, นาที, วินาที เป็นต้น

// Calendar.current.date: ใช้สำหรับดึงวันที่และเวลาปัจจุบันตามเวลาปัจจุบันของอุปกรณ์

// DateFormatter: ใช้สำหรับแปลงวันที่และเวลาจาก Date เป็น String หรือจาก String เป็น Date  โดยกำหนดรูปแบบที่ต้องการ คุณสามารถกำหนดรูปแบบวันที่และเวลาด้วยตัวเองหรือใช้รูปแบบที่กำหนดไว้ล่วงหน้า เช่น .short, .medium, .long, .full ซึ่งจะถูกปรับใช้ตามภาษาและการตั้งค่าภาษาในอุปกรณ์.

// dateStyle: ใช้ในการกำหนดรูปแบบของวันที่และเวลาเมื่อแปลง Date เป็น String โดยสามารถกำหนดให้เป็นรูปแบบที่ต้องการ เช่น .short, .medium, .long, .full ซึ่งจะกำหนดรูปแบบของวันที่และเวลาตามที่คุณต้องการแสดงในข้อความ

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State var selectDate: Date = Date()
    let startingDate: Date = Calendar.current.date(
        from: DateComponents(year: 2018)) ?? Date()
    
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .long
        return formatter
    }
    
    var body: some View {
        VStack {
            Text("SELECTED DATE IS:")
                .font(.headline)
            Text(dateFormatter.string(from: selectDate))
                .font(.title2)
//            DatePicker("Selet a Date", selection: $selectDate)
//            DatePicker("Select a date", selection: $selectDate, displayedComponents: [.date, .hourAndMinute])
            DatePicker(
                "\t Select a Date",
                selection: $selectDate,
                in: startingDate...endingDate,
                displayedComponents: [.date])
                .accentColor(Color.red)
                .datePickerStyle(
                    CompactDatePickerStyle()
    //                GraphicalDatePickerStyle()
    //                WheelDatePickerStyle()
            )
        }
    }
}

#Preview {
    DatePickerBootcamp()
}
