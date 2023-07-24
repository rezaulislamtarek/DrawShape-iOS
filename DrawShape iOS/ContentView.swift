//
//  ContentView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 24/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 250, height: 250)
               .foregroundColor(.red)
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 200, height: 200)
               .foregroundColor(.red)
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 150, height: 150)
               .foregroundColor(.red)
            
            Circle()
               .stroke(lineWidth: 0.5)
               .frame(width: 100, height: 100)
               .foregroundColor(.red)
            Image(systemName: "person.circle.fill").font(.system(size: 100))
            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
