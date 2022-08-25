// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract bankt {
    address payable user;
    address key;
    address payable manager;
    mapping (address=>uint) mapi;
    uint BB;
    constructor(){
        manager = payable (msg.sender);
        
    }

    function get() public view returns(uint) {
        return(mapi[msg.sender]);
    }
    function  deposit() payable public
    {
        manager.transfer(msg.value);
        mapi[msg.sender]+= msg.value;
        BB+=msg.value;

    }
        function getbank() public view returns(uint) {
        require(msg.sender==manager, "not Matched");
        return(BB);
    }
        function WD(address _aa) public payable {
            user = payable (_aa);
            
            require((msg.sender==manager && (mapi[user]>=msg.value)), "not Matched");
            user.transfer(msg.value);
            uint a = msg.value;
            mapi[user] -= a;
            BB-=msg.value;



    }


}