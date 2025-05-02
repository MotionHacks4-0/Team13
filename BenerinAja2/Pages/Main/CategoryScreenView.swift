//
//  CategoryScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct CategoryScreenView: View {
    let categories = [
        "Laptop",
        "AC (Air Conditioner)",
        "Alarm Rumah",
        "Amplifier",
        "Antena TV",
        "Blender",
        "CCTV",
        "Charger & Port USB",
        "Console Game",
        "Dispenser",
        "Drone",
        "DVD Player",
        "Earphone & Headset"
    ]

    @State private var searchText = ""
    @State private var selectedTab: Tab = .category

    var filteredCategories: [String] {
        if searchText.isEmpty {
            return categories
        } else {
            return categories.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        ZStack(alignment: .leading) {
            VStack(spacing: 0) {
                VStack {
                    Text("Kategori")
                        .font(.system(size: 25, weight: .black))
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading) 
                        .padding(.top, 50)
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                }
                .background(Color("color-primary"))


                VStack(spacing: 16) {
                    Text("Teknisi siap bantu, Pilih jenis barang yang diservis")
                        .font(.system(size: 18, weight: .medium))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.top, 16)
                        .padding(.horizontal)

                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Cari kategori", text: $searchText)
                            .foregroundColor(.primary)
                    }
                    .padding(12)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .padding(.horizontal)

                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(filteredCategories, id: \.self) { category in
                                Button(action: {
                              
                                    print("Kategori dipilih: \(category)")
                
                                }) {
                                    VStack(alignment: .leading) {
                                        Text(category)
                                            .foregroundColor(.primary)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding(.vertical, 16)
                                            .padding(.horizontal)
                                        Divider()
                                    }
                                    .background(Color("alt-white"))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .background(Color("color-alt-white"))
                .edgesIgnoringSafeArea(.bottom)
            }

            MenuBarView(selectedTab: $selectedTab, isVisible: true)
                .zIndex(1)
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CategoryScreenView()
}

