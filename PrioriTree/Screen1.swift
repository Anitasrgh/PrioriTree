//
//  ContentView.swift
//  ParaCha
//
//  Created by Anita Saragih on 24/05/23.
//

import SwiftUI

struct Screen1: View {
    @State private var isShowingNextView = false
    @EnvironmentObject var listViewModel: ListViewModel
        var body: some View {
//            NavigationStack{

                ZStack {
                    Image("Screen1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 354.84, height: 87)
                        .position(x: 185, y: 60)
                        .padding()
                        .foregroundColor(.accentColor)
                    Image("Pohon1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 450, height: 700, alignment: .center)
                        .position(x: 200, y: 320)
                        .blur(radius: 0)
                    Image("Man1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 250, alignment: .center)
                        .position(x: 330, y: 480)
//                    Image("meja")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 150, height: 150, alignment: .center)
//                        .position(x: 200, y: 580)
//
                    Image("Woman1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 250, alignment: .center)
                        .position(x: 75, y: 490)
                    NavigationLink {
                                ListView()
                            }label: {
                                Text("Let's Start")
                                }
                            .font(.system(size: 18))
                            .padding(.horizontal, 100)
                            .padding(.vertical)
                            .background(.green)
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                            .position(x: 195, y: 700)
//                    Image("Produktiv")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 350, height: 310, alignment: .center)
//                        .background(Color.white)
//                        .position(x: 200, y: 300)
                }
                }
            }
// struct Screen1_Preview: PreviewProvider{
//    static var previews: some View{
//        Screen1()
//    }
// }
