/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that clips an image to a circle and adds a stroke and shadow.
*/

import SwiftUI

struct CircleImage: View {
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
                    .shadow(radius: 7)
            }
            .scaleEffect(scale)
            .animation(
                reduceMotion ? nil : .easeOut(duration: 3),
                value: scale
            )
            .onLongPressGesture (
                minimumDuration: 0.1,
                pressing: { isPressing in
                    guard !reduceMotion else {
                        return
                    }
                    scale = isPressing ? 2.0 : 1.0
                }
            ) {}
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
