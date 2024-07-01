// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract DegenToken {
    string public name = "degen";
    string public symbol = "DGN";
    uint8 public decimals = 18;
    uint256 public totalSupply = 100000e18;
    address public owner;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    string[] public rewards = ["avaxBadge", "Treasure", "amazonCoupon"];
    uint256 public redeemRate = 100; // Tokens required to redeem one reward

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Redeem(address indexed from, uint256 value, string reward);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Transfer to the zero address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        require(_spender != address(0), "Approve to the zero address");
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0), "Transfer to the zero address");
        require(_value <= balanceOf[_from], "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Allowance exceeded");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_to != address(0), "Mint to the zero address");
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }

    function burn(uint256 _amount) public {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");
        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        emit Transfer(msg.sender, address(0), _amount);
    }

    function increaseAllowance(address _spender, uint256 _addedValue) public returns (bool) {
        require(_spender != address(0), "Increase allowance to the zero address");
        allowance[msg.sender][_spender] += _addedValue;
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

    function decreaseAllowance(address _spender, uint256 _subtractedValue) public returns (bool) {
        require(_spender != address(0), "Decrease allowance to the zero address");
        require(allowance[msg.sender][_spender] >= _subtractedValue, "Allowance below zero");
        allowance[msg.sender][_spender] -= _subtractedValue;
        emit Approval(msg.sender, _spender, allowance[msg.sender][_spender]);
        return true;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Transfer ownership to the zero address");
        owner = _newOwner;
    }

    function redeem(uint256 _rewardIndex) public returns (string memory) {
        require(_rewardIndex < rewards.length, "Invalid reward index");
        require(balanceOf[msg.sender] >= redeemRate, "Insufficient balance to redeem");

        balanceOf[msg.sender] -= redeemRate; 
        totalSupply -= redeemRate;
        emit Transfer(msg.sender, address(0), redeemRate);

        string memory reward = rewards[_rewardIndex];
        emit Redeem(msg.sender, redeemRate, reward);

        return rewards[_rewardIndex];
    }
}
