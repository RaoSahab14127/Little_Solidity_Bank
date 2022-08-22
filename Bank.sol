// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract bankt {
    address payable user;
    address key;
    address payable manager;
    constructor(){
        manager = payable (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    }

    
    function set(address _key) public {
        key = _key;
    }
        function get() public view returns(uint) {
        require(msg.sender==key, "not Matched");
        return(msg.sender.balance);
    }
    function  deposit() payable public
    {
        manager.transfer(msg.value);
    }
        function getbank() public view returns(uint) {
        require(msg.sender==0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "not Matched");
        return(msg.sender.balance);
    }
        function WD(address _aa) public payable {
            user = payable (_aa);
            require(msg.sender==0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "not Matched");
            
            
        user.transfer(msg.value);
    }


}