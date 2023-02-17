//
//  MainView.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            iPhoneView()
        } else {
            iPadView()
        }
    }
    
    struct iPhoneView: View {
        
        @State private var selectedTab = 0
        
        var body: some View {
            TabView(selection: $selectedTab) {
                LinkUploadView().environmentObject(LinkUploadState())
                    .tabItem {
                        Image(systemName: "doc.on.doc")
                        Text("Upload a link")
                    }
                    .tag(0)
                
                LinkListView().environmentObject(LinkListState())
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Link list")
                    }
                    .tag(1)
                
                Text("Tab 3")
                    .tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(2)
                
            }
        }
    }
    
    struct iPadView: View {
        
        @State var orientation = UIDevice.current.orientation
        
        var body: some View {
            Group{
                if orientation == .portrait {
                    portrait
                } else {
                    landscape
                }
            }.onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
        }
        
        var portrait: some View {
            VStack {
                Spacer()
                LinkUploadView().environmentObject(LinkUploadState())
                Spacer()
                LinkListView().environmentObject(LinkListState())
                Spacer()
            }
        }
        
        var landscape: some View {
            HStack{
                Spacer()
                LinkUploadView().environmentObject(LinkUploadState())
                Spacer()
                LinkListView().environmentObject(LinkListState())
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
