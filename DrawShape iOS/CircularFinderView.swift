//
//  CircularFinderView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 26/7/23.
//

import SwiftUI

struct CircularFinderView: View {
    @State private var circleRadius: CGFloat = 0
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 300,height: 300)
        }
    }
    
}
    

struct CircularFinderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularFinderView()
    }
}
