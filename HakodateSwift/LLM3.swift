//
//  LLM3.swift
//  HakodateSwift
//
//  Created by Shingo Toyoda on 2026/02/22.
//

import SwiftUI

struct WhiteLoverCookieLayer: View {
    let size: CGFloat
    
    var body: some View {
        DiamondShape()
            .fill(Color(red: 0.96, green: 0.91, blue: 0.82))
            .frame(width: size, height: size)
            .overlay(
                DiamondShape()
                    .stroke(Color(red: 0.8, green: 0.7, blue: 0.5), lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.15), radius: 2, x: 2, y: 2)
    }
}

struct WhiteLoverChocolateLayer: View {
    let size: CGFloat
    
    var body: some View {
        DiamondShape()
            .fill(Color(red: 1.0, green: 0.98, blue: 0.95))
            .frame(width: size, height: size)
            .overlay(
                DiamondShape()
                    .stroke(Color(red: 0.9, green: 0.85, blue: 0.75), lineWidth: 0.5)
            )
    }
}

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midX = rect.midX
        let midY = rect.midY
        
        path.move(to: CGPoint(x: midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: midY))
        path.addLine(to: CGPoint(x: midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: midY))
        path.closeSubpath()
        
        return path
    }
}

struct WhiteLoverView: View {
    let size: CGFloat
    
    var body: some View {
        ZStack {
            WhiteLoverCookieLayer(size: size)
                .offset(y: 4)
            
            WhiteLoverChocolateLayer(size: size * 0.85)
                .offset(y: -2)
        }
    }
}

#Preview {
    WhiteLoverView(size: 100)
        .padding()
}
