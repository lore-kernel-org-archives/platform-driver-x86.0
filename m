Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793015505;
	b=XuWo1z3Vy1pL9DaWkyRcpbtQkHGxo8nqQz6xqxwaatpqz7kpWvyOHqOspYGvqeMiQphw
	 n4/sI9D4V80aLktHBnmABXa4DnFD5PNYtAEZtGc48gAoWKiSsXbIY9JqKPMvnhXZUttDh
	 +dFUZ4pjqxRcl1Vl/+fAc24HwejBC1MxEMVN1bgo/yoKn0eslkZs+gVGQP8tBoh9vY7xa
	 yGts3M+U7smhoR11+AewCC+e3mYJjLqLzdMYEpv10VuC/Veear0+jjxH5UolVZtEB8n7P
	 SL5gHl2N1eb8No2sM52OikEpwJLASuytXoOME0zKHgeEIKKwUpt8rMskmgmXVCSTVBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793015505;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=VJrJTfTUDlx97MAq1A+gzzj+Og+pQUZ/leRKKXkxD6k=;
	b=urKOajTmyIz88AyyTHr43H76w+XQvGI0ncOhQeV85NL4IR3Y8xWM/MDNEAIaCapCFh9Z
	 PDChikuXkEBNflvLyrIFpCWB83Xw3RJ+TOijOoiI4X+AFZLH7SCL6wSCZLIKaFKvYOJU8
	 DVjvezGEdy3AUPXRewSK2t/nxVvbyC5Rwmj1xlRPXGiTOCid6qUZH6/4VeqyNmzhofmIe
	 HBCgCyoszZyuqqkPsaHou8HZDmTHYH+rdeWt/t13egQGkRAqi5zQgeQYYWb+OJMPkmpVq
	 GfwK6+it7fuUkOVbdKoZWsJIUcYpvqVFKBjUB4gm04tYxVD3QqK4a/L+X7gqqUkhnDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=alHFuk7z;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E1D606A337;
	Mon, 26 Oct 2026 11:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77E1D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=alHFuk7z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793015505; x=1824551505;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=coL3iR7kD026e+aoig7unQs+GdG69jQHu72BbieV/fc=;
  b=alHFuk7zHXgq3ZG7Sho/rSePjgZBwZkR2dWRyN//Kqla7sHYHVkvNGTU
   pFnL8OGcnHy5RYCicowBs0w25Y6mmy3KxUpsjFOTu9uheUYMMdfWv8KVc
   QovY33fgwCHndtE9/RkXMiECgQipGqthAp7/lsJEZD7hd8dhsRTfwjbge
   aLhxqQ6953/fI5SJewJ6Jyo6ZEDFx841M+yVTEQUgBjewQgtykIa4tiAJ
   Knd4crowRWDt22PksE9tS9qgaBFyNUCAbVBxECYA078LPEB0GdTNckBBQ
   fiebvX1GDGFyzR2JrWMkXs+gbP2d94y4xB3d2aG3dWf44F+rxXTb8h6Ma
   Q==;
X-CSE-ConnectionGUID: MPBQBfTmQHSGVADTUwdysQ==
X-CSE-MsgGUID: IV4mLYqXQ/+yZMzCmI/Z8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1569186"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1569186"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:51:44 -0700
X-CSE-ConnectionGUID: KcVB1Fg0SH+gt921MOceEA==
X-CSE-MsgGUID: sL3hbTI/SXGXfOP8vHh5sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4190161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.109])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 04:51:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Oct 2026 13:51:38 +0200 (EET)
To: Cian Ruane <cian.ruane1@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: huawei-wmi: Add keyboard backlight
 support
In-Reply-To: <20261025233910.9907-1-cian.ruane1@gmail.com>
Message-ID: <79d79800-485b-2003-958d-f7353b223683@linux.intel.com>
References: <20261025233910.9907-1-cian.ruane1@gmail.com>
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

On Mon, 26 Oct 2026, Cian Ruane wrote:

