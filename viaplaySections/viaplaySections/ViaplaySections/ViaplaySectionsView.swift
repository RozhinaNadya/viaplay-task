//
//  ViaplaySectionsView.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import SwiftUI

struct ViaplaySectionsView: View {
    @EnvironmentObject var viewModel: ViaplaySectionsViewModel

    private typealias MyStrings = L10n.ViaplaySections
    private typealias MyImages = Images.Common
    private typealias MyColors = Colors.Common

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                MyImages.banner.justImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Group {
                    Text(MyStrings.title)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding(.vertical, 8)
                    if let sections = viewModel.viaplaySectionsTitles?.links.viaplaySections {
                        ForEach(sections) { section in
                            sectionRectangle(title: section.title)
                        }
                    } else {
                        HStack {
                            Spacer()
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .accentColor))
                            Spacer()
                        }
                        .padding(.top, 16)
                    }
                }
                .padding(.horizontal, 16)
            }
            .frame(maxWidth: .infinity)
        }
        .background(
            LinearGradient(
                gradient: .init(
                    colors: [
                        MyColors.backgroundLight.justColor,
                        MyColors.backgroungDark.justColor
                    ]
                ),
                startPoint: .leading,
                endPoint: .trailing
            ))
        .onAppear {
            viewModel.getSectionsTitles()
        }
    }

    @ViewBuilder
    func sectionRectangle(title: String) -> some View {
        VStack {
            Text(title)
                .foregroundColor(.white)
                .font(.title)
        }
        .frame(height: 100)
        .frame(maxWidth: .infinity)
        .mask(
            RoundedRectangle(cornerRadius: 10)
        )
        .background(
            RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.accentColor)
        )
    }
}

struct ViaplaySectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ViaplaySectionsView()
    }
}
