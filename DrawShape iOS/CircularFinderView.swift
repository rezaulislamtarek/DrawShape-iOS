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
        GeometryReader { geometry in
            let screenSize = min(geometry.size.width, geometry.size.height)
            
            let circleSize = screenSize
            
            ZStack (alignment: .center) {
                Circle()
                    .stroke(lineWidth: 2)
                    .frame(width: circleSize, height: circleSize)
                    .foregroundColor(.green)
                
                    
                Circle().frame(width: 20, height: 20).foregroundColor(.green)
                Circle().frame(width: 10, height: 10)
                    .foregroundColor(.red)
                    .position(CGPoint(x: screenSize/2 , y: screenSize/2))
                
                    
            }.background(.blue)
            .onAppear {
                circleRadius = circleSize / 2
            }
        }
    }
    
    // Function to calculate the position of the dot along the circle radius
    private func dotPosition() -> CGPoint {
        let angleInRadians = 45 * .pi / 180.0
        let centerX = circleRadius
        let centerY = circleRadius
        let dotX = centerX + circleRadius * cos(CGFloat(angleInRadians))
        let dotY = centerY + circleRadius * sin(CGFloat(angleInRadians))
        return CGPoint(x: dotX, y: dotY)
    }
}

struct CircularFinderView_Previews: PreviewProvider {
    static var previews: some View {
        CircularFinderView()
    }
}
