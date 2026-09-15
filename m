Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D63F46EC77;
	Tue, 15 Sep 2026 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789472021; cv=none; b=Kljr6NrT6EHscv/b0X/ZbutX0bpKdoGyEUqB4gunPoJVL/fW4d2/CzLJJp2pHDc//rJqm1DQ77pvM0l4utFypGleJDeD653L7k4RIBrHmGZcoZjz3XHzvwwm/fqeCZIP2QfbfBY26hMNGBd/+T6bI1UNODbuCkzY5EbHTzllRjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789472021; c=relaxed/simple;
	bh=uKIKvgewVRs7/B1mDvkn4Vyj+re2oz2aoTTEA4Wdmng=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FzLeIZu+eOZSVXtcCehhHe9aIlg5wVPbTHxtPI72NjKiUrnpEom1CEzBao13KQeCcqZf0MyJtdTP9m56zY/TPJnXPy/kz1WTHXTXJFUqTEbvktqsKOpnw5k5AJiTvHyCcHBXOWzry4pXbcDzRELvD0pnu1GdHk4QGoy00/bkEt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbRQHCD/; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbRQHCD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789472019; x=1821008019;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=uKIKvgewVRs7/B1mDvkn4Vyj+re2oz2aoTTEA4Wdmng=;
  b=FbRQHCD/hhNOtwpbuGi8fP7isX7L5T055pFN3uJkHdJtQK7nuxSrrJgb
   ha+JA3fNPUfOMc7OuIWj3dWoYzdYcD8+l+rlAo8h+V2BKKt8x/bQZryw7
   lXT8rtppjaM8tSTvtGdZvGop/mJ5CW/TThXOOPP5tRA/PDII22xs9PHF3
   Q48v3S536WvW3UkYfpzxpW+0L9zdEe1Uq3Fq9z7LarWfzVE4wL9BCCG1S
   BSCaVoYnamhcsJVM9Vx1wmd39HR9/FOsnDVmIqqavDd+V5OJNb2BEtlw+
   eXJY7nrVfskRXcahKZkHAcQspqdVdr5vUWpCuwwntEfcf1NK+Ip1pqnSb
   w==;
X-CSE-ConnectionGUID: cY4fBphLTQuW8SJLN8NsMg==
X-CSE-MsgGUID: XfKREV+oTE2Um8cytLqR8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="340790"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="340790"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:33:36 -0700
X-CSE-ConnectionGUID: fm5OVp8iSVe90lOXs6zY0g==
X-CSE-MsgGUID: Cpdr79yCQv6Vt8LGTlxxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271169269"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 04:33:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Sep 2026 14:33:27 +0300 (EEST)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hansg@kernel.org>, Nitin Joshi <nitjoshi@gmail.com>, 
    platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] platform/x86: thinkpad_acpi: convert mutex_lock()
 to guard(mutex)
In-Reply-To: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
Message-ID: <15bd7fc2-ea2c-95fe-330f-6dcb005239c9@linux.intel.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Aug 2026, Dmitry Torokhov wrote:

> Convert straightforward mutex_lock() and mutex_unlock() usages for
> hotkey_mutex, tpacpi_inputdev_send_mutex, kbdlight_mutex, lcdshadow_dev
> lock, and dytc_mutex to guard(mutex) and scoped_guard(mutex) helpers
> from linux/cleanup.h.
> 
> This improves code readability and ensures that mutexes are
> automatically released when exiting their respective scopes.
> 
> Assisted-by: Antigravity:gemini-3.6-flash
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Hi,

I've now applied this patch 1 into the review-ilpo-next branch. I 
converted the newly added mutex_lock/unlock() pair in hotkey_poll_setup() 
while at it but it would have been nice if you'd have made them a series 
instead and done that for me as there was unclear dependency between the 
input_device_enabled() change and this one because of the newly added 
mutex_lock/unlock() pair. Hopefully the next time. :-)

Patch 2 seems contested and changes behavior without telling upfront. And 
a return value change shouldn't be hidden into otherwise mechanical 
conversion patch like that anyway. The change is generally good otherwise
so please resend it once the return value thing is addressed.

