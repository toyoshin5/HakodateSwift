//
//  LLM1.swift
//  HakodateSwift
//
//  Created by Shingo Toyoda on 2026/02/22.
//

import SwiftUI

struct ShiroiKoibitoView: View {
    @State private var isExpanded = false

    var body: some View {
        ZStack {
            CookieView()
                .offset(y: isExpanded ? 70 : 10)

            ChocolateView()
                .offset(y: isExpanded ? 0 : 0)

            CookieView()
                .offset(y: isExpanded ? -70 : -10)
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                isExpanded.toggle()
            }
        }
    }
}

struct CookieView: View {
    var body: some View {
        ZStack {
            // パステルイエローのベース生地 (中心部が明るく、外側が少し暗い)
            RoundedRectangle(cornerRadius: 15)
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.99, green: 0.96, blue: 0.85),  // 中心
                            Color(red: 0.93, green: 0.86, blue: 0.70),  // 外側
                        ]),
                        center: .center,
                        startRadius: 20,
                        endRadius: 90
                    )
                )

            // 焼き色1: 内側のぼんやりしたグラデーション
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color(red: 0.85, green: 0.60, blue: 0.25).opacity(0.4),
                            Color(red: 0.90, green: 0.70, blue: 0.40).opacity(0.1),
                            Color(red: 0.85, green: 0.55, blue: 0.20).opacity(0.5),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 16
                )
                .blur(radius: 6)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            // 焼き色2: 外周の濃い焼き色 (重ねがけでよりリアルに)
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(
                    LinearGradient(
                        colors: [
                            Color(red: 0.80, green: 0.45, blue: 0.15).opacity(0.8),
                            Color(red: 0.70, green: 0.35, blue: 0.10).opacity(0.6),
                            Color(red: 0.85, green: 0.50, blue: 0.15).opacity(0.8),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 10
                )
                .blur(radius: 3)
                .clipShape(RoundedRectangle(cornerRadius: 15))

            // 焼き色3: さらに細く濃いフチ
            RoundedRectangle(cornerRadius: 15)
                .strokeBorder(
                    Color(red: 0.65, green: 0.35, blue: 0.1).opacity(0.6),
                    lineWidth: 4
                )
                .blur(radius: 3)
        }
        .frame(width: 160, height: 160)
        .rotationEffect(.degrees(45))
        .scaleEffect(y: 0.5)
        // 生地の厚みと、上からのハイライトを表現
        // .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 12)
        // .shadow(color: .white.opacity(0.5), radius: 2, x: -1, y: -2)
    }
}

struct ChocolateView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 0.99, green: 0.99, blue: 0.97),
                        Color(red: 0.95, green: 0.94, blue: 0.89),
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .frame(width: 170, height: 170)
            // チョコの厚みを表現するハイライトとエッジシャドウ
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.white, lineWidth: 1.5)
                    .blur(radius: 1)
                    .offset(x: -1, y: -1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(red: 0.85, green: 0.82, blue: 0.75), lineWidth: 1)
                    .blur(radius: 1)
                    .offset(x: 1, y: 1)
            )
            .rotationEffect(.degrees(45))
            .scaleEffect(y: 0.5)
            .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 6)
    }
}

#Preview("ShiroiKoibito1") {
    ZStack {
        Color(red: 0.97, green: 0.97, blue: 0.98).ignoresSafeArea()
        VStack(spacing: 50) {
            ShiroiKoibitoPackageView()
            ShiroiKoibitoView()
        }
    }
}

struct ShiroiKoibitoPackageView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.02, green: 0.35, blue: 0.35))
                .shadow(color: .black.opacity(0.2), radius: 8, x: 0, y: 5)

            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 160)
                .foregroundColor(.white)
                .offset(x: -70, y: -50)
                .rotationEffect(.degrees(15))
                .opacity(0.95)

            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .foregroundColor(.white)
                .offset(x: 90, y: -40)
                .opacity(0.95)

            Image(systemName: "snowflake")
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .foregroundColor(.white)
                .offset(x: -110, y: 70)
                .rotationEffect(.degrees(-10))
                .opacity(0.95)

            VStack(alignment: .center, spacing: 5) {
                Text("白い恋人")
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)

                VStack(spacing: 1) {
                    Text("CHOCOLAT BLANC")
                    Text("ET")
                    Text("LANGUE DE CHAT")
                }
                .font(.system(size: 14, weight: .bold, design: .serif))
                .italic()
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 0.95, green: 0.85, blue: 0.4),
                            Color(red: 0.75, green: 0.65, blue: 0.2),
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            }
            .offset(x: 40, y: 65)

            HStack {
                PackageSealView()
                Spacer()
                PackageSealView()
            }
        }
        .frame(width: 340, height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct PackageSealView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white.opacity(0.85))
                .frame(width: 25)
                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 0)

            HStack(spacing: 2) {
                ForEach(0..<6, id: \.self) { _ in
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1.5)
                }
            }
        }
        .frame(width: 25)
    }
}
