//
//  NavigationViewBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 14/4/2567 BE.
//

// Navigation View ใช้สำหรับการนำทางระหว่างหน้า (page-based navigation) โดยสามารถใช้ NavigationLink เพื่อเปิดหน้าใหม่ และ NavigationLink จะสร้างปุ่มที่เมื่อคลิกแล้วจะเปิดหน้าใหม่ขึ้นมา

/*
 
 navigationBarItems: ใช้เพื่อเพิ่มรายการเครื่องมือบนแถบนำทางของ NavigationView
 ซึ่งสามารถกำหนดได้ทั้งแบบ leading และ trailing
 
 NavigationLink: เป็น View ที่ใช้เพื่อทำให้เกิดการนำทางระหว่างหน้า
 โดยเมื่อมีการคลิกที่ NavigationLink จะนำทางไปยังหน้าปลายทางที่ระบุ
 
 */

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink("Hello, World!",
                               destination: MyOtherScreen())
                
                Text("Hello, World")
                Text("Hello, World")
                Text("Hello, World")
            }
            .navigationTitle("All Inboxes")
            .font(.headline)
//            .navigationBarTitleDisplayMode(.largeTitle)
//            .navigationBarTitleDisplayMode(.automatic)
//            .navigationBarTitleDisplayMode(.inline)
//            .navigationBarHidden(true)
            .navigationBarItems(
                leading:
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                    },
                    trailing:
                         NavigationLink(
                         destination: MyOtherScreen(),
                         label: {
                             Image(systemName: "gear")
                         })
                         .accentColor(.gray)
            )
            
            
        }
    }
}

struct MyOtherScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen!")
                .navigationBarHidden(true)
            
            VStack {
                Button("BACK BUTTON") {
                    presentationMode.wrappedValue.dismiss()
                }
                NavigationLink("Click here", destination: Text("3rd screen!"))
            }
        }
    }
}

#Preview {
    NavigationViewBootcamp()
}
