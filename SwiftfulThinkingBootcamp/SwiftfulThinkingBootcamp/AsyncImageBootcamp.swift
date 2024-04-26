//
//  AsyncImageBootcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 24/4/2567 BE.
//

// AsyncImage ใช้ในการโหลดและแสดงรูปภาพจาก URL โดยอัตโนมัติ

import SwiftUI

struct AsyncImageBootcamp : View {
    
    let url = URL(string: "https://picsum.photos/400")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProfileView()
            case .success(let returnedImage):
                returnedImage
                     .resizable()
                     .scaledToFit()
                     .frame(width: 100, height: 100)
                    .cornerRadius(20)
            case .failure:
                Image(systemName: "questionmark")
                    .font(.headline)
            default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
        
//        AsyncImage(url: url, content: { returnedImage in
//            returnedImage
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 200)
//                .cornerRadius(20)
//        }, placeholder: {
//            ProgressView()
//        })
    }
}

#Preview {
    AsyncImageBootcamp()
}
