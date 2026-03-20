// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/token/ERC20/ERC20.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v4.9.3/contracts/access/AccessControl.sol";

contract PhiQuenceToken is ERC20, ERC20Permit, ERC20Burnable, ERC20Pausable, AccessControl {
    bytes32 public constant PAUSER_ROLE = keccak256("PAUSER_ROLE");

    uint256 public constant MAX_SUPPLY = 1_618_000_000 * 10**18;

    address public immutable stakingVault = 0xf1513F5C6bDCf2452a74fC1BC0e5323D25b58ca5;
    address public immutable liquidityVault = 0x0A5AdF67d317bC5D010a7A94924211B64E5D5c11;
    address public immutable ecosystemVault = 0x28ea3Cf77cDA308F46C0eb97a2715E24046abE7c;
    address public immutable treasuryVault = 0x7Cb0364e31f8Fc0C510D03102e9e7BdbB6eb5209;
    address public immutable communityVault = 0xb492a850DfF316B2C8350021c1E21e862aaF27F8;
    address public immutable founderVault = 0xd5B2af6b3b2B5E5e6a7eAf60D8898b9Df600FDC5;
    address public immutable strategicReserveVault = 0xA08994Deb1c96580587909a2B0aEC95aF987c53F;
    address public immutable securityVault = 0xa2F0B4abF58e7F79Aaa78B0a06daCe5408265e06;
    address public immutable burnReserveVault = 0x7f3f6f186DFfb0f148697f9B7fe69984258D4c07;

    constructor() ERC20("PhiQuence", "PHI") ERC20Permit("PhiQuence") {
        _mint(stakingVault, (MAX_SUPPLY * 3820) / 10000);
        _mint(liquidityVault, (MAX_SUPPLY * 2360) / 10000);
        _mint(ecosystemVault, (MAX_SUPPLY * 1460) / 10000);
        _mint(treasuryVault, (MAX_SUPPLY * 900) / 10000);
        _mint(communityVault, (MAX_SUPPLY * 560) / 10000);
        _mint(founderVault, (MAX_SUPPLY * 340) / 10000);
        _mint(strategicReserveVault, (MAX_SUPPLY * 300) / 10000);
        _mint(securityVault, (MAX_SUPPLY * 160) / 10000);
        _mint(burnReserveVault, (MAX_SUPPLY * 100) / 10000);
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._beforeTokenTransfer(from, to, amount);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