Sashiko complains about the strscpy() placement in patch 3 and that looks 
valid concern to me.

--
 i.

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 139 ++++++++------------
>  1 file changed, 57 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index f8e116e8a65d..beb85ea1103b 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2164,7 +2164,7 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
>  		return 0;
>  	}
>  
> -	mutex_lock(&hotkey_mutex);
> +	guard(mutex)(&hotkey_mutex);
>  
>  	HOTKEY_CONFIG_CRITICAL_START
>  	hotkey_driver_mask = mask;
> @@ -2177,8 +2177,6 @@ static int tpacpi_hotkey_driver_mask_set(const u32 mask)
>  							~hotkey_source_mask);
>  	hotkey_poll_setup(true);
>  
> -	mutex_unlock(&hotkey_mutex);
> -
>  	return rc;
>  }
>  
> @@ -2202,15 +2200,12 @@ static void tpacpi_input_send_tabletsw(void)
>  {
>  	int state;
>  
> -	if (tp_features.hotkey_tablet &&
> -	    !hotkey_get_tablet_mode(&state)) {
> -		mutex_lock(&tpacpi_inputdev_send_mutex);
> +	if (tp_features.hotkey_tablet && !hotkey_get_tablet_mode(&state)) {
> +		guard(mutex)(&tpacpi_inputdev_send_mutex);
>  
>  		input_report_switch(tpacpi_inputdev,
>  				    SW_TABLET_MODE, !!state);
>  		input_sync(tpacpi_inputdev);
> -
> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
>  	}
>  }
>  
> @@ -2235,7 +2230,6 @@ static int get_camera_shutter(void)
>  
>  static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  {
> -	bool known_ev;
>  	u32 scancode;
>  
>  	if (tpacpi_driver_event(hkey))
> @@ -2278,11 +2272,8 @@ static bool tpacpi_input_send_key(const u32 hkey, bool *send_acpi_ev)
>  		scancode = hkey;
>  	}
>  
> -	mutex_lock(&tpacpi_inputdev_send_mutex);
> -	known_ev = sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
> -	mutex_unlock(&tpacpi_inputdev_send_mutex);
> -
> -	return known_ev;
> +	guard(mutex)(&tpacpi_inputdev_send_mutex);
> +	return sparse_keymap_report_event(tpacpi_inputdev, scancode, 1, true);
>  }
>  
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> @@ -2572,9 +2563,8 @@ static void hotkey_poll_setup(const bool may_warn)
>  
>  static void hotkey_poll_setup_safe(const bool may_warn)
>  {
> -	mutex_lock(&hotkey_mutex);
> +	guard(mutex)(&hotkey_mutex);
>  	hotkey_poll_setup(may_warn);
> -	mutex_unlock(&hotkey_mutex);
>  }
>  
>  static void hotkey_poll_set_freq(unsigned int freq)
> @@ -3077,13 +3067,11 @@ static void tpacpi_send_radiosw_update(void)
>  
>  	/* Issue rfkill input event for WLSW switch */
>  	if (!(wlsw < 0)) {
> -		mutex_lock(&tpacpi_inputdev_send_mutex);
> +		guard(mutex)(&tpacpi_inputdev_send_mutex);
>  
>  		input_report_switch(tpacpi_inputdev,
>  				    SW_RFKILL_ALL, (wlsw > 0));
>  		input_sync(tpacpi_inputdev);
> -
> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
>  	}
>  
>  	/*
> @@ -3095,7 +3083,7 @@ static void tpacpi_send_radiosw_update(void)
>  
>  static void hotkey_exit(void)
>  {
> -	mutex_lock(&hotkey_mutex);
> +	guard(mutex)(&hotkey_mutex);
>  	hotkey_poll_stop_sync();
>  	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
>  		   "restoring original HKEY status and mask\n");
> @@ -3105,8 +3093,6 @@ static void hotkey_exit(void)
>  	      hotkey_mask_set(hotkey_orig_mask)) |
>  	     hotkey_status_set(false)) != 0)
>  		pr_err("failed to restore hot key mask to BIOS defaults\n");
> -
> -	mutex_unlock(&hotkey_mutex);
>  }
>  
>  /*
> @@ -3423,11 +3409,11 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	if (tp_features.hotkey_mask) {
>  		/* hotkey_source_mask *must* be zero for
>  		 * the first hotkey_mask_get to return hotkey_orig_mask */
> -		mutex_lock(&hotkey_mutex);
> -		res = hotkey_mask_get();
> -		mutex_unlock(&hotkey_mutex);
> -		if (res)
> -			return res;
> +		scoped_guard(mutex, &hotkey_mutex) {
> +			res = hotkey_mask_get();
> +			if (res)
> +				return res;
> +		}
>  
>  		hotkey_orig_mask = hotkey_acpi_mask;
>  	} else {
> @@ -3526,11 +3512,11 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  		hotkey_exit();
>  		return res;
>  	}
> -	mutex_lock(&hotkey_mutex);
> -	res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
> -			       | hotkey_driver_mask)
> -			      & ~hotkey_source_mask);
> -	mutex_unlock(&hotkey_mutex);
> +	scoped_guard(mutex, &hotkey_mutex) {
> +		res = hotkey_mask_set(((hotkey_all_mask & ~hotkey_reserved_mask)
> +				       | hotkey_driver_mask)
> +				      & ~hotkey_source_mask);
> +	}
>  	if (res < 0 && res != -ENXIO) {
>  		hotkey_exit();
>  		return res;
> @@ -3977,11 +3963,11 @@ static void hotkey_resume(void)
>  {
>  	tpacpi_disable_brightness_delay();
>  
> -	mutex_lock(&hotkey_mutex);
> -	if (hotkey_status_set(true) < 0 ||
> -	    hotkey_mask_set(hotkey_acpi_mask) < 0)
> -		pr_err("error while attempting to reset the event firmware interface\n");
> -	mutex_unlock(&hotkey_mutex);
> +	scoped_guard(mutex, &hotkey_mutex) {
> +		if (hotkey_status_set(true) < 0 ||
> +		    hotkey_mask_set(hotkey_acpi_mask) < 0)
> +			pr_err("error while attempting to reset the event firmware interface\n");
> +	}
>  
>  	tpacpi_send_radiosw_update();
>  	tpacpi_input_send_tabletsw();
> @@ -5034,21 +5020,16 @@ static DEFINE_MUTEX(kbdlight_mutex);
>  
>  static int kbdlight_set_level(int level)
>  {
> -	int ret = 0;
> -
>  	if (!hkey_handle)
>  		return -ENXIO;
>  
> -	mutex_lock(&kbdlight_mutex);
> +	guard(mutex)(&kbdlight_mutex);
>  
>  	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
> -		ret = -EIO;
> -	else
> -		kbdlight_brightness = level;
> -
> -	mutex_unlock(&kbdlight_mutex);
> +		return -EIO;
>  
> -	return ret;
> +	kbdlight_brightness = level;
> +	return 0;
>  }
>  
>  static int kbdlight_get_level(void)
> @@ -10103,9 +10084,8 @@ static void lcdshadow_resume(void)
>  	if (!lcdshadow_dev)
>  		return;
>  
> -	mutex_lock(&lcdshadow_dev->lock);
> +	guard(mutex)(&lcdshadow_dev->lock);
>  	lcdshadow_set_sw_state(lcdshadow_dev, lcdshadow_dev->sw_state);
> -	mutex_unlock(&lcdshadow_dev->lock);
>  }
>  
>  static int lcdshadow_read(struct seq_file *m)
> @@ -10137,9 +10117,8 @@ static int lcdshadow_write(char *buf)
>  	if (state >= 2 || state < 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&lcdshadow_dev->lock);
> -	res = lcdshadow_set_sw_state(lcdshadow_dev, state);
> -	mutex_unlock(&lcdshadow_dev->lock);
> +	scoped_guard(mutex, &lcdshadow_dev->lock)
> +		res = lcdshadow_set_sw_state(lcdshadow_dev, state);
>  
>  	drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
>  
> @@ -10603,26 +10582,26 @@ static const struct platform_profile_ops dytc_profile_ops = {
>  static void dytc_profile_refresh(void)
>  {
>  	enum platform_profile_option profile;
> -	int output = 0, err = 0;
> +	int output = 0, err;
>  	int perfmode, funcmode = 0;
>  
> -	mutex_lock(&dytc_mutex);
> -	if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> -		if (dytc_mmc_get_available)
> -			err = dytc_command(DYTC_CMD_MMC_GET, &output);
> -		else
> -			err = dytc_cql_command(DYTC_CMD_GET, &output);
> -		funcmode = DYTC_FUNCTION_MMC;
> -	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
> -		err = dytc_command(DYTC_CMD_GET, &output);
> -		/* Check if we are PSC mode, or have AMT enabled */
> -		funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> -	} else { /* Unknown profile mode */
> -		err = -ENODEV;
> +	scoped_guard(mutex, &dytc_mutex) {
> +		if (dytc_capabilities & BIT(DYTC_FC_MMC)) {
> +			if (dytc_mmc_get_available)
> +				err = dytc_command(DYTC_CMD_MMC_GET, &output);
> +			else
> +				err = dytc_cql_command(DYTC_CMD_GET, &output);
> +			funcmode = DYTC_FUNCTION_MMC;
> +		} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) {
> +			err = dytc_command(DYTC_CMD_GET, &output);
> +			/* Check if we are PSC mode, or have AMT enabled */
> +			funcmode = (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +		} else { /* Unknown profile mode */
> +			err = -ENODEV;
> +		}
> +		if (err)
> +			return;
>  	}
> -	mutex_unlock(&dytc_mutex);
> -	if (err)
> -		return;
>  
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
>  	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
> @@ -11425,7 +11404,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  		if (tp_features.kbdlight) {
>  			enum led_brightness brightness;
>  
> -			mutex_lock(&kbdlight_mutex);
> +			guard(mutex)(&kbdlight_mutex);
>  
>  			/*
>  			 * Check the brightness actually changed, setting the brightness
> @@ -11437,8 +11416,6 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  				led_classdev_notify_brightness_hw_changed(
>  					&tpacpi_led_kbdlight.led_classdev, brightness);
>  			}
> -
> -			mutex_unlock(&kbdlight_mutex);
>  		}
>  		/* Key events are suppressed by default hotkey_user_mask */
>  		return false;
> @@ -11460,11 +11437,11 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  			enum drm_privacy_screen_status old_hw_state;
>  			bool changed;
>  
> -			mutex_lock(&lcdshadow_dev->lock);
> -			old_hw_state = lcdshadow_dev->hw_state;
> -			lcdshadow_get_hw_state(lcdshadow_dev);
> -			changed = lcdshadow_dev->hw_state != old_hw_state;
> -			mutex_unlock(&lcdshadow_dev->lock);
> +			scoped_guard(mutex, &lcdshadow_dev->lock) {
> +				old_hw_state = lcdshadow_dev->hw_state;
> +				lcdshadow_get_hw_state(lcdshadow_dev);
> +				changed = lcdshadow_dev->hw_state != old_hw_state;
> +			}
>  
>  			if (changed)
>  				drm_privacy_screen_call_notifier_chain(lcdshadow_dev);
> @@ -11485,12 +11462,10 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
>  			pr_err("Error retrieving camera shutter state after shutter event\n");
>  			return true;
>  		}
> -		mutex_lock(&tpacpi_inputdev_send_mutex);
> -
> -		input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> -		input_sync(tpacpi_inputdev);
> -
> -		mutex_unlock(&tpacpi_inputdev_send_mutex);
> +		scoped_guard(mutex, &tpacpi_inputdev_send_mutex) {
> +			input_report_switch(tpacpi_inputdev, SW_CAMERA_LENS_COVER, camera_shutter_state);
> +			input_sync(tpacpi_inputdev);
> +		}
>  		return true;
>  	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>  		/* Toggle kernel-level doubletap event filtering */
> 

-- 
 i.

