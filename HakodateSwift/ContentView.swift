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
            Color(red: 0.1, green: 0.4, blue: 0.4)
                .ignoresSafeArea()

            VStack(spacing: 50) {
                Text("白い恋人")
                    .font(.system(size: 36, weight: .bold, design: .serif))
                    .foregroundColor(.white)
                ShiroiKoibitoPackageView()
                ShiroiKoibitoView()

            }
        }
    }
}

#Preview {
    ContentView()
}
