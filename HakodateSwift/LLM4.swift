//
//  LLM4.swift
//  HakodateSwift
//
//  Created by Shingo Toyoda on 2026/02/22.
//

import SwiftUI

struct ShiroiKoibito4View: View {
    var body: some View {
        ZStack {
            Cookie4LayerView()
                .offset(y: 8)

            Chocolate4LayerView()

            Cookie4LayerView()
                .offset(y: -8)
        }
        .frame(width: 260, height: 220)
    }
}

struct Cookie4LayerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.98, green: 0.94, blue: 0.80),
                            Color(red: 0.95, green: 0.88, blue: 0.72),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color(red: 0.90, green: 0.70, blue: 0.35),
                            Color(red: 0.85, green: 0.60, blue: 0.25),
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 12
                )
                .blur(radius: 5)
                .padding(6)

            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                .padding(8)
        }
        .frame(width: 160, height: 160)
        .diamond4Perspective()
    }
}

struct Chocolate4LayerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 1.0, green: 0.99, blue: 0.96),
                            Color(red: 0.97, green: 0.96, blue: 0.92),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(Color(red: 0.92, green: 0.90, blue: 0.86), lineWidth: 1)
        }
        .frame(width: 168, height: 168)
        .diamond4Perspective()
    }
}

private extension View {
    func diamond4Perspective() -> some View {
        self
            .rotationEffect(.degrees(45))
            .scaleEffect(x: 1.0, y: 0.55)
            .shadow(color: .black.opacity(0.14), radius: 6, x: 0, y: 8)
    }
}

struct Package4View: View {
    var body: some View {
        ZStack {
            BagBackground4View()

            ZStack {
                Color(red: 0.0, green: 0.28, blue: 0.30)

                SnowCrystal4Shape()
                    .fill(Color.white.opacity(0.95))
                    .frame(width: 200, height: 200)
                    .offset(x: -30, y: -45)

                SnowCrystal4Shape()
                    .fill(Color.white.opacity(0.90))
                    .frame(width: 130, height: 130)
                    .rotationEffect(.degrees(30))
                    .offset(x: 60, y: -20)

                SnowCrystal4Shape()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: 70, height: 70)
                    .rotationEffect(.degrees(-15))
                    .offset(x: -80, y: 60)

                VStack(alignment: .trailing, spacing: 4) {
                    Spacer()

                    Text("白い恋人")
                        .font(.system(size: 28, weight: .bold, design: .serif))
                        .foregroundColor(.white)

                    VStack(spacing: 0) {
                        Text("CHOCOLAT BLANC")
                        Text("ET")
                        Text("LANGUE DE CHAT")
                    }
                    .font(.system(size: 10, weight: .semibold, design: .serif))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 0.90, green: 0.80, blue: 0.35),
                                Color(red: 0.80, green: 0.70, blue: 0.25),
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 20)
                .padding(.bottom, 16)
            }
            .frame(width: 240, height: 220)
            .clipShape(RoundedRectangle(cornerRadius: 4))
            .padding(12)

            HStack {
                SealStripe4View()
                Spacer()
                SealStripe4View()
            }
            .frame(width: 268)
        }
        .frame(width: 268, height: 248)
    }
}

struct BagBackground4View: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.92),
                        Color.white.opacity(0.85),
                        Color.white.opacity(0.90),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
            )
            .shadow(color: .black.opacity(0.12), radius: 8, x: 0, y: 4)
    }
}

struct SealStripe4View: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 18)

            HStack(spacing: 2) {
                ForEach(0..<4, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.gray.opacity(0.12))
                        .frame(width: 1.5)
                }
            }
        }
        .frame(width: 18)
    }
}

struct SnowCrystal4Shape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius: CGFloat = min(rect.width, rect.height) / 2

        for i in 0..<6 {
            let angle: CGFloat = CGFloat(i) * 60.0 - 90.0
            let rad: CGFloat = angle * .pi / 180.0
            let cosRad: CGFloat = Foundation.cos(rad)
            let sinRad: CGFloat = Foundation.sin(rad)

            let tip = CGPoint(
                x: center.x + radius * cosRad,
                y: center.y + radius * sinRad
            )

            path.move(to: center)
            path.addLine(to: tip)

            let branchLength: CGFloat = radius * 0.45
            let branchPositions: [CGFloat] = [0.35, 0.6, 0.82]

            for pos in branchPositions {
                let branchBase = CGPoint(
                    x: center.x + radius * pos * cosRad,
                    y: center.y + radius * pos * sinRad
                )

                let scale: CGFloat = 1.0 - pos * 0.4
                let leftRad: CGFloat = (angle + 50) * .pi / 180.0
                let rightRad: CGFloat = (angle - 50) * .pi / 180.0
                let cosL: CGFloat = Foundation.cos(leftRad)
                let sinL: CGFloat = Foundation.sin(leftRad)
                let cosR: CGFloat = Foundation.cos(rightRad)
                let sinR: CGFloat = Foundation.sin(rightRad)

                let leftTip = CGPoint(
                    x: branchBase.x + branchLength * scale * cosL,
                    y: branchBase.y + branchLength * scale * sinL
                )
                let rightTip = CGPoint(
                    x: branchBase.x + branchLength * scale * cosR,
                    y: branchBase.y + branchLength * scale * sinR
                )

                path.move(to: branchBase)
                path.addLine(to: leftTip)
                path.move(to: branchBase)
                path.addLine(to: rightTip)

                if pos < 0.5 {
                    let subLen: CGFloat = branchLength * scale * 0.5
                    let subLeftRad: CGFloat = (angle + 80) * .pi / 180.0
                    let subRightRad: CGFloat = (angle - 80) * .pi / 180.0

                    let subLeft = CGPoint(
                        x: leftTip.x + subLen * Foundation.cos(subLeftRad),
                        y: leftTip.y + subLen * Foundation.sin(subLeftRad)
                    )
                    let subRight = CGPoint(
                        x: rightTip.x + subLen * Foundation.cos(subRightRad),
                        y: rightTip.y + subLen * Foundation.sin(subRightRad)
                    )

                    path.move(to: leftTip)
                    path.addLine(to: subLeft)
                    path.move(to: rightTip)
                    path.addLine(to: subRight)
                }
            }
        }

        return path.strokedPath(
            StrokeStyle(lineWidth: rect.width * 0.025, lineCap: .round, lineJoin: .round))
    }
}

#Preview("ShiroiKoibito4") {
    ZStack {
        Color(red: 0.97, green: 0.97, blue: 0.98).ignoresSafeArea()
        ShiroiKoibito4View()
    }
}

#Preview("ShiroiKoibito4 Package") {
    ZStack {
        Color(red: 0.95, green: 0.95, blue: 0.96).ignoresSafeArea()
        VStack(spacing: 30) {
            Package4View()
            ShiroiKoibito4View()
        }
    }
}
