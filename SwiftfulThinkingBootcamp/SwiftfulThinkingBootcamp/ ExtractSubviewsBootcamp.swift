//
//   ExtractSubviewsBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 12/4/2567 BE.
//

// ExtractSubviews เป็นการแยกวิวย่อยออกมาหลายๆส่วน ซึ่งช่วยให้โค้ดของคุณมีความกระชับและอ่านง่ายขึ้น โดยสามารถนำส่วนของโค้ดที่ซ้ำซ้อนหรือซ้ำกันมาแยกออกมาเป็นวิวย่อย เพื่อให้โค้ดมีโครงสร้างที่เรียบง่ายและง่ายต่อการบำรุงรักษา



import SwiftUI

struct _ExtractSubviewsBootcamp: View {
    var body: some View {
        ZStack {
            Color(Color.mint).edgesIgnoringSafeArea(.all)
            
            contentLayer
        }
    }
    
    var contentLayer: some View {
        HStack {
            MyItem(title: "Apples", count: 1, color: .red)
            MyItem(title: "Oranges", count: 10, color: .orange)
            MyItem(title: "Bananas", count: 34, color: .yellow)
        }
    }
    
}

struct MyItem: View {
    
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack {
            Text("\(count)")
                .foregroundColor(.white)
            Text(title)
                .foregroundColor(.white)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

#Preview {
    _ExtractSubviewsBootcamp()
}
