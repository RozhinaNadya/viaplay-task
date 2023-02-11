//
//  ViaplaySectionsView.swift
//  viaplaySections
//
//  Created by Nadya Rozhina on 2023-02-11.
//

import SwiftUI

struct ViaplaySectionsView: View {
    @EnvironmentObject var viewModel: ViaplaySectionsViewModel

    var body: some View {
        ScrollView {
            VStack {
                if let sections = viewModel.viaplaySectionsTitles?.links.viaplaySections {
                    ForEach(sections) { section in
                        Text(section.title)
                    }
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.getSectionsTitles()
        }
    }
}

struct ViaplaySectionsView_Previews: PreviewProvider {
    static var previews: some View {
        ViaplaySectionsView()
    }
}
