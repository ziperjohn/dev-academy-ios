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
        VStack(alignment: .center, spacing: 20) {
            StoredAsyncImage(url: state.placeImageUrl!) { image in
                image
                    .resizable()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 4)
            } placeholder: {
                Image("placeholder")
                    .resizable()
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(radius: 4)
            }.overlay {
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.85)]),
                               startPoint: .top,
                               endPoint: .bottom).cornerRadius(20)
            }.overlay(alignment: .bottomLeading) {
                PlaceTitleSubtitleDistance(title: state.placeTitle, subtitle: state.placeAddress, titleColor: .white, subtitleColor: .white, coordinate: state.placeCoordinate)
                    .padding()
            }

            HStack(spacing: 40) {
                if let webUrl = state.webUrl {
                    CircleButton(icon: "globe", url: webUrl)
                }

                if let emailScheme = state.emailScheme {
                    CircleButton(icon: "envelope", url: emailScheme)
                }

                if let phoneScheme = state.phoneScheme {
                    CircleButton(icon: "phone", url: phoneScheme)
                }
            }

            if let coordinate = state.placeCoordinate {
                MapView(coordinate: coordinate)
                    .frame(height: 250)
                    .cornerRadius(20)
                    .padding(.horizontal)
            }

            Button {
                state.isFavourite.wrappedValue.toggle()
            } label: {
                HStack {
                    Image(systemName: state.isFavourite.wrappedValue ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(.red)

                    Text(state.isFavourite.wrappedValue ? "Remove from favourite" : "Add to favourite")
                }
            }

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
            .environmentObject(PlacesObservableObject(placesService: ProductionPlacesService()))
    }
}
