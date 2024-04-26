//
//  GridBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

// Grid: ใช้สำหรับจัดวางองค์ประกอบ UI ในรูปแบบของตารางหรือเมทริกซ์

import SwiftUI

struct GridBootcamp: View {
    
    let columns: [GridItem] = [
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(100), spacing: nil, alignment: nil),
//        GridItem(.fixed(75), spacing: nil, alignment: nil),
//        GridItem(.fixed(50), spacing: nil, alignment: nil),
        
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
        GridItem(.flexible(), spacing: 0, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),
//        GridItem(.flexible(), spacing: nil, alignment: nil),

//        GridItem(.adaptive(minimum: 10, maximum: 300), spacing: nil, alignment: nil),
//        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: 400)
            
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {
                          Section(header:
                                       Text("Section 1")
                                       .foregroundColor(.white)
                                       .font(.title)
                                       .frame(maxWidth: .infinity, alignment: .leading)
                                       .background(Color.blue)
                                       .padding()
                           ) {
                               ForEach(0..<20) { index in
                                  Rectangle()
                                     .frame(height: 150)
                              }
                           }
                   
                           Section(header:
                                         Text("Section 2")
                                         .foregroundColor(.white)
                                         .font(.title)
                                         .frame(maxWidth: .infinity, alignment: .leading)
                                         .background(Color.red)
                                         .padding()
                           ) {
                               ForEach(0..<20) { index in
                                   Rectangle()
                                       .fill(Color.green)
                                       .frame(height: 150)
                               }
                           }
            })
        }
    }
}

#Preview {
    GridBootcamp()
}
