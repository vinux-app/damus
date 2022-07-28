//
//  CarouselView.swift
//  damus
//
//  Created by William Casarin on 2022-05-20.
//

import SwiftUI

struct CarouselItem: Identifiable {
    let image: Image
    let text: Text
    
    let id = UUID().uuidString
}

let carousel_items = [
    CarouselItem(image: Image("logo-nobg"),
                 text: Text("DAMUS")),
    CarouselItem(image: Image("bitcoin-p2p"),
                 text: Text("Censorship Resistant \(Text("\n")) Social Network.")),
    CarouselItem(image: Image("undercover"),
                 text: Text("Accounts require \(Text("\n")) no personal information!")),
    CarouselItem(image: Image("encrypted-message"),
                 text: Text("End-to-End \(Text("\n")) \(Text("encrypted").bold()) messaging."))
]

struct CarouselView: View {
    var body: some View {
        TabView {
            ForEach(carousel_items) { item in
                CarouselItemView(item: item)
                    .tabItem {
                        Text(item.id)
                    }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

func CarouselText(_ txt: String) -> some View {
    return Text(txt)
}

struct CarouselItemView: View {
    let item: CarouselItem
            
    var body: some View {
    // activate landscape changes
    HStack(spacing: 10) {
        item.image
            .resizable()
            .frame(width: 80, height: 80)
        item.text
            .multilineTextAlignment(.center)
            .font(.title2)
            .foregroundColor(Color.white)
            .padding([.leading,.trailing], 10.0)
}}}
