//
//  ContentView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 24/7/23.
//

import SwiftUI

struct CustomShape : Shape{
    func path(in rect: CGRect) -> Path {
        Path { p in
            
            
            p.move(to: CGPoint(x: rect.midX, y: rect.minY))
            p.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            //            p.addLine(to: CGPoint(x: rect.midX+0.5, y: rect.maxY))
            //            p.addLine(to: CGPoint(x: rect.midX+0.5, y: rect.minY))
            
            
        }
    }
    
}

struct CCS : Shape{
    func path(in rect: CGRect) -> Path {
        Path { p in
            
            p.addArc(center: CGPoint(x: rect.midX, y: rect.minY),
                     radius: 5,
                     startAngle: Angle(degrees: 0),
                     endAngle: Angle(degrees: 360),
                     clockwise: false)
            
          
        }
    }
    
}

struct ContentView: View {
    let maxHeight : CGFloat = 360
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 0.5)
                .frame(width: 360, height: 360)
                .foregroundColor(.gray)
            Circle()
                .stroke(lineWidth: 0.5)
                .frame(width: 280, height: 280)
                .foregroundColor(.gray)
            
            Circle()
                .stroke(lineWidth: 0.5)
                .frame(width: 220, height: 200)
                .foregroundColor(.gray)
            
            CustomShape()
                .rotation(.degrees(45))
                .stroke(lineWidth: 0.5)
                .fill(.gray)
                .frame(width: maxHeight, height: maxHeight)
            CCS()
                .rotation(.degrees(180))
                .fill(.green)
                .frame(width: maxHeight, height: maxHeight)
                .overlay(Text("abc abca").position(CGPoint(x: maxHeight/2 + 5, y: maxHeight - maxHeight + 20)))
            
            
            
            
            CustomShape()
                .rotation(.degrees(135))
                .stroke(lineWidth: 0.5)
                .fill(.gray)
                .frame(width: maxHeight, height: maxHeight)
            CCS()
                .rotation(.degrees(5))
                .fill(.green)
                .frame(width: maxHeight, height: maxHeight)
            
            
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: 100, height: 100)
                .foregroundColor(.red)
                .opacity(0.5)
                        Image("tarek").resizable().frame(width: 100 ,height: 100).clipShape(Circle())
            
            
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
