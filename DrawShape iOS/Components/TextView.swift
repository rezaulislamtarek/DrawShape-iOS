//
//  TextView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 31/7/23.
//

import SwiftUI

struct TextView: View {
    var text : String
    var body: some View {
        Text(text).font(.system(size: 12))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Rezaul Islam")
    }
}
