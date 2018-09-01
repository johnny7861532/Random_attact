pragma solidity ^0.4.21;

contract Attact{
    
    struct attact{
        uint lastUpdated;
        uint attact;
    }
    
    event newAttact (address _player, uint _attact);
    
    
    attact[] public attacts;
    
    mapping (uint => address) public attacter;
    mapping (address => uint) attactNumbers;
    
     function updateTimestamp() returns (uint256) {
     return now;
    }
    
    function _userAttact( uint _time, uint _attact) private{
        uint id = attacts.push(attact(_time,_attact)) -1 ;
        attacter[id] = msg.sender;
        attactNumbers[msg.sender] ++ ;
        newAttact(msg.sender,_attact);
    }
    
    function _generateAttact(uint _time) private view returns (uint){
        uint seed = uint(keccak256(_time));
        return seed % 100;
     }
     
     
     function createAttact( ) public{
         uint initAttact = _generateAttact(updateTimestamp());
         _userAttact(updateTimestamp(),initAttact);
     }
        

    
    
    
}