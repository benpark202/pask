//
//  About.swift
//  pask
//
//  Created by Benjamin Park on 2/23/25.
//
import SwiftUI

struct AboutView: View {
    @State private var returnHome = false;
    @State private var contentAppear = false;
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 200, height: 200)
                        .opacity(contentAppear ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                contentAppear = true
                            }
                        }
                    Circle()
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [.cyan.opacity(0.5), .cyan.opacity(0.4)]), startPoint: .top, endPoint: .bottom))
                        .frame(width: 200, height: 200)
                        .opacity(contentAppear ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                contentAppear = true
                            }
                        }
                    Image("myMemoji")
                        .resizable()
                        .frame(width: 180, height: 180)
                        .opacity(contentAppear ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                contentAppear = true
                            }
                        }
                }
                ZStack {
                    Rectangle()
                        .frame(width: 450, height: 90)
                        .foregroundStyle(Color.indigo)
                        .cornerRadius(20)
                        .padding(.bottom, 20)
                        .padding(.top, 60)
                        .opacity(0.2)
                        .opacity(contentAppear ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                contentAppear = true
                            }
                        }
                    Text("Hello world!")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.indigo)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 50, design: .monospaced))
                        .padding(.bottom, 20)
                        .padding(.top, 60)
                        .opacity(contentAppear ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.5)) {
                                contentAppear = true
                            }
                        }
                }
                Text("Welcome to Pask, the game that teaches you how to create strong the strongest password and protect your online identity! Learn more throughout the interactive lesson! ")
                    .fontWeight(.bold)
                    .frame(width: 600)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30, design: .monospaced))
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    .opacity(contentAppear ? 0.6 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.5)) {
                            contentAppear = true
                        }
                    }
                Button(action: {
                    returnHome = true;
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
                        Text("Done")
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
            }
            .fullScreenCover(isPresented: $returnHome) {
                ContentView()
            }
        }
    }
}