> The HWMI interface of the HUAWEI MateBook X Pro 2020 (MACHC-WAX9)
> exposes the keyboard backlight through the \GLIV and \SLIV methods of
> the WMAA dispatcher (MFID 2, SFID 6/7), with the level in byte 2 of the
> buffer. The EC stores the level doubled, so the three levels off/low/
> high are represented as 0, 2 and 4.
> 
> Register a "platform::kbd_backlight" LED class device with a maximum
> brightness of 2 so that userspace, e.g. UPower, can control it.
> 
> Changes made with the Fn+F3 hotkey are handled by the EC itself and
> are not reported to the OS on this model: no EC query or WMI event is
> generated. LED_BRIGHT_HW_CHANGED is therefore not set.
> 
> The level encoding has only been verified on this model, so enable the
> feature through a DMI quirk.
> 
> Tested on: HUAWEI MACHC-WAX9 (MateBook X Pro 2020), BIOS 1.05 and 1.26,
> Ubuntu 24.04 (kernel 6.8.0-147-generic, with this patch backported).
> 
> Signed-off-by: Cian Ruane <cian.ruane1@gmail.com>
> ---
>  drivers/platform/x86/huawei-wmi.c | 64 +++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawei-wmi.c
> index 96ee9a97c..8eafda8a1 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -39,8 +39,14 @@ enum {
>  	FN_LOCK_GET			= 0x00000604, /* \GFRS */
>  	FN_LOCK_SET			= 0x00000704, /* \SFRS */
>  	MICMUTE_LED_SET			= 0x00000b04, /* \SMLS */
> +	KBD_BACKLIGHT_GET		= 0x00000602, /* \GLIV */
> +	KBD_BACKLIGHT_SET		= 0x00000702, /* \SLIV */
>  };
>  
> +/* The EC stores the keyboard backlight level doubled: off/low/high = 0/2/4. */
> +#define KBD_BACKLIGHT_MAX		2
> +#define KBD_BACKLIGHT_STEP		2
> +
>  union hwmi_arg {
>  	u64 cmd;
>  	u8 args[8];
> @@ -50,6 +56,7 @@ struct quirk_entry {
>  	bool battery_reset;
>  	bool ec_micmute;
>  	bool report_brightness;
> +	bool kbd_backlight;
>  };
>  
>  static struct quirk_entry *quirks;
> @@ -65,6 +72,7 @@ struct huawei_wmi {
>  
>  	struct huawei_wmi_debug debug;
>  	struct led_classdev cdev;
> +	struct led_classdev kbd_cdev;
>  	struct device *dev;
>  
>  	struct mutex wmi_lock;
> @@ -126,6 +134,10 @@ static struct quirk_entry quirk_matebook_x = {
>  	.report_brightness = true,
>  };
>  
> +static struct quirk_entry quirk_kbd_backlight = {
> +	.kbd_backlight = true,
> +};
> +
>  static const struct dmi_system_id huawei_quirks[] = {
>  	{
>  		.callback = dmi_matched,
> @@ -145,6 +157,15 @@ static const struct dmi_system_id huawei_quirks[] = {
>  		},
>  		.driver_data = &quirk_matebook_x
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "Huawei MACHC-WAX9",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "HUAWEI"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "MACHC-WAX9"),
> +		},
> +		.driver_data = &quirk_kbd_backlight
> +	},
>  	{  }
>  };
>  
> @@ -322,6 +343,48 @@ static void huawei_wmi_leds_setup(struct device *dev)
>  	devm_led_classdev_register(dev, &huawei->cdev);
>  }
>  
> +/* Keyboard backlight */
> +
> +static enum led_brightness huawei_wmi_kbd_backlight_get(struct led_classdev *led_cdev)
> +{
> +	u8 ret[0x100];

Generally, avoid using literals and use named defines for sizes, offsets, 
and values (and BIT()/GENMASK() for bitfields).

> +	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, ret, sizeof(ret)))
> +		return 0;
> +
> +	/* byte[0] = STAT, byte[2] = level as stored by the EC */
> +	return ret[2] / KBD_BACKLIGHT_STEP;
> +}
> +
> +static int huawei_wmi_kbd_backlight_set(struct led_classdev *led_cdev,
> +					enum led_brightness brightness)
> +{
> +	union hwmi_arg arg;
> +
> +	arg.cmd = KBD_BACKLIGHT_SET;
> +	arg.args[2] = brightness * KBD_BACKLIGHT_STEP;
> +
> +	return huawei_wmi_cmd(arg.cmd, NULL, 0);
> +}
> +
> +static void huawei_wmi_kbd_backlight_setup(struct device *dev)
> +{
> +	struct huawei_wmi *huawei = dev_get_drvdata(dev);
> +
> +	if (!quirks || !quirks->kbd_backlight)
> +		return;
> +
> +	if (huawei_wmi_cmd(KBD_BACKLIGHT_GET, NULL, 0))
> +		return;
> +
> +	huawei->kbd_cdev.name = "platform::kbd_backlight";
> +	huawei->kbd_cdev.max_brightness = KBD_BACKLIGHT_MAX;
> +	huawei->kbd_cdev.brightness_get = &huawei_wmi_kbd_backlight_get;
> +	huawei->kbd_cdev.brightness_set_blocking = &huawei_wmi_kbd_backlight_set;
> +
> +	devm_led_classdev_register(dev, &huawei->kbd_cdev);
> +}
> +
>  /* Battery protection */
>  
>  static int huawei_wmi_battery_get(int *start, int *end)
> @@ -915,6 +978,7 @@ static int huawei_wmi_probe(struct platform_device *pdev)
>  		mutex_init(&huawei_wmi->wmi_lock);
>  
>  		huawei_wmi_leds_setup(&pdev->dev);
> +		huawei_wmi_kbd_backlight_setup(&pdev->dev);
>  		huawei_wmi_fn_lock_setup(&pdev->dev);
>  		huawei_wmi_battery_setup(&pdev->dev);
>  		huawei_wmi_debugfs_setup(&pdev->dev);
> 
> base-commit: 9d3475065167197742b0882aff21cf8e78393277
> 

-- 
 i.

