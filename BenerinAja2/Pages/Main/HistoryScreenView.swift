//
//  HistoryScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct HistoryScreenView: View {
    @State private var selectedTab: Tab = .riwayat
    @State private var selectedTabs: Set<String> = []
    @State private var showFilter = false

    let tabs = ["Riwayat", "Dalam Proses", "Lunas"]

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                VStack(spacing: 4) {
                    HStack {
                        Text("Aktivitas")
                            .font(.system(size: 25, weight: .black))
                        Spacer()
                        HStack(spacing: 16) {
                            Image(systemName: "questionmark.circle.fill")
                            Image(systemName: "square.and.arrow.down")
                        }
                        .font(.title3)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 18)
                }
                .background(Color("color-primary"))
                .foregroundColor(.white)

                Spacer()
                Spacer()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        Button(action: {
                            showFilter.toggle()
                        }) {
                            HStack {
                                Spacer()
                                Label("Filter", systemImage: "list.bullet")
                                    .font(.subheadline)
                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .frame(width: 120)
                            .background(Color.white)
                            .cornerRadius(24)
                            .overlay(RoundedRectangle(cornerRadius: 24).stroke(Color.gray.opacity(0.3)))
                        }

                        ForEach(sortedTabs, id: \.self) { tab in
                            Button(action: {
                                withAnimation {
                                    toggleSelection(for: tab)
                                }
                            }) {
                                Text(tab)
                                    .font(.subheadline)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(
                                        selectedTabs.contains(tab) ? Color("color-primary") : Color.white
                                    )
                                    .foregroundColor(
                                        selectedTabs.contains(tab) ? .white : .black
                                    )
                                    .cornerRadius(24)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 24)
                                            .stroke(Color.gray.opacity(0.3))
                                    )
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                ScrollView {
                    VStack(spacing: 16) {
                        CardHistoryView(
                            imageName: "andi",
                            orderCode: "A12300",
                            date: "30 April 2025",
                            storeName: "Andi Elektronik Care",
                            category: "TV",
                            price: "Rp. 170.000",
                            isPaid: true
                        )

                        CardHistoryView(
                            imageName: "khusni",
                            orderCode: "A18000",
                            date: "29 April 2025",
                            storeName: "Jaya Komputer",
                            category: "Handphone",
                            price: "Rp. 300.000",
                            isPaid: true
                        )

                        CardHistoryView(
                            imageName: "khusni",
                            orderCode: "A23300",
                            date: "1 April 2025",
                            storeName: "Jaya Komputer",
                            category: "Handphone",
                            price: "Rp. 275.000",
                            isPaid: true
                        )
                    }
                    .padding(.vertical)
                }
            }

            if showFilter {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showFilter = false
                    }

                VStack {
                    Spacer()
                    FilterView(isPresented: $showFilter)
                }
                .transition(.move(edge: .bottom))
                .zIndex(1)
            }

            VStack {
                Spacer()
                MenuBarView(selectedTab: $selectedTab, isVisible: true)
                    .zIndex(1)
                    .padding(.bottom, 30)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
            .navigationBarBackButtonHidden(true)
        }
        .background(Color(red: 0.95, green: 0.98, blue: 1.0))
        .edgesIgnoringSafeArea(.bottom)
    }

    private var sortedTabs: [String] {
        selectedTabs.map { $0 } + tabs.filter { !selectedTabs.contains($0) }
    }

    private func toggleSelection(for tab: String) {
        if selectedTabs.contains(tab) {
            selectedTabs.remove(tab)
        } else {
            selectedTabs.insert(tab)
        }
    }
}

#Preview {
    HistoryScreenView()
}
