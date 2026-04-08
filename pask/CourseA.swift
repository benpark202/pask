import SwiftUI

// Stopwatch Capability
class Stopwatch: ObservableObject {
    @Published var seconds: Int = 0;
    var timer: Timer?
    
    func start() {
        timer?.invalidate();
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.seconds += 1
        })
    }
    
    func stop() {
        timer?.invalidate();
    }
    
    func reset() {
        stop()
        seconds = 0; // Reset the timer back to ero
    }
    
    func formatClock() -> String {
        let minutes = seconds / 60;
        let seconds = seconds % 60
        return "\(minutes):" + (seconds < 10 ? "0\(seconds)" : "\(seconds)")
    }
}

struct PasswordCreationSplashView: View {
    @State private var instructionsView = false
    @State private var entryView = false
    @Binding var courseView: Bool;
    
    let toPrint = "> Opening Lab..."
    @State private var title = ""

    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Text(title)
                    .font(.system(size: 60, design: .monospaced))
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.indigo)
                    .onAppear {
                        toPrint.enumerated().forEach {
                            index, letter in
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.1) {
                                title.append(letter)
                            }
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            entryView = true;
                        }
                    }
            }
        }
        .fullScreenCover(isPresented: $entryView) {
            PasswordCreationStepA(entryView: $entryView)
                .transition(.opacity)
        }

    }
}

struct PasswordCreationStepA: View {
    @State private var instructionsView = false
    @Binding var entryView: Bool

    let toPrint = "Make your password at least 12 or more characters."
    @State private var message = ""

    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Text("MASTER THE")
                    .font(.system(size: 35, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .opacity(0.5)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                Text("Password")
                    .font(.system(size: 100, design: .monospaced))
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.indigo)
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color.white)
                        .opacity(0.05)
                        .cornerRadius(50)
                        .padding(.top, 0)
                        .padding(.leading, 90)
                        .padding(.trailing, 90)
                        .padding(.bottom, 40)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color("TriMidnight"))
                        .cornerRadius(50)
                        .padding(.bottom, 60)
                        .padding(.leading, 70)
                        .padding(.trailing, 70)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color("LightMidnight"))
                        .cornerRadius(50)
                        .padding(.bottom, 90)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    
                    
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 100, height: 100, alignment: .topLeading)
                                    .foregroundStyle(.indigo)
                                    .padding(.leading, 100)
                                    .padding(.bottom, 120)
                                    .padding(.top, 60)
                                Text("1")
                                    .fontWeight(.semibold)
                                    .font(.system(size: 40, design: .monospaced))
                                    .foregroundStyle(Color("Midnight"))
                                    .padding(.top, 60)
                                    .padding(.leading, 100)
                                    .padding(.bottom, 120)
                            }
                            VStack {
                                Text("Longer is stronger")
                                    .font(.system(size: 35, design: .monospaced))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, 20)
                                    .padding(.top, 60)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text(message)
                                    .font(.system(size: 30, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .lineSpacing(10)
                                    .padding(.bottom, 120)
                                    .padding(.top, 1)
                                    .foregroundStyle(Color.white)
                                    .opacity(0.5)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 80)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .onAppear {
                                        toPrint.enumerated().forEach {
                                            index, letter in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
                                                message.append(letter)
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }

                    Button(action: {
                        instructionsView = true
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 150, maxHeight: 80)
                                .cornerRadius(200)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 15, height: 25)
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.heavy)
                                .padding(.leading, 5)
                            Spacer()
                        }
                    }
                .fullScreenCover(isPresented: $instructionsView) {
                    PasswordCreationStepB(instructionsView: $instructionsView)
                        .transition(.opacity)
                }
            }
        }
    }
}

