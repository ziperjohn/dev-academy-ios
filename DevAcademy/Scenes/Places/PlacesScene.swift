//
//  PlacesScene.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 25.07.2023.
//

import ActivityIndicatorView
import SwiftUI

struct PlacesScene: View {
    @State var features: [Feature] = []
    @State var showFavorites = false

    var body: some View {
        NavigationStack {
            Group {
                if !features.isEmpty {
                    List(features, id: \.properties.ogcFid) { feature in
                        NavigationLink(destination: PlaceDetail(feature: feature)) {
                            PlacesRow(feature: feature)
                        }
                    }
                    .animation(.default, value: features)
                    .listStyle(.plain)
                } else {
                    ActivityIndicatorView(isVisible: .constant(true), type: .growingCircle)
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 150)
                }
            }
            .navigationTitle("Kultůrní mapa Brna")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    showFavorites.toggle()
                } label: {
                    Image(systemName: "heart.fill").font(.headline)
                }
            }
        }
        .onAppear(perform: fetch)
        .sheet(isPresented: $showFavorites) {
            Text("Nic tu není")
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
        }
    }

    func fetch() {
        DataService.shared.fetchData { result in
            switch result {
            case .success(let features):
                self.features = features.features
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct PlacesScene_Previews: PreviewProvider {
    static var previews: some View {
        PlacesScene()
    }
}
