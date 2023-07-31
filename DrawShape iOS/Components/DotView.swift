//
//  DotText.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 26/7/23.
//

import SwiftUI

struct DotView: View {
    var isActive : Bool
    var body: some View {
        ZStack{
            VStack(spacing: 0){ 
                Circle().fill( isActive ? .green : .gray ).frame(height: 14).padding(.all,2)
            }.background(.white)
                 
        }
    }
}

struct DotText_Previews: PreviewProvider {
    static var previews: some View {
        DotView(isActive: false)
    }
}
