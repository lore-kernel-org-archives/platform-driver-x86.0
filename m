Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369037;
	b=zAilEkWTeVABK94eld/x++WRfC5eE5tAfMMGQPJO2K0cjWVkZW7NedRSex9XDSigRfSU
	 EiKyNlIbW6BHeBkX9BM2sTjE7TPORYn6GIfc+wdQh/vSDAMdG8MBfLruvkhPJ1Z8Z3c42
	 NtwN1V/L5Yy2X3IBfGvwDVXicc5sJTYbw6ISJpk6yYyMWQC7P2YaxW8RvgKuDlxiJ0Cr7
	 3uG/Zr1CyeczcvCWk4hs9JswEAVyPl4fleiyP27nrI11aBYm89WiBC4Ilt2UAf63od8f8
	 wKG8W74KAfPLFeZUecA/HNeFnToa6UpP0AeAmpWmvCWgPHCkCyoPyj6n9OMpKGvyo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369037;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=jHL1+/V1pt1FOWAIsOOBAHAwhoT4A92NFv8TlA3cGVE=;
	b=fcQmUq3r8P4rrmypPEgobR8OKq3rAtHewj3RbiPhXYrS85j30Zm/d6OHWeTZiyj+VYAu
	 MmeEH6CeLitUcKe0y5tfpW9/z5eBpZdyNahuwSNuhDdvpmtpCm/99U+tFAENM7Gd2MjCF
	 0gaH/NTqGpmXOI1LbnRsHxbogzj3prmAOOmfmxac/cDReWAWnhXvcGGJI0VbQeCQf7i9M
	 g+o5kEwY60tRPrfanzFbDlvC8tYVA0EDR3C5S7oUgQa3kU1Fpi5VD9WLMlbqL9sgIgg5Q
	 /+AudekWuhddfMQnmjBWnRRD9Tzx5KLjIXiYazWDHKSyTUDnlZAkFCQGyimyieVxLig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcHrVvr+;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D5606A31F;
	Fri, 30 Oct 2026 14:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF9D5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcHrVvr+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793369037; x=1824905037;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=rTsbnyafhb2FO1JXtDpVeoHchWbqe1TG0in3JpRJm3o=;
  b=HcHrVvr+zUTXNjjO38GITAK2/nCtJGJZWoZMrR6YodpR973bO9lYVwc5
   /bo4qqkbQkKhSn+v1OqxZOg/mv6Dc65rTyiL+FPe9/Bf18pXv2nq/8Nk/
   i5yz0mG6kdJP9vvNHvKi1bq/h+f3tIVQUEv2aCYdPaVug3shMYPODSYct
   QeQUGqv7aZm9DnkNmwIqAYFuea+xAyQ2lDrWqs/+H7YYSBHGLm+mqhxwA
   dx8/pkgsjSMkxC4cNlakxGpXuh5Rj6cI2/zA/dKLy+meOAt9ql0qC8yFd
   7Ex/uCyXe/W3uo3X1FuWa5WTyzajlbX+nx+d1jxWT8Eyd0BEcg2cEHggw
   Q==;
X-CSE-ConnectionGUID: MSqgytRnQ5m3iBBZ9kcDOw==
X-CSE-MsgGUID: sXo70oIcQBmfO67VZkoVlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2147975"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2147975"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 07:03:56 -0700
X-CSE-ConnectionGUID: O3gLYXWsSsqPEA6yDH+3fA==
X-CSE-MsgGUID: nwl2LN9lT8uqJSIC+6sKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5335735"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 07:03:53 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 30 Oct 2026 16:03:48 +0200 (EET)
To: surirajat@gmail.com
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, ibm-acpi-devel@lists.sourceforge.net, 
    markpearson@lenovo.com, hdegoede@redhat.com, rajat.suri@dell.com
Subject: Re: [PATCH] platform/x86: lenovo: convert mutex_init() users to
 devm_mutex_init()
In-Reply-To: <20261030135435.308058-1-surirajat@gmail.com>
Message-ID: <1df64b2f-dc28-963a-0fd5-a3e77ade9e27@linux.intel.com>
References: <20261030135435.308058-1-surirajat@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Oct 2026, surirajat@gmail.com wrote:

> From: Rajat Suri <rajat.suri@dell.com>
> 
> Convert the mutex_init() calls under drivers/platform/x86/lenovo/
> to devm_mutex_init() so that the mutex lifecycle is managed by devres.
> 
> This removes the need for manual mutex_destroy() calls in wmi-camera and
> ideapad-laptop, and fixes thinkpad_acpi, which never destroyed the
> hotkey, brightness, volume and fan mutexes on its teardown path.
> 
> Details per driver:
> 
>  - wmi-camera: bind notify_lock to the WMI device and drop the
>    mutex_destroy() from remove().
> 
>  - ideapad-laptop: allocate the DYTC private data with devm_kzalloc() and
>    bind its mutex to the platform device. Calling mutex_destroy() on a
>    manually freed object is not possible with devres, so the kfree() and
>    ideapad_dytc_profile_exit() helper are removed as well. The memory now
>    outlives the platform profile registration, which is also devm managed
>    and therefore released in reverse order.

Lets do this per driver.

Clearly you when beyond the scope of devm_mutex_init() here (the summary 
in the shortlog on Subject). It's easier to write a focused changelog when 
you don't try to combine many things into one.

Whenever you need to start to use bullet lists like this to describe 
variations, you almost always want to split things into multiple patches 
instead.

