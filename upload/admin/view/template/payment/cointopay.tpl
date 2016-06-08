<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/payment.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
        </div>
        <div class="content">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <script type="text/javascript">
                    <?php if((isset($cointopay_merchantID) && !empty($cointopay_merchantID)) && (isset($cointopay_crypto_coin) && empty($cointopay_crypto_coin))){?>
                        $(document).ready(function(){
                            getMerchantCoin('<?php echo $cointopay_merchantID;?>');
                        });
                    <?php } ?>
                    function getMerchantCoin(merchantId)
                    {
                        $.ajax({
                            url:'index.php?route=payment/cointopay/getMerchantCoinsByAjax&token=<?php echo $token?>',
                            type:'post',
                            data:{merchantId:merchantId},
                            success:function(res){
                                $('#cointopay_crypto_coin').html(res);
                            }
                        });
                    }
                </script>
                <table class="form">
                    <tr>
                        <td>
                            <span class="required">*</span> 
                            <?php echo $entry_display_name; ?></br>
                            <span class="help"><?php echo $help_display_name_hint; ?></span>
                        </td>
                        <td><input type="text" name="cointopay_display_name" value="<?php echo $cointopay_display_name; ?>" id="cointopay_display_name"/>
                            <?php if ($error_display_name) { ?>
                                <span class="error"><?php echo $error_display_name; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="required">*</span> 
                            <?php echo $entry_api_key; ?></br>
                            <span class="help"><?php echo $help_api_key_hint; ?></span>
                        </td>
                        <td><input type="text" name="cointopay_api_key" value="<?php echo $cointopay_api_key; ?>" id="cointopay_api_key"/>
                            <?php if ($error_api_key) { ?>
                                <span class="error"><?php echo $error_api_key; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="required">*</span> 
                            <?php echo $entry_merchantID; ?></br>
                            <span class="help"><?php echo $help_merchantID_hint; ?></span>
                        </td>
                        <td><input type="text" name="cointopay_merchantID" value="<?php echo $cointopay_merchantID; ?>" id="cointopay_merchantID" onchange="getMerchantCoin(this.value);"/>
                            <?php if ($error_merchantID) { ?>
                                <span class="error"><?php echo $error_merchantID; ?></span>
                            <?php } ?></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="required">*</span> 
                            <?php echo $entry_crypto_coin; ?>
                            <span class="help"><?php echo $help_crypto_coin_hint; ?></span>
                        </td>
                        <td>
                            <select name="cointopay_crypto_coin" id="cointopay_crypto_coin">
                                <?php if($cointopay_crypto_coin && !empty($cointopay_crypto_coin)) {?>
                                    <option value="">Select Default Coin</option>
                                    <?php foreach ($crypto_coins as $key=>$value) { ?>
                                        <option value="<?php echo $key;?>" <?php if($key == $cointopay_crypto_coin){echo 'selected="selected"';}?>><?php echo $value;?></option>
                                    <?php } ?>
                                <?php }else{?>
                                    <option value="">Select Default Coin</option>    
                                <?php } ?>
                            </select>
                            <?php if ($error_crypto_coin) { ?>
                                <span class="error"><?php echo $error_crypto_coin; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo $entry_order_status; ?>
                        </td>
                        <td>
                            <select name="cointopay_order_status_id" id="cointopay_order_status_id">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                    <?php if ($order_status['order_status_id'] == $cointopay_order_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo $entry_callback_success_order_status; ?>
                        </td>
                        <td>
                            <select name="cointopay_callback_success_order_status_id" id="cointopay_callback_success_order_status_id">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                    <?php if ($order_status['order_status_id'] == $cointopay_callback_success_order_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo $entry_callback_failed_order_status; ?>
                        </td>
                        <td>
                            <select name="cointopay_callback_failed_order_status_id" id="cointopay_callback_failed_order_status_id">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                    <?php if ($order_status['order_status_id'] == $cointopay_callback_failed_order_status_id) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                    <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                    <?php } ?>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo $entry_redirect_url; ?>
                        </td>
                        <td>
                            <strong><?php echo $help_redirect_url_hint; ?></strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <?php echo $entry_status; ?>
                        </td>
                        <td>
                            <select name="cointopay_status" id="cointopay_status">
                                <?php if ($cointopay_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<?php echo $footer; ?> 