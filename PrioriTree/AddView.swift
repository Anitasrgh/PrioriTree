//
//  AddView.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type sesuatu", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(red: 200/255, green: 200/255, blue: 200/255))
                    .cornerRadius(10)
                Button(action: saveButtonPressed, label: {
                    Text("Save"
                        .uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(width: 80, height: 50)
                    .background(Color.accentColor)
                    .cornerRadius(10)
                    .position(x: 320, y: 50)
                }
                )
            }
            .padding(14)
        }
        .navigationTitle("Add The Item")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "at least 3 character Dude!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

// struct AddView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView {
//            AddView()
//        }
//        .environmentObject(ListViewModel())
//    }
// }
