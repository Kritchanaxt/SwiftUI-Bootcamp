//
//  ColorsBootCamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

// fill: ใช้กำหนดให้ view ที่ถูกวางใน container นั้นๆ แสดงความยาวหรือความกว้างเท่ากับพื้นที่ทั้งหมดของ container

// foregroundColor: ใช้กำหนดสีของเนื้อหาภายใน view

import SwiftUI

struct ColorsBootCamp: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .fill(
                // Color.purple
                // Color(#colorLiteral(red: 0, green:0.32, blue: 0.574, alpha: 1))
                // Color(UIColor.secondarySystemBackground)
                Color("CustomColor")
            )
            .frame(width: 300, height: 300)
            // .shadow(radius: 10)
            .shadow(color: Color("CustomColor").opacity(0.5), radius: 10, x: -20, y:-20)
    }
}

#Preview {
    ColorsBootCamp()
}
