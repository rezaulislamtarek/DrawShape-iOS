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
//            p.addLine(to: CGPoint(x: rect.midX-1, y: rect.maxY))
//            p.addLine(to: CGPoint(x: rect.midX-1, y: rect.minY))
        }
    }
    
    
}

struct ContentView: View {
    let maxHeight : CGFloat = 300
    var body: some View {
        ZStack {
 
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 300, height: 300)
               .foregroundColor(.red)
            
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 200, height: 200)
               .foregroundColor(.red)
            
            CustomShape()
                .rotation(.degrees(45-10))
                .stroke(lineWidth: 0.5)
                .fill(.red)
                .frame(width: maxHeight, height: maxHeight)
            CustomShape()
                .rotation(.degrees(45*3 + 10))
                .stroke(lineWidth: 0.5)
                .fill(.red)
                .frame(width: maxHeight, height: maxHeight)
            CustomShape()
                .rotation(.degrees(45*2))
                .stroke(lineWidth: 0.5)
                .fill(.red)
                .frame(width: maxHeight, height: maxHeight)
                
            Circle()
               .stroke(lineWidth: 10)
               .frame(width: 100, height: 100)
               .foregroundColor(.red)
               .opacity(0.5)
            Image("tarek").resizable().frame(width: 100 ,height: 100).clipShape(Circle())
        
//            Image(systemName: "person.circle.fill").font(.system(size: 100))
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
