//
//  CardView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(viewModel.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 110)
                .clipped()
                .cornerRadius(15, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
        VStack(alignment: .leading, spacing: 6) {
                Text(viewModel.orderCode)
                    .font(.system(size: 12, weight: .semibold))

                Text(viewModel.orderDate)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)

                Text(viewModel.storeName)
                    .font(.system(size: 12, weight: .semibold))

                Text(viewModel.category)
                    .font(.system(size: 9))
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(Color("color-alt-white"))
                    .cornerRadius(4)

                Text(viewModel.price)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Color("color-primary"))

                HStack(spacing: 6) {
                    Button(action: {}) {
                        HStack(spacing: 2) {
                            Image(systemName: "cart")
                                .font(.system(size: 10))
                            Text("Pesan")
                                .font(.system(size: 10, weight: .semibold))
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color("color-primary"))
                        .foregroundColor(.white)
                        .cornerRadius(5)
                    }

                    Button(action: {}) {
                        HStack(spacing: 2) {
                            Image(systemName: "star")
                                .font(.system(size: 10))
                            Text("Beri P..")
                                .font(.system(size: 10, weight: .semibold))
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white)
                        .foregroundColor(Color("color-primary"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color("color-primary"), lineWidth: 1)
                        )
                    }
                }
            }
            .padding(10)
        }
        .frame(width: 160)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}



struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleViewModel = CardViewModel(imageName: "andi",
                                            orderCode: "A12300",
                                            orderDate: "30 April 2025",
                                            storeName: "Andi Elektronik Care",
                                            category: "Handphone",
                                            price: "Rp. 170.000")
        
        CardView(viewModel: sampleViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
