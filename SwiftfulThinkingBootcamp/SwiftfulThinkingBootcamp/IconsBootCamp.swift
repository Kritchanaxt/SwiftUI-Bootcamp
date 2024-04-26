//
//  IconsBootCamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Kritchanaxt_. on 7/4/2567 BE.
//

import SwiftUI

struct IconsBootCamp: View {
    var body: some View {
        Image(systemName: "sun.max.trianglebadge.exclamationmark.fill")
            .renderingMode(.original)// แสดงสีไอคอน
            .resizable()
            //.aspectRatio(contentMode: .fit)
            //.scaledToFit()
            .scaledToFill()
            //.font(.largeTitle)
            //.font(.caption)
            //.font(.system(size: 200))
            .foregroundColor(Color.red)
            .frame(width: 300, height: 300)
            //.clipped()
    }
}

#Preview {
    IconsBootCamp()
}
