//
//  DetailSearchView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct DetailSearchView: View {
    @Binding var isPresented: Bool
    @Binding var searchQuery: String

    let trendingKeywords = [
        "Service Layar Laptop", "Ganti Baterai HP",
        "Laptop Mati", "HP Gak Bisa Di Cas", "LCD"
    ]

    let categories = [
        ("Laptop", "icon-laptop"),
        ("TV", "icon-tv"),
        ("AC", "icon-ac")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    withAnimation {
                        isPresented = false
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                TextField("Apa yang kamu butuhkan hari ini?", text: $searchQuery)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding()
            .background(Color("color-primary"))

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Sedang Trend")
                            .font(.headline)
                        WrapView(data: trendingKeywords, spacing: 8) { keyword in
                            Button(action: {
                                searchQuery = keyword
                                isPresented = false
                            }) {
                                Text(keyword)
                                    .font(.system(size: 15,weight: .regular))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .background(Color(.systemGray5))
                                    .foregroundColor(.black)
                                    .cornerRadius(20)
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Kategori Pilihan")
                            .font(.headline)

                        ForEach(categories, id: \.0) { category in
                            Button(action: {
                                print("Kategori tapped: \(category.0)")
                            }) {
                                HStack(spacing: 16) {
                                    Image(category.1)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(12)

                                    Text(category.0)
                                        .font(.body)
                                        .foregroundColor(.black)

                                    Spacer()
                                }
                                .padding(.horizontal)
                            }
                        }

                    }
                }
                .padding()
            }
            .background(Color(.systemGray6))
        }
        .transition(.move(edge: .bottom))
        .animation(.easeInOut, value: isPresented)
    }
}


struct WrapView<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let data: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content

    @State private var totalHeight: CGFloat = .zero

    var body: some View {
        GeometryReader { geometry in
            self.generateContent(in: geometry)
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(Array(data), id: \.self) { item in
                content(item)
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if abs(width - d.width) > g.size.width {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if item == data.last {
                            width = 0 
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: { _ in
                        let result = height
                        if item == data.last {
                            height = 0
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry in
            Color.clear
                .preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
        .onPreferenceChange(HeightPreferenceKey.self) { value in
            binding.wrappedValue = value
        }
    }
}

private struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

struct DetailSearchView_Previews: PreviewProvider {
    static var previews: some View {
        DetailSearchView(
            isPresented: .constant(true),
            searchQuery: .constant("")
        )
    }
}