struct PasswordCreationStepB: View {
    @Binding var instructionsView: Bool
    @State private var instructionsViewB = false
    @State private var message = ""
    @State private var toPrint = "Utilize a mix of numbers, upper and lowercase letters, and symbols. For instance: Alph@BetA450_410"
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
            Text("MASTER THE")
                .font(.system(size: 35, design: .monospaced))
                .fontWeight(.bold)
                .foregroundStyle(Color.white)
                .opacity(0.5)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
            Text("Password")
                .font(.system(size: 100, design: .monospaced))
                .padding(.top, 20)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
                .foregroundStyle(Color.indigo)
            
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .foregroundStyle(Color.white)
                    .opacity(0.05)
                    .cornerRadius(50)
                    .padding(.top, 0)
                    .padding(.leading, 90)
                    .padding(.trailing, 90)
                    .padding(.bottom, 40)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .foregroundStyle(Color("TriMidnight"))
                    .cornerRadius(50)
                    .padding(.bottom, 60)
                    .padding(.leading, 70)
                    .padding(.trailing, 70)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .foregroundStyle(Color("LightMidnight"))
                    .cornerRadius(50)
                    .padding(.bottom, 90)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                
                
                VStack {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 100, height: 100, alignment: .topLeading)
                                .foregroundStyle(.indigo)
                                .padding(.leading, 100)
                                .padding(.bottom, 120)
                                .padding(.top, 60)
                            Text("2")
                                .fontWeight(.bold)
                                .font(.system(size: 40, design: .monospaced))
                                .foregroundStyle(Color("Midnight"))
                                .padding(.top, 60)
                                .padding(.leading, 100)
                                .padding(.bottom, 120)
                        }
                        VStack {
                            Text("Jam and mix it up!")
                                .font(.system(size: 35, design: .monospaced))
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.trailing)
                                .padding(.leading, 20)
                                .padding(.top, 60)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                            Text(message)
                                .font(.system(size: 30, design: .monospaced))
                                .fontWeight(.semibold)
                                .lineSpacing(10)
                                .padding(.bottom, 120)
                                .padding(.top, 1)
                                .foregroundStyle(Color.white)
                                .opacity(0.5)
                                .padding(.leading, 20)
                                .padding(.trailing, 80)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .topLeading)
                                .onAppear {
                                    toPrint.enumerated().forEach {
                                        index, letter in
                                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
                                            message.append(letter)
                                        }
                                    }
                                }

                        }
                    }
                }
            }

                    
                    Button(action: {
                        instructionsViewB = true
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 150, maxHeight: 80)
                                .cornerRadius(200)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 15, height: 25)
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.heavy)
                                .padding(.leading, 5)
                            Spacer()
                        }
                    }
                }
                .fullScreenCover(isPresented: $instructionsViewB) {
                    PasswordCreationStepC(instructionsViewB: $instructionsViewB)
                        .transition(.opacity)
            }
        }
    }
}

struct PasswordCreationStepC: View {
    @Binding var instructionsViewB: Bool
    @State private var knowledgeTestView = false
    @State private var message = ""
    @State private var toPrint = "Each one of your accounts should have a unique password."
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Text("MASTER THE")
                    .font(.system(size: 35, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .opacity(0.5)
                    .multilineTextAlignment(.center)
                    .padding(.top, 40)
                Text("Password")
                    .font(.system(size: 100, design: .monospaced))
                    .padding(.top, 20)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.indigo)
                
                ZStack {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color.white)
                        .opacity(0.05)
                        .cornerRadius(50)
                        .padding(.top, 0)
                        .padding(.leading, 90)
                        .padding(.trailing, 90)
                        .padding(.bottom, 40)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color("TriMidnight"))
                        .cornerRadius(50)
                        .padding(.bottom, 60)
                        .padding(.leading, 70)
                        .padding(.trailing, 70)
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .foregroundStyle(Color("LightMidnight"))
                        .cornerRadius(50)
                        .padding(.bottom, 90)
                        .padding(.leading, 50)
                        .padding(.trailing, 50)
                    
                    
                    VStack {
                        HStack {
                            ZStack {
                                Circle()
                                    .frame(width: 100, height: 100, alignment: .topLeading)
                                    .foregroundStyle(.indigo)
                                    .padding(.leading, 100)
                                    .padding(.bottom, 120)
                                    .padding(.top, 60)
                                Text("3")
                                    .fontWeight(.bold)
                                    .font(.system(size: 40))
                                    .foregroundStyle(Color("Midnight"))
                                    .padding(.top, 60)
                                    .padding(.leading, 100)
                                    .padding(.bottom, 120)
                            }
                            VStack {
                                Text("Never reuse a password!")
                                    .font(.system(size: 35, design: .monospaced))
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, 20)
                                    .padding(.top, 60)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text(message)
                                    .font(.system(size: 30, design: .monospaced))
                                    .fontWeight(.semibold)
                                    .lineSpacing(10)
                                    .padding(.bottom, 120)
                                    .padding(.top, 1)
                                    .foregroundStyle(Color.white)
                                    .opacity(0.5)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 80)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                    .onAppear {
                                        toPrint.enumerated().forEach {
                                            index, letter in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
                                                message.append(letter)
                                            }
                                        }
                                        
                                    }
                            }
                        }
                    }
                }
                
                    
                    Button(action: {
                        knowledgeTestView = true
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 150, maxHeight: 80)
                                .cornerRadius(200)
                                .padding(.leading, 5)
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .resizable()
                                .frame(width: 15, height: 25)
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.heavy)
                                .padding(.leading, 5)
                            Spacer()
                        }
                    }
                    .fullScreenCover(isPresented: $knowledgeTestView) {
                        FinaleView(knowledgeTestView: $knowledgeTestView)
                            .transition(.opacity)

                }
            }
        }
    }
}


