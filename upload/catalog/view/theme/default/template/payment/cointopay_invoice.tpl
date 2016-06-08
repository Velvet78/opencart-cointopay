<?php echo $header; ?>
<div id="content">
    <fieldset>
        <?php if(isset($error)) { ?>
            <div class="warning"><?php echo $error;?></div>
        <?php }else{ ?>
            <legend><h2><?php echo $text_title;?></h2></legend>
            <div class="login-content">
                <div class="left">
                    <table class="form">
                        <tbody>
                            <tr>
                                <td><?php echo $text_transaction_id;?></td>
                                <td><?php echo $TransactionID;?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="form">
                        <tbody>
                            <tr>
                                <td><?php echo $text_address;?></td>
                                <td><?php echo $coinAddress;?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="form">
                        <tbody>
                            <tr>
                                <td><?php echo $text_amount;?></td>
                                <td><?php echo $Amount;?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="form">
                        <tbody>
                            <tr>
                                <td><?php echo $text_coinname;?></td>
                                <td><?php echo $CoinName;?></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="form">
                        <tbody>
                            <tr>
                                <td></td>
                                <td><img src="<?php echo $QRCodeURL;?>" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <table class="form">
                        <tbody>
                            <tr>
                                <td><?php echo $text_pay_with_other;?></td>
                                <td><a href="<?php echo $RedirectURL;?>" ><?php echo $text_clickhere;?></a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="right">
                    <div style="text-align: center;">
                        <img src="http://cointopay.com/img/logo.png" />
                    </div>
                    </br>
                    <div>
                        Cointopay International B.V. is providing crypto payment and web wallet services.
                        You can make and receive payments, but also offer your goods on the crypto market without the need to 
                        setup your own shopping cart. 
                        We are fully integrated with the banking system via Belfius bank and with payment service provider ICEPAY, 
                        this means we are fully enabled to serve you. Take full advantage now.
                        </br></br>
                        <strong>Pricing</strong></br></br>
                        We offer one payment model: Pay 0.5% per successful outgoing transaction.
                        Incoming transactions are free, as well as Cointopay T-Zero internal payments.</br></br>
                        <strong>Buy Crypto Coins</strong></br></br>
                        You can buy crypto currencies like BitCoin from us directly into your wallet. 
                        Register for an account, go to your dashboard, generate an invoice then pay it via other payment options. 
                        Once completed your coins will directly show up into your dashboard. Ready for sending!

                        Please note that the input currency has to be set to Euro, US Dollar or Chinese Yuan for the alternative payment button to appear. 
                        You are basically invoicing yourself.
                    </div>
                </div>
            </div>
        <?php } ?>
    </fieldset>
</div>
<?php echo $footer; ?>