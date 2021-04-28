//
//  Pie.swift
//  WaterControllApp WatchKit Extension
//
//  Created by Физтех.Радио on 23.03.2021.
//

import SwiftUI

struct Pie: Shape {
    var startAngle :Angle
    var endAngle: Angle
    var clockwise: Bool = false
    var rect: CGRect
    var animatableData: AnimatablePair<Double, Double>
    {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height)/2
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(startAngle.radians))
    )
        let startMin = CGPoint(
            x: center.x + radius * 0.9 * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * 0.9 * sin(CGFloat(startAngle.radians))
    )
        let endMin = CGPoint(
            x: center.x + radius * 0.9 * cos(CGFloat(endAngle.radians)),
            y: center.y + radius * 0.9 * sin(CGFloat(endAngle.radians))
    )
        
        let startCenter = CGPoint(
            x: center.x + radius * 0.95 * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * 0.95 * sin(CGFloat(startAngle.radians))
    )
        let endCenter = CGPoint(
            x: center.x + radius * 0.95 * cos(CGFloat(endAngle.radians)),
            y: center.y + radius * 0.95 * sin(CGFloat(endAngle.radians))
    )
        
        
        var p = Path()
        p.move(to: startMin)
        p.addArc(
            center: startCenter,
            radius: radius * 0.05,
            startAngle: startAngle,
            endAngle: startAngle + Angle.degrees(180),
            clockwise: true)
        //p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: clockwise
        )
        p.addArc(
            center: endCenter,
            radius: radius * 0.05,
            startAngle: endAngle,
            endAngle: endAngle - Angle.degrees(180),
            clockwise: false)
        //p.addLine(to: endMin)
        p.addArc(
            center: center,
            radius: radius * 0.9,
            startAngle: endAngle,
            endAngle: startAngle,
            clockwise: !clockwise
        )
        return p
    }
}
