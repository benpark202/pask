//
//  ContentView.swift
//  pask
//
//  Created by Benjamin Park on 12/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var instructionsView = false
    @State private var aboutView = false
    
    // Title Animations
    @State private var contentAppear = false
    @State private var creditsView = false
    @State private var vaultOffset: CGFloat = 0;

    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            VStack {
                Image(.vault1)
                    .resizable()
                    .opacity(contentAppear ? 1 : 0)
                    .offset(y: vaultOffset)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2).repeatForever(autoreverses: true)) {
                            contentAppear = true
                            vaultOffset = -60
                        }
                    }
                    .frame(width: 350, height: 250)
                
                Text("Pask")
                    .font(.system(size: 100, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .opacity(contentAppear ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            contentAppear = true
                        }
                    }
                    .padding(.bottom, 50)
                
                Button(action: {
                    instructionsView = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)
                            .opacity(contentAppear ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    contentAppear = true
                                }
                            }
                        Text("Begin")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                            .opacity(contentAppear ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    contentAppear = true
                                }
                            }
                    }
                }
            
            Button(action: {
                    aboutView = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)
                            .opacity(0.2)
                            .opacity(contentAppear ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    contentAppear = true
                                }
                            }
                        Text("About")
                            .foregroundStyle(Color.indigo)
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                            .opacity(contentAppear ? 1 : 0)
                            .onAppear {
                                withAnimation(.easeIn(duration: 1.5)) {
                                    contentAppear = true
                                }
                            }
                    }
                }
            }
            InstructionsViewPartA()
                .opacity(instructionsView ? 1 : 0)
                .animation(.easeInOut, value: instructionsView)

                .fullScreenCover(isPresented: $aboutView) {
                    AboutView()
                }
        }
    }
}

#Preview {
    ContentView()
}