struct FinaleView: View {
    @Binding var knowledgeTestView: Bool;
    @State private var knowledgeReadyView = false;
    @State private var message = "";
    @State private var toPrint = "Amazing, the research is complete! You're an absolute professional at this!";
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Image("LockleyGlad")
                    .resizable()
                    .frame(width: 475, height: 360)

                Text(message)
                    .fontWeight(.bold)
                    .frame(width: 600)
                    .lineSpacing(10)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, design: .monospaced))
                    .onAppear {
                        toPrint.enumerated().forEach {
                            index, letter in
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                                message.append(letter)
                        }
                    }
                
                }
                Button(action: {
                    knowledgeReadyView = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)
                            .padding(.top, 50)

                        Text("Continue")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .padding(.top, 50)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
                .fullScreenCover(isPresented: $knowledgeReadyView) {
                    KnowledgeTestView(knowledgeReadyView: $knowledgeReadyView)
                        .transition(.opacity)
                }

            }
        }
    }
}

struct KnowledgeTestView: View {
    @Binding var knowledgeReadyView: Bool
    @State private var courseAGameView = false
    @StateObject var stopwatch = Stopwatch();
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Image("LightBulb")
                    .resizable()
                    .frame(width: 480, height: 340)
                Text("Using your knowledge, you can")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, design: .monospaced))
                    .padding(.bottom, 20)
                HStack {
                    ZStack {
                        Text("begin")
                            .fontWeight(.bold)
                            .foregroundStyle(Color.indigo)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40, design: .monospaced))
                            .padding(.bottom, 70)
                        Rectangle()
                            .frame(width: 150, height: 70)
                            .foregroundStyle(Color.indigo)
                            .opacity(0.1)
                            .cornerRadius(20)
                            .padding(.bottom, 70)
                    }
                    
                    Text(" development!")
                        .fontWeight(.bold)
                        .padding(.leading, 5)
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.bottom, 70)
                }
                Button(action: {
                    courseAGameView = true
                    stopwatch.start()
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)

                        Text("Start")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
            }
            CourseAGameA(stopwatch: stopwatch)
                .opacity(courseAGameView ? 1 : 0)
                .animation(.easeInOut, value: courseAGameView)

        }
    }
}


// Creating a strong password
struct CourseAGameA: View {
    @State private var incorrectMessage = false;
    @State private var correctMessage = false;
    @State private var pauseMenu = false;
    @State private var showPauseAnimation = false;
    @State private var courseBGameView = false;
    @State private var returnToCourses = false;
    
