//
//  CardHistoryView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct CardHistoryView: View {
    @ObservedObject var viewModel: CardHistoryViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Image(viewModel.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 130)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(viewModel.orderCode)
                        .font(.system(size: 15, weight: .semibold))
                        .font(.subheadline)
                    Spacer()
                    if viewModel.isPaid {
                        Text("Lunas")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                
                Text(viewModel.date)
                    .font(.caption2)
                    .foregroundColor(.gray)
                
                Text(viewModel.storeName)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
                Text(viewModel.category)
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(.vertical, 2)
                    .padding(.horizontal, 5)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(6)
                
                Text(viewModel.price)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("color-primary"))
                
                HStack(spacing: 8) {
                    Button(action: {}) {
                        Image("icon-share")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    Button(action: {}) {
                        HStack(spacing: 2) {
                            Image(systemName: "cart")
                                .font(.system(size: 9))
                            Text("Pesan Lagi")
                                .font(.system(size: 9, weight: .semibold))
                        }
                        .frame(width:70, height: 18)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color("color-primary"))
                        .foregroundColor(.white)
                        .cornerRadius(4)
                    }
                    Button(action: {}) {
                        HStack(spacing: 2) {
                            Image(systemName: "star")
                                .font(.system(size: 9))
                            Text("Beri Penilaian")
                                .font(.system(size: 9, weight: .semibold))
                        }
                        .frame(width:80, height: 18)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.white)
                        .foregroundColor(Color("color-primary"))
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color("color-primary"), lineWidth: 1)
                        )
                    }
                }
                .padding(.top, 2)
            }
            
            Spacer()
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
        .padding(.horizontal)
    }
}

struct CardHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleViewModel = CardHistoryViewModel(
            imageName: "andi",
            orderCode: "A12300",
            date: "30 April 2025",
            storeName: "Andi Elektronik Care",
            category: "TV",
            price: "Rp. 170.000",
            isPaid: true
        )
        
        CardHistoryView(viewModel: sampleViewModel)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
