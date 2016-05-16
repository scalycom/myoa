<?php
namespace Vendor\Wxpay;
/**
 * 
 * 微信支付API异常类
 * @author widyhu
 *
 */
class WxPayException extends \Think\Exception {
	public function errorMessage()
	{
		return $this->getMessage();
	}
}
