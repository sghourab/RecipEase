//
//  SearchBarView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-06-15.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    var placeholder: String
   
    
    init(placeholder: String, searchText: Binding<String>) {
        _searchText = searchText
        self.placeholder = placeholder
       
        
    }
    
  
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent
                )
            
            
            TextField(placeholder, text: $searchText)
                .foregroundColor(Color.theme.accent)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                   
                }
            
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.2),
                        radius: 10,
                        x: 0, y: 0)
        )
        .padding()
    }
    
    
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(placeholder: "Search recipe names or ingredients", searchText: .constant(""))
                .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
            
            SearchBarView(placeholder: "Search recipe names or ingredients", searchText: .constant(""))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.light)
    }
    }
}
