pragma abicoder v2;

interface TokenHub {
    function getMiniRelayFee() external view returns (uint256);

    function getContractAddrByBEP2Symbol(bytes32 bep2Symbol) external view returns (address);

    function getBep2SymbolByContractAddr(address contractAddr) external view returns (bytes32);

    function bindToken(bytes32 bep2Symbol, address contractAddr, uint256 decimals) external;

    function unbindToken(bytes32 bep2Symbol, address contractAddr) external;

    function transferOut(
        address contractAddr,
        address recipient,
        uint256 amount,
        uint64 expireTime
    ) external payable returns (bool);

    function recoverBCAsset(bytes32 tokenSymbol, address recipient, uint256 amount) external;
    function cancelTokenRecoverLock(bytes32 tokenSymbol, address attacker) external;

    /* solium-disable-next-line */
    function batchTransferOutBNB(
        address[] calldata recipientAddrs,
        uint256[] calldata amounts,
        address[] calldata refundAddrs,
        uint64 expireTime
    ) external payable returns (bool);

    function withdrawStakingBNB(uint256 amount) external returns (bool);

    function cancelTransferIn(address tokenAddress, address attacker) external;
}