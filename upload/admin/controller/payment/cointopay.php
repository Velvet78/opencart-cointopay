<?php
class ControllerPaymentCoinToPay extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/cointopay');
                
		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                    
			$this->model_setting_setting->editSetting('cointopay', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title']					 = $this->language->get('heading_title');

                $this->data['text_payment']					 = $this->language->get('text_payment');
                $this->data['text_success']					 = $this->language->get('text_success');
                $this->data['text_bitcoin']                                    = $this->language->get('text_bitcoin');
                $this->data['text_litecoin']                                   = $this->language->get('text_litecoin');
                $this->data['text_darkcoin']                                   = $this->language->get('text_darkcoin');
                $this->data['text_freicoin']                                   = $this->language->get('text_freicoin');
                $this->data['text_enabled']                                    = $this->language->get('text_enabled');
                $this->data['text_disabled']                                   = $this->language->get('text_disabled');

                $this->data['entry_api_key']					 = $this->language->get('entry_api_key');
                $this->data['entry_crypto_coin']				 = $this->language->get('entry_crypto_coin');
                $this->data['entry_redirect_url']				 = $this->language->get('entry_redirect_url');
                $this->data['entry_status']					 = $this->language->get('entry_status');
                $this->data['entry_merchantID']				 = $this->language->get('entry_merchantID');
                $this->data['entry_display_name']				 = $this->language->get('entry_display_name');
                $this->data['entry_order_status']				 = $this->language->get('entry_order_status');
                $this->data['entry_callback_success_order_status']		 = $this->language->get('entry_callback_success_order_status');
                $this->data['entry_callback_failed_order_status']		 = $this->language->get('entry_callback_failed_order_status');
                
                $this->data['error_permission']				 = $this->language->get('error_permission');
                
                $this->data['button_save']                                     = $this->language->get('button_save');
		$this->data['button_cancel']                                   = $this->language->get('button_cancel');
                
                $this->data['help_api_key_hint']                               = $this->language->get('help_api_key_hint');
                $this->data['help_crypto_coin_hint']                           = $this->language->get('help_crypto_coin_hint');
                $this->data['help_redirect_url_hint']                          = $this->language->get('help_redirect_url_hint');
                $this->data['help_display_name_hint']                          = $this->language->get('help_display_name_hint');
                $this->data['help_merchantID_hint']                          = $this->language->get('help_merchantID_hint');
                
                $this->data['tab_general']					 = 'General';

                $this->data['token'] = $this->session->data['token'];
                
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

                if (isset($this->error['api_key'])) {
			$this->data['error_api_key'] = $this->error['api_key'];
		} else {
			$this->data['error_api_key'] = '';
		}
                
                if (isset($this->error['display_name'])) {
			$this->data['error_display_name'] = $this->error['display_name'];
		} else {
			$this->data['error_display_name'] = '';
		}
                
                if (isset($this->error['merchantID'])) {
			$this->data['error_merchantID'] = $this->error['merchantID'];
		} else {
			$this->data['error_merchantID'] = '';
		}
                
                if (isset($this->error['crypto_coin'])) {
			$this->data['error_crypto_coin'] = $this->error['crypto_coin'];
		} else {
			$this->data['error_crypto_coin'] = '';
		}
                
		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/cointopay', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);
                
		$this->data['action'] = $this->url->link('payment/cointopay', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
                
                if (isset($this->request->post['cointopay_display_name'])) {
			$this->data['cointopay_display_name'] = $this->request->post['cointopay_display_name'];
		} else {
			$this->data['cointopay_display_name'] = $this->config->get('cointopay_display_name');
		}
                
		if (isset($this->request->post['cointopay_api_key'])) {
			$this->data['cointopay_api_key'] = $this->request->post['cointopay_api_key'];
		} else {
			$this->data['cointopay_api_key'] = $this->config->get('cointopay_api_key');
		}

                if (isset($this->request->post['cointopay_status'])) {
			$this->data['cointopay_status'] = $this->request->post['cointopay_status'];
		} else {
			$this->data['cointopay_status'] = $this->config->get('cointopay_status');
		}
                
                if (isset($this->request->post['cointopay_crypto_coin'])) {
			$this->data['cointopay_crypto_coin'] = $this->request->post['cointopay_crypto_coin'];
		} else {
			$this->data['cointopay_crypto_coin'] = $this->config->get('cointopay_crypto_coin');
		}
                
                if (isset($this->request->post['cointopay_order_status_id'])) {
			$this->data['cointopay_order_status_id'] = $this->request->post['cointopay_order_status_id'];
		} else {
			$this->data['cointopay_order_status_id'] = $this->config->get('cointopay_order_status_id');
		}
                
                if (isset($this->request->post['cointopay_callback_success_order_status_id'])) {
			$this->data['cointopay_callback_success_order_status_id'] = $this->request->post['cointopay_callback_success_order_status_id'];
		} else {
			$this->data['cointopay_callback_success_order_status_id'] = $this->config->get('cointopay_callback_success_order_status_id');
		}
                
                if (isset($this->request->post['cointopay_callback_failed_order_status_id'])) {
			$this->data['cointopay_callback_failed_order_status_id'] = $this->request->post['cointopay_callback_failed_order_status_id'];
		} else {
			$this->data['cointopay_callback_failed_order_status_id'] = $this->config->get('cointopay_callback_failed_order_status_id');
		}
                
                if (isset($this->request->post['cointopay_merchantID'])) {
			$this->data['cointopay_merchantID'] = $this->request->post['cointopay_merchantID'];
		} else {
			$this->data['cointopay_merchantID'] = $this->config->get('cointopay_merchantID');
                        
                        $this->data['crypto_coins'] = $this->getMerchantCoins($this->config->get('cointopay_merchantID'));
                        
		}
                
                
                $this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
                
                $this->template = 'payment/cointopay.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/cointopay')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->request->post['cointopay_api_key']) {
			$this->error['api_key'] = $this->language->get('error_api_key');
		}
                
                if (!$this->request->post['cointopay_display_name']) {
			$this->error['display_name'] = $this->language->get('error_display_name');
		}
                
                if (!$this->request->post['cointopay_merchantID']) {
			$this->error['merchantID'] = $this->language->get('error_merchantID');
		}
                
                if (!$this->request->post['cointopay_crypto_coin']) {
			$this->error['crypto_coin'] = $this->language->get('error_crypto_coin');
		}

		return !$this->error;
	}
        
        function getMerchantCoinsByAjax()
        {
            if($this->request->post['merchantId'])
            {
                $option = '<option value="">Select Default Coin</option>';
                $arr = $this->getMerchantCoins($this->request->post['merchantId']);
                foreach($arr as $key => $value)
                {
                    $option .= '<option value="'.$key.'">'.$value.'</option>';
                }
                echo $option;
            }
        }
        
        function getMerchantCoins($merchantId)
        {
            $url = 'http://cointopay.com/CloneMasterTransaction?MerchantID='.$merchantId.'&output=json';
            $ch = curl_init($url);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, 3);
            $output = curl_exec($ch);
            curl_close($ch);

            $php_arr = json_decode($output);
            $new_php_arr = array();
            
            if(count($php_arr)>0)
            {
                for($i=0;$i<count($php_arr)-1;$i++)
                {
                    if(($i%2)==0)
                    {
                        $new_php_arr[$php_arr[$i+1]] = $php_arr[$i];
                    }
                }
            }
            return $new_php_arr;
        }
}