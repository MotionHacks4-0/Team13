//
//  WorkercategoryScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct WorkerCategoryScreen: View {
    @Environment(\.dismiss) var dismiss
    @State private var selectedTabs: Set<String> = []
    @State private var showFilter = false

    let tabs = ["Harga Service"]
    let workers = [
        (image: "andi", title: "Andi Elektronik Care", subtitle: "Spesialis servis semua laptop, handphone, kamera, dan lain-lain...", rating: 4.9),
        (image: "khusni", title: "Jaya Komputer", subtitle: "Berpengalaman lebih dari 5 tahun di bidang perbaikan laptop & PC", rating: 4.9),
        (image: "heri", title: "Laptopin Aja", subtitle: "Layanan cepat panggilan ke rumah/kantor", rating: 4.9),
        (image: "anton", title: "Technifix", subtitle: "Teknisi tersertifikasi, layanan profesional & bergaransi", rating: 4.9)
    ]

    private var sortedTabs: [String] {
        tabs.filter { selectedTabs.contains($0) } + tabs.filter { !selectedTabs.contains($0) }
    }

    private func toggleSelection(for tab: String) {
        if selectedTabs.contains(tab) {
            selectedTabs.remove(tab)
        } else {
            selectedTabs.insert(tab)
        }
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                Color.white.edgesIgnoringSafeArea(.all)

                VStack(spacing: 0) {
                    // Fixed blue header
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            }

                            Spacer()

                            HStack(spacing: 4) {
                                Text("Bojongsoang, Bandung, Jawa Barat")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                Image(systemName: "chevron.down")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }

                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Cari", text: .constant(""))
                                .foregroundColor(.primary)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .padding()
                    .background(Color("color-primary"))
                    .shadow(radius: 2)

                    // Scrollable content
                    ScrollView {
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                Button(action: {
                                    showFilter.toggle()
                                }) {
                                    HStack {
                                        Spacer()
                                        Label("Laptop & Komputer", systemImage: "list.bullet")
                                            .font(.subheadline)
                                        Spacer()
                                    }
                                    .padding(.vertical, 8)
                                    .frame(width: 180)
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
                                                selectedTabs.contains(tab) ? .white : Color("color-primary")
                                            )
                                            .cornerRadius(24)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 24)
                                                    .stroke(Color("color-primary").opacity(0.3))
                                            )
                                    }
                                }
                            }
                            .padding(.horizontal)

                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 170), spacing: 16)], spacing: 16) {
                                ForEach(workers, id: \.title) { worker in
                                    CardCategoryView(
                                        imageName: worker.image,
                                        title: worker.title,
                                        subtitle: worker.subtitle,
                                        rating: worker.rating
                                    )
                                }
                            }
                            .padding()
                        }
                        .padding(.top, 16)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


struct WorkerCategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkerCategoryScreen()
    }
}
