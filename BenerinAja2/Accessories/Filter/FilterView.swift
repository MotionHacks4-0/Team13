//
//  FilterView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//

import SwiftUI

struct FilterView: View {
    @Binding var isPresented: Bool
    @State private var selectedCategories: Set<String> = []
    @State private var selectedStatus: Set<String> = []
    @State private var selectedDate = Date()

    let categories = [
        "Semua", "AC (Air Conditioner)", "Alarm Rumah", "Amplifier", "Antena TV", "Blender",
        "CCTV", "Charger & Port USB", "Console Game", "Laptop & Komputer", "Magic Jar / Rice Cooker",
        "Mesin Cuci", "Mesin Fotocopy", "Mesin Jahit Elektrik", "Mesin Pompa Air", "Microwave",
        "Mixer & Juicer", "Modem & Router"
    ]

    let statuses = ["Semua", "Batal", "Selesai"]

    var body: some View {
        VStack(spacing: 0) {
            Capsule()
                .frame(width: 40, height: 5)
                .foregroundColor(Color.gray.opacity(0.4))
                .padding(.top, 12)
                .padding(.bottom, 8)

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Filter")
                        .font(.title3)
                        .bold()
                        .padding(.bottom, 8)

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Status").bold()
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
                            ForEach(statuses, id: \.self) { status in
                                FilterCheckbox(label: status, isChecked: selectedStatus.contains(status)) {
                                    if selectedStatus.contains(status) {
                                        selectedStatus.remove(status)
                                    } else {
                                        selectedStatus.insert(status)
                                    }
                                }
                            }
                        }
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Waktu Transaksi").bold()
                        DatePicker("Pilih Tanggal", selection: $selectedDate, displayedComponents: .date)
                            .datePickerStyle(.compact)
                    }

                    VStack(alignment: .leading, spacing: 10) {
                        Text("Kategori").bold()
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ForEach(categories, id: \.self) { item in
                                FilterCheckbox(label: item, isChecked: selectedCategories.contains(item)) {
                                    if selectedCategories.contains(item) {
                                        selectedCategories.remove(item)
                                    } else {
                                        selectedCategories.insert(item)
                                    }
                                }
                            }
                        }
                    }

                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Terapkan Filter")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .padding(.top, 16)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 32)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.white)
        )
        .frame(maxHeight: UIScreen.main.bounds.height * 0.85)
        .transition(.move(edge: .bottom))
        .animation(.easeInOut(duration: 0.3), value: isPresented)
    }
}

struct FilterCheckbox: View {
    let label: String
    var isChecked: Bool
    var onTap: () -> Void

    var body: some View {
        Button(action: onTap) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(6)
            .contentShape(Rectangle())
        }
    }
}


//struct FilterCheckbox: View {
//    let label: String
//    @State private var isChecked = false
//
//    var body: some View {
//        Button(action: { isChecked.toggle() }) {
//            HStack {
//                Image(systemName: isChecked ? "checkmark.square" : "square")
//                Text(label).font(.subheadline)
//            }
//        }
//        .foregroundColor(.primary)
//    }
//}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
    }
}