    @ObservedObject var stopwatch: Stopwatch; // Share the stopwatch across various views
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))

            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .foregroundStyle(Color.indigo)
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                                .padding(.top, 40)
                                .padding(.trailing, 10)
                            Text("0 / 4")
                                .foregroundStyle(Color.indigo)
                                .frame(width: 110, height: 25)
                                .font(.system(size: 30, design: .monospaced))
                                .fontWeight(.bold)
                                .padding(.top, 40)
                                .padding(.trailing, 40)
                        }
                        Rectangle()
                            .frame(width: 200, height: 65)
                            .cornerRadius(100)
                            .opacity(0.2)
                            .foregroundStyle(Color.indigo)
                            .padding(.top, 40)
                            .padding(.trailing, 40)
                    }
                }
                Spacer()
            }


            VStack {
                HStack {
                    Button(action: {
                        pauseMenu = true
                        stopwatch.stop()
                    }) {
                        ZStack {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.white)
                                .opacity(0.4)
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.white)
                                .opacity(0.1)
                            
                        
                        }
                        Text(stopwatch.formatClock())
                            .foregroundStyle(Color.white)
                            .opacity(0.4)
                            .font(.system(size: 30, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                    }
                    .padding(40)
                    
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Image(.vault1)
                    .resizable()
                    .frame(width: 340, height: 250)
                Text("Choose the strongest password")
                    .padding(.top, 40)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, design: .monospaced))

                HStack {
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 320, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.trailing, 5)
                            Text("passworD")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.trailing, 5)
                                .font(.system(size: 32, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                    
                    Button(action: {
                        correctMessage = true
                        incorrectMessage = false
                        stopwatch.stop()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            correctMessage = false
                            courseBGameView = true
                            stopwatch.start()
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 320, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.leading, 5)
                            Text("jOhnD0e2&12()")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 32, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                }
                
                HStack {
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 320, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.trailing, 5)
                            Text("JonnyApple5")
                                .foregroundStyle(Color("Midnight"))
                                .padding(.trailing, 5)
                                .fontWeight(.semibold)
                                .font(.system(size: 32, design: .monospaced))
                        }
                    }

                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 320, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.leading, 5)
                            Text("Hello123World")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 32, design: .monospaced))
                        }
                    }
                }
                
                if correctMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 350, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Nice!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            
            if incorrectMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 650, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Hmm... there's a stronger one!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            }
            if pauseMenu {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color.black)
                    .opacity(0.6)
                    .onTapGesture {
                            pauseMenu = false
                            showPauseAnimation = false
                    }
                Rectangle()
                    .frame(width: 700, height: 500)
                    .cornerRadius(60)
                    .foregroundStyle(Color("TriMidnight"))
                    .scaleEffect(showPauseAnimation ? 1 : 0.95)
                    .opacity(showPauseAnimation ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            showPauseAnimation = true
                        }
                    }
                VStack {
                    Text("Paused")
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.bottom, 60)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .scaleEffect(showPauseAnimation ? 1 : 0.95)
                        .opacity(showPauseAnimation ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                showPauseAnimation = true
                            }
                        }
                    Button(action: {
                        pauseMenu = false
                        showPauseAnimation = false
                        stopwatch.start()
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 400, maxHeight: 80)
                                .cornerRadius(100)
                                .scaleEffect(showPauseAnimation ? 1 : 0.95)
                                .opacity(showPauseAnimation ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        showPauseAnimation = true
                                    }
                                }
                            Text("Resume")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .scaleEffect(showPauseAnimation ? 1 : 0.95)
                                .opacity(showPauseAnimation ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        showPauseAnimation = true
                                    }
                                }
                                    .font(.system(size: 35, design: .monospaced))
                        }
                    }
                }
            }
            CourseAGameB(stopwatch: stopwatch)
                .opacity(courseBGameView ? 1 : 0)
                .animation(.easeInOut, value: courseBGameView)
        }
    }
}

struct CourseAGameB: View {
    @State private var incorrectMessage = false;
    @State private var correctMessage = false;
    @State private var pauseMenu = false;
    @State private var returnToCourses = false;
    @State private var courseCGameView = false;

