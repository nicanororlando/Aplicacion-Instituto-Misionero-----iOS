//
//  ContentView.swift
//  Instituto Misionero
//
//  Created by Nicanor Orlando on 19/10/2021.
//  Copyright © 2021 KnorDev. All rights reserved.
//

import SwiftUI
import Combine

struct Home: View {
    
    @State private var showModal = false
    @State var navigateToCoritario = false
    @State var navigateToAcercaDe = false
    
    var body: some View {
        NavigationView {
            ZStack{
            Image("fondo13")
                .resizable()
                .scaledToFill()
                .blur(radius: 3)
            
            VStack{
                Spacer()
                
                // IM //
                Button(action: {
                    self.showModal = true
                }) {
                VStack{
                    Image("icono_im")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .padding(.bottom, -10)
                        .padding(.top, 7)
                    Text("Instituto")
                        .foregroundColor(Color(UIColor(named: "dark-grey")!))
                        .fontWeight(.semibold)
                        .offset(x: 0, y: 0)
                    Text("Misionero")
                        .foregroundColor(Color(UIColor(named: "semi-dark-red")!))
                        .fontWeight(.semibold)
                        .offset(x: 0, y: 0)
                    }
                }
                .padding(.bottom,25)
                .buttonStyle(filledRoundedCornerButtonStyle(font: .largeTitle, padding: 10, bgColor: Color.white.opacity(0.7), bgColor2: Color.gray.opacity(0.7), fgColor: .white, cornerRadius: 20, opacity: 1.0, X: 0, Y: 0))
                // END Im //
                
                // CORITARIO //
                Button(action: {
                    self.navigateToCoritario = true
                }) {
                HStack{
                    Image(systemName: "music.note.list")
                    Text("Coritario")
                        .fontWeight(.semibold)
                    }
                }
                .padding(.bottom,10)
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 20, bgColor: Color.white.opacity(0.7), bgColor2: Color.gray.opacity(0.5), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: 0))
                // END Coritario //
                
                // ACERCA DE //
                Button(action: {
                    self.navigateToAcercaDe = true
                }) {
                HStack{
                    Image(systemName: "info.circle")
                    Text("Acerca de nosotros")
                        .fontWeight(.semibold)
                    }
                }
                .buttonStyle(filledRoundedCornerButtonStyle(font: .title, padding: 15, bgColor: Color.white.opacity(0.6), bgColor2: Color.gray.opacity(0.5), fgColor: .white, cornerRadius: 10, opacity: 1, X: 0, Y: 0))
                // END Acerca de  //
                
                Spacer()
                    .frame(height: 30)
                
                }// --> VStack
                .background(
                    Group{
                        NavigationLink(
                            destination: ListView(),
                            isActive: $navigateToCoritario,
                            label: {
                                EmptyView()
                            })
                        NavigationLink(
                            destination: ListInfoView(),
                            isActive: $navigateToAcercaDe,
                            label: {
                                EmptyView()
                            })
                    }// --> Group
                    .hidden()
                )
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .background(Color.white.opacity(0))
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
            ModalView(isShowing: $showModal)
            }// --> ZStack
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .statusBar(hidden: true)
        }// --> Nav view
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
