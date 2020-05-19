//
//  ChatListView.swift
//  Messenger UI
//
//  Created by APPLE  on 18/05/20.
//  Copyright © 2020 Suresh Mopidevi. All rights reserved.
//

import Foundation
import SwiftUI

struct ChatListView: View {
    var chatRooms: [ChatRoom] {
        [ChatRoom(title: "Bunny", lastMessage: "Check out my lastest UI design on Github", timestamp: "10:10 AM", tag: 3, avatarImage: "images"),
         ChatRoom(title: "Suresh", lastMessage: "Great apps on the way ♥️", timestamp: "09:45 AM", tag: 0, avatarImage: "images-1"),
         ChatRoom(title: "Mounika", lastMessage: "Check out this latest SwiftUI from @suresh", timestamp: "08:20 AM", tag: 1, avatarImage: "images-2"),
         ChatRoom(title: "Prasad", lastMessage: "Great, Lets do this", timestamp: "11:23 PM", tag: 2, avatarImage: "images-3"),
         ChatRoom(title: "John", lastMessage: "Great work, Thanks!", timestamp: "12:23 PM", tag: 4, avatarImage: "images-4"),
         ChatRoom(title: "Pavan", lastMessage: "ChatUI design in SwiftUI", timestamp: "08:21 AM", tag: 5, avatarImage: "images-5"),
         ChatRoom(title: "SwiftUI", lastMessage: "ChatUI design in SwiftUI", timestamp: "10:10 AM", tag: 6, avatarImage: "images-6"),
         ChatRoom(title: "Mohan", lastMessage: "ChatUI design in SwiftUI", timestamp: "10:10 AM", tag: 7, avatarImage: "images-7"),
         ChatRoom(title: "Bobby", lastMessage: "ChatUI design in SwiftUI", timestamp: "10:10 AM", tag: 8, avatarImage: "images-8"),
         ChatRoom(title: "Smarty", lastMessage: "ChatUI design in SwiftUI", timestamp: "10:10 AM", tag: 9, avatarImage: "images-9")]
    }

    var body: some View {
        NavigationView {
            ZStack {
                Rectangle()
                    .colorInvert()
                VStack(alignment: .leading) {
                    Text("Recents")
                        .font(.headline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading])
                    ScrollView(.horizontal) {
                        HStack(spacing: 0.0) {
                            ForEach(self.chatRooms, id: \.self) { room in
                                self.recentChats(avatar: room.avatarImage, name: room.title)
                            }
                        }
                    }
                    List(self.chatRooms, id: \.self) { room in
                        NavigationLink(destination: ChatUIView()) {
                            self.chatRoomCard(room: room)
                        }.navigationBarHidden(true)
                    }.padding(.top)
                }
            }
            .navigationBarTitle("Messenger", displayMode: .inline)
            .navigationBarItems(leading: Image(systemName: "magnifyingglass"), trailing: Image(systemName: "plus.circle"))
        }
        .navigationViewStyle(DefaultNavigationViewStyle())
        .padding(0)
    }

    func recentChats(avatar: String, name: String) -> some View {
        return VStack(alignment: .center) {
            Image(avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.blue, lineWidth: 2)
                ).padding(.top, 2)
            Text(name)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }.padding([.horizontal], 12.0)
    }

    func chatRoomCard(room: ChatRoom) -> some View {
        return VStack {
            HStack(alignment: .top, spacing: 16.0) {
                Image(room.avatarImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                VStack(alignment: .leading, spacing: 4.0) {
                    Text(room.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(1)
                    Text(room.lastMessage)
                        .font(.system(size: 15))
                        .foregroundColor(.init(white: 0.5))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                Spacer()
                HStack(alignment: .top) {
                    Text(room.timestamp)
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.trailing)
                }
            }.padding(6)
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}

struct ChatRoom: Hashable {
    var title: String
    var lastMessage: String
    var timestamp: String
    var tag: Int
    var avatarImage: String
}

extension Color {
    static func colorLiteral(customized: UIColor) -> Color {
        return Color(customized)
    }
}
