//
//  ExtractedFunctionBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 11/4/2567 BE.
//

// Extracted Function คือการนำโค้ดที่ซ้ำซ้อนออกมาเป็นฟังก์ชันใหม่เพื่อลดความซ้ำซ้อนและเพิ่มความกระชับในโปรแกรมของเรา ช่วยให้โค้ดมีความสมบูรณ์และง่ายต่อการอ่านและบำรุงรักษาได้มากยิ่งขึ้น

import SwiftUI

struct ExtractedFunctionBootcamp: View {
    
    @State var backgroundColor: Color = Color.pink
    
    var body: some View {
        ZStack {
            // backgroud
            backgroundColor
                 .edgesIgnoringSafeArea(.all)
            
            // content
            contentLayer
        }
    }
    
    var contentLayer: some View {
        VStack {
            Text("Change color background")
                .font(.title)
                .foregroundColor(.white)
                        
            HStack(spacing: 20) {
                Button(action: {
                    buttonPressed()
                }, label: {
                    Text("YELLOW")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 2)

                })
                
                Button(action: {
                    buttonPressed2()
                }, label: {
                    Text("ORANGE")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                        .shadow(color: Color.black, radius: 2)
                })
            }
        }
    }
    
    func buttonPressed() {
        backgroundColor = .yellow
    }
        
    func buttonPressed2() {
        backgroundColor = .orange
    }
}

#Preview {
    ExtractedFunctionBootcamp()
}
