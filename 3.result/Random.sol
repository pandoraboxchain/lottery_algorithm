pragma solidity ^0.4.13;

//inner random contract
contract Random {

	//numbers of blocks to wait before spin
	uint32 public blockDelay;

	//numbers of blocks when its too late to get random
	uint32 public blockExpired;

	//max integer result
	uint8 public maxResult;

	//number of requests in array
	uint public requestsCount;

	//random request structure
	struct Request {
		address customer; //address who needs random
		uint256 block; //number of block where request is placed
		bool done; //random is generated or not
		uint8 result; //random generated value
	}

	//indexed requests storage
	mapping (uint => Request) requests;

	//constructor
	function Random() {
		blockDelay = 1;
		blockExpired = 1000;
		requestsCount = 0;
		maxResult = 100;
	}

	//no default payment function
	function() {
		revert();
	}

	//place request for random number
	function placeRequest() public returns (uint placed) {
		placed = requestsCount;
		requests[requestsCount] = Request(msg.sender, block.number, false, 0);
		requestsCount++;
	}

	//something to review our db of requests
	function getRequest(uint index) constant returns (address a, uint256 b, bool c, uint8 d) {
		a = requests[index].customer;
		b = requests[index].block;
		c = requests[index].done;
		d = requests[index].result;
	}

	//get result of random
	function getRandomByRequest(uint index) public returns (uint8 d)
	{
		if (block.number <= requests[index].block + blockDelay) {
			revert();
		}
		if (block.number > requests[index].block + blockExpired) {
			revert();
		}
		if (requests[index].done) {
			d = requests[index].result;
		} else {
			bytes32 blockHash = block.blockhash(requests[index].block + blockDelay);

			if (blockHash == 0) {
				revert();
			}

			bytes32 shaPlayer = sha3(requests[index].customer, blockHash);

			requests[index].done = true;
			requests[index].result = uint8(uint256(shaPlayer) % maxResult);
			d = requests[index].result;
		}
	}
}
