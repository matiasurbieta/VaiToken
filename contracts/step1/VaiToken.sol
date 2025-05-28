// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.7.0; //Let's pretend that this is the line of the contract
//pragma solidity 0.8.18; // don't look at this line

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract VAIToken {
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowed;

    uint256 totalSupply;
    string public name;
    string public symbol;
    uint8 public decimals;

    constructor(
        uint256 _initialAmount,
        string memory _name,
        uint8 _decimals,
        string memory _symbol
    ) {
        balances[msg.sender] = _initialAmount;
        totalSupply = _initialAmount;
        name = _name;
        decimals = _decimals;
        symbol = _symbol;
    }

    function transfer(
        address _to,
        uint256 _value
    ) public returns (bool success) {
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) public returns (bool success) {
        balances[_to] += _value;
        balances[_from] -= _value;
        allowed[_from][msg.sender] -= _value;
        return true;
    }

    function approve(
        address _spender,
        uint256 _value
    ) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        return true;
    }

    function allowance(
        address _owner,
        address _spender
    ) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
}
