//
//  CircleView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 28/7/23.
//

import SwiftUI

struct CircleView: View {
    let center: CGPoint
    let radius: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let circleRect = CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2)
                path.addEllipse(in: circleRect)
            }
            .stroke(Color.gray, lineWidth: 0.5) // Change the color as needed
        }
    }
}
struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(center: CGPoint(x: 100, y: 100), radius: 50.0)
    }
}
