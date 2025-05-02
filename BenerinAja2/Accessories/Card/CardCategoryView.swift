//
//  CardCategoryView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//
import SwiftUI

struct CardCategoryView: View {
    let imageName: String
    let title: String
    let subtitle: String
    let rating: Double

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)

            Text(title)
                .font(.system(size: 14, weight: .semibold))

            Text(subtitle)
                .font(.system(size: 11))
                .foregroundColor(.gray)
                .lineLimit(2)

            HStack(spacing: 4) {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size: 12))
                Text(String(format: "%.1f", rating))
                    .font(.system(size: 12, weight: .medium))
            }

            HStack {
                Button(action: {}) {
                    Image("icon-share")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Button(action: {}) {
                    Text("Pesan Sekarang")
                        .font(.system(size: 10, weight: .bold))
                        .frame(width:60, height: 18)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color("color-primary"))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }

                Button(action: {}) {
                    Text("Chat")
                        .font(.system(size: 10, weight: .bold))
                        .frame(width:30, height: 18)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.gray.opacity(0.1))
                        .foregroundColor(Color("color-primary"))
                        .cornerRadius(6)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.1), radius: 4, x: 0, y: 2)
        .frame(width: 170)
    }
}

struct CardCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CardCategoryView(
            imageName: "andi",
            title: "Andi Elektronik Care",
            subtitle: "Spesialis servis semua laptop, handphone, kamera, dan lain-lain...",
            rating: 4.9
        )
        .previewLayout(.sizeThatFits)
        .padding()
        .background(Color(.systemGroupedBackground))
    }
}

