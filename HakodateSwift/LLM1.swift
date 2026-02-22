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
        ShiroiKoibitoView()
    }
}
