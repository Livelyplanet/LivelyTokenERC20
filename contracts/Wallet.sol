// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "./AccessControl.sol";
import "./IWallet.sol";

abstract contract Wallet is IWallet, AccessControl {

    address public constant PUBLIC_SALE_WALLET_ADDRESS = address(0x7eA3cFefA2b13e493110EdEd87e2Ba72C115BEc1);
    address public constant FOUNDING_TEAM_WALLET_ADDRESS = address(0x001b0a8A4749C70AEAD435Cf7E6dA06A7bAd1a2d);
    address public constant RESERVES_WALLET_ADDRESS = address(0x3A528Ca83A9D4e167Dc9c14690349E3b6FC02054);
    address public constant AUDIO_VIDEO_PRODUCTIONS_WALLET_ADDRESS = address(0x90b08DCFD15447187A72f5e06592b353e5CFfA93);
    address public constant BOUNTY_PROGRAMS_WALLET_ADDRESS = address(0x00fc4fBcf0F01553bfC470fF85FCA2F3F21e138b);
    address public constant CHARITY_WALLET_ADDRESS = address(0x7A6D0f0F96f39E54AbfEbA3D1dA6f56c921B9cB7);

    struct WalletInfo {
        bytes32 name;
        bytes32 role;
    }

    mapping(address => WalletInfo) internal _wallets; 

    constructor() {    
        _wallets[PUBLIC_SALE_WALLET_ADDRESS] = WalletInfo(keccak256("PUBLIC_SALE_WALLET"), ADMIN_ROLE);
        _wallets[FOUNDING_TEAM_WALLET_ADDRESS] = WalletInfo(keccak256("FOUNDING_TEAM_WALLET"), 0x0);
        _wallets[RESERVES_WALLET_ADDRESS] = WalletInfo(keccak256("RESERVES_WALLET"), 0x0);
        _wallets[AUDIO_VIDEO_PRODUCTIONS_WALLET_ADDRESS] = WalletInfo(keccak256("AUDIO_VIDEO_PRODUCTIONS_WALLET"), ADMIN_ROLE);
        _wallets[BOUNTY_PROGRAMS_WALLET_ADDRESS] = WalletInfo(keccak256("BOUNTY_PROGRAMS_WALLET"), ADMIN_ROLE);
        _wallets[CHARITY_WALLET_ADDRESS] = WalletInfo(keccak256("CHARITY_WALLET"), ADMIN_ROLE);
    }

    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) 
        public 
        view 
        virtual 
        override
        returns (bool) 
    {
        return interfaceId == type(IWallet).interfaceId || super.supportsInterface(interfaceId);
    }
} 