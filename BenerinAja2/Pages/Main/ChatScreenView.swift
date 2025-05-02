//
//  ChatScreenView.swift
//  BenerinAja-Beta
//
//  Created by Ranzyah Adinata Aldo on 01/05/25.
//

import SwiftUI

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let date: String
    let imageName: String
    let unreadCount: Int
}

import SwiftUI

struct ChatScreenView: View {
    let chats: [Chat] = [
        Chat(name: "Andi", message: "Lalalalalaa", date: "30/4", imageName: "andi", unreadCount: 1),
        Chat(name: "Khusni", message: "Lalalalalaa", date: "30/4", imageName: "khusni", unreadCount: 1),
        Chat(name: "Andi", message: "Lalalalalaa", date: "30/4", imageName: "andi", unreadCount: 1),
        Chat(name: "Khusni", message: "Lalalalalaa", date: "30/4", imageName: "khusni", unreadCount: 1)
    ]
    
    @State private var selectedTab: Tab = .chat

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(Color("color-primary"))
                    .frame(height: 100)
                    .overlay(
                        Text("Chat")
                            .font(.system(size: 25, weight: .black))
                            .foregroundColor(.white)
                            .padding(.top, 50)
                            .padding(.leading, 20),
                        alignment: .topLeading
                    )
                    .padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text("Pilihan fitur")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        CircleIcon(systemName: "envelope.fill")
                        CircleIcon(systemName: "headphones")
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
                
                Text("Chat kamu")
                    .font(.headline)
                    .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(chats) { chat in
                            ChatRow(chat: chat)
                                .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 100) 
                }
            }
            .background(Color("color-alt-white"))
            .ignoresSafeArea(edges: .top)
            
            MenuBarView(selectedTab: $selectedTab, isVisible: true)
                .zIndex(1)
                .padding(.bottom, 0)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CircleIcon: View {
    let systemName: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color("color-primary"))
                .frame(width: 60, height: 60)
            Image(systemName: systemName)
                .foregroundColor(Color("color-alt-white"))
                .font(.system(size: 24))
        }
    }
}

struct ChatRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(alignment: .top) {
            Image(chat.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 54)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Text(chat.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Text(chat.message)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                if chat.unreadCount > 0 {
                    HStack {
                        Spacer()
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 16, height: 16)
                            .overlay(
                                Text("\(chat.unreadCount)")
                                    .font(.caption2)
                                    .foregroundColor(Color("color-alt-white"))
                            )
                    }
                }
                Divider()
            }
        }
        .padding(.vertical, 8)
        .background(Color("color-alt-white"))
        .cornerRadius(8)
        
    }
}


#Preview {
    ChatScreenView()
}
