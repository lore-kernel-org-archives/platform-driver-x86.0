Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F2D339397;
	Wed,  2 Sep 2026 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341778; cv=none; b=WDL5x9dlrMRGfHQRc34ZLjVpqF5aZzQ+4lV8XUkgIWmQv3l+kauCRHB3VVRKoA9qBykt79YYbz/aSMSY0i3c8IKCxnAOawTeiD+FPQPU9Z1Eoy4ZbjcDKU4SyCViJv/9JK5liKmed80LyDwEcWQzxqhwvDob7Dst+FZonzDLlOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341778; c=relaxed/simple;
	bh=8Mi/Z2pGNgDvVuDHmYnb5BGvJMNX4auQxR1sSTTaE3Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WywQJrqMXNmylH/sA353XL1EMrYNUHNSrOqQbY/MMKJ0sGaB0gSSMKo94mhejtLYwTVSMfDkuh0Ogd36KCxTaGA1vjffXH6cq7t2rN8Vli7zEX57OP4ls2tms4uE2RGfZv518HQB1WE8il7OfjPYgMzGLGj+lf/sPZgZSDrIOng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/HRVi18; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/HRVi18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788341776; x=1819877776;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8Mi/Z2pGNgDvVuDHmYnb5BGvJMNX4auQxR1sSTTaE3Q=;
  b=d/HRVi18QnJgrZGWqnfc4nBdNGM2lcTO1hudYXDItiHPVMFzSyQkAIaR
   HALXZwWtV/xXsCPwS1fkcWcith7GnPmITiI+I0Htfi8MCdjc2T3BgIj6s
   RL7o5hXFeCA5LU3DJCGJMIcY9lS5WzHdpezF1u12bB/k39Nc0Zx7ULpcO
   lJ7N2yJvHZufOJ2o4BqplLfpIKrr7osZ9yyWVY0IoXenkGhMbq8dB2eDY
   JHU5NONX/WjZyB7iOtVkMFvveLyB5qKWVqJbdtxmm1E8kpa8cgxrOk0o4
   0559pxLRzIeXKBdeIjR441pUjNs7kdBWUpEOqR2c+KsaKtqxcxlMl/7IV
   A==;
X-CSE-ConnectionGUID: OSHURAvtTMeespTo2ZD0HA==
X-CSE-MsgGUID: YT2euCyvT2uS/OCXKYn7+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="106314244"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="106314244"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:36:15 -0700
X-CSE-ConnectionGUID: E7QJ/EU/T2mJ/0k3/Oejmg==
X-CSE-MsgGUID: KcsWaen2T2a1IjjasSxmhw==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.185])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 02:36:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Sep 2026 12:36:09 +0300 (EEST)
To: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
cc: Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: asus-wmi: fix FA401 series keyboard sleep
 strobe
In-Reply-To: <20260902015256.23434-1-idotohors@gmail.com>
Message-ID: <a429f57e-0e3d-65b3-09a6-748760fa86e2@linux.intel.com>
References: <20260902015256.23434-1-idotohors@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Sep 2026, Idotoho Reimon Simanjuntak wrote:

