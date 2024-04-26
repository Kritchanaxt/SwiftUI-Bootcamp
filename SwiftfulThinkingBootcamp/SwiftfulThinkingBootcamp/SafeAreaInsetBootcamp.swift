//
//  SafeAreaInsetBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 25/4/2567 BE.
//

// MARK: SafeAreaInset ใช้เพื่อปรับแต่งหน้าจอให้เข้ากับ Safe Area ของอุปกรณ์ iOS ได้อย่างถูกต้องและสวยงาม สรุปสั้นๆ น่าใช้ในการปรับแต่งหน้าจอให้เข้ากับ Safe Area ของอุปกรณ์ iOS

import SwiftUI

struct SafeAreaInsetBootcamp: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
            .navigationBarTitleDisplayMode(.inline)
//            .overlay(
//                Text("Hi")
//                    .frame(maxWidth: .infinity)
//                    .background(Color.yellow)
//                
//                , alignment: .bottom)
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow.edgesIgnoringSafeArea(.bottom))
//                    .clipShape(Circle())
//                    .padding()
            }
            
            .safeAreaInset(edge: .bottom, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.yellow.edgesIgnoringSafeArea(.bottom))
//                    .clipShape(Circle())
//                    .padding()
            }
        }
    }
}

#Preview {
    SafeAreaInsetBootcamp()
}
