// Copyright © 2022 Tokenary. All rights reserved.

import Foundation
import WalletCore

enum DappRequestAction {
    case none
    case justShowApp
    case switchAccount(SelectAccountAction)
    case selectAccount(SelectAccountAction)
    case approveMessage(SignMessageAction)
    case approveTransaction(SendTransactionAction)
}

struct SelectAccountAction {
    let peer: PeerMeta?
    let coinType: CoinType?
    var selectedAccounts: Set<SpecificWalletAccount>
    let initiallyConnectedProviders: Set<Web3Provider>
    var network: EthereumChain?
    let source: Source
    let completion: (EthereumChain?, [SpecificWalletAccount]?) -> Void
    
    enum Source {
        case walletConnect, safariExtension
    }
}

struct SignMessageAction {
    let provider: Web3Provider
    let subject: ApprovalSubject
    let account: TokenaryAccount
    let meta: String
    let peerMeta: PeerMeta
    let completion: (Bool) -> Void
}

struct SendTransactionAction {
    let provider: Web3Provider
    let transaction: Transaction
    let chain: EthereumChain
    let account: TokenaryAccount
    let peerMeta: PeerMeta
    let completion: (Transaction?) -> Void
}
