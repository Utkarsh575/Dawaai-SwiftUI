//
//  HistoryView.swift
//  DawaaiSwiftUi
//
//  Created by user1 on 21/02/24.
//
import SwiftUI
import Foundation
struct HistoryView: View {
    @State private var tileData: [String] = ["Dolo 650", "Amyron", "Amodep AT", "Crocin", "Disprin", "Burnol"]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(minimum: 200))]) {
                    ForEach(tileData, id: \.self) { title in
                        TileView(title: title)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("HISTORY")
            .background(Color("bgColor"))
        }
    }
}

struct TileView: View {
    let title: String

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)

            VStack {
                // Optionally add an image here if needed
                // Image("imageName")
                //     .resizable()
                //     .aspectRatio(contentMode: .fit)
                //     .clipShape(RoundedRectangle(cornerRadius: 10)) // Match corner radius

                Text(title)
                    .font(.title3)
                    .multilineTextAlignment(.center) // Center align multi-line text

                // Add more content as needed
            }
            .padding(20) // Adjust padding if necessary
        }
        .frame(maxWidth: .infinity) // Ensure tiles expand to fill the width
    }
}

#Preview {
    ContentView()
}
