pragma solidity ^0.5.0;


// Должен быть разработан смарт-контракт монеты на базе стандарта ERC20.
contract Token {
    string  public name = "DApp Token";
    string  public symbol = "DAPP";
    uint256 public totalSupply = 1000000000000000000000000; // 1 million tokens
    uint8   public decimals = 18;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}

// //or 


// contract ERC20Interface {
//     function totalSupply()
//         public
//         view
//         returns (uint);

//     function balanceOf(address tokenOwner)
//         public
//         view
//         returns (uint balance);
    
//     function allowance
//         (address tokenOwner, address spender)
//         public
//         view
//         returns (uint remaining);

//     function transfer(address to, uint tokens)              public
//         returns (bool success);
    
//     function approve(address spender, uint tokens)      public
//         returns (bool success);

//     function transferFrom
//         (address from, address to, uint tokens) public
//         returns (bool success);


//     event Transfer(address indexed from, address indexed to, uint tokens);
//     event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
// }
// contract SafeMath{
//     function safeAdd(uint a, uint b) public pure returns (uint c) {
//         c = a + b;
//         require(c >= a);
//     }
//     function safeSub(uint a, uint b) public pure returns (uint c) {
//         require(b <= a);
//         c = a - b;
       
//     }
//     function safeMul(uint a, uint b) public pure returns (uint c) {
//         c = a * b;
//         require(a == 0 || c/a == b);
//     }
//     function safeDiv(uint a, uint b) public pure returns (uint c) {
//         require(b > 0);
//         c = a/b;
//     }
// }

// contract Porttoken is ERC20Interface ,SafeMath
// {
//     string public name;
//     string public symbol;
//     uint8 public decimals; // 18 decimals is the strongly suggested default, avoid changing it
    
//     uint256 public _totalSupply;
   
//     mapping(address => uint) balances;
//     mapping(address => mapping(address => uint)) allowed;
   
//     /**
//      * Constrctor function
//      *
//      * Initializes contract with initial supply tokens to the creator of the contract
//      */
//     constructor() public {
//         name = "Porttoken";
//         symbol = "PTC";
//         decimals = 18;
//         _totalSupply = 100000000000000000000000000;
       
//         balances[msg.sender] = _totalSupply;
//         emit Transfer(address(0), msg.sender, _totalSupply);
//     }
   
//     function totalSupply() public view returns (uint) {
//         return _totalSupply  - balances[address(0)];
//     }
   
//     function balanceOf(address tokenOwner) public view returns (uint balance) {
//         return balances[tokenOwner];
//     }
   
//     function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
//         return allowed[tokenOwner][spender];
//     }
   
//     function approve(address spender, uint tokens) public returns (bool success) {
//         allowed[msg.sender][spender] = tokens;
//         emit Approval(msg.sender, spender, tokens);
//         return true;
//     }
   
//     function transfer(address to, uint tokens) public returns (bool success) {
//         balances[msg.sender] = safeSub(balances[msg.sender], tokens);
//         balances[to] = safeAdd(balances[to], tokens);
//         emit Transfer(msg.sender, to, tokens);
//         return true;
//     }
   
//     function transferFrom(address from, address to, uint tokens) public returns (bool success) {
//         balances[from] = safeSub(balances[from], tokens);
//         allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
//         balances[to] = safeAdd(balances[to], tokens);
//         emit Transfer(from, to, tokens);
//         return true;
        
//     }
// }