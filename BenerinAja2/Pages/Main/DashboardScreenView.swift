//
//  DashboardScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct DashboardScreenView: View {
    @State private var searchQuery: String = ""
    @State private var scrollViewOffset: CGFloat = 0
    @State private var lastScrollOffset: CGFloat = 0
    @State private var selectedTab: Tab = .home
    @State private var isDetailSearchPresented: Bool = false

    let orders = [
           CardViewModel(imageName: "andi", orderCode: "A12300", orderDate: "30 April 2025", storeName: "Andi Elektronik Care", category: "Handphone", price: "Rp. 170.000"),
           CardViewModel(imageName: "khusni", orderCode: "A18000", orderDate: "29 April 2025", storeName: "Andi Elektronik Care", category: "Handphone", price: "Rp. 170.000"),
           CardViewModel(imageName: "khusni", orderCode: "A18000", orderDate: "29 April 2025", storeName: "Andi Elektronik Care", category: "Handphone", price: "Rp. 170.000"),
       ]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Senang bertemu denganmu, ")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.white) +
                            Text("Caldera!")
                                .font(.system(size: 18, weight: .black))
                                .foregroundColor(.white)
                            
                            Text("Bojongsoang, Bandung, Jawa Barat")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white)
                                .font(.subheadline)
                                .padding(.top, -5)
                                .padding(.bottom, 8)
                            HStack {
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(.gray)
                                    
                                    Text(searchQuery.isEmpty ? "Apa yang kamu butuhkan hari ini?" : searchQuery)
                                        .foregroundColor(searchQuery.isEmpty ? .gray : .black)
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .onTapGesture {
                                            isDetailSearchPresented = true
                                        }
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 12)
                                .frame(height: 40)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                
                                Image("profile")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }
                        }
                        .padding()
                        .background(Color("color-primary") .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity, maxHeight: 240)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                            .padding(.bottom,75))
                        .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack {
                                Text("Pesan Lagi")
                                    .font(.system(size: 20, weight: .semibold))
                                    .foregroundColor(Color.black)
                                    .padding(.top,-20)
                                
                                Spacer()
                                
                                Button(action: {
                                    //kasih aksi nanti
                                    print("Lihat selengkapnya diklik")
                                }) {
                                    Text("Lihat selengkapnya")
                                        .foregroundColor(Color("color-primary"))
                                        .font(.subheadline)
                                        .padding(.top, -15)
                                }
                                .buttonStyle(PlainButtonStyle())}
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(orders, id: \.orderCode) { order in
                                        CardView(viewModel: order)
                                            .frame(width: 180, height: 270)
                                    }
                                }
                                .padding(.horizontal, -6)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.top, 45)
                        
                        Text("Kategori Teratas")
                            .font(.system(size: 20, weight: .semibold))
                            .font(.headline)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 4), spacing: 14) {
                            Button(action: {
                                // Action for Laptop
                            }) {
                                VStack {
                                    Image("icon-laptop")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("Laptop")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for TV
                            }) {
                                VStack {
                                    Image("icon-tv")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("TV")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for Washer
                            }) {
                                VStack {
                                    Image("icon-washer")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("Washer")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for Heater
                            }) {
                                VStack {
                                    Image("icon-heater")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("Heater")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for CCTV
                            }) {
                                VStack {
                                    Image("icon-cctv")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("CCTV")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for AC
                            }) {
                                VStack {
                                    Image("icon-ac")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("AC")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for Camera
                            }) {
                                VStack {
                                    Image("icon-camera")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("Camera")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                            
                            Button(action: {
                                // Action for More
                            }) {
                                VStack {
                                    Image("icon-more")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(8)
                                        .background(Color("color-alt-white"))
                                        .cornerRadius(8)
                                    
                                    Text("More")
                                        .font(.footnote)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                }
                                .padding(.vertical, 8)
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .padding()
                        Spacer()
                        Spacer()
                    }
                }
                
                Button(action: {
                    
                }) {
                    Image(systemName: "headphones")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("color-primary"))
                        .clipShape(Circle())
                }
                .padding(.trailing, 5)
                .padding(.bottom, 85)
                
                MenuBarView(selectedTab: $selectedTab, isVisible: true)
                    .zIndex(1)
                    .padding(.bottom, 0)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                }
                .navigationBarBackButtonHidden(true)
            }
        .fullScreenCover(isPresented: $isDetailSearchPresented) {
            DetailSearchView(isPresented: $isDetailSearchPresented, searchQuery: $searchQuery)
        }
        }
    }

#Preview {
    DashboardScreenView()
}
