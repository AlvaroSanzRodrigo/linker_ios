//
//  LinkUploadView.swift
//  linker
//
//  Created by Sanz Copacabana on 16/2/23.
//

import SwiftUI

struct LinkUploadView: View {
    
    @State private var link = ""
    @EnvironmentObject var state: LinkUploadState
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Link to upload:").padding([.trailing, .leading], .padding.mediumPadding)
            

            HStack {
                TextField("https://link.to/upload", text: $link)
                    .padding(.all, 4)
                    
                
                Button(action: {
                    link = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
                .padding()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
            
            HStack {
                Spacer()
                Button {
                    print(link)
                    state.uploadLink(link: link.replacingOccurrences(of: "127.0.0.1:11470", with: "192.168.1.102:11470"))
                } label: {
                    HStack {
                        Text("Upload")
                    }
                }
                Spacer()
            }
            
        }
    }
}

struct LinkUploadView_Previews: PreviewProvider {
    static var previews: some View {
        LinkUploadView()
    }
}
