//
//  MealView.swift
//  DietUI
//
//  Created by Ji Hye PARK on 6/2/24.
//

import SwiftUI

struct MealView: View {
    let mealType: String
    @State private var images: [UIImage] = []
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var mealNotes: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(images, id: \.self) { image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                    }

                    if images.count < 4 {
                        Button(action: {
                            showImagePicker = true
                        }) {
                            Image(systemName: "photo.on.rectangle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                if let selectedImage = selectedImage {
                    images.append(selectedImage)
                }
            }) {
                ImagePicker(image: $selectedImage)
            }
            .padding(.bottom, 10)

            TextEditor(text: $mealNotes)
                .frame(height: 100)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
        .padding()
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(mealType: "아침")
    }
}





