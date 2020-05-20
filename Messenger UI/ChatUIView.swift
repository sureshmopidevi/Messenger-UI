//
//  ChatUI.swift
//  Open News
//
//  Created by APPLE  on 02/03/20.
//  Copyright © 2020 Suresh Mopidevi. All rights reserved.
//

import SwiftUI

struct ChatUIView: View {
    @State var message = ""
    fileprivate var someMessages: [MessagesData] = {
        var messages: [MessagesData] = []
        for i in 1 ... 20 {
            if i % 3 == 0 {
                let message = MessagesData(id: UUID())
                messages.append(message)
            } else {
                let message = MessagesData(id: UUID())
                messages.append(message)
            }
        }
        return messages
    }()

    var body: some View {
        VStack {
            ChatView(messages: someMessages)
            bottomTextBar(state: $message)
        }
        .padding(0)
        .navigationBarTitle("Chat UI")
    }

    func bottomTextBar(state: Binding<String>) -> some View {
        return HStack(spacing: 4) {
            Button(action: {
                print("button pressed")
                   }) {
                Image(systemName: "paperclip.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.gray)
            }.padding(8)
            TextField("Write your message", text: state)
                .foregroundColor(.white)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                print("button pressed")
                   }) {
                Image(systemName: "arrow.right.circle.fill")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color.init(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
            }.padding(8)
        }
        .padding(4)
        .background(Color(white: 0.97))
    }
}

struct ChatUI_Previews: PreviewProvider {
    static var previews: some View {
        ChatUIView()
    }
}

struct ChatView: View {
    fileprivate var messages: [MessagesData] = []
    var body: some View {
        List(messages, id: \.id) { mess in
            if mess.isFromcurrentSender {
                OutgoingMessageView(message: mess.message)
            } else {
                IncomingMessageView(message: mess.message)
            }
        }.onAppear {
            UITableView.appearance().backgroundColor = .white
            UITableView.appearance().separatorStyle = .none
        }
    }
}

struct IncomingMessageView: View {
    var message: String
    var body: some View {
        HStack(alignment: .top) {
            // MARK: Profile Stack

            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Image("images")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                }
            }

            // MARK: Bubble Stack

            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(message)
                        .foregroundColor(.black)
                        .font(.system(size: 16))
                        .padding(8)
                        .clipped()
                    Text("10:20 AM").font(.caption)
                        .foregroundColor(Color(white: 0.6))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                }.background(Color(white: 0.9))
                    .cornerRadius(8)
            }

            Spacer()
        }
    }
}

struct OutgoingMessageView: View {
    var message: String
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            VStack(alignment: .trailing) {
                VStack(alignment: .trailing) {
                    Text(message)
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                        .padding(8)
                        .clipped()
                    Text("12:40 PM").font(.caption)
                        .foregroundColor(Color(white: 0.9))
                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                }
                .background(Color(#colorLiteral(red: 0.4711452723, green: 0.4828599095, blue: 0.9940789342, alpha: 1)))
                .cornerRadius(8)
            }
        }
    }
}

struct ChatBubble: Shape {
    let isFromCurrentSender: Bool
    func path(in rect: CGRect) -> Path {
        let cgpath = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft, .bottomRight, isFromCurrentSender ? .topLeft : .topRight], cornerRadii: CGSize(width: 12, height: 12))
        return Path(cgpath.cgPath)
    }
}

public struct MessagesData: Identifiable {
    public var id: UUID = UUID()
    var suffleUser: [Bool] {
        return [
            true, false, true, false,
        ]
    }

    var isFromcurrentSender: Bool {
        return suffleUser.randomElement() ?? true
    }

    var dummyMessages: [String] {
        return ["Harry Harry Hello thre", "Rossa are bule rush",
                "DuckDuckGo is an Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs. With our roots as the search engine that doesn’t t", "Cook",
                "Carolyn", "th our roots as the search engine that doesn’t track you, we’ve expanded what we do to protect you no matter where you go on the Internet. Check out our stor",
                "Albert", "Walker",
                "Randy", "At DuckDuckGo, we don’t think the Internet should feel so creepy and getting the privacy you deserve online should be as simple as closing the blinds.",
                "Larry", "Barnes",
                "You deserve privacy. Companies are making DuckDuckGo is an Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs. With our roots as the search engine that doesn’t t money off of your private information online without y", "Wilson",
                "Jesse", "Campbell",
                "We’re setting the new standard of trust online, empowering people to take control of their information.", "Rogers",
                "Theresa", "Patterson",
                "Internet should feel so creepy and getting the pri", "Simmons",
                "g together on a mission to set a new standard of trust online.", "Perry",
                "Frank", "Butler",
                "DuckDuckGo is an Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs. With our roots as the search engine that doesn’t tDuckDuckGo is an Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs. With our roots as the search engine that doesn’t tDuckDuckGo is an Internet privacy company that empowers you to seamlessly take control of your personal information online, without any tradeoffs. With our roots as the search engine that doesn’t t"]
    }

    var message: String {
        return dummyMessages.randomElement() ?? "Suresh"
    }
}
