Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914113D1ABC;
	Thu, 28 May 2026 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779965637; cv=none; b=tqm7F6loCpgnvhNz8z/hwklQZ8PCSseRTRJrenKGE/vr8WjdKyNifjwdupKbRzvD39fPHZDDAKMEMxcMrg6/SCmS4UDMNMx0pIM74Nv3pZBdg522iJsyT0ZyPwgPHwxbpo1CPKC0R4RAp5dSdMQ2ikuyzuO9cql/g8DRDHfGbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779965637; c=relaxed/simple;
	bh=CPPU2aBUTSmLoz7rlE0tkmw799nzqbLg66Ni/kJN/Hc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=n1TXe8aU8vsltagsqEekhJ0KzPpaptpmkwcs4RdMDXc5XlmFB3xpJGvLK+L8AKD0fcWN7vsdog9McePe/HMALo9E8AI2px95s+KUgtOQtPY5C7HyNorzUOFXaz2ExsODkasHNQ4oSp6f6IHJp/dEOPBLdFGe85JLVJCtiC75aF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ba9DKt1v; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ba9DKt1v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779965635; x=1811501635;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CPPU2aBUTSmLoz7rlE0tkmw799nzqbLg66Ni/kJN/Hc=;
  b=ba9DKt1v4iq6NGydxOwIcagQv6TC3cNe8rYFpnbVoWb5q0clNkevx8ss
   BkIGzk5P7UTIRr7w2MCXrdP9afez0tkq9CTSli1C1bZUosLJdphUT1bg7
   D1Z12vCs1hggjjPR2+fmp6hyFr59iHjtyALeIGFutNY5o4Ae/twfyjYPL
   Z4pn68wLoxsEVIAMnGFRu9MWxiVaDibK8oeBH1Tngvk5rINAZuaCYbmOr
   WeGmn0NQM22lC2YRqFf/FF3ztktV7g+mmhspBRH1kK8zLKkBFDFOtp4do
   J2Wjzck7y/Y+RYPQz3pEqjDneKbfk1yVRanjrxem68laOCOzrqPDOqtA+
   Q==;
X-CSE-ConnectionGUID: sfbbQpJDQrCBJCAmRTLkkw==
X-CSE-MsgGUID: ad8bUIqvRjORBw+46VeRBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80531013"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80531013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:53:54 -0700
X-CSE-ConnectionGUID: 45DteEi3Qe6bRprBBtY96g==
X-CSE-MsgGUID: gc1dnpKqS5a5cbjsoPsVMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="244344224"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.187])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:53:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 28 May 2026 13:53:47 +0300 (EEST)
To: Dirga Yuza <dirgayuza123@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, jlee@suse.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] platform/x86: acer-wmi: Add 4-zone RGB keyboard
 support for Acer Nitro AN515-58
In-Reply-To: <20260503062131.158944-1-dirgayuza123@gmail.com>
Message-ID: <5319e340-c285-45d6-4a53-353626954000@linux.intel.com>
References: <20260503062131.158944-1-dirgayuza123@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 3 May 2026, Dirga Yuza wrote:

> This RFC adds support for the 4-zone RGB keyboard on Acer Nitro AN515-58.
> 
> The current acer-wmi driver does not provide support for keyboard
> backlighting. This patch introduces support for the multicolor LED class
> to expose the four zones to userspace.
> 
> The implementation is based on prior reverse engineering efforts of WMI
> method ID 6, particularly from Linuwu-sense and
> JafarAkhondali's acer-predator-turbo-and-rgb-keyboard-linux-module.
> I do not have access to a Windows environment to capture traces myself.
> 
> This has been tested on AN515-58 under regular usage, including
> suspend/resume cycles.
> 
> I would appreciate feedback on the following points:
> 
> 1. acer-wmi currently relies heavily on global state. This patch follows
> the same approach for consistency. However, given that this introduces
> new structures, would it be preferable to group them into a private
> per-device structure, or is continuing with global data acceptable
> for this driver?
> 
> 2. The current implementation registers four independent
> led_classdev_mc instances (acer-wmi::kbd_backlight_N). In testing with
> KDE Plasma, color updates propagate correctly across all zones, but
> brightness control appears to affect only the last registered zone.
> 
> Is independent registration the preferred approach, or would a
> single aggregate device controlling all zones be more appropriate?
> 
> 3. The patch currently hardcodes four zones via a model-specific quirk.
> Is this the preferred approach, or is there a more scalable way to handle
> varying zone counts across devices?
> 
> 4. Kconfig is updated to add `imply LEDS_CLASS_MULTICOLOR` for acer-wmi
> and the code is wrapped with IS_REACHABLE() to handle optional dependency
> on LEDS_CLASS. Is this correct approach for optional multicolor
> LED support?
> 
> On this hardware, brightness keys (Fn+F9/F10) generate KEY_KBDILLUMUP/DOWN
> input events. In my testing, these events do not appear to generate
> corresponding release events, unlike other keys
> (e.g., touchpad toggle or rfkill), which emit proper press/release pairs.
> 
> In KDE Plasma, this is interpreted as a held key, causing continuous
> brightness changes.
> 
> Synthesizing press/release events would result in both the EC and
> userspace adjusting their own brightness, causing duplicate changes.
> The current behavior (no release events) also leads to incorrect
> interpretation as a held key in KDE Plasma.
> 
> Therefore it is unclear whether these events should be ignored
> entirely or handled in some other way. Guidance on the preferred approach
> would be appreciated.
> 
> This is my first contribution in the kernel, so any feedback on design,
> coding style, or submission process would be appreciated.
> 
> Signed-off-by: Dirga Yuza <dirgayuza123@gmail.com>
> ---
>  drivers/platform/x86/Kconfig    |   1 +
>  drivers/platform/x86/acer-wmi.c | 141 ++++++++++++++++++++++++++++++++
>  2 files changed, 142 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 2ffa4ecf6..c7eb3a587 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -179,6 +179,7 @@ config ACER_WMI
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
>  	select NEW_LEDS
> +	imply LEDS_CLASS_MULTICOLOR

