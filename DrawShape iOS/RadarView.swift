//
//  RadarView.swift
//  DrawShape iOS
//
//  Created by Rezaul Islam on 27/7/23.
//

import SwiftUI

struct Data : Identifiable{
    var id = UUID()
    var name :String
    var isActive : Bool
}

class Datas{
    static var dataList = [
        Data(name: "Tarek", isActive: true),
        Data(name: "Tanvir", isActive: false), //2
        
        Data(name: "Rana", isActive: true),
        Data(name: "Rakib", isActive: true),
        Data(name: "Shakib", isActive: true),
        Data(name: "Rabby", isActive: true), //4
        
        Data(name: "Sumon", isActive: false),
        Data(name: "Hasan", isActive: true),
        Data(name: "Faisal", isActive: true),
        Data(name: "Khann", isActive: false),
        Data(name: "Anvir", isActive: true),
        Data(name: "Anvir", isActive: true), //6
        
        Data(name: "Sumon", isActive: false),
        Data(name: "Hasan", isActive: true),
        Data(name: "Faisal", isActive: true),
        Data(name: "Khann", isActive: false),
        Data(name: "Khann", isActive: false),
        Data(name: "Khann", isActive: false),
        Data(name: "Anvir", isActive: true),
        Data(name: "Anvir", isActive: true), //8
    ]
}

struct RadarView: View {
    
    var dataList = Datas.dataList
    
    struct PointOnCircle: Identifiable {
        let id = UUID()
        let point: CGPoint
    }
    
    
    
    func pointsOnCircle(center: CGPoint, radius: CGFloat, count: Int) -> [CGPoint] {
        var points = [CGPoint]()
        
        for i in 0..<count {
            let theta = CGFloat(2 * Double.pi) / CGFloat(count) * CGFloat(i)
            let x = center.x + radius * cos(theta)
            let y = center.y + radius * sin(theta)
            points.append(CGPoint(x: x, y: y))
        }
        return points
    }
    
    func getElectronsForFirstShells(center : CGPoint, radius  : CGFloat, electron : Int) -> [CGPoint] {
        return pointsOnCircle(center: center, radius: radius, count: electron)
    }
    
    func getElectronsForSecondShells(center : CGPoint, radius  : CGFloat, electron : Int) -> [CGPoint] {
        let points = pointsOnCircle(center: center, radius: radius, count: 100)
        var electrons : [CGPoint] = []
        let div = 100 / electron
        
        for i in 0..<99{
            if i % div == 0 {
                electrons.append(points[i+12])
            }
        }
        return electrons
    }
    