    @ObservedObject var stopwatch: Stopwatch; // Share the stopwatch across various views

    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))

            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .foregroundStyle(Color.indigo)
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                                .padding(.top, 40)
                                .padding(.trailing, 10)
                            Text("1 / 4")
                                .foregroundStyle(Color.indigo)
                                .frame(width: 110, height: 25)
                                .font(.system(size: 30, design: .monospaced))
                                .fontWeight(.bold)
                                .padding(.top, 40)
                                .padding(.trailing, 40)
                        }
                        Rectangle()
                            .frame(width: 200, height: 65)
                            .cornerRadius(100)
                            .opacity(0.2)
                            .foregroundStyle(Color.indigo)
                            .padding(.top, 40)
                            .padding(.trailing, 40)
                    }
                }
                Spacer()
            }


            VStack {
                HStack {
                    Button(action: {
                        pauseMenu = true
                        stopwatch.stop()
                    }) {
                        ZStack {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.white)
                                .opacity(0.4)
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.white)
                                .opacity(0.1)
                            
                        
                        }
                        Text(stopwatch.formatClock())
                            .foregroundStyle(Color.white)
                            .opacity(0.4)
                            .font(.system(size: 30, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                    }
                    .padding(40)
                    
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Image(.vault1)
                    .resizable()
                    .frame(width: 340, height: 250)
                Text("Choose the strongest password")
                    .padding(.top, 40)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, design: .monospaced))

                HStack {
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.trailing, 5)
                            Text("Alligator508")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.trailing, 5)
                                .font(.system(size: 30, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                    
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.leading, 5)
                            Text("WorldWideWeb900")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 30, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                }
                
                HStack {
                    Button(action: {
                        correctMessage = true
                        incorrectMessage = false
                        stopwatch.stop()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            correctMessage = false
                            courseCGameView = true
                            stopwatch.start()
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.trailing, 5)
                            Text("Text('!W%W*D#C@!')")
                                .foregroundStyle(Color("Midnight"))
                                .padding(.trailing, 5)
                                .fontWeight(.semibold)
                                .font(.system(size: 30, design: .monospaced))
                        }
                    }

                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.leading, 5)
                            Text("-Red * Apples -")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 30, design: .monospaced))
                        }
                    }
                }
                
                if correctMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 350, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Nice!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            
            if incorrectMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 650, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Hmm... there's a stronger one!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            }
            if pauseMenu {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color.black)
                    .opacity(0.6)
                Rectangle()
                    .frame(width: 700, height: 500)
                    .cornerRadius(60)
                    .foregroundStyle(Color("TriMidnight"))
                VStack {
                    Text("Paused")
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.bottom, 60)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    Button(action: {
                        pauseMenu = false
                        stopwatch.start()
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 400, maxHeight: 80)
                                .cornerRadius(100)
                            Text("Resume")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .font(.system(size: 35, design: .monospaced))
                        }
                    }
                }
            }
            CourseAGameC(stopwatch: stopwatch)
                .opacity(courseCGameView ? 1 : 0)
                .animation(.easeInOut, value: courseCGameView)
        }
    }
}

struct CourseAGameC: View {
    @State private var incorrectMessage = false;
    @State private var correctMessage = false;
    @State private var pauseMenu = false;
    @State private var examplePassword: String = ""
    @State private var showPauseAnimation = false;
    @State private var returnToCourses = false;
    @State private var courseDGameView = false;
    @FocusState private var isFocused: Bool

    @ObservedObject var stopwatch: Stopwatch; // Share the stopwatch across various views
    
    // Validating the password for checks
    func isValid(_ password: String) -> Bool {
        let hasLength = password.count >= 12
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let hasNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        
        return hasLength && hasUppercase && hasLowercase && hasNumber;
    }

    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))

            ZStack {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color("Midnight"))
                
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            HStack {
                                Image(systemName: "checkmark")
                                    .resizable()
                                    .foregroundStyle(Color.indigo)
                                    .frame(width: 30, height: 30)
                                    .fontWeight(.semibold)
                                    .padding(.top, 40)
                                    .padding(.trailing, 10)
                                Text("2 / 4")
                                    .foregroundStyle(Color.indigo)
                                    .frame(width: 110, height: 25)
                                    .font(.system(size: 30, design: .monospaced))
                                    .fontWeight(.bold)
                                    .padding(.top, 40)
                                    .padding(.trailing, 40)
                            }
                            Rectangle()
                                .frame(width: 200, height: 65)
                                .cornerRadius(100)
                                .opacity(0.2)
                                .foregroundStyle(Color.indigo)
                                .padding(.top, 40)
                                .padding(.trailing, 40)
                        }
                    }
                    Spacer()
                }
                
            }


            VStack {
                HStack {
                    Button(action: {
                        pauseMenu = true
                        stopwatch.stop()
                    }) {
                        ZStack {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.white)
                                .opacity(0.4)
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.white)
                                .opacity(0.1)
                            
                        
                        }
                        Text(stopwatch.formatClock())
                            .foregroundStyle(Color.white)
                            .opacity(0.4)
                            .font(.system(size: 30, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                    }
                    .padding(40)
                    
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Image(.vault1)
                    .resizable()
                    .frame(width: 340, height: 250)
                Text("Create a strong password")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 45, design: .monospaced))
                ZStack {
                    TextField("WWDC#2025is@wesoME", text: $examplePassword)
                        .frame(width: 500, height: 80)
                        .font(.system(size: 30, design: .monospaced))
                        .fontWeight(.semibold)
                        .focused($isFocused)
                        .padding(.top, 20)
                        .foregroundStyle(Color.white)
                        .autocorrectionDisabled(true) // Prevent's the keyboard from making predictions
                        .textContentType(.newPassword) // Declare as a new password to prevent autofilling of passwords
                        .padding(.bottom, 20)
                        .onSubmit {
                            if (isValid(examplePassword)) {
                                correctMessage = true;
                                incorrectMessage = false;
                                stopwatch.stop()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    courseDGameView = true;
                                    stopwatch.start()
                                }
                            } else {
                                correctMessage = false;
                                incorrectMessage = true;
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    incorrectMessage = false;
                                }
                            }
                        }
                    Rectangle()
                        .frame(maxWidth: 550, maxHeight: 80)
                        .foregroundStyle(Color.white)
                        .opacity(0.05)
                        .cornerRadius(20)
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    }

                Button(action: {
                    isFocused = false;
                    if (isValid(examplePassword)) {
                        correctMessage = true;
                        incorrectMessage = false;
                        stopwatch.stop()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            courseDGameView = true;
                            stopwatch.start()
                        }
                    } else {
                        correctMessage = false;
                        incorrectMessage = true;
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            incorrectMessage = false;
                        }
                    }
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 550, maxHeight: 80)
                            .cornerRadius(100)
                            .padding(.top, 10)

                        Text("Enter")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.semibold)
                            .font(.system(size: 35, design: .monospaced))
                            .padding(.top, 10)
                    }
                }
            }
                
            if pauseMenu {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color.black)
                    .opacity(0.6)
                    .onTapGesture {
                            pauseMenu = false
                            showPauseAnimation = false
                    }
                Rectangle()
                    .frame(width: 700, height: 500)
                    .cornerRadius(60)
                    .foregroundStyle(Color("TriMidnight"))
                    .scaleEffect(showPauseAnimation ? 1 : 0.95)
                    .opacity(showPauseAnimation ? 1 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.5)) {
                            showPauseAnimation = true
                        }
                    }
                VStack {
                    Text("Paused")
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.bottom, 60)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                        .scaleEffect(showPauseAnimation ? 1 : 0.95)
                        .opacity(showPauseAnimation ? 1 : 0)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.5)) {
                                showPauseAnimation = true
                            }
                        }
                    Button(action: {
                        pauseMenu = false
                        showPauseAnimation = false
                        stopwatch.start()
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 400, maxHeight: 80)
                                .cornerRadius(100)
                                .scaleEffect(showPauseAnimation ? 1 : 0.95)
                                .opacity(showPauseAnimation ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        showPauseAnimation = true
                                    }
                                }
                            Text("Resume")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .scaleEffect(showPauseAnimation ? 1 : 0.95)
                                .opacity(showPauseAnimation ? 1 : 0)
                                .onAppear {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        showPauseAnimation = true
                                    }
                                }
                                    .font(.system(size: 35, design: .monospaced))
                        }
                    }
                }
            }
            
            if correctMessage {
                ZStack {
                    Rectangle()
                        .frame(maxWidth: 350, maxHeight: 100)
                        .cornerRadius(40)
                        .foregroundStyle(Color.white)
                        .opacity(0.05)
                        .padding(.top, 840)
                    HStack {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .padding(.trailing, 25)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .padding(.top, 800)
                            .padding(.top, 40)
                        Text("Beautiful!")
                            .foregroundStyle(Color.white)
                            .fontWeight(.semibold)
                            .font(.system(size: 35))
                            .padding(.top, 800)
                            .padding(.top, 40)
                    }
                }
            }
            
            if incorrectMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 650, maxHeight: 100)
                            .frame(maxWidth: 650, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 840)
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.top, 800)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Hmm... you're almost there!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .padding(.top, 800)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
        
            CourseAGameD(stopwatch: stopwatch)
                .opacity(courseDGameView ? 1 : 0)
                .animation(.easeInOut, value: courseDGameView)

        }
        
    }
}

