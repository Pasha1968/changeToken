import React, { Component } from 'react'

class Login extends Component {

		
	async Login(){
		const web3 = window.web3
		const accounts = await web3.eth.getAccounts()
		var accountg = window.prompt("enter your private key")

		window.console.log(accountg)
		accountg = web3.eth.accounts.privateKeyToAccount(accountg)
		window.console.log(accountg)
		this.setState({ accountg })
	}

	render(){
		return(
			<div>
				<h1> Login</h1>
				<button onClick={this.Login}>
      				Login
    			</button>
    		</div>
		)
	}
}

export default Login;