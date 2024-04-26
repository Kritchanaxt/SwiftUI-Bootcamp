//
//  TabViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//
// TabView เป็น container view ที่ใช้สำหรับแสดงหน้าจอหลายๆ หน้าที่แยกกันโดยมีแท็บและการนำทางระหว่างหน้า โดยแต่ละหน้าจะเป็นเนื้อหาของแต่ละแท็บ การใช้ TabView มักจะเหมาะสำหรับการแสดงข้อมูลหลายๆ หมวดหมู่ที่ผู้ใช้สามารถเข้าถึงได้ง่ายๆ โดยการเลื่อนระหว่างแท็บหรือคลิกที่แท็บเพื่อเปลี่ยนหน้า

import SwiftUI

struct TabViewBootcamp: View {
    
    @State var selectedTab: Int = 0
    
    let icons: [String] = [
        "heart.fill", "globe", "house.fill", "person.fill"
    ]
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            HomeView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            TabView {
                ForEach(icons, id: \.self) { icon in
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                }
            }
            .tabItem {
                Image(systemName: "globe")
                Text("Browse")
            }
            .background(
                RadialGradient(
                    gradient: Gradient(colors: [Color.red, Color.blue]),
                    center: .center,
                    startRadius: 5,
                    endRadius: 300)
            )
            .frame(height: 300)
            .tabViewStyle(PageTabViewStyle())
            .tag(1)

            
            Text("HOME TAB")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)
        }
        .accentColor(.red)
    }
}

#Preview {
    TabViewBootcamp()
}

struct HomeView: View {
    
    @Binding var selectedTab: Int
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            VStack {
                Text("Home tab")
                    .font(.largeTitle)
                .foregroundColor(.white)
            }
            
            Button(action: {
                selectedTab = 2
            }, label: {
                Text("Go to profile")
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(10)
            })
        }
    }
}
