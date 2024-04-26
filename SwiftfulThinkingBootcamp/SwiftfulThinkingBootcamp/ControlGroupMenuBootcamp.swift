//
//  ControlGroupMenuBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 26/4/2567 BE.
//

/* 
 
 MARK: ControlGroup:
 - เป็นตัวควบคุมที่ช่วยในการจัดกลุ่มองค์ประกอบที่เกี่ยวข้องกันช่วยลดการซ้ำซ้อนในการเขียนโค้ดและ
 ทำให้โค้ดมีความสะดวกต่อการอ่านและแก้ไข
 
*/

import SwiftUI

struct ControlGroupMenuBootcamp: View {
    var body: some View {
        Menu("My Menu") {
            ControlGroup {
                Button("Uno") {
                    
                }
                Button("Dos") {
                    
                }
//                Button("Tres") {
//
//                }
                Menu("How are you?") {
                    Button("Good") {
                        
                    }
                    Button("Bad") {
                        
                    }
                }
            }
            Button("Two") {
                
            }
            Menu("Three") {
                Button("Hi") {
                    
                }
                Button("Hello") {
                    
                }
            }
        }
    }
}

#Preview {
    ControlGroupMenuBootcamp()
}
