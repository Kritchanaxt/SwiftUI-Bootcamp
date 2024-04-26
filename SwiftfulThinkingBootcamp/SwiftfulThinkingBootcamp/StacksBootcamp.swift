//
//  StacksBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 8/4/2567 BE.
//

// Stacks: ใช้สำหรับจัดวางองค์ประกอบ UIโดยมี VStack สำหรับจัดวางแนวตั้งและ HStack สำหรับจัดวางแนวนอน

// LazyHStack: เป็น container view ที่ใช้เรียงลำดับองค์ประกอบภายในในแนวนอน และจะโหลดองค์ประกอบเมื่อจำเป็นเท่านั้น ซึ่งเหมาะสำหรับการแสดงข้อมูลจำนวนมาก


import SwiftUI

struct StacksBootcamp: View {
    
    // Vstacks -> Vertical
    // Hstacks -> Horizontal
    // Zstacks -> zIndex(back tp front)
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0, content: ({
            Rectangle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
            
            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
        }))
        ZStack(alignment: .top){
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 500, alignment: .center)
            
            VStack(alignment: .leading, spacing: 30) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)
                
                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.purple)
                        .frame(width: 50, height: 50)
                    
                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)
                    
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                }
                .background(Color.white)
            }
            .background(Color.black)
        }
    }
//        HStack(alignment: .center) {
//            Text("5")
//                .font(.largeTitle)
//                .underline()
//            
//            Text("Items in your cart")
//                .font(.caption)
//                .foregroundColor(.blue)
//        }
        
//        VStack(spacing: 50) {
//            
//            ZStack {
//                Circle()
//                    .frame(width: 100, height: 100)
//                
//                Text("1")
//                    .font(.title)
//                    .foregroundColor(.white)
//            }
//            
//            Text("1")
//                .font(.title)
//                .foregroundColor(.white)
//                .background(
//                    Circle()
//                        .frame(width: 100, height: 100)
//                )
//        }
}
    
    struct StacksBootcamp_Previews: PreviewProvider {
        static var previews: some View {
            StacksBootcamp()
        }
    }


