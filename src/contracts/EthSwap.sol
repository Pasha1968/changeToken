pragma solidity ^0.5.0;

import "./Token.sol";

// Кошелек должен предоставить возможность покупки / продажи токенов,
// просмотра баланса и трансфера токенов.


// Должен быть разработан смарт-контракт для обмена ether на токены и
// наоборот. Смарт-контракт должен предоставить возможность установки курсов.
// 4) Курсы обмена могут задаваться через CLI.
contract EthSwap {
  string public name = "EasyPay Exchange";
  Token public token;
  uint public rate = 100;

  event TokensPurchased(//Вот это можно использовать для записи в журнал
    address account,
    address token,
    uint amount,
    uint rate
  );

  event TokensSold(
    address account,
    address token,
    uint amount,
    uint rate
  );

  constructor(Token _token) public {
    token = _token;// функция для задания курса
  }

  function changeRate (uint newrate) public {
  
    rate = newrate;

  }


  function buyTokens() public payable { //get -> check amount -> transfer
    // Calculate the number of tokens to buy
    uint tokenAmount = msg.value * rate;

    // Require that EthSwap has enough tokens
    require(token.balanceOf(address(this)) >= tokenAmount);

    // Transfer tokens to the user
    token.transfer(msg.sender, tokenAmount);

    // Emit an event
    emit TokensPurchased(msg.sender, address(token), tokenAmount, rate);
  }

  function sellTokens(uint _amount) public {
    // User can't sell more tokens than they have
    require(token.balanceOf(msg.sender) >= _amount);

    // Calculate the amount of Ether to redeem
    uint etherAmount = _amount / rate;

    // Require that EthSwap has enough Ether
    require(address(this).balance >= etherAmount);

    // Perform sale
    token.transferFrom(msg.sender, address(this), _amount);//from to amount
    msg.sender.transfer(etherAmount); //send ether to person, who called this func or smt like that

    // Emit an event
    emit TokensSold(msg.sender, address(token), _amount, rate);
  }

}