struct CourseAGameD: View {
    @State private var incorrectMessage = false;
    @State private var correctMessage = false;
    @State private var pauseMenu = false;
    @State private var examplePassword: String = ""
    @State private var showPauseAnimation = false;
    @State private var returnToCourses = false;
    @State private var completedView = false;
    @FocusState private var isFocused: Bool

    @ObservedObject var stopwatch: Stopwatch; // Share the stopwatch across various views
    
    // Validating the password for checks
    func isValid(_ password: String) -> Bool {
        let hasLength = password.count >= 12
        let hasUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let hasLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let hasNumber = password.rangeOfCharacter(from: .decimalDigits) != nil
        
        return hasLength && hasUppercase && hasLowercase && hasNumber;
    }

    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))

            VStack {
                HStack {
                    Spacer()
                    ZStack {
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .foregroundStyle(Color.indigo)
                                .frame(width: 30, height: 30)
                                .fontWeight(.semibold)
                                .padding(.top, 40)
                                .padding(.trailing, 10)
                            Text("3 / 4")
                                .foregroundStyle(Color.indigo)
                                .frame(width: 110, height: 25)
                                .font(.system(size: 30, design: .monospaced))
                                .fontWeight(.bold)
                                .padding(.top, 40)
                                .padding(.trailing, 40)
                        }
                        Rectangle()
                            .frame(width: 200, height: 65)
                            .cornerRadius(100)
                            .opacity(0.2)
                            .foregroundStyle(Color.indigo)
                            .padding(.top, 40)
                            .padding(.trailing, 40)
                    }
                }
                Spacer()
            }


            VStack {
                HStack {
                    Button(action: {
                        pauseMenu = true
                        stopwatch.stop()
                    }) {
                        ZStack {
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(Color.white)
                                .opacity(0.4)
                            Circle()
                                .frame(width: 65, height: 65)
                                .foregroundStyle(Color.white)
                                .opacity(0.1)
                            
                        
                        }
                        Text(stopwatch.formatClock())
                            .foregroundStyle(Color.white)
                            .opacity(0.4)
                            .font(.system(size: 30, design: .monospaced))
                            .fontWeight(.bold)
                            .padding(.leading, 40)
                    }
                    .padding(40)
                    
                    Spacer()
                }
                Spacer()
            }
            VStack {
                Image(.vault1)
                    .resizable()
                    .frame(width: 340, height: 250)
                Text("When can you reuse a password across different sites?")
                    .padding(.top, 40)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40, design: .monospaced))

                HStack {
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.trailing, 5)
                            Text("Always")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.trailing, 5)
                                .font(.system(size: 30, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                    
                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.top, 50)
                                .padding(.leading, 5)
                            Text("Sometimes")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 30, design: .monospaced))
                                .padding(.top, 50)
                        }
                    }
                }
                
                HStack {
                    Button(action: {
                        correctMessage = true
                        incorrectMessage = false
                        stopwatch.stop()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            correctMessage = false
                            completedView = true
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.trailing, 5)
                            Text("Never")
                                .foregroundStyle(Color("Midnight"))
                                .padding(.trailing, 5)
                                .fontWeight(.semibold)
                                .font(.system(size: 30, design: .monospaced))
                        }
                    }

                    Button(action: {
                        correctMessage = false
                        incorrectMessage = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                            incorrectMessage = false
                        }
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 360, maxHeight: 80)
                                .cornerRadius(100)
                                .padding(.leading, 5)
                            Text("Can vary")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .padding(.leading, 5)
                                .font(.system(size: 30, design: .monospaced))
                        }
                    }
                }
                
                if correctMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 350, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "checkmark")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Nice!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            
            if incorrectMessage {
                    ZStack {
                        Rectangle()
                            .frame(maxWidth: 650, maxHeight: 100)
                            .cornerRadius(40)
                            .foregroundStyle(Color.white)
                            .opacity(0.05)
                            .padding(.top, 40)
                        HStack {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                                .padding(.trailing, 25)
                                .fontWeight(.bold)
                                .foregroundStyle(Color.white)
                                .padding(.top, 40)
                            Text("Hmm... there's a better choice!")
                                .foregroundStyle(Color.white)
                                .fontWeight(.semibold)
                                .font(.system(size: 35))
                                .padding(.top, 40)
                        }
                    }
                }
            }
            if pauseMenu {
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundStyle(Color.black)
                    .opacity(0.6)
                Rectangle()
                    .frame(width: 700, height: 500)
                    .cornerRadius(60)
                    .foregroundStyle(Color("TriMidnight"))
                VStack {
                    Text("Paused")
                        .font(.system(size: 40, design: .monospaced))
                        .padding(.bottom, 60)
                        .multilineTextAlignment(.center)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.white)
                    Button(action: {
                        pauseMenu = false
                        stopwatch.start()
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.indigo)
                                .frame(maxWidth: 400, maxHeight: 80)
                                .cornerRadius(100)
                            Text("Resume")
                                .foregroundStyle(Color("Midnight"))
                                .fontWeight(.semibold)
                                .font(.system(size: 35, design: .monospaced))
                        }
                    }
                }
            }
        
            CompletedCourseA(stopwatch: stopwatch)
                .opacity(completedView ? 1 : 0)
                .animation(.easeInOut, value: completedView)

        }
        
    }
}


