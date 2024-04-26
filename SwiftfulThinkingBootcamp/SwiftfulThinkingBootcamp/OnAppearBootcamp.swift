//
//  OnAppearBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//

// onAppear ใช้ในการเรียกใช้การกระทำเมื่อวิวปรากฏบนหน้าจอ การใช้งาน modifier นี้มักจะใช้ในการดึงข้อมูล การเริ่มต้น หรือการอัปเดตเมื่อวิวเป็นที่มองเห็นของผู้ใช้

import SwiftUI

struct OnAppearBootcamp: View {
    
    @State var myText: String = "Start text."
    @State var count: Int = 0
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(myText)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    myText = "This is the new text!"
                }
            })
            .onDisappear(perform: {
                myText = "Ending text."
            })
            .navigationTitle("On Appear: \(count)")
        }
    }
}

#Preview {
    OnAppearBootcamp()
}
