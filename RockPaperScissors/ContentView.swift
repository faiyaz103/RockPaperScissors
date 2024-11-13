import SwiftUI

struct ContentView: View {
    
    @State var player = "1"
    @State var cpu = "3"
    
    @State var pscore=0
    @State var cpuscore=0
    
    @State var msg = "Rock Paper Scissors"
    
    var body: some View {
        
        ZStack {
            
            Image("background-wood-grain")
                .resizable()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text(msg)
                    .font(.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 10.0)
                Spacer()
                HStack {
                    Spacer()
                    Image(player)
                    Spacer()
                    Image(cpu)
                    Spacer()
                }
                Spacer()
                Button{
                    play()
                } label: {
                    Image("button")
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                            
                        Text(String(pscore))
                            .font(.largeTitle)
                            
                    }
                    Spacer()
                    VStack {
                        Text("BotMan")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuscore))
                            .font(.largeTitle)
                    }
                    Spacer()
                    
                }
                .foregroundColor(.white)
                Spacer()
                
            }
        }
        
    }
    
    func play(){
        var pcard = Int.random(in: 1...3)
        var cpucard = Int.random(in: 1...3)
        
        player = String(pcard)
        cpu = String(cpucard)
        
        if pscore < 11 && cpuscore < 11 {
            msg = "Rock Paper Scissors"
        }
        
        if pcard == 1 && cpucard == 2 {
            cpuscore+=1
        }
        else if pcard == 2 && cpucard == 1 {
            pscore+=1
        }
        else if pcard == 1 && cpucard == 3 {
            pscore+=1
        }
        else if pcard == 3 && cpucard == 1 {
            cpuscore+=1
        }
        else if pcard == 2 && cpucard == 3 {
            cpuscore+=1
        }
        else if pcard == 3 && cpucard == 2 {
            pscore+=1
        }
        
        if pscore == 10 {
            msg = "YOU WON !"
            pscore=0
            cpuscore=0
        }
        else if cpuscore == 10 {
            msg = "YOU LOST :("
            pscore=0
            cpuscore=0
        }
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
