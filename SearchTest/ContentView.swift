//
//  ContentView.swift
//  SearchTest
//
//  Created by 이경민 on 2022/05/12.
//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    @StateObject var viewModel = FoodSearchViewModel()
    var body: some View {
        VStack{
            HStack{
                TextField("음식이름을 검색해주세요.", text: $viewModel.searchTerm)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: viewModel.searchTerm) { newValue in
                        viewModel.getResults(searchTerm: newValue) { results in
                            viewModel.results = results
                        }
                    }
                    
                
                Button {
                    viewModel.getResults(searchTerm: viewModel.searchTerm) { results in
                        viewModel.results = results
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title3)
                }

            }
            .padding()
            List{
                ForEach(viewModel.results){ result in
                    Text(result.name?.raw ?? "Example")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
