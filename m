Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28239020C;
	Wed, 12 Aug 2026 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564531; cv=none; b=lPG5VkUgdeJFm95v1Hsn7SSCBOPVgOm21Cj6/MilPP0xepCCfENSYbKNoKI7/zFylDZvzlC2lP6XxviwPNXmqp9teJ7XTu00dTzkysSMAXPhNE3oK5m/yus5QzGn/q4OPJ9pPydRfR8axM56WvRCM9uUmRxaCYK8SucWjnVwD+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564531; c=relaxed/simple;
	bh=14YMkepUba8OMXYj93ZJjJxtDbJ/KpQndWsYQqwDoqU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=D82g8WETK7546e5tvrtacT4NQXK8vzmu2XMgNf8FjCUZ/yhocJ3bgi5IH6Wj19jkZxz3c+lCHxOXXGWB+hPfpuAg4VmIkpQPjJ8Mxa7uccc/iooB3qvJPzvpnvTZDNEFH4g/gaNB1G6+BE4sie2ip6QoaRKa5KNjqAChQMWDSjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=kiqpQv/I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pi+Jjfxq; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="kiqpQv/I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pi+Jjfxq"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4A2FC14000AD;
	Wed, 12 Aug 2026 15:55:28 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Wed, 12 Aug 2026 15:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786564528;
	 x=1786650928; bh=14sp39/wf5Ys1OU60CyXVXV4uOfUigH15n3bLxJgYvw=; b=
	kiqpQv/I5/8Oxl7Tmz4w09gCpPSXUJI1DUDKeRDM8UikknkG/HjvLUoZbGjTib4i
	iRa9CDEwAGoZSDq2LZezNrFw/tCrRfCJXFL2WdHArPOAyW8PUYaHSDF6JXCKSL/V
	/dON4WR4hIxVF7KD0mur1l5d4fBKAF72bjXypd4KdovmyPAxPP6uHCp41lVVjnTP
	9jyf+251fzB8oMNRxE8ekSxqNFJFxsHnnIerxoCKfLSR5OhVL4YxmvMGuiiVCKw3
	fs9mDrAHlfZpy4rHJ7G+q+cjTp50FlvaisskYTZy3k2KiFUSV6STColY3IVDn0jz
	yB6npXFUxJWSw9EMtBKDJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786564528; x=
	1786650928; bh=14sp39/wf5Ys1OU60CyXVXV4uOfUigH15n3bLxJgYvw=; b=P
	i+Jjfxq2wGtexTq07Z38DLRr3u1+8nDeRaDWbHg/c3zV7M8KDIIW1p/W6yBHYztf
	mrfrQhcjmG0PFmiMsj+1XYVfEmLZr7hg6OhvtqWCdS9zkoWFMeQyaINQeBynK2f/
	CCR38DOZzOBasuNTA5KUHiRZ4ZVHX4dEk9WyUE6eA8W+JDM6q5FnISX+qMG80Rhi
	jYahFala6wcRXpETRTQ57RIv6MPyDtg7IB7gUL1iHA4Qj6ErZsTRZrp73qccJ6rU
	Cu47nGFDe1ME2+A80o279jMA2WXuYuGhQS56tJnat263b1/DJykpbYTqiyGKPRGA
	9VaZ6hD/N9lIJKetAJg+Q==
X-ME-Sender: <xms:r898asgg8qLoa5hyHUPxkW8xP54evYKpRJlav278f_3ytGhxToY2eg>
    <xme:r898av14em41NAjlOc4zOc2yP1d1mGDSupUylZ7Rnn-AvkIsHjvIs8KFH4JuIWzRC
    1iMkUR8h5-u7CaaL1EsivIMvJOZK_FAiuw9qqy36Bdd_Y6yNVqGGPrE>
