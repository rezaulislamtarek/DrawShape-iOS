//
//  DotText.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 26/7/23.
//

import SwiftUI

struct DotView: View {
    var data : Data
    var body: some View {
        ZStack{
            VStack(spacing: 0){ 
                Circle().fill( data.isActive ? .green : .gray ).frame(height: 16)
            }
                 
        }
    }
}

struct DotText_Previews: PreviewProvider {
    static var previews: some View {
        DotView(data: Datas.dataList[0])
    }
}
