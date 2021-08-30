//
//  ContentView.swift
//  Shared
//
//  Created by Pranav Teegavarapu on 8/29/21.
//

import SwiftUI
import MessageUI

/// Main View
struct ContentView: View {
    private let messageComposeDelegate = MessageDelegate()

    var body: some View {
        VStack {
            Color.purple.ignoresSafeArea().overlay(
                VStack(spacing:20) {
                    Spacer()
                    Button(action: {
                        self.presentMessageCompose()
                    }) {
                        Text("gn")
                            .padding()
                            .background(Color(red: 249/255.0, green: 215/255.0, blue: 112/255.0))
                            .foregroundColor(Color(red: 25/255.0, green: 25/255.0, blue: 112/255.0))
                            .cornerRadius(10)
                    }
                    Spacer()
                }
            )
        }
    }

}

// MARK: The message part
extension ContentView {

    /// Delegate for view controller as `MFMessageComposeViewControllerDelegate`
    private class MessageDelegate: NSObject, MFMessageComposeViewControllerDelegate {
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
            // Customize here
            controller.dismiss(animated: true)
        }

    }

    /// Present an message compose view controller modally in UIKit environment
    private func presentMessageCompose() {
        guard MFMessageComposeViewController.canSendText() else {
            return
        }
        let vc = UIApplication.shared.keyWindow?.rootViewController

        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = messageComposeDelegate
        composeVC.body = "gn"

        vc?.present(composeVC, animated: true)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
