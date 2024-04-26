//
//  TextBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

// alignment: ใช้กำหนดการจัดวาง view ภายใน container ว่าจะจัดวางอย่างไร

import SwiftUI

struct TextBootcamp: View {
    var body: some View {
        Text("Hello, World! This is the Swiftful thinking Bootcamp. I am really enjoying this coures and learning alot." .lowercased())
           // .uppercased
           // .lowercased
           // .capitalized
           // .font(.title)
           // .fontWeight(.semibold)
           // .bold()
           .underline(true, color: Color.red)
           .italic() // ฟอนต์
           .strikethrough(true, color: Color.green)
           .font(.system(size: 24, weight: .semibold, design: .serif ))
            //.baselineOffset(50.0) //ระยะห่างบรรทัด
            //.kerning(10) //ระยะห่างตัวอักษร
            .multilineTextAlignment(.center)
            .foregroundColor(.blue)
            .frame(width: 300, height: 200, alignment: .leading)
    }
}

#Preview {
    TextBootcamp()
}