> The FA401 series accepts the TUF keyboard RGB power-state command but does
> not advertise the device through the normal DSTS presence probe. Register
> the state attributes for this series and re-assert keyboard brightness in
> the PM prepare callback so the EC enters S0ix with the correct state.
> 
> Without the brightness re-assertion, the display server blanks the keyboard
> before the kernel suspend path runs, leaving the EC with brightness=0 and
> preventing the sleep strobe from activating. Because kbd_led_wk may already
> be zeroed by the display server at prepare time, always re-assert level 3
> (max) brightness; the sleep strobe requires a non-zero brightness to
> activate.
> 
> Use a quirk flag (kbd_rgb_state_quirk) set via DMI match table rather than
> ad-hoc dmi_match() calls. Use the standard dev_pm_ops .prepare callback
> rather than overloading the Ally-specific LPS0 ops. Define self-documenting
> macros for the TUF RGB state bitfields at file scope.
> 
> Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 14 ++++++++++
>  drivers/platform/x86/asus-wmi.c    | 43 +++++++++++++++++++++++++++++-
>  drivers/platform/x86/asus-wmi.h    |  1 +
>  3 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index aeb461b16..fb06013ca 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -155,6 +155,11 @@ static struct quirk_entry quirk_asus_z13 = {
>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
>  };
>  
> +static struct quirk_entry quirk_asus_fa401 = {
> +	.wapf = 0,
> +	.kbd_rgb_state_quirk = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -163,6 +168,15 @@ static int dmi_matched(const struct dmi_system_id *dmi)
>  }
>  
>  static const struct dmi_system_id asus_quirks[] = {
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUSTeK COMPUTER INC. FA401",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_BOARD_NAME, "FA401"),
> +		},
> +		.driver_data = &quirk_asus_fa401,
> +	},
>  	{
>  		.callback = dmi_matched,
>  		.ident = "ASUSTeK COMPUTER INC. Q500A",
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a65090429..8d7c9e8bd 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -129,6 +129,14 @@ module_param(fnlock_default, bool, 0444);
>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>  
> +/* TUF RGB power state bitfields for DEVS(ASUS_WMI_DEVID_TUF_RGB_STATE) */
> +#define TUF_RGB_STATE_CMD		0xbd
> +#define TUF_RGB_STATE_SAVE		BIT(8)
> +#define TUF_RGB_STATE_BOOT		(0x03 << 16)
> +#define TUF_RGB_STATE_AWAKE		(0x0c << 16)
> +#define TUF_RGB_STATE_SLEEP		(0x30 << 16)
> +#define TUF_RGB_STATE_KEYBOARD		(0xc0 << 16)

Can those values be somehow named? Is there a field that could then use 
FIELD_PREP() or are these individual bits that could be named and or'ed 
together?

Alternatively, if no better naming exists for these, convert them to 
GENMASK().

> +
>  #define ASUS_MINI_LED_MODE_MASK		0x03
>  /* Standard modes for devices with only on/off */
>  #define ASUS_MINI_LED_OFF		0x00
> @@ -5153,7 +5161,6 @@ static int asus_wmi_add(struct platform_device *pdev)
>  
>  	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
>  	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
> -	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
>  		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -5166,6 +5173,15 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
> +	/*
> +	 * FA401 series accepts the TUF RGB-state DEVS command but does not
> +	 * advertise the device through DSTS. Keep the normal DSTS probe for
> +	 * other models and force registration when the quirk is set.
> +	 */
> +	asus->kbd_rgb_state_available =
> +		asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE) ||
> +		asus->driver->quirks->kbd_rgb_state_quirk;
> +
>  	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
>  
>  	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
> @@ -5396,11 +5412,36 @@ static int asus_hotk_restore(struct device *device)
>  
>  static int asus_hotk_prepare(struct device *device)
>  {
> +	struct asus_wmi *asus = dev_get_drvdata(device);
> +
>  	if (use_ally_mcu_hack == ASUS_WMI_ALLY_MCU_HACK_ENABLED) {
>  		acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE,
>  					   ASUS_USB0_PWR_EC0_CSEE_OFF);
>  		msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
>  	}
> +
> +	/*
> +	 * The display server may blank the keyboard backlight before the
> +	 * kernel suspend path runs. Re-assert brightness and power-state
> +	 * flags so the EC enters S0ix with the correct state. Always use
> +	 * level 3 (max) because kbd_led_wk may already be zeroed by the
> +	 * display server at this point, and the sleep strobe requires a
> +	 * non-zero brightness to activate.
> +	 */
> +	if (asus && asus->driver->quirks->kbd_rgb_state_quirk &&
> +	    asus->kbd_rgb_state_available) {
> +		u8 brightness = 0x80 | 0x03; /* level 3 (max) + light-on bit */

Please use a named define for "light-on bit" instead of the literal.

As level 3 is mentioned also in the other comment, you can drop this 
comment.

> +
> +		asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT,
> +				      brightness, NULL);
> +		asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> +					  ASUS_WMI_DEVID_TUF_RGB_STATE,
> +					  TUF_RGB_STATE_CMD | TUF_RGB_STATE_SAVE |
> +					  TUF_RGB_STATE_BOOT | TUF_RGB_STATE_AWAKE |
> +					  TUF_RGB_STATE_SLEEP | TUF_RGB_STATE_KEYBOARD,
> +					  0, NULL);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index 5cd4392b9..69d224774 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -52,6 +52,7 @@ struct quirk_entry {
>  	 */
>  	int no_display_toggle;
>  	u32 xusb2pr;
> +	bool kbd_rgb_state_quirk;
>  };
>  
>  struct asus_wmi_driver {
> 

-- 
 i.

