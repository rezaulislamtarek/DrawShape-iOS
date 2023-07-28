//
//  DotText.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 26/7/23.
//

import SwiftUI

struct DotText: View {
    var data : Data
    var body: some View {
        ZStack{
            VStack(spacing: 0){ 
                Circle().fill( data.isActive ? .green : .gray ).frame(height: 16)
                //Text("\(data.name)").font(.system(size: 10))
            }
                 
        }
    }
}

struct DotText_Previews: PreviewProvider {
    static var previews: some View {
        DotText(data: Datas.dataList[0])
    }
}