    func getElectronsForThirdShells(center : CGPoint, radius  : CGFloat, electron : Int) -> [CGPoint] {
        let points = pointsOnCircle(center: center, radius: radius, count: 100)
        var electrons : [CGPoint] = []
        let div = 100 / electron
        var count = 0
        for i in 0..<99{
            if i % div == 0 {
                count = count + 1
                if count != (electron + 1) {
                    electrons.append(points[i])
                }
            }
        }
        return electrons //getElectronsForThirdShells
    }
    
    
    func getElectronsForFourthShells(center : CGPoint, radius  : CGFloat, electron : Int) -> [CGPoint] {
        let points = pointsOnCircle(center: center, radius: radius, count: 100)
        var electrons : [CGPoint] = []
        let div = 100 / electron
        var count = 0
        for i in 0..<99{
            if i % div == 0 {
                count = count + 1
                if count != (electron + 1) {
                    electrons.append(points[i+5])
                }
            }
        }
        return electrons
    }
    
    
    var body: some View {
        GeometryReader { gm in
            ZStack(alignment: .top){
            
                let dif = (150/820) * gm.size.width
                let width = CGFloat(gm.size.width)
                let center = CGPoint(x: gm.size.width/2, y: gm.size.width/2)
                
                let radiousForCircel5 = width - dif*0
                let radiousForCircel4 = width - dif*1
                let radiousForCircel3 = width - dif*2
                let radiousForCircel2 = width - dif*3
                let radiousForCircel1 = width - dif*4
                
                let size = dataList.count
                
                
                
                ZStack {
                    CustomShape()
                        .rotation(.degrees(45))
                        .stroke(lineWidth: 0.5)
                        .fill(.gray)
                        .frame(width: width, height: width)
                    CustomShape()
                        .rotation(.degrees(135))
                        .stroke(lineWidth: 0.5)
                        .fill(.gray)
                        .frame(width: width, height: width)
                    
                    Image("tarek").resizable().frame(width: 100 ,height: 100).clipShape(Circle())
                    
                }
                
                
                ZStack{
                    
                    CircleView(center: center, radius: radiousForCircel5/2)
                    
                    CircleView(center: center, radius: radiousForCircel4/2)
                    
                    CircleView(center: center, radius: radiousForCircel3/2)
                    
                    CircleView(center: center, radius: radiousForCircel2/2)
                    
                    CircleView(center: center, radius: radiousForCircel1/2)
                    
                }
                
                
                
                if size <= 2 {
                    let points2 = pointsOnCircle(center: center, radius: radiousForCircel2/2, count: size)
                     
                    ForEach(points2.indices, id: \.self ) { index in
                       DotText(data:  dataList[index] ).position(points2[index])
                    }
                }
                
                else if  size <= 6 {
                    
                    let points2 = pointsOnCircle(center: center, radius: radiousForCircel2/2, count: 2)
                    ForEach(points2.indices, id: \.self ) { index in
                       DotText(data:  dataList[index] ).position(points2[index])
                    }
                    
                    let electronForCircel3 = size - 2
                    
                    let points3 = getElectronsForSecondShells(center: center, radius: radiousForCircel3/2, electron: electronForCircel3)
                    
                    
                    ForEach(points3.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points3[index])
                            let x = points3[index].x
                            let y = points3[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                        
                    }
                    
                }
                
                else if size <= 12 {
                    
                    let points2 = pointsOnCircle(center: center, radius: radiousForCircel2/2, count: 2)
                    ForEach(points2.indices, id: \.self ) { index in
                       DotText(data:  dataList[index] ).position(points2[index])
                    }
                    
                    let electronForCircel3 = 4
                    let points3 = getElectronsForSecondShells(center: center, radius: radiousForCircel3/2, electron: electronForCircel3)
                    
                    
                    ForEach(points3.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points3[index])
                            let x = points3[index].x
                            let y = points3[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                    }
                    
                    
                    let electronForCircel4 = size - 6
                    let points4 = getElectronsForThirdShells(center: center, radius: radiousForCircel4/2, electron: electronForCircel4)
                    
                    
                    ForEach(points4.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points4[index])
                            let x = points4[index].x
                            let y = points4[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                    }
                    
                }
                
                else if size <= 20 {
                    let points2 = pointsOnCircle(center: center, radius: radiousForCircel2/2, count: 2)
                    ForEach(points2.indices, id: \.self ) { index in
                       DotText(data:  dataList[index] ).position(points2[index])
                    }
                    
                    let electronForCircel3 = 4
                    let points3 = getElectronsForSecondShells(center: center, radius: radiousForCircel3/2, electron: electronForCircel3)
                    
                    
                    ForEach(points3.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points3[index])
                            let x = points3[index].x
                            let y = points3[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                    }
                    
                    
                    let electronForCircel4 = 6
                    let points4 = getElectronsForThirdShells(center: center, radius: radiousForCircel4/2, electron: electronForCircel4)
                    
                    ForEach(points4.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points4[index])
                            let x = points4[index].x
                            let y = points4[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                    }
                    
                    let electronForCircel5 = size - 12
                    let points5 = getElectronsForFourthShells(center: center, radius: radiousForCircel5/2, electron: electronForCircel5)
                    
                    ForEach(points5.indices, id: \.self ) { index in
                            DotText(data:  dataList[2] ).position(points5[index])
                            let x = points5[index].x
                            let y = points5[index].y + 17
                            Text("name").font(.system(size: 15)).position(CGPoint(x: x, y: y))
                    }
                    
                    
                    
                    
                }
                else {
                    
                }
                
                
            }
        }
    }
}

struct RadarView_Previews: PreviewProvider {
    static var previews: some View {
        RadarView()
    }
}
