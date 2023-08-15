//
//  PlaceDetailsScene.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 06.08.2023.
//

import SwiftUI

struct PlaceDetail: View {
    let feature: Feature

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: feature.properties.obrId1) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    ProgressView()
                }.overlay {
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.85)]),
                                   startPoint: .top,
                                   endPoint: .bottom).cornerRadius(20)
                }.overlay(alignment: .bottomLeading) {
                    PlaceTitleSubtitleDistance(title: feature.properties.nazev, subtitle: feature.properties.druh.rawValue, titleColor: .white, subtitleColor: .white, coordinate: feature.geometry)
                        .padding()
                }

                Spacer()

                Text("Další obsah")

                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(.black.opacity(0.4))
                        .clipShape(Circle())
                }
            }
        }
    }
}

struct PlaceDetail_Previews: PreviewProvider {
    static var previews: some View {
        PlaceDetail(feature: Features.mock.features[0])
    }
}
