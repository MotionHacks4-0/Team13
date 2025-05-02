//  WorkerDetailScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct WorkerDetailScreenView: View {
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color("color-primary")
                .frame(height: 100)
                .ignoresSafeArea(edges: .top)
                .zIndex(1)

            Button(action: {
                // Aksi untuk kembali
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .padding()
            }
            .zIndex(1)

            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(spacing: 0) {
                        Image("andi")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 220)
                            .clipped()
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Andi Elektronik Care")
                            .font(.title2.bold())

                        HStack {
                            InfoPill(text: "Pesanan Selesai : 78")
                            InfoPill(text: "Bergabung sejak 2020")
                        }

                        HStack {
                            InfoPill(text: "Terakhir mengirim penawaran\n4 bulan lalu")
                            InfoPill(text: "Belum ada penawaran dalam\n30 hari terakhir")
                        }

                        Text("Spesialis servis semua laptop, handphone, kamera, dan lain-lain dengan harga yang terjangkau. Cocok untuk mahasiswa dan kantoran. Service kami terletak di Bandung.")
                            .font(.body)
                            .foregroundColor(.gray)

                        Text("Spesialis")
                            .font(.headline)

                        Wrap(tags: ["Laptop", "Handphone", "Kamera", "Komputer", "CCTV", "Lampu", "TV"])

                        HStack(spacing: 12) {
                            Button(action: {}) {
                                HStack(spacing: 4) {
                                    Image(systemName: "cart.fill")
                                    Text("Pesan Sekarang")
                                        .font(.system(size: 12))
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .background(Color("color-primary"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }

                            Button(action: {}) {
                                HStack(spacing: 4) {
                                    Image(systemName: "bubble.left.and.bubble.right")
                                    Text("Konsultasi Servis")
                                        .font(.system(size: 12))
                                }
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                                .frame(height: 50)
                                .frame(maxWidth: .infinity)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color("color-primary"), lineWidth: 1)
                                )
                                .foregroundColor(Color("color-primary"))
                            }
                        }
                    }
                    .padding(.horizontal)

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Album")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(["album-1", "album-2", "album-1"], id: \.self) { imageName in
                                    Image(imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipped()
                                        .cornerRadius(8)
                                }

                                ZStack {
                                    Image("album-2")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120)
                                        .clipped()
                                        .cornerRadius(8)

                                    Rectangle()
                                        .foregroundColor(.black)
                                        .opacity(0.5)
                                        .cornerRadius(8)

                                    Text("Lihat yang lain")
                                        .foregroundColor(.white)
                                        .font(.subheadline.bold())
                                }
                            }
                            .padding(.horizontal)
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Lihat Selengkapnya")
                            .font(.headline)
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ReviewCard(name: "Irvan Muranda", review: "Teknisi cukup tanggap dan sopan", rating: 5)
                                ReviewCard(name: "Ananda D", review: "Bagus pengerjaannya dan cepat", rating: 5)
                            }
                            .padding(.horizontal)
                        }
                    }

                    Spacer(minLength: 20)
                }
                .padding(.top, 47)
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
}

struct InfoPill: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.system(size: 10))
            .foregroundColor(.white)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color("color-primary"))
            .cornerRadius(4)
            .multilineTextAlignment(.center)
    }
}

struct Wrap: View {
    let tags: [String]
    var body: some View {
        let columns = [GridItem(.adaptive(minimum: 100), spacing: 8)]
        LazyVGrid(columns: columns, spacing: 8) {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .font(.footnote)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
        }
    }
}

struct ReviewCard: View {
    var name: String
    var review: String
    var rating: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray)
                VStack(alignment: .leading) {
                    Text(name).bold()
                    HStack(spacing: 2) {
                        ForEach(0..<rating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.yellow)
                        }
                    }
                }
            }

            Text(review)
                .font(.body)

            Text("Apakah ulasan ini membantu?")
                .font(.footnote)
                .foregroundColor(.gray)

            HStack {
                Image(systemName: "hand.thumbsup")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).stroke(Color(.systemGray5)))
        .frame(width: 220)
    }
}

#Preview {
    WorkerDetailScreenView()
}
