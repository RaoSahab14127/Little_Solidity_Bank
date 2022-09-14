// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// contract bankt {
//     address payable user;
//     address payable manager;
//     mapping (address=>uint) mapi;
//     uint BB;
//     uint totalWD;
//     constructor(){
//         manager = payable (msg.sender);
//         totalWD = 0;
        
//     }

//     function get() public view returns(uint) {
//         return(mapi[msg.sender]);
//     }
//     function  deposit() payable public
//     {
//         require(msg.value >= 1 ether && msg.value <= 10 ether, "Aby Bhekari ziada dal");
//         manager.transfer(msg.value);
//         mapi[msg.sender]+= msg.value;
//         BB+=msg.value;

//     }
//         function getbank() public view returns(uint) {
//         require(msg.sender==manager, "not Matched");
//         return(BB);
//     }
//         function WD(address _aa) public payable {
//             user = payable (_aa);
            
//             require((msg.sender==manager && (mapi[user]>=msg.value)), "not Matched");
//             uint mmm;
//             if (totalWD == 0){
//                 mmm= msg.value;
//                 mmm/=10;
//                 mmm = (msg.value)-mmm;
//                user.transfer(mmm);
//                uint a = msg.value;
//             mapi[user] -= a;
//             BB-=mmm;
//             totalWD+=1;
//             }
//             else if (totalWD == 1){
//                 mmm= msg.value;
//                 mmm/=10;
//                 mmm = (msg.value)-mmm-mmm;

//                user.transfer(mmm);
//                uint a = msg.value;
//             mapi[user] -= a;
//             BB-=mmm; 
//             totalWD+=1;
//             }
//             else if (totalWD == 2){
//                 mmm= msg.value;
//                 mmm/=10;
//                 mmm = (msg.value)-(mmm*3);
//                user.transfer(mmm); 
//                uint a = msg.value;
//             mapi[user] -= a;
//             BB-=mmm;
//             totalWD+=1;
//             }
//             else{
//                 mmm= msg.value;
//                user.transfer(mmm);
//                uint a = msg.value;
//             mapi[user] -= a;
//             BB-=mmm; 
//             }
            
contract bank2 {
    address payable user;
    address payable manager;
    struct cus{
        uint bala;
        uint time;
    }
    mapping (address=>cus) mapi;

    uint BB;
    uint totalWD;
    uint time;
    constructor(){
        manager = payable (msg.sender);
        totalWD = 0;
        
    }

    function get() public view returns(uint) {
        return(mapi[msg.sender].bala);
    }
    function  deposit() payable public
    {
        require(msg.value >= 1 ether && msg.value <= 10 ether, "Aby Bhekari ziada dal");
        if(mapi[msg.sender].time ==0){ 
        mapi[msg.sender].time = block.timestamp;
        }
        manager.transfer(msg.value);
        mapi[msg.sender].bala+= msg.value;
        BB+=msg.value;

    }
        function getbank() public view returns(uint) {
        require(msg.sender==manager, "not Matched");
        return(BB);
    }
        function WD(address _aa) public payable {
            user = payable (_aa);

            
            require((msg.sender==manager && (mapi[user].bala>=msg.value)), "not Matched");
            
            uint newTime =  (block.timestamp)-(mapi[user].time) ;
            
            
            uint mmm;
            if (newTime >= 10){
            mmm = ((msg.value)/10);
            mapi[user].bala+=mmm;
            user.transfer(mmm);
            BB-=(mmm);
            }
            else {
                mmm =(msg.value)-((msg.value)/10);
                user.transfer(mmm);
                BB-=(msg.value);
            }
        
        
            mapi[user].bala-=(msg.value);
            

            
            }}