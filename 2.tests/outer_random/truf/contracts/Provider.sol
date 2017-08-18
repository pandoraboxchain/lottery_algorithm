pragma solidity ^0.4.13;


contract Provider {

	address public owner; //address who can update random
	address public admin; //address who can ask random

	//number of suggests in array
	uint public suggestsCount;

	//random suggest structure
	struct Suggest{
		bytes32 seed; //random is generated by the seed
		bool asked; //mark when admin uses this number
		uint index; //index where to put in main contract
	}

	//indexed suggests storage
	mapping (uint => Suggest) suggests;

	function Provider() {
		owner = msg.sender;
	}
	modifier onlyOwner {
		if (msg.sender != owner) {
			revert();
		}
		_;
	}
	function setAdmin(address newAdmin) onlyOwner {
		admin = newAdmin;
	}

	function() {
		revert();
	}

	//place suggest of random number
	function placeSuggest(bytes32 seed) onlyOwner returns (uint placed) {
		placed = suggestsCount;
		suggests[suggestsCount] = Suggest(seed, false, 0);
		suggestsCount++;
	}

	//something to review our db of suggested randoms
	function getSuggest(uint index) constant returns (bytes32 a, bool b, uint c) {
		a = suggests[index].seed;
		b = suggests[index].asked;
		c = suggests[index].index;
	}

	//admin matched suggest with request in main contract (can call also here)
	function updateSuggestIndex(uint index, uint main_index) returns (bool) {
		if (msg.sender != admin) {
			revert();
		}
		if (suggests[index].asked) {
			revert();
		}
		suggests[index].index = main_index;
		suggests[index].asked = true;
	}
}