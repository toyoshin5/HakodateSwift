//
//  ContentView.swift
//  HakodateSwift
//
//  Created by Shingo Toyoda on 2026/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.2, green: 0.5, blue: 0.5)
                .ignoresSafeArea()

            VStack(spacing: 50) {
                ShiroiKoibitoPackageView()
                    .shadow(color: .black.opacity(0.6), radius: 8, x: 0, y: 6)
                ShiroiKoibitoView()

            }
        }
    }
}

#Preview {
    ContentView()
}
