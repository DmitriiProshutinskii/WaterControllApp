//
//  Home.swift
//  WaterControllApp WatchKit Extension
//
//  Created by Физтех.Радио on 23.03.2021.
//

import SwiftUI
import CoreData

struct Home: View {
    @State var times: Double = WaterModel.GetDataToday()
    @State var scaleEffect: Double = 0
    
    var body: some View {
        GeometryReader { geometry in
            let rect = geometry.frame(in: .global)
            //times == Double(WaterModel.HOW_MANY_GLASSES)
            if(times != Double(WaterModel.HOW_MANY_GLASSES)) {
                ZStack {
                    Pie(startAngle: Angle.degrees(-90), endAngle: Angle.degrees(-90 + times * 360/Double(WaterModel.HOW_MANY_GLASSES)), clockwise: false, rect: rect)
                        .padding(5)
                        .foregroundColor(getColor(times: times))
                        .animation(.easeOut(duration: 0.4))
                        

                    WaterButton(image: "drop", rect: rect, color: .blue)
                        .onTapGesture {
                            times += 1
                            WaterModel.SetDataToday(glasses: times)
                        }
                        .buttonStyle(PlainButtonStyle())
                }.frame(width: rect.width, alignment: .center)
            } else {
                ZStack{
                    Circle()
                        .foregroundColor(.green)
                        .animation(.easeIn(duration: 1))
                    Image(systemName: "checkmark")
                        .font(.system(size: 100))
                        .clipShape(Circle())
                    
                }.frame(width: rect.width, alignment: .center)
                .scaleEffect(x: CGFloat(scaleEffect), y: CGFloat(scaleEffect), anchor: .center)
                .animation(.easeOut(duration: 0.5))
                .onAppear {
                    DispatchQueue.global(qos: .background).async {
                        let date = Date()
                        var t: Double = 0
                        while(t < 1){
                            t = Date().timeIntervalSince(date)*2.5
                                DispatchQueue.main.async {
                                    scaleEffect = t
                                }
                            }
                    }
                    
                }
            }
        }
    }
    
    func getColor(times: Double) -> Color {
        let t: Int = Int(times)
        switch t {
        case 1,2:
            return .red
        case 3,4:
            return .orange
        case 5,6:
            return .yellow
        case 7,8:
            return .green
        default:
            return .blue
        }
    }
}


struct WaterButton: View {
    
    var image: String
    var rect: CGRect
    var color: Color
    
    var body: some View {
        VStack(spacing:8) {
            Image(systemName: image)
                .font(.system(size: 70))
                .frame(width: rect.width / 1.4, height: rect.height / 1.4, alignment: .center)
                .background(color)
                .clipShape(Circle())
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
