//
//  KuesionerScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct CheckboxField: View {
    let label: String
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(.blue)
                Text(label)
                    .foregroundColor(.primary)
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct KuesionerScreenView: View {
    @State private var issues: [String: Bool] = [
        "TV mati total": false,
        "TV nyala tapi tidak muncul gambar": false,
        "Ganti layar/panel TV": false,
        "Port HDMI/USB rusak": false,
        "TV tidak bisa konek ke Wi-Fi/Siaran TV error": false,
        "Tidak bisa ganti channel/input": false,
        "Lainnya": false
    ]
    
    @State private var tvTypes: [String: Bool] = [
        "LED": false, "LCD": false, "Plasma": false,
        "Tabung": false, "OLED": false, "Smart TV": false, "Lainnya": false
    ]
    
    @State private var tvBrands: [String: Bool] = [
        "Toshiba": false, "Samsung": false, "LG": false,
        "Sony": false, "Polytron": false, "Panasonic": false,
        "Coocaa": false, "Changhong": false, "Lainnya": false
    ]
    
    @State private var tvSize = ""
    @State private var tvModel = ""
    @State private var serviceDate = ""
    @State private var serviceTime = ""
    @State private var additionalInfo = ""
    @State private var name = ""
    @State private var email = ""
    @State private var province = ""
    @State private var city = ""
    @State private var district = ""
    @State private var phone = ""

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Dapatkan Penawaran Penyedia Jasa Service")
                        .font(.title3)
                        .bold()
                    Text("Silakan isi formulir di bawah ini untuk mendapatkan penawaran terbaik kami.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                VStack(alignment: .leading, spacing: 16) {
                    Text("Bagaimana cara kerjanya?")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 8) {
                        infoRow(icon: "checkmark.circle.fill", title: "Jelaskan Kebutuhan Anda", subtitle: "Ceritakan keluhan atau kebutuhan jasa Anda")
                        infoRow(icon: "doc.text.fill", title: "Submit Formulir", subtitle: "Kami akan bantu hubungkan dengan penyedia jasa terpercaya")
                        infoRow(icon: "person.crop.circle.fill.badge.checkmark", title: "Konsultasi Service", subtitle: "Diskusikan kebutuhan dan dapatkan penawaran harga")
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Kenapa harus kami?")
                        .font(.headline)
                    VStack(alignment: .leading, spacing: 6) {
                        Label("Terverifikasi", systemImage: "checkmark.circle.fill")
                        Label("Jaminan Garansi", systemImage: "checkmark.circle.fill")
                        Label("Penyedia Jasa Terpercaya", systemImage: "checkmark.circle.fill")
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }

                checkboxGroup(title: "Request Detail", items: $issues)
                checkboxGroup(title: "Jenis TV yang anda gunakan", items: $tvTypes)
                checkboxGroup(title: "Merek TV yang Anda miliki", items: $tvBrands)

                Group {
                    TextField("Ukuran layar TV anda (Inch)", text: $tvSize)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Nomer Seri / Kode Model TV anda", text: $tvModel)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Kapan Anda membutuhkan layanan?", text: $serviceDate)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Pada pukul berapa anda membutuhkan layanan?", text: $serviceTime)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Informasi tambahan", text: $additionalInfo, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .lineLimit(3, reservesSpace: true)
                }

                Group {
                    Text("Kontak anda")
                        .font(.headline)
                    TextField("Your Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Provinsi", text: $province)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Kota / Kabupaten", text: $city)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Kecamatan, Kelurahan", text: $district)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("No HP", text: $phone)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                }

                HStack(spacing: 16) {
                    Button("Konsultasi Service") {}
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    Button("Pesan Sekarang") {}
                        .frame(height: 20)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Kuesioner")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    func infoRow(icon: String, title: String, subtitle: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: icon)
                .foregroundColor(.blue)
            VStack(alignment: .leading, spacing: 4) {
                Text(title).bold()
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }

    @ViewBuilder
    func checkboxGroup(title: String, items: Binding<[String: Bool]>) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.headline)
            ForEach(items.wrappedValue.sorted(by: { $0.key < $1.key }), id: \.key) { key, _ in
                CheckboxField(label: key, isChecked: Binding(
                    get: { items.wrappedValue[key, default: false] },
                    set: { items.wrappedValue[key] = $0 }
                ))
            }
        }
    }
}

#Preview {
    NavigationView {
        KuesionerScreenView()
    }
}
