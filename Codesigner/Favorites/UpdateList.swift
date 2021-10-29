//
//  UpdateList.swift
//  SwiftUIDemo
//
//  Created by LEE on 2019/10/9.
//  Copyright © 2019 Lee. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    
    var updates = updateDate
    @EnvironmentObject var store: UpdateStore
    
    func addItem() {
        store.updates.append(Update(image: "Illustration1", title: "SwiftUI", text: "", date: "JUN 26"))
    }
    func move(from source: IndexSet, to destination: Int) {
        store.updates.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationView {
            
            VStack {
                Button(action: addItem) {
                    Text("Add Item")
                        .foregroundColor(.white)
                }
                .padding(8)
                .background(Color("background3"))
                .cornerRadius(8)
                
                List {
                    ForEach(store.updates) { item in
                        NavigationLink(destination: UpdateDetail(title: item.title, text: item.text, image: item.image)) {
                            HStack(spacing: 12.0) {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.text)
                                        .lineLimit(2)
                                        .lineSpacing(4)
                                        .font(.subheadline)
                                    Text(item.date)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete { indexSet in
                        self.store.updates.remove(at: indexSet.first!)
                    }
                    .onMove(perform: move)
                }
                .navigationBarTitle("Notification")
                .navigationBarItems(trailing:
                    EditButton()
                )
            }
            
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateDate = [
    Update(image: "Illustration1", title: "SwiftUI", text: "Congratulations! You have completed the study of 3DCarouselSlider", date: "JUN 26"),
    Update(image: "Illustration2", title: "Algorithm", text: "Congratulations! You have completed the study of bubble sorting", date: "JUN 27"),
    Update(image: "Illustration3", title: "SwiftUI", text: "Congratulations! You have completed the study of HalfModalSheet", date: "JUN 26"),
    Update(image: "Illustration4", title: "SwiftUI", text: "Congratulations! You have completed the study of radix sorting", date: "JUN 26")
]