X-ME-Proxy-Cause: dmFkZTGuyPvaZgtQyEOoiChlK75pJql1zw/bZTB1M749xN/GKMK00ls2Gj1dEdnfyHMpgT
    LXkKeFvYA7cVX/Qr5dqBvtJl0+S0WlbA4TBvbY125hEh08V3nI/kh6t5lXDR96uF9PEJhy
    eQIgd8a67ES8htaag/mPPY2ciF3bvFpHFYJIp+3HgvVO030XQ7KROKSxzsRTt2bfSKh6Mq
    TZF0fy697yuANesslViHPEl64pm+sPfA6jJ1wKySoldhlAk4VoYef5pFDW74yG5qKdVRbW
    pH9+2JdyODjlyMXS7DMOp1/tIHnpKUY3F6fE7hzZp8q/+lJncJnprYX5eiIpBn4k93zpGp
    CR87OHIexJ3lqINyMSUlt/zTfP6so6YRp2mLedlSm8h8zJrtLR0yoJTTeBXA0U+44rPfJc
    WJkDgTV/I61dYgjmL5QwrRK5NtGY3cBugJ+CgqJOTDoHAUA8ue/QG5w5Yb3wft4P4XO4rk
    kBwtIL7quCoCryyg5NrLtGe5Dz9AgEKl8nbLLy6bMxb3ofxazW75Tifnl7usqCRjHhHxT9
    cI0wv4JXyeSG8JCsJWKdiTfsHWAB7nZO/ZwuL28R9RUCCkcHh7Jve0iKgpo6xkAxX3PEZX
    sgRerzsszeuksFVSZW6P4jNHlDr3m60RHWoC0LmBU3s9DeaEeSz9lF8Jq2yg
X-ME-Proxy: <xmx:r898aq_AIvag42eCEoriGM04Z9orGCsNJzKbaNPlos7dIlZ-GPkKLg>
    <xmx:r898aoGt_fwBwnBTNsPI9xuKEZFVRkCCXOPEsxO0KCUddDbr0KoCwQ>
    <xmx:r898apjWQjXChcU7aUv6zBHD61KJOwiZXI9yqH0PYE5OpusGiXCecg>
    <xmx:r898atuw3OfqPYipD-ilAXrqdg1rskDJsaEDJaS84jmgo2qKPc-61w>
    <xmx:sM98anVnoJcV-E1Xi7K_vFnn5spW7VImzcGKhkuHgFvGkldZgFXukSrz>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B7F22CE0072; Wed, 12 Aug 2026 15:55:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AP5BIVipIj7w