Maybe it would be better to just use depends on and remove the ifdeffery.

Nothing else seem to use imply for LEDS_CLASS_MULTICOLOR.

>  	select ACPI_PLATFORM_PROFILE
>  	help
>  	  This is a driver for newer Acer (and Wistron) laptops. It adds
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e0eaaefb1..b7c3d6c28 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -36,6 +36,7 @@
>  #include <linux/unaligned.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitmap.h>
> +#include <linux/led-class-multicolor.h>

These should be eventually changed to the alphabetical order. I see there 
are pre-existing violations but place it new one next to leds.h please.

If you want, you can make change that corrects the include ordering (in 
a separate patch).
  
>  MODULE_AUTHOR("Carlos Corbacho");
>  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> @@ -76,10 +77,16 @@ MODULE_LICENSE("GPL");
>  #define ACER_WMID_GET_GAMING_FAN_SPEED_METHODID 17
>  #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
>  #define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
> +#define ACER_WMID_SET_GAMING_STATIC_LED_METHODID 6
> +
> +#define ACER_GAMING_KBL_ZONES 4
>  
>  #define ACER_GAMING_FAN_BEHAVIOR_CPU BIT(0)
>  #define ACER_GAMING_FAN_BEHAVIOR_GPU BIT(3)
>  
> +/* Bit 3 enables keyboard backlight update */
> +#define ACER_GAMING_KBL_SET_ON BIT(3)

Please add bits.h. This is a pre-existing problem but lets fix it now 
since you're adding new BIT() & GENMASK() users.

