//
//  ScrollViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

// ScrollView: ใช้สำหรับการเลื่อนเนื้อหาของ view ที่มีขนาดใหญ่เกินกว่าจะแสดงบนหน้าจอ


import SwiftUI

struct ScrollViewBootcamp: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<10) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0..<5) { index in
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.red)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
    }
}

#Preview {
    ScrollViewBootcamp()
}