Date: Wed, 12 Aug 2026 15:55:06 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Nitin Joshi" <nitjoshi@gmail.com>, "Hans de Goede" <hansg@kernel.org>
Message-Id: <24dca37c-b91f-4dba-aa8f-4a9fc55e8f2b@app.fastmail.com>
In-Reply-To: <7a924f0a-0afb-4ae0-a106-37cdc76836bd@app.fastmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
 <7a924f0a-0afb-4ae0-a106-37cdc76836bd@app.fastmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH 1/3] platform/x86: thinkpad_acpi: convert
 mutex_lock() to guard(mutex)
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Aug 12, 2026, at 2:29 PM, Mark Pearson wrote:
> Thanks Dmitry,
>
> On Thu, Aug 6, 2026, at 2:19 AM, Dmitry Torokhov wrote:
>> Convert straightforward mutex_lock() and mutex_unlock() usages for
>> hotkey_mutex, tpacpi_inputdev_send_mutex, kbdlight_mutex, lcdshadow_dev
>> lock, and dytc_mutex to guard(mutex) and scoped_guard(mutex) helpers
>> from linux/cleanup.h.
>>
>> This improves code readability and ensures that mutexes are
>> automatically released when exiting their respective scopes.
>>
>> Assisted-by: Antigravity:gemini-3.6-flash
>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> ---
>>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 139 ++++++++------------
>>  1 file changed, 57 insertions(+), 82 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
>> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> index f8e116e8a65d..beb85ea1103b 100644
>> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
>> @@ -2164,7 +2164,7 @@ static int tpacpi_hotkey_driver_mask_set(const 
>> u32 mask)
>>  		return 0;
>>  	}
>> 
>> -	mutex_lock(&hotkey_mutex);
>> +	guard(mutex)(&hotkey_mutex);
>> 
>>  	HOTKEY_CONFIG_CRITICAL_START
>>  	hotkey_driver_mask = mask;
>> @@ -2177,8 +2177,6 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
>>  							~hotkey_source_mask);
>>  	hotkey_poll_setup(true);
>> 
>> -	mutex_unlock(&hotkey_mutex);
>> -
>>  	return rc;
>>  }
>> 
>> @@ -2202,15 +2200,12 @@ static void tpacpi_input_send_tabletsw(void)
>>  {
>>  	int state;
>> 
>> -	if (tp_features.hotkey_tablet &&
>> -	    !hotkey_get_tablet_mode(&state)) {
>> -		mutex_lock(&tpacpi_inputdev_send_mutex);
>> +	if (tp_features.hotkey_tablet && !hotkey_get_tablet_mode(&state)) {
>> +		guard(mutex)(&tpacpi_inputdev_send_mutex);
>> 
>>  		input_report_switch(tpacpi_inputdev,
>>  				    SW_TABLET_MODE, !!state);
>>  		input_sync(tpacpi_inputdev);
>> -
>> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
>>  	}
>>  }
>> 
>> @@ -2235,7 +2230,6 @@ static int get_camera_shutter(void)
>> 
>>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>>  {
>> -	bool known_ev;
>>  	u32 scancode;
>> 
>>  	if (tpacpi_driver_event(hkey))
>> @@ -2278,11 +2272,8 @@ static bool tpacpi_input_send_key(const u32 
>> hkey, bool *send_acpi_ev)
>>  		scancode = hkey;
>>  	}
>> 
>> -	mutex_lock(&tpacpi_inputdev_send_mutex);
>> -	known_ev = sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
>> -	mutex_unlock(&tpacpi_inputdev_send_mutex);
>> -
>> -	return known_ev;
>> +	guard(mutex)(&tpacpi_inputdev_send_mutex);
>> +	return sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
>>  }
>> 
>>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>> @@ -2572,9 +2563,8 @@ static void hotkey_poll_setup(const bool may_warn)
>> 
>>  static void hotkey_poll_setup_safe(const bool may_warn)
>>  {
>> -	mutex_lock(&hotkey_mutex);
>> +	guard(mutex)(&hotkey_mutex);
>>  	hotkey_poll_setup(may_warn);
>> -	mutex_unlock(&hotkey_mutex);
>>  }
>> 
>>  static void hotkey_poll_set_freq(unsigned int freq)
>> @@ -3077,13 +3067,11 @@ static void tpacpi_send_radiosw_update(void)
>> 
>>  	/* Issue rfkill input event for WLSW switch */
>>  	if (!(wlsw < 0)) {
>> -		mutex_lock(&tpacpi_inputdev_send_mutex);
>> +		guard(mutex)(&tpacpi_inputdev_send_mutex);
>> 
>>  		input_report_switch(tpacpi_inputdev,
>>  				    SW_RFKILL_ALL, (wlsw > 0));
>>  		input_sync(tpacpi_inputdev);
>> -
>> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
>>  	}
>> 
>>  	/*
>> @@ -3095,7 +3083,7 @@ static void tpacpi_send_radiosw_update(void)
>> 
>>  static void hotkey_exit(void)
>>  {
>> -	mutex_lock(&hotkey_mutex);
>> +	guard(mutex)(&hotkey_mutex);
>>  	hotkey_poll_stop_sync();
>>  	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
>>  		   "restoring original HKEY status and mask\n");
>> @@ -3105,8 +3093,6 @@ static void hotkey_exit(void)
>>  	      hotkey_mask_set(hotkey_orig_mask)) |
>>  	     hotkey_status_set(false)) != 0)
>>  		pr_err("failed to restore hot key mask to BIOS defaults\n");
>> -
>> -	mutex_unlock(&hotkey_mutex);
>>  }
>> 
>>  /*
>> @@ -3423,11 +3409,11 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  	if (tp_features.hotkey_mask) {
>>  		/* hotkey_source_mask *must* be zero for
>>  		 * the first hotkey_mask_get to return hotkey_orig_mask */
>> -		mutex_lock(&hotkey_mutex);
>> -		res = hotkey_mask_get();
>> -		mutex_unlock(&hotkey_mutex);
>> -		if (res)
>> -			return res;
>> +		scoped_guard(mutex, &hotkey_mutex) {
>> +			res = hotkey_mask_get();
>> +			if (res)
>> +				return res;
>> +		}
>> 
>>  		hotkey_orig_mask = hotkey_acpi_mask;
>>  	} else {
>> @@ -3526,11 +3512,11 @@ static int __init hotkey_init(struct 
>> ibm_init_struct *iibm)
>>  		hotkey_exit();
>>  		return res;
>>  	}
>> -	mutex_lock(&hotkey_mutex);
>> -	res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
>> -			       | hotkey_driver_mask)
>> -			      & ~hotkey_source_mask);
>> -	mutex_unlock(&hotkey_mutex);
>> +	scoped_guard(mutex, &hotkey_mutex) {
>> +		res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
>> +				       | hotkey_driver_mask)
>> +				      & ~hotkey_source_mask);
>> +	}
>>  	if (res < 0 && res != -ENXIO) {
>>  		hotkey_exit();
>>  		return res;
>> @@ -3977,11 +3963,11 @@ static void hotkey_resume(void)
>>  {
>>  	tpacpi_disable_brightness_delay();
>> 
>> -	mutex_lock(&hotkey_mutex);
>> -	if (hotkey_status_set(true) < 0 ||
>> -	    hotkey_mask_set(hotkey_acpi_mask) < 0)
>> -		pr_err("error while attempting to reset the event firmware interface\n");
>> -	mutex_unlock(&hotkey_mutex);
>> +	scoped_guard(mutex, &hotkey_mutex) {
>> +		if (hotkey_status_set(true) < 0 ||
>> +		    hotkey_mask_set(hotkey_acpi_mask) < 0)
>> +			pr_err("error while attempting to reset the event firmware interface\n");
>> +	}
>> 
>>  	tpacpi_send_radiosw_update();
>>  	tpacpi_input_send_tabletsw();
>> @@ -5034,21 +5020,16 @@ static DEFINE_MUTEX(kbdlight_mutex);
>> 
>>  static int kbdlight_set_level(int level)
>>  {
>> -	int ret = 0;
>> -
>>  	if (!hkey_handle)
>>  		return -ENXIO;
>> 
>> -	mutex_lock(&kbdlight_mutex);
>> +	guard(mutex)(&kbdlight_mutex);
>> 
>>  	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
>> -		ret = -EIO;
>> -	else
>> -		kbdlight_brightness = level;
>> -
>> -	mutex_unlock(&kbdlight_mutex);
>> +		return -EIO;
>> 
>> -	return ret;
>> +	kbdlight_brightness = level;
>> +	return 0;
>>  }
>> 
>>  static int kbdlight_get_level(void)
>> @@ -10103,9 +10084,8 @@ static void lcdshadow_resume(void)
>>  	if (!lcdshadow_dev)
>>  		return;
>> 
>> -	mutex_lock(&lcdshadow_dev->lock);
>> +	guard(mutex)(&lcdshadow_dev->lock);
>>  	lcdshadow_set_sw_state(lcdshadow_dev, lcdshadow_dev->sw_state);
>> -	mutex_unlock(&lcdshadow_dev->lock);
>>  }
>> 
>>  static int lcdshadow_read(struct seq_file *m)
>> @@ -10137,9 +10117,8 @@ static int lcdshadow_write(char *buf)
>>  	if (state >= 2 || state < 0)
>>  		return -EINVAL;
>> 
>> -	mutex_lock(&lcdshadow_dev->lock);
>> -	res = lcdshadow_set_sw_state(lcdshadow_dev, state);
>> -	mutex_unlock(&lcdshadow_dev->lock);
>> +	scoped_guard(mutex, &lcdshadow_dev->lock)
>> +		res = lcdshadow_set_sw_state(lcdshadow_dev, state);
>> 
>>  	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
>> 
>> @@ -10603,26 +10582,26 @@ static const struct platform_profile_ops 
>> dytc_profile_ops = {
>>  static void dytc_profile_refresh(void)
>>  {
>>  	enum platform_profile_option profile;
>> -	int output = 0, err = 0;
>> +	int output = 0, err;
>>  	int perfmode, funcmode = 0;
>> 
>> -	mutex_lock(&dytc_mutex);
>> -	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>> -		if (dytc_mmc_get_available)
>> -			err = dytc_command(DYTC_CMD_MMC_GET, &output);
>> -		else
>> -			err = dytc_cql_command(DYTC_CMD_GET, &output);
>> -		funcmode = DYTC_FUNCTION_MMC;
>> -	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>> -		err = dytc_command(DYTC_CMD_GET, &output);
>> -		/* Check if we are PSC mode, or have AMT enabled */
>> -		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>> -	} else { /* Unknown profile mode */
>> -		err = -ENODEV;
>> +	scoped_guard(mutex, &dytc_mutex) {
>> +		if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
>> +			if (dytc_mmc_get_available)
>> +				err = dytc_command(DYTC_CMD_MMC_GET, &output);
>> +			else
>> +				err = dytc_cql_command(DYTC_CMD_GET, &output);
>> +			funcmode = DYTC_FUNCTION_MMC;
>> +		} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
>> +			err = dytc_command(DYTC_CMD_GET, &output);
>> +			/* Check if we are PSC mode, or have AMT enabled */
>> +			funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>> +		} else { /* Unknown profile mode */
>> +			err = -ENODEV;
>> +		}
>> +		if (err)
>> +			return;
>>  	}
>> -	mutex_unlock(&dytc_mutex);
>> -	if (err)
>> -		return;
>> 
>>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
>>  	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
>> @@ -11425,7 +11404,7 @@ static bool tpacpi_driver_event(const unsigned 
>> int hkey_event)
>>  		if (tp_features.kbdlight) {
>>  			enum led_brightness brightness;
>> 
>> -			mutex_lock(&kbdlight_mutex);
>> +			guard(mutex)(&kbdlight_mutex);
>> 
>>  			/*
>>  			 * Check the brightness actually changed, setting the brightness
>> @@ -11437,8 +11416,6 @@ static bool tpacpi_driver_event(const unsigned 
>> int hkey_event)
>>  				led_classdev_notify_brightness_hw_changed(
>>  					&tpacpi_led_kbdlight.led_classdev, brightness);
>>  			}
>> -
>> -			mutex_unlock(&kbdlight_mutex);
>>  		}
>>  		/* Key events are suppressed by default hotkey_user_mask */
>>  		return false;
>> @@ -11460,11 +11437,11 @@ static bool tpacpi_driver_event(const 
>> unsigned int hkey_event)
>>  			enum drm_privacy_screen_status old_hw_state;
>>  			bool changed;
>> 
>> -			mutex_lock(&lcdshadow_dev->lock);
>> -			old_hw_state = lcdshadow_dev->hw_state;
>> -			lcdshadow_get_hw_state(lcdshadow_dev);
>> -			changed = lcdshadow_dev->hw_state != old_hw_state;
>> -			mutex_unlock(&lcdshadow_dev->lock);
>> +			scoped_guard(mutex, &lcdshadow_dev->lock) {
>> +				old_hw_state = lcdshadow_dev->hw_state;
>> +				lcdshadow_get_hw_state(lcdshadow_dev);
>> +				changed = lcdshadow_dev->hw_state != old_hw_state;
>> +			}
>> 
>>  			if (changed)
>>  				drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
>> @@ -11485,12 +11462,10 @@ static bool tpacpi_driver_event(const 
>> unsigned int hkey_event)
>>  			pr_err("Error retrieving camera shutter state after shutter 
>> event\n");
>>  			return true;
>>  		}
>> -		mutex_lock(&tpacpi_inputdev_send_mutex);
>> -
>> -		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, 
>> camera_shutter_state);
>> -		input_sync(tpacpi_inputdev);
>> -
>> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
>> +		scoped_guard(mutex, &tpacpi_inputdev_send_mutex) {
>> +			input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, 
>> camera_shutter_state);
>> +			input_sync(tpacpi_inputdev);
>> +		}
>>  		return true;
>>  	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>>  		/* Toggle kernel-level doubletap event filtering */
>> -- 
>> 2.55.0.679.g6767b8d81c-goog
>
> Sorry, took me a while to get to this one.
> Changes look good, nice cleanup.
>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>
> Mark
>
Ran a build with all 3 patches on a P14s G7 and couldn't see any problems.
So, for the series:
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
