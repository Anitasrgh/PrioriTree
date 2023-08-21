//
//  ViewList.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import SwiftUI
import UserNotifications

struct ListView2: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var imgTree: String = "Baru"
    @State var finish: Int = 0
    @State var heightTree: Double = 200
    var body: some View {
        ZStack(alignment: .top) {
            Image("Back1")
                .resizable()
                .ignoresSafeArea()
            List {
                ForEach(listViewModel.items) {item in
                    ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                                print(item.isCompleted)
                                if item.isCompleted==false {
                                    finish += 1
                                } else {
                                    finish -= 1
                                }
                                if finish==0 {
                                    imgTree = "Baru"
                                }
                                if finish==1 {
                                    imgTree = "Tumbuh"
                                    heightTree = 400
                                    print("Tumbuh")
                                } else if finish==2 {
                                    imgTree = "Pohon1"
                                    heightTree = 500
                                    print("Besar")
                                } else if finish==3 {
                                    imgTree = "Berbuah"
                                    heightTree = 850
                                    print("Berbuah")
                                } else {
                                    heightTree = 200
                                }
                                print(finish)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            ZStack(alignment: .bottom) {
                Image(imgTree)
                    .resizable()
                    .scaledToFit()
                    .frame(height: heightTree, alignment: .center)
                    .position(x: 200, y: 460)
            }
        }.frame(maxHeight: .infinity).onAppear {
            checkTree()
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Here Your Priority Tasks")
        .navigationBarItems(trailing: Button {self.send()}
                            label: {Text("Send Notification")}
            .padding(.horizontal)
            .foregroundColor(.blue))
    }
    func checkTree() {
        print("check")
        for injak in 0..<listViewModel.items.count where listViewModel.items[injak].isCompleted {
            finish += 1
        }
        print(finish)
        if finish==0 {
            imgTree = "Baru"
        } else if finish==1 {
            imgTree = "Tumbuh"
            heightTree = 400
            print("Tumbuh")
        } else  if finish==2 {
            imgTree = "Pohon1"
            heightTree = 500
            print("Besar")
        } else if finish==3 {
            imgTree = "Berbuah"
            heightTree = 850
            print("Berbuah")
        } else {
            heightTree = 200
        }
    }
    func send() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        let content = UNMutableNotificationContent()
        content.title = "Message"
        content.subtitle = "New Tutorial from PrioriTree!!"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct ListView2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView2()
        }
        .environmentObject(ListViewModel())
    }
}