>  #define ACER_GAMING_FAN_BEHAVIOR_STATUS_MASK GENMASK_ULL(7, 0)
>  #define ACER_GAMING_FAN_BEHAVIOR_ID_MASK GENMASK_ULL(15, 0)
>  #define ACER_GAMING_FAN_BEHAVIOR_SET_CPU_MODE_MASK GENMASK(17, 16)
> @@ -91,6 +98,9 @@ MODULE_LICENSE("GPL");
>  #define ACER_GAMING_FAN_SPEED_ID_MASK GENMASK_ULL(7, 0)
>  #define ACER_GAMING_FAN_SPEED_VALUE_MASK GENMASK_ULL(15, 8)
>  
> +/* Bits [43:40] selects target zones, setting all bits targets all zones*/
> +#define ACER_GAMING_KBL_SET_ALL_ZONES GENMASK(43, 40)
> +
>  #define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
>  #define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
>  #define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
> @@ -310,6 +320,7 @@ struct hotkey_function_type_aa {
>  #define ACER_CAP_PLATFORM_PROFILE	BIT(10)
>  #define ACER_CAP_HWMON			BIT(11)
>  #define ACER_CAP_PWM			BIT(12)
> +#define ACER_CAP_KBL_FOUR_ZONE_RGB	BIT(13)
>  
>  /*
>   * Interface type flags
> @@ -405,6 +416,7 @@ struct quirk_entry {
>  	u8 gpu_fans;
>  	u8 predator_v4;
>  	u8 pwm;
> +	u8 kbl_four_zone_rgb;
>  };
>  
>  static struct quirk_entry *quirks;
> @@ -427,6 +439,9 @@ static void __init set_quirks(void)
>  
>  	if (quirks->pwm)
>  		interface->capability |= ACER_CAP_PWM;
> +
> +	if (quirks->kbl_four_zone_rgb)
> +		interface->capability |= ACER_CAP_KBL_FOUR_ZONE_RGB;
>  }
>  
>  static int __init dmi_matched(const struct dmi_system_id *dmi)
> @@ -458,6 +473,7 @@ static struct quirk_entry quirk_acer_travelmate_2490 = {
>  static struct quirk_entry quirk_acer_nitro_an515_58 = {
>  	.predator_v4 = 1,
>  	.pwm = 1,
> +	.kbl_four_zone_rgb = 1,
>  };
>  
>  static struct quirk_entry quirk_acer_predator_ph315_53 = {
> @@ -2762,6 +2778,118 @@ static u32 get_wmid_devices(void)
>  
>  static int acer_wmi_hwmon_init(void);
>  
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
> +
> +static int acer_wmi_poll_and_enable_zones(void)
> +{
> +	acpi_status status;
> +
> +	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_SYS_INFO_METHODID,
> +		0, NULL);

Please align these continuations to ( unless you've very very good reason 
for not to.

> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	status = WMI_gaming_execute_u64(ACER_WMID_GET_GAMING_LED_METHODID,
> +		ACER_GAMING_KBL_SET_ON |
> +		ACER_GAMING_KBL_SET_ALL_ZONES,
> +		NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +struct acer_wmi_led_zone {
> +	struct led_classdev_mc mc_cdev;
> +	struct mc_subled subled_info[3];
> +	u8 zone_id;
> +};
> +
> +struct led_four_zone_set_param {
> +	u8 zone;
> +	u8 red;
> +	u8 green;
> +	u8 blue;
> +} __packed;
> +
> +static struct acer_wmi_led_zone kbl_zones[ACER_GAMING_KBL_ZONES];
> +
> +static int acer_wmi_mc_brightness_set(struct led_classdev *led_cdev,
> +	enum led_brightness brightness)
> +{
> +	int err;

Please try to use reverse xmas-tree order for local variable declarations.

> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct acer_wmi_led_zone *zone = container_of(mc_cdev,
> +		struct acer_wmi_led_zone, mc_cdev);

Either make this one line (it's just below 100 cols), or put the entire 
container_of to the second line.

Please also add linux/container_of.h.

> +	struct led_four_zone_set_param params;
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	err = led_mc_calc_color_components(mc_cdev, brightness);
> +	if (err)
> +		return err;
> +
> +	led_cdev->brightness = brightness;
> +
> +	params.zone = zone->zone_id;
> +	params.red = mc_cdev->subled_info[0].brightness;
> +	params.green = mc_cdev->subled_info[1].brightness;
> +	params.blue = mc_cdev->subled_info[2].brightness;
> +
> +	input.length = sizeof(params);
> +	input.pointer = &params;
> +
> +	status = wmi_evaluate_method(WMID_GUID4, 0,
> +		ACER_WMID_SET_GAMING_STATIC_LED_METHODID, &input, NULL);

Please align this to (

> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static enum led_brightness
> +acer_wmi_mc_brightness_get(struct led_classdev *led_cdev)
> +{
> +	return led_cdev->brightness;
> +}
> +
> +static int acer_wmi_register_four_zone_leds(struct device *dev)
> +{
> +	int i, ret;
> +
> +	for (i = 0; i < ACER_GAMING_KBL_ZONES; i++) {
> +		struct acer_wmi_led_zone *zone = &kbl_zones[i];
> +
> +		memset(zone, 0, sizeof(*zone));

Why is this required?

> +		zone->subled_info[0].color_index = LED_COLOR_ID_RED;
> +		zone->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +		zone->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +		zone->mc_cdev.subled_info = zone->subled_info;
> +		zone->mc_cdev.num_colors = 3;
> +
> +		/* WMI uses a bitmask as for zones. BIT(i) selects zone i */
> +		zone->zone_id = BIT(i);
> +
> +		zone->mc_cdev.led_cdev.name = devm_kasprintf(dev, GFP_KERNEL,
> +			"acer-wmi::kbd_backlight_%d", i + 1);

Please make sure the naming matches what is documented in:

https://lore.kernel.org/linux-leds/20260504145434.12746-1-johannes.goede@oss.qualcomm.com/

> +		zone->mc_cdev.led_cdev.dev = dev;
> +		zone->mc_cdev.led_cdev.brightness_set_blocking =
> +			acer_wmi_mc_brightness_set;
> +		zone->mc_cdev.led_cdev.brightness_get =
> +			acer_wmi_mc_brightness_get;
> +		zone->mc_cdev.led_cdev.max_brightness = 255;
> +
> +		ret = devm_led_classdev_multicolor_register(dev,
> +			&zone->mc_cdev);

Fits to one line.

> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
> +
>  /*
>   * Platform device
>   */
> @@ -2797,8 +2925,21 @@ static int acer_platform_probe(struct platform_device *device)
>  			goto error_hwmon;
>  	}
>  
> +	if (has_cap(ACER_CAP_KBL_FOUR_ZONE_RGB)) {
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR)
> +		err = acer_wmi_poll_and_enable_zones();
> +		if (err)
> +			goto error_kbl_four_zone_rgb;
> +
> +		err = acer_wmi_register_four_zone_leds(&device->dev);
> +		if (err)
> +			goto error_kbl_four_zone_rgb;
> +#endif /* IS_REACHABLE(CONFIG_LEDS_CLASS_MULTICOLOR) */
> +	}
> +
>  	return 0;
>  
> +error_kbl_four_zone_rgb:
>  error_hwmon:
>  error_platform_profile:
>  	acer_rfkill_exit();
> 

-- 
 i.

