//
//  DotText.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 26/7/23.
//

import SwiftUI

struct DotText: View {
    @Binding var title : String
    var body: some View {
        VStack{
            Circle().fill(.green).frame(height: 12)
            Text("\(title)").font(.system(size: 12)).padding(4)
                 
        }.padding(0)
    }
}

struct DotText_Previews: PreviewProvider {
    static var previews: some View {
        DotText(title: .constant("Tarek"))
    }
}
