//
//  SpacerBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 8/4/2567 BE.
//

// Spacer ใช้ในการจัดวางเพื่อสร้างพื้นที่ว่างใน layout โดยมันจะรับพื้นที่ที่ว่างทั้งหมดที่เหลืออยู่ใน container view และจะทำให้ views อื่นๆ ภายใน container ปรับตำแหน่งตามพื้นที่ว่างนั้นๆ ซึ่งช่วยในการจัดวางและการแสดงผลขององค์ประกอบ UI

import SwiftUI

struct SpacerBootcamp: View {
    var body: some View {
                HStack(spacing: 0){
                    Spacer(minLength: 0)
                        .frame(height: 10)
                        .background(Color.orange)
        
                    Rectangle()
                        .frame(width: 50, height: 50)
        
                    Spacer()
                        .frame(height: 10)
                        .background(Color.orange)
        
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
        
                    Spacer()
                        .frame(height: 10)
                        .background(Color.orange)
        
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 50, height: 50)
        
                    Spacer(minLength: 0)
                        .frame(height: 10)
                        .background(Color.orange)
                }
                .background(Color.yellow)
                .padding(.horizontal, 10)
                .background(Color.blue)
            }
    
        }

#Preview {
    SpacerBootcamp()
}

//        VStack {
//            HStack(spacing: 0){
//                Image(systemName: "xmark")
//                Spacer()
//                    .frame(height: 10)
//                    .background(Color.orange)
//                
//                Image(systemName: "gear")
//            }
//            .font(.title)
//            .padding(.horizontal)
//            
//            Spacer()
//                .frame(width: 10)
//                .background(Color.orange)
//            
//            Rectangle()
//                .frame(height: 55)
//        }
//    }
//    
//    struct SpacerBootcamp_Previews: PreviewProvider {
//        static var previews: some View {
//            SpacerBootcamp()
//        }
//    }
//}
