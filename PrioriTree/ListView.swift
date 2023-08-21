//
//  ViewList.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import SwiftUI

struct ListView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    var body: some View {
        ZStack {
            Image("Back1")
                .resizable()
                .ignoresSafeArea()
            if listViewModel.items.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) {item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                NavigationLink {
                            ListView2()
                        }label: {
                            Text("Finish")
                            }
                        .font(.system(size: 18))
                        .padding(.horizontal, 100)
                        .padding(.vertical)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .position(x: 195, y: 300)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Manage Your Task's")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
