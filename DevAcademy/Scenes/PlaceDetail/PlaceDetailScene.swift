//
//  PlaceDetailsScene.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 06.08.2023.
//

import SwiftUI

struct PlaceDetailScene: View {
    @Environment(\.dismiss) var dismiss
    let state: PlaceDetailViewState

    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: state.placeImageUrl) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            } placeholder: {
                ProgressView()
            }.overlay {
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.85)]),
                               startPoint: .top,
                               endPoint: .bottom).cornerRadius(20)
            }.overlay(alignment: .bottomLeading) {
                PlaceTitleSubtitleDistance(title: state.placeTitle, subtitle: state.placeType, titleColor: .white, subtitleColor: .white, coordinate: state.placeCoordinate)
                    .padding()
            }

            Text("Location")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            MapView(coordinate: state.placeCoordinate)
                .frame(height: 250)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1))
                .padding(.horizontal)

            Spacer()
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
        PlaceDetailScene(state: PlaceDetailViewState(place: Places.mock.places[0]))
    }
}
