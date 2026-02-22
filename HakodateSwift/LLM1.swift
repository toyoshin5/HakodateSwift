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
                .offset(y: isExpanded ? 70 : 15)

            ChocolateView()
                .offset(y: isExpanded ? 0 : 0)

            CookieView()
                .offset(y: isExpanded ? -70 : -15)
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
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(red: 0.95, green: 0.88, blue: 0.72))

            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(red: 0.82, green: 0.53, blue: 0.22), lineWidth: 8)
                .blur(radius: 6)
                .padding(4)
        }
        .frame(width: 160, height: 160)
        .rotationEffect(.degrees(45))
        .scaleEffect(y: 0.5)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 10)
    }
}

struct ChocolateView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 0.99, green: 0.98, blue: 0.93))
            .frame(width: 175, height: 175)
            .rotationEffect(.degrees(45))
            .scaleEffect(y: 0.5)
            .shadow(color: .black.opacity(0.1), radius: 3, x: 0, y: 5)
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
                .frame(width: 120)
                .foregroundColor(.white)
                .offset(x: 100, y: 10)
                .rotationEffect(.degrees(45))
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
                    .font(.system(size: 34, weight: .heavy, design: .serif))
                    .foregroundColor(.white)
                    .italic()

                VStack(spacing: 1) {
                    Text("CHOCOLAT BLANC")
                    Text("ET")
                    Text("LANGUE DE CHAT")
                }
                .font(.system(size: 14, weight: .bold, design: .serif))
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
