//
//  EditProfileScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI
import PhotosUI

struct EditProfileScreenView: View {
    @State private var name: String = "Caldera"
    @State private var phoneNumber: String = "0812345678910"
    @State private var email: String = "caldera123@gmail.com"
    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false

    var body: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .leading) {
                Color("color-primary")
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 110)

                HStack {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)

                    Text("Ubah Profil")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.white)
                        .padding(.leading, 8)

                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)
            }

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    HStack(alignment: .center, spacing: 16) {
                        VStack {
                            Button {
                                showImagePicker = true
                            } label: {
                                if let image = selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                } else {
                                    Image("profile")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                }
                            }

                            Text("Tambah Foto")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }

                        Text("Pasang foto ptofil agar semua orang bisa lihat!")
                            .font(.subheadline)
                            .foregroundColor(.black)

                        Spacer()
                    }
                    .padding(.horizontal)

                    Group {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nama")
                                .font(.system(size: 12, weight: .regular))
                                .font(.subheadline)
                                .foregroundColor(.black) + Text("*").foregroundColor(.red)

                            TextField("Nama", text: $name)
                                .font(.title3.bold())
                                .padding(.bottom, 4)

                            Divider()
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nomor Handphone")
                                .font(.system(size: 12, weight: .regular))
                                .font(.subheadline)
                                .foregroundColor(.black) + Text("*").foregroundColor(.red)

                            TextField("Nomor Handphone", text: $phoneNumber)
                                .font(.title3.bold())
                                .keyboardType(.phonePad)
                                .padding(.bottom, 4)

                            Divider()
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.system(size: 12, weight: .regular))
                                .font(.subheadline)
                                .foregroundColor(.black) + Text("*").foregroundColor(.red)

                            TextField("Email", text: $email)
                                .font(.title3.bold())
                                .keyboardType(.emailAddress)
                                .padding(.bottom, 4)

                            Divider()
                        }
                    }
                    .padding(.horizontal)

                    Button(action: {
                        print("Profil diubah")
                        // Simpan perubahan ke server
                    }) {
                        Text("Ubah Profil")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("color-primary"))
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.top, 32)
                }
                .padding(.top, 24)
            }

            Spacer()
        }
        .background(Color(.systemGroupedBackground))
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
}

#Preview {
    EditProfileScreenView()
}