>  - thinkpad_acpi: bind the hotkey, hotkey thread data, brightness, volume
>    and fan mutexes to tpacpi_pdev, which is registered before any
>    subdriver init runs, and propagate a possible failure from
>    devm_mutex_init().
> 
> No functional change intended.

Not true, in thinkpad_acpi case you wanted to add the missing 
mutex_destroy() which surely is a function change.

> Signed-off-by: Rajat Suri <rajat.suri@dell.com>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 23 ++++----------------
>  drivers/platform/x86/lenovo/thinkpad_acpi.c  | 21 +++++++++++++-----
>  drivers/platform/x86/lenovo/wmi-camera.c     |  6 +----
>  3 files changed, 21 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
> index fcb5ed7035f5..ee8e00bdaf6b 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1172,11 +1172,13 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  		return -ENODEV;
>  	}
>  
> -	priv->dytc = kzalloc_obj(*priv->dytc);
> +	priv->dytc = devm_kzalloc(&priv->platform_device->dev, sizeof(*priv->dytc), GFP_KERNEL);
>  	if (!priv->dytc)
>  		return -ENOMEM;
>  
> -	mutex_init(&priv->dytc->mutex);
> +	err = devm_mutex_init(&priv->platform_device->dev, &priv->dytc->mutex);
> +	if (err)
> +		goto pp_reg_failed;
>  
>  	priv->dytc->priv = priv;
>  
> @@ -1195,24 +1197,11 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
>  	return 0;
>  
>  pp_reg_failed:
> -	mutex_destroy(&priv->dytc->mutex);
> -	kfree(priv->dytc);
>  	priv->dytc = NULL;
>  
>  	return err;
>  }
>  
> -static void ideapad_dytc_profile_exit(struct ideapad_private *priv)
> -{
> -	if (!priv->dytc)
> -		return;
> -
> -	mutex_destroy(&priv->dytc->mutex);
> -	kfree(priv->dytc);
> -
> -	priv->dytc = NULL;
> -}
> -
>  /*
>   * Rfkill
>   */
> @@ -2487,8 +2476,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	ideapad_backlight_exit(priv);
>  
>  backlight_failed:
> -	ideapad_dytc_profile_exit(priv);
> -
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> @@ -2516,8 +2503,6 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
>  				   ideapad_acpi_notify);
>  
>  	ideapad_backlight_exit(priv);
> -	ideapad_dytc_profile_exit(priv);
> -
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..8c7d6f281ae3 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -3381,10 +3381,14 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  	       tpacpi_inputdev->close != NULL);
>  
>  	TPACPI_ACPIHANDLE_INIT(hkey);
> -	mutex_init(&hotkey_mutex);
> +	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_mutex);
> +	if (res)
> +		return res;
>  
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> -	mutex_init(&hotkey_thread_data_mutex);
> +	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_thread_data_mutex);
> +	if (res)
> +		return res;
>  #endif
>  
>  	/* hotkey not supported on 570 */
> @@ -6834,7 +6838,9 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
>  
>  	vdbg_printk(TPACPI_DBG_INIT, "initializing brightness subdriver\n");
>  
> -	mutex_init(&brightness_mutex);
> +	b = devm_mutex_init(&tpacpi_pdev->dev, &brightness_mutex);
> +	if (b)

b ?

> +		return b;
>  
>  	quirks = tpacpi_check_quirks(brightness_quirk_table,
>  				ARRAY_SIZE(brightness_quirk_table));
> @@ -7575,7 +7581,9 @@ static int __init volume_init(struct ibm_init_struct *iibm)
>  
>  	vdbg_printk(TPACPI_DBG_INIT, "initializing volume subdriver\n");
>  
> -	mutex_init(&volume_mutex);
> +	rc = devm_mutex_init(&tpacpi_pdev->dev, &volume_mutex);
> +	if (rc)
> +		return rc;
>  
>  	/*
>  	 * Check for module parameter bogosity, note that we
> @@ -8913,11 +8921,14 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>  static int __init fan_init(struct ibm_init_struct *iibm)
>  {
>  	unsigned long quirks;
> +	int rc;
>  
>  	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
>  			"initializing fan subdriver\n");
>  
> -	mutex_init(&fan_mutex);
> +	rc = devm_mutex_init(&tpacpi_pdev->dev, &fan_mutex);
> +	if (rc)
> +		return rc;
>  	fan_status_access_mode = TPACPI_FAN_NONE;
>  	fan_control_access_mode = TPACPI_FAN_WR_NONE;
>  	fan_control_commands = 0;
> diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/x86/lenovo/wmi-camera.c
> index 89ecbce60bf4..de4596686d2a 100644
> --- a/drivers/platform/x86/lenovo/wmi-camera.c
> +++ b/drivers/platform/x86/lenovo/wmi-camera.c
> @@ -107,9 +107,7 @@ static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>  
>  	dev_set_drvdata(&wdev->dev, priv);
>  
> -	mutex_init(&priv->notify_lock);
> -
> -	return 0;
> +	return devm_mutex_init(&wdev->dev, &priv->notify_lock);
>  }
>  
>  static void lenovo_wmi_remove(struct wmi_device *wdev)
> @@ -118,8 +116,6 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
>  
>  	if (priv->idev)
>  		input_unregister_device(priv->idev);
> -
> -	mutex_destroy(&priv->notify_lock);
>  }
>  
>  static const struct wmi_device_id lenovo_wmi_id_table[] = {
> 

-- 
 i.

