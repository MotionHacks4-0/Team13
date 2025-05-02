//
//  Problems+Helper.swift
//  BenerinAja
//
//  Created by Fa Ainama Caldera S  on 01/05/25.
//

import Foundation

enum LaptopProblem: String, Codable, CaseIterable {
    case broken = "Tidak bisa menyala"
    case blank = "Layar tidak tampil (blank screen)"
    case slow = "Laptop terasa lambat"
    case overheat = "Overheat (panas berlebih)"
    case battery = "Baterai boros/tidak bisa dicas"
    case input = "Keyboard/touchpad tidak berfungsi"
    case restart = "Laptop sering kali restart"
    case hardware = "Terkena air/kerusakan fisik"
    case software = "Masalah software: virus/os"
    case voice = "Tidak ada suara"
    case image = "Gambar kabur atau tidak jelas"
    case conslet = "Perangkat tersambar petir"
    case screen = "Ganti layar/panel"
    case port = "Port HDMI/USB rusak"
    case connection = "Tidak dapat mendapatkan koneksi jaringan"
    case channel = "Tidak dapat mengganti channel"
}

enum TelevisionProblem: String, Codable, CaseIterable {
    case broken = "Mati total"
    case voice = "Tidak ada suara"
    case image = "Gambar kabur atau tidak jelas"
    case conslet = "Perangkat tersambar petir"
    case screen = "Ganti layar/panel"
    case port = "Port HDMI/USB rusak"
    case connection = "Tidak dapat mendapatkan koneksi jaringan"
    case channel = "Tidak dapat mengganti channel"
}

enum ACProblem: String, Codable, CaseIterable {
    case Cooling = "Tidak dingin"
    case waterLeak = "Bocor air"
    case noisyWhenOn = "Berisik saat menyala"
    case completelyDead = "AC mati total"
    case badOdor = "Keluar bau tidak sedap"
}
enum CctvProblem: String, Codable, CaseIterable {
    case notPoweringOn = "Tidak menyala"
    case noDisplay = "Tidak menampilkan gambar"
    case blurryImage = "Gambar buram/tidak jelas"
    case notRecording = "Tidak merekam"
    case inaccessible = "Tidak bisa diakses via HP/PC"
    case dvrIssue = "DVR bermasalah"
}
enum WaterDispenserProblem: String, Codable, CaseIterable {
    case notHeating = "Tidak bisa memanaskan air"
    case notCooling = "Tidak bisa mendinginkan air"
    case noWaterFlow = "Air tidak keluar / macet"
    case leaking = "Bocor / air menetes"
    case runningButNotWorking = "Mesin menyala tapi tidak berfungsi"
    case burningSmell = "Bau gosong / komponen terbakar"
    case weirdNoise = "Terdengar suara aneh saat dinyalakan"
    case powerTrip = "Listrik mati saat alat dinyalakan"
    case indicatorOff = "Lampu indikator tidak menyala"
}
enum WashingMachineProblem: String, Codable, CaseIterable {
    case notPoweringOn = "Tidak bisa menyala"
    case noWaterFlow = "Air tidak keluar/masuk"
    case notSpinning = "Tidak bisa berputar/memutar"
    case vibratingOrWeirdNoise = "Mesin bergetar keras / bunyi aneh"
    case notRinsingOrDrying = "Tidak bisa membilas atau mengeringkan"
    case leaking = "Bocor / ada air keluar dari mesin"
    case controlNotWorking = "Tombol/layar kontrol tidak berfungsi"
    case burningSmell = "Tercium bau terbakar"
    case powerTrip = "Listrik mati saat mesin digunakan"
}
