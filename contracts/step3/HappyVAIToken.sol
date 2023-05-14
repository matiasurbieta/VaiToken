// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract HappyVAIToken {
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    uint256 private totalSupply;
    string public name;
    string public symbol;
    uint8 public decimals;

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    constructor() {
        balanceOf[msg.sender] = 1000e18;
        totalSupply = 1000e18;
        name = "HVAI Token";
        decimals = 18;
        symbol = "HVAI";
    }

    function transfer(
        address _to,
        uint256 _value
    ) external returns (bool success) {
        balanceOf[msg.sender] -= _value;

        unchecked {
            balanceOf[_to] += _value;
        }

        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _value
    ) external returns (bool success) {
        uint256 allowed = allowance[_from][msg.sender]; // Saves gas for limited approvals.

        // En muchisimos casos si se quiere dar a una addreess permiso ilimitados para gastar tokens, se le asigna un permiso de type(uint256).max o -1.
        // Dado que el usuario acepto darle permisos al address para mover ilimitadamente, no hace fata restar el amount al allowed y de esta forma estamos reduciento gas
        if (allowed != type(uint256).max)
            allowance[_from][msg.sender] = allowed - _value;

        balanceOf[_from] -= _value;

        unchecked {
            balanceOf[_to] += _value;
        }

        emit Transfer(_from, _to, _value);

        return true;
    }

    function approve(
        address spender,
        uint256 amount
    ) external virtual returns (bool) {
        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }
}
