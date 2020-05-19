//
//  ContentView.swift
//  Messenger UI
//
//  Created by APPLE  on 18/05/20.
//  Copyright © 2020 Suresh Mopidevi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ChatListView()
                .tabItem {
                    Image(systemName: "ellipses.bubble.fill")
                    Text("Chat")
                }
            DeveloperProfileView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Developer")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
