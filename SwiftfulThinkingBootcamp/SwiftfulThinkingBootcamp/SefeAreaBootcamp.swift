//
//  SefeAreaBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

// edgesIgnoringSafeArea: ใช้กำหนดให้ view ไม่คำนึงถึง safe area บนหรือล่างของหน้าจอ

import SwiftUI

struct SefeAreaBootcamp: View {
    var body: some View {
        
        //        ZStack {
        //
        //            // background
        //            Color.blue
        //                .edgesIgnoringSafeArea(.all)
        //
        //            // forground
        //            VStack {
        //                Text("Hello, World!")
        //                    .padding(.top, 50)
        //                Spacer()
        //            }
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            //.background(Color.red)
        //        }
        
        ScrollView {
            VStack {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)
                }
            }
        }
//        .background(Color.blue)
        .background(
            Color.red
                .edgesIgnoringSafeArea(.all)
//                .ignoresSafeArea(edges: .top)
        )
        
        
    }
}

#Preview {
    SefeAreaBootcamp()
}
