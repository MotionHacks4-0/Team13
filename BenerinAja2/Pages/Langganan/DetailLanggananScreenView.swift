//
//  DetailLanggananScreenView.swift
//  BenerinAja2
//
//  Created by Ranzyah Adinata Aldo on 02/05/25.
//
import SwiftUI

struct DetailLanggananScreenView: View {
    enum SubscriptionMode {
        case bulanan, satuKali
    }
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMode: SubscriptionMode = .bulanan
    @State private var selectedOption: Int = 0

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.primary)
                            .padding(10)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)

                ScrollView {
                    VStack(spacing: 24) {
                        HStack(spacing: 16) {
                            subscriptionCard(
                                title: "Bulanan",
                                features: [
                                    "Prioritas Layanan",
                                    "Garansi Lebih Panjang",
                                    "Konsultasi Unlimited",
                                    "Promo Eksklusif",
                                    "Teknisi Pilihan\n(Top-rated Only)"
                                ]
                            )

                            subscriptionCard(
                                title: "Satu Kali",
                                features: [
                                    "Prioritas Layanan",
                                    "Konsultasi Unlimited",
                                    "Teknisi Pilihan"
                                ]
                            )
                        }
                        .padding(.horizontal)

                        VStack(spacing: 12) {
                            if selectedMode == .bulanan {
                                optionButton(title: "Tahunan", subtitle: "Rp169.000", index: 0)
                                optionButton(title: "Bulanan", subtitle: "Rp24.000", index: 1)
                            } else {
                                optionButton(title: "7 Hari (Untuk chat 1 tukang)", subtitle: "Rp9.000", index: 0)
                                optionButton(title: "1 Hari (Untuk chat 1 tukang)", subtitle: "Rp2.000", index: 1)
                            }
                        }
                        .padding(.horizontal)

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Dapatkan BenerinAja Pro")
                                .font(.headline)

                            HStack(spacing: 12) {
                                subscriptionModeButton(text: "Bulanan", isSelected: selectedMode == .bulanan) {
                                    selectedMode = .bulanan
                                    selectedOption = 0
                                }
                                subscriptionModeButton(text: "Satu Kali", isSelected: selectedMode == .satuKali) {
                                    selectedMode = .satuKali
                                    selectedOption = 0
                                }
                            }

                            Toggle(isOn: .constant(false)) {
                                Text("Batalkan langganan Kamu kapan saja")
                                    .font(.system(size: 12))

                            }
                            .toggleStyle(MyCheckboxToggleStyle())
                        }
                        .padding(.horizontal)

                        HStack {
                            Text("Jatuh tempo \(selectedMode == .bulanan ? "1 Mei 2026" : "8 Mei 2025")")
                            Spacer()
                            Text(selectedMode == .bulanan ? "Rp\(selectedOption == 0 ? "169.000" : "24.000")" : "Rp\(selectedOption == 0 ? "9.000" : "2.000")")
                        }
                        .font(.system(size: 12))
                        .padding(.horizontal,20)
                        
                        Button(action: {}) {
                            Text("Berlangganan")
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("color-primary"))
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        
                        VStack(spacing: 4) {
                            Text("Batalkan kapan saja. Langganan diperbarui otomatis.")
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                            (
                                Text("Dengan bergabung, Kamu menyetujui ")
                                + Text("Kebijakan Privasi").foregroundColor(.blue).underline()
                                + Text(" berserta ")
                                + Text("Persyaratan Privasi.").foregroundColor(.blue).underline()
                            )
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                    .padding(.top)
                    .padding(.bottom, 32)
                }
            }
            .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
            .navigationBarBackButtonHidden(true) // Hide default back button here
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func subscriptionCard(title: String, features: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)

            ForEach(features, id: \.self) { feature in
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text(feature)
                        .font(.subheadline)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            Spacer()
        }
        .frame(height: 280)
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    func optionButton(title: String, subtitle: String, index: Int) -> some View {
        Button(action: {
            selectedOption = index
        }) {
            HStack(spacing: 12) {
                Image(systemName: selectedOption == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(selectedOption == index ? .blue : .gray)
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.subheadline)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(selectedOption == index ? Color.blue : Color.gray.opacity(0.2), lineWidth: 2)
            )
        }
    }

    func subscriptionModeButton(text: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(isSelected ? Color("color-primary") : .white)
                .foregroundColor(isSelected ? .white : Color("color-primary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("color-primary"), lineWidth: 2)
                )
        }
    }
}

struct MyCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(.blue)
                configuration.label
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    DetailLanggananScreenView()
}

#Preview {
    DetailLanggananScreenView()
}




