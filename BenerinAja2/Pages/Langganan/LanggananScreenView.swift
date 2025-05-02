//
//  LanggananScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct LanggananScreenView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack(alignment: .topTrailing) {
                    Image("langganan")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 50)
                    
                    Button(action: {
                        // Aksi tutup
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding(12)
                            .background(Color.black.opacity(0.5))
                            .clipShape(Circle())
                            .padding(.top, 50)
                            .padding()
                    }
                }

                VStack(alignment: .leading, spacing: 12) {
                    Text("Aktifkan paket BenerinAja Pro")
                        .font(.title2).bold()
                    
                    Text("BenerinAja pro memiliki akses banyak manfaat untuk keperluan kamu beserta alat elektronik kamu.")
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    Text("Inilah yang benefit yang Kamu dapatkan dengan BenerinAja Pro :")
                        .font(.subheadline)
                        .bold()
                        .padding(.top, 8)
                    
                    HStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Bulanan")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)

                            BenefitItem(text: "Prioritas Layanan")
                            BenefitItem(text: "Garansi Lebih Panjang")
                            BenefitItem(text: "Konsultasi Unlimited")
                            BenefitItem(text: "Promo Eksklusif")
                            BenefitItem(text: "Teknisi Pilihan\n(Top-rated Only)")
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Satu Kali")
                                .font(.headline)
                                .foregroundColor(.blue)
                                .frame(maxWidth: .infinity, alignment: .center)

                            BenefitItem(text: "Prioritas Layanan")
                            BenefitItem(text: "Konsultasi Unlimited\nTeknisi Pilihan")
                            
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemGray6))
                        .cornerRadius(16)
                    }

                }
                .padding()
                
                Spacer()
                
                NavigationLink(destination: DetailLanggananScreenView()) {
                    Text("Tingkatkan")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("color-primary"))
                        .cornerRadius(12)
                        .padding([.horizontal, .bottom])
                }
            }
            .ignoresSafeArea(edges: .top)
        }
    }
}

struct BenefitItem: View {
    var text: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    LanggananScreenView()
}
