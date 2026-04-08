//
//  Introduction.swift
//  pask
//
//  Created by Benjamin Park on 2/23/25.
//  Written on
//

import SwiftUI

struct InstructionsViewPartA: View {
    @State private var instructionsViewNext = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            VStack {
                Image("Lockley")
                    .resizable()
                    .frame(width: 475, height: 360)
                
                Text("Salutations user,")
                    .fontWeight(.bold)
                    .lineSpacing(6)
                    .font(.system(size: 35, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .opacity(0.7)
                    .multilineTextAlignment(.center)
                    .frame(width: 430)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
                Text("It seems like you've stumbled into our security lab, welcome!")
                    .fontWeight(.bold)
                    .lineSpacing(10)
                    .font(.system(size: 35, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 430)
                    .padding(.top, 10)
                    .padding(.bottom, 50)

                
                Button(action: {
                    instructionsViewNext = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)

                        Text("Next")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
            }
            
            InstructionsViewPartB()
                .opacity(instructionsViewNext ? 1 : 0)
                .animation(.easeInOut, value: instructionsViewNext)
        }
    }
}

struct InstructionsViewPartB: View {
    @State private var instructionsViewFinal = false
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            VStack {
                Image("LockleyThinking")
                    .resizable()
                    .frame(width: 475, height: 360)
                
                Text("I'm Lockley, it's pleasure to meet you! Currently, we are we are currently developing a new defense system.")
                    .fontWeight(.bold)
                    .lineSpacing(10)
                    .font(.system(size: 35, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 460)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
                
                Button(action: {
                    instructionsViewFinal = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)

                        Text("How can I help?")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
            }
            
            InstructionsViewPartC()
                .opacity(instructionsViewFinal ? 1 : 0)
                .animation(.easeInOut, value: instructionsViewFinal)
        }
    }
}

struct InstructionsViewPartC: View {
    @State private var instructionsViewDirections = false
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            VStack {
                Image("LockleyGlad")
                    .resizable()
                    .frame(width: 475, height: 360)
                
                Text("Wow! Thank so much for asking! In order to design a new system, we must develop a special key. To create a key, some research must be conducted on learning new ways to secure passwords.")
                    .fontWeight(.bold)
                    .lineSpacing(10)
                    .font(.system(size: 30, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 500)
                    .padding(.top, 10)
                    .padding(.bottom, 50)
                
                
                Button(action: {
                    instructionsViewDirections = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)

                        Text("Next")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
            }
            
            InstructionsViewPartD()
                .opacity(instructionsViewDirections ? 1 : 0)
                .animation(.easeInOut, value: instructionsViewDirections)
        }
    }
}

struct InstructionsViewPartD: View {
    @State private var courseView = false
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            VStack {
                Text("Goal")
                    .font(.system(size: 100, design: .monospaced))
                    .padding(.top, 60)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.indigo)
                HStack {
                    Text("A key is made up of")
                        .fontWeight(.bold)
                        .lineSpacing(10)
                        .font(.system(size: 35, design: .monospaced))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                    
                    ZStack {
                        Text("3 components")
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                            .foregroundStyle(Color.indigo)
                            .multilineTextAlignment(.center)
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundStyle(Color.indigo)
                            .opacity(0.2)
                            .frame(maxWidth: 300, maxHeight: 70)
                    }
                    
                    
                }
                
                HStack {
                    ZStack {
                        Text("Research")
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                            .foregroundStyle(Color.indigo)
                            .multilineTextAlignment(.center)
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundStyle(Color.indigo)
                            .opacity(0.2)
                            .frame(maxWidth: 240, maxHeight: 70)
                    }
                    
                    Text(" to rebuild")
                        .fontWeight(.semibold)
                        .lineSpacing(6)
                        .font(.system(size: 35, design: .monospaced))
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                }
                
                Text("a brand new security system!")
                    .fontWeight(.semibold)
                    .font(.system(size: 35, design: .monospaced))
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 90)
                
                Button(action: {
                    courseView = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)
                        
                        Text("Let's Go!")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                    .fullScreenCover(isPresented: $courseView) {
                        PasswordCreationSplashView(courseView: $courseView)
                            .transition(.opacity)
                    }
                }
            }
        }
    }
}