struct CompletedCourseA: View {
    @State private var courseViewReturn = false
    
    @ObservedObject var stopwatch: Stopwatch; // Now finally, for printing the total

    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
                .foregroundStyle(Color("Midnight"))
            
            VStack {
                Image("Lockley")
                    .resizable()
                    .frame(width: 480, height: 340)
                Text("Woohoo!")
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 60, design: .monospaced))
                    .padding(.bottom, 20)
                
                HStack {
                    Image(systemName: "clock")
                        .fontWeight(.bold)
                        .foregroundStyle(Color.indigo)
                        .font(.system(size: 35, design: .monospaced))
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        .padding(.bottom, 50)
                    
                    Text(stopwatch.formatClock())
                        .fontWeight(.bold)
                        .foregroundStyle(Color.indigo)
                        .font(.system(size: 35, design: .monospaced))
                        .padding(.top, 10)
                        .padding(.bottom, 50)
                }
                
                Text("Thank you so much for your help! You've not only helped me but also declared yourself a passwords expert! Well done my friend!")
                    .lineSpacing(10)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .font(.system(size: 30, design: .monospaced))
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    .opacity(0.6)
                Button(action: {
                    courseViewReturn = true
                }) {
                    ZStack {
                        Rectangle()
                            .foregroundStyle(Color.indigo)
                            .frame(maxWidth: 400, maxHeight: 80)
                            .cornerRadius(100)

                        Text("Return Home")
                            .foregroundStyle(Color("Midnight"))
                            .fontWeight(.bold)
                            .font(.system(size: 35, design: .monospaced))
                    }
                }
            }
            ContentView()
                .opacity(courseViewReturn ? 1 : 0)
                .animation(.easeInOut, value: courseViewReturn)

        }
    }
}


#Preview {
    ContentView()
}

