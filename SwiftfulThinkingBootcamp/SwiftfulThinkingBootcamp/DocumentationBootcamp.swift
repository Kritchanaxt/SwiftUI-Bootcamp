//
//  DocumentationBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 21/4/2567 BE.
//

// Documentation: เอกสารสั้นๆ เพื่ออธิบายและแนะนำการใช้ SwiftUI framework ให้สรุปภาพรวมและคำแนะนำสำหรับผู้เริ่มต้นให้ทราบโดยย่อ หรือ การ comment

// Key word
/*
 
 1. Option + Command + Left and Right Arrow: 
 This keyboard shortcut is used to navigate to the previous or next editor tab .
 
 2. Command + /: 
 This keyboard shortcut is used to comment or uncomment selected lines of code
 
*/

import SwiftUI

struct DocumentationBootcamp: View {
    
    // MARK: PROPERTIES
    
    @State var data: [String] = [
        "Apples", "Oranges", "Bananas"
    ]
    
    @State var showAlert: Bool = false
    
    // MARK: BODY
    
    // WAVE - Working copy - things io do:
    /*
     1) Fix title
     2) Fix title
     3) Fix something else
     
     
     */
    
    var body: some View {
        NavigationView { // START: NAV
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                
                .navigationTitle("Documentation")
                .navigationBarItems(trailing:
                                        Button("ALERT", action: {
                    showAlert.toggle()
                })
                )
                .alert(isPresented: $showAlert, content: {
                    getAlert(text: "This is the alert!")
            })
            }
        } // END: NAV
    }
    
    /// This is tge foreground layer that holds a scrollView
    private var foregroundLayer : some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLV
    }
    
    // MARK: FUNTIONS
    
    /// Get an alert with a spdecified title.
    ///
    /// This funtion creates and returns an alert immediately. The alert will have a title based on the text patameter but it will NOT have a message.
    /// ```
    ///  getAlert(text: "Hi") -> Alert(title: Text("Hi"))
    /// ```
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns an alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
}
    
   // MARK: PREVIEW

#Preview {
    DocumentationBootcamp()
}
