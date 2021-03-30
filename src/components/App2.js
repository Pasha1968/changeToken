import React, { Component } from 'react'
import Web3 from 'web3'
import Token from '../abis/Token.json'
import EthSwap from '../abis/EthSwap.json'
import Navbar from './Navbar'
import Main from './Main'
import './App.css'
//front - end :(
//

//App1js - это обменик с метамаском, а это попытка сделать все своё используя WEB3JS

//https://web3js.readthedocs.io/en/v1.3.4/web3.html
//web = new Web3()//not connected to blockchain

//need 
// 1 : connect app to blockchain  web3.js
// 2 : connect browser to blockchain (metamask)_

//https://github.com/MetaMask/metamask-mobile/blob/develop/app/core/WalletConnect.js
class App extends Component {

// https://medium.com/coinmonks/build-your-ethereum-app-in-react-js-or-vue-with-create-eth-app-577e41860a47 <-----

//https://github.com/MetaMask/metamask-mobile/blob/develop/app/core/Encryptor.js

//https://docs.ethers.io/v5/concepts/events/
  async Loaddata(){
  window.web3 = new Web3( "http://localhost:7545");
  window.web3.eth.getAccounts().then(console.log);
  window.console.log(window.web3);
  }
  async componentWillMount() {
    await this.Loaddata()
  }

  // async loadWeb3() {//metamask info
  //   if (window.ethereum) {
  //     window.web3 = new Web3(window.ethereum)
  //     await window.ethereum.enable()
  //   }
  //   else if (window.web3) {
  //     window.web3 = new Web3(window.web3.currentProvider)
  //   }
  //   else {
  //     window.alert('Non-Ethereum browser detected. You should consider trying MetaMask!')
  //   }
  // }

  
  render() {
    let content
    

    return (
      <div>
        Hello World
        
      </div>
    );
  }
}

export default App;
