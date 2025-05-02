//
//  CustomerServiceScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct CustomerServiceScreenView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top,10)
                Text("Customer Service")
                    .font(.system(size: 20, weight: .black))
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 30)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)

            ScrollView {
                VStack(spacing: 16) {
                    Text("30 Apr")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .padding(.top)

                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(0..<3) { _ in
                            Text(loremText)
                                .padding()
                                .background(Color(red: 0.9, green: 0.93, blue: 0.98))
                                .cornerRadius(16)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                }
            }

            VStack(spacing: 0) {
                Divider()
                Button(action: {}) {
                    Text("Lorem")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                }
                Divider()
                Button(action: {}) {
                    Text("Ipsum")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.blue)
                }
            }
            .background(Color.white)
            .cornerRadius(24, corners: [.topLeft, .topRight])
        }
        .background(Color(red: 0.96, green: 0.98, blue: 1.0))
        .edgesIgnoringSafeArea(.top)
    }

    var loremText: String {
        """
        Lorem ipsum dolor sit amet consectetur adipiscing elit. Quisque faucibus ex sapien vitae pellentesque sem placerat. In id cursus mi pretium tellus duis convallis. Tempus leo eu aenean sed diam urna tempor. Pulvinar vivamus fringilla lacus nec metus bibendum egestas. Iaculis massa nisl malesuada lacinia integer nunc posuere. Ut hendrerit semper vel class aptent taciti sociosqu. Ad litora torquent per conubia nostra inceptos himenaeos.
        """
    }
}

#Preview {
    CustomerServiceScreenView()
}

#Preview {
    CustomerServiceScreenView()
}
