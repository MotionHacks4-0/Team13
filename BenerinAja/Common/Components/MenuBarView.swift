//
//  MenuBarView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct MenuBarView: View {
    @Binding var selectedTab: Tab
    var isVisible: Bool
    
    var body: some View {
        VStack {
            Spacer()
            if isVisible {
                VStack(spacing: 0) {
                    Divider().background(Color.gray.opacity(0.3))
                    HStack {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Spacer()
                            NavigationLink(destination: destinationView(for: tab)) {
                                VStack(spacing: 4) {
                                    Image(systemName: tab.icon)
                                        .font(.system(size: 20))
                                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                                    Text(tab.label)
                                        .font(.system(size: 12))
                                        .foregroundColor(selectedTab == tab ? .blue : .gray)
                                }
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    .background(Color.white)
                }
                .transition(.move(edge: .bottom))
                .animation(.easeInOut(duration: 0.3), value: isVisible)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
    
    // Fungsi untuk menentukan tampilan berdasarkan tab yang dipilih
    @ViewBuilder
    private func destinationView(for tab: Tab) -> some View {
        switch tab {
        case .home:
            HomeScreenView()
        case .category:
            Text("s")
        case .riwayat:
            Text("s")
        case .chat:
            Text("s")
        }
    }
}

enum Tab: CaseIterable {
    case home, category, riwayat, chat
    
    var label: String {
        switch self {
        case .home: return "Home"
        case .category: return "Category"
        case .riwayat: return "Riwayat"
        case .chat: return "Chat"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "house.fill"
        case .category: return "square.grid.2x2"
        case .riwayat: return "clock"
        case .chat: return "bubble.left.and.bubble.right"
        }
    }
}

struct MenuBarPreviewWrapper: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                }
                .background(MenuBarView(selectedTab: $selectedTab, isVisible: true))
                .zIndex(1)
            }
        }
    }
}

#Preview {
    MenuBarPreviewWrapper()
}
