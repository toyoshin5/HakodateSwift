//
//  LLM2.swift
//  HakodateSwift
//
//  Created by Shingo Toyoda on 2026/02/22.
//

import SwiftUI

struct ShiroiKoibito2View: View {
    var body: some View {
        ZStack {
            ShiroiKoibitoChocolateLayerView()
                .offset(x: 8, y: 10)

            ShiroiKoibitoCookieLayerView()
        }
        .frame(width: 250, height: 220)
    }
}

struct ShiroiKoibitoCookieLayerView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.99, green: 0.95, blue: 0.83),
                            Color(red: 0.98, green: 0.93, blue: 0.78)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color(red: 0.93, green: 0.66, blue: 0.30), lineWidth: 16)
                .blur(radius: 4)
                .padding(4)

            RoundedRectangle(cornerRadius: 18, style: .continuous)
                .stroke(Color.white.opacity(0.35), lineWidth: 2)
                .padding(10)
        }
        .frame(width: 180, height: 180)
        .shiroiKoibitoDiamondPerspective()
    }
}

struct ShiroiKoibitoChocolateLayerView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color(red: 0.99, green: 0.99, blue: 0.97),
                        Color(red: 0.96, green: 0.95, blue: 0.91)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Color(red: 0.90, green: 0.89, blue: 0.84), lineWidth: 1.5)
            }
            .frame(width: 186, height: 186)
            .shiroiKoibitoDiamondPerspective()
    }
}

private extension View {
    func shiroiKoibitoDiamondPerspective() -> some View {
        self
            .rotationEffect(.degrees(45))
            .scaleEffect(x: 1, y: 0.62)
            .shadow(color: .black.opacity(0.16), radius: 8, x: 0, y: 10)
    }
}

#Preview("ShiroiKoibito2") {
    ZStack {
        Color(red: 0.97, green: 0.97, blue: 0.98).ignoresSafeArea()
        ShiroiKoibito2View()
    }
}
