Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CC7279DB3
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751007; cv=none; b=uNJgvWslyZw+dcl85fNvUHp0tLU4xJY/h6GfuyppPtnIvmR6HH6gvStMHbG3rGCkGVrvwig4BoeNbpfkpqaF8Mc+QFAOdVqAjtey2cRHAfFaFASPjzJ0WXO9xr2HzXPu5vmyP43Idrlb9up5SAQQ68TF+zWqkiwOEU3UohFYCJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751007; c=relaxed/simple;
	bh=NR6TVSW685z+xl4pMRTI9uGTtlta9M78wW8Lefwl8rI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=M5HwOck41vowsFixEnGOxq5jQS+kIzpzbyF0mQZDFTzwVb1d7vrqIflqb4KVQhn87Rz9BsntHB2nhRcQ3AEK5xd86ppovUfa1sZ0Q3brFHRIpzwpIuwUn6EESD8I64unuqvQL5IKeuCnor2N6ej2mQ54PzajCXuY9OjvCJEGFVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZs7zCLZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZs7zCLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773751005; x=1805287005;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NR6TVSW685z+xl4pMRTI9uGTtlta9M78wW8Lefwl8rI=;
  b=VZs7zCLZ2KCYTUn4UbK5YNjWw7uha2n9BrAgNpIy7BgE8itja69qHB1Y
   xMyOTSieLYHcmNAyHiOZVAW5k885ScxggoGBRVmDdHlWfv+R8S3a/3lSl
   qJNFgCOmBAePHc+rR6i81WUsS5njKZsgJwOJDhY56AZ/OrsgA9SjPx4MZ
   ZJK9Nk+DXDAtSuyhClIMoAlSybkyGlKmf6xuwRHzLMplqKge5EYPUzeBL
   lasqOf/N72hN3suCdQ2GqTbaVaiTqccM46oKv2RNMBnPbFPZgyyIEWdCF
   ReuAoPod1ctgTiXwBcVRwKvLLv3LXBnOj6ZqTEe5DXygof28PM8Xkli6P
   g==;
X-CSE-ConnectionGUID: 6UhCmif/R8Sp+DBJCVCOWA==
X-CSE-MsgGUID: yxkZ7I15QGadf1R7BnhTSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74668664"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="74668664"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:36:45 -0700
X-CSE-ConnectionGUID: 83hEq/7GSkir9fSH+nurdA==
X-CSE-MsgGUID: B4II4rgNSi6YUn1a3Vo/hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="216605239"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.161])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 05:36:41 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Mar 2026 14:36:38 +0200 (EET)
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
cc: platform-driver-x86@vger.kernel.org, josh@joshuagrisham.com, 
    ayaanmirza788@gmail.com
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Handle ACPI hotkey
 notifications
In-Reply-To: <20260316193319.151148-1-ayaanmirzabaig85@gmail.com>
Message-ID: <44912fc0-91fb-0a85-64fa-1b0b3661f0d8@linux.intel.com>
References: <20260316193319.151148-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Mar 2026, Ayaan Mirza Baig wrote:

> On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
> mute, and camera block hotkeys do not generate i8042 scancodes.
> Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
> respectively, all of which previously fell through to the deafult
> "unknown" warning in galaxybook_acpi_notify().
> 
> Add handling for these three events:
> 
> - 0x7d (Fn+F9, keyboard backlight): schedule the existing
>   kbd_backlight_hotkey_work which cycles brightness.
> 
> - 0x6e (Fn+F10, microphone mute): register a new hotkey input device
>   and emit KEY_MICMUTE.
> 
> - 0x6f (Fn+F11, camera block): if block_recording is active use the
>   existing block_recording_hotkey_work; otherwise emit KEY_CAMERA via the
>   hotkey input device on models where the block_recording ACPI feature is
>   not supported
> 
> Tested on Samsung Galaxy Book 5 (SAM0430).
> 
> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 596 +++++++++++++---------
>  1 file changed, 359 insertions(+), 237 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 755cb82bdb60..d0d614166a4a 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -16,6 +16,7 @@
>  #include <linux/err.h>
>  #include <linux/i8042.h>
>  #include <linux/init.h>
> +#include <linux/input-event-codes.h>
>  #include <linux/input.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> @@ -54,6 +55,7 @@ struct samsung_galaxybook {
>  
>  	struct work_struct block_recording_hotkey_work;
>  	struct input_dev *camera_lens_cover_switch;
> +	struct input_dev *hotkey_dev;
>  
>  	struct acpi_battery_hook battery_hook;
>  
> @@ -66,16 +68,16 @@ enum galaxybook_fw_attr_id {
>  	GB_ATTR_BLOCK_RECORDING,
>  };
>  
> -static const char * const galaxybook_fw_attr_name[] = {
> +static const char *const galaxybook_fw_attr_name[] = {
>  	[GB_ATTR_POWER_ON_LID_OPEN] = "power_on_lid_open",
> -	[GB_ATTR_USB_CHARGING]      = "usb_charging",
> -	[GB_ATTR_BLOCK_RECORDING]   = "block_recording",
> +	[GB_ATTR_USB_CHARGING] = "usb_charging",
> +	[GB_ATTR_BLOCK_RECORDING] = "block_recording",

Please make sure your patch does not do any unrelated changes such as 
these and then submit v2.

--
 i.

>  };
>  
> -static const char * const galaxybook_fw_attr_desc[] = {
> +static const char *const galaxybook_fw_attr_desc[] = {
>  	[GB_ATTR_POWER_ON_LID_OPEN] = "Power On Lid Open",
> -	[GB_ATTR_USB_CHARGING]      = "USB Charging",
> -	[GB_ATTR_BLOCK_RECORDING]   = "Block Recording",
> +	[GB_ATTR_USB_CHARGING] = "USB Charging",
> +	[GB_ATTR_BLOCK_RECORDING] = "Block Recording",
>  };
>  
>  #define GB_ATTR_LANGUAGE_CODE "en_US.UTF-8"
> @@ -87,7 +89,8 @@ struct galaxybook_fw_attr {
>  	struct kobj_attribute display_name;
>  	struct kobj_attribute current_value;
>  	int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value);
> -	int (*set_value)(struct samsung_galaxybook *galaxybook, const bool value);
> +	int (*set_value)(struct samsung_galaxybook *galaxybook,
> +			 const bool value);
>  };
>  
>  struct sawb {
> @@ -121,89 +124,93 @@ struct sawb {
>  	} __packed;
>  } __packed;
>  
> -#define GB_SAWB_LEN_SETTINGS          0x15
> -#define GB_SAWB_LEN_PERFORMANCE_MODE  0x100
> +#define GB_SAWB_LEN_SETTINGS 0x15
> +#define GB_SAWB_LEN_PERFORMANCE_MODE 0x100
>  
> -#define GB_SAFN  0x5843
> +#define GB_SAFN 0x5843
>  
> -#define GB_SASB_KBD_BACKLIGHT     0x78
> -#define GB_SASB_POWER_MANAGEMENT  0x7a
> -#define GB_SASB_USB_CHARGING_GET  0x67
> -#define GB_SASB_USB_CHARGING_SET  0x68
> -#define GB_SASB_NOTIFICATIONS     0x86
> -#define GB_SASB_BLOCK_RECORDING   0x8a
> -#define GB_SASB_PERFORMANCE_MODE  0x91
> +#define GB_SASB_KBD_BACKLIGHT 0x78
> +#define GB_SASB_POWER_MANAGEMENT 0x7a
> +#define GB_SASB_USB_CHARGING_GET 0x67
> +#define GB_SASB_USB_CHARGING_SET 0x68
> +#define GB_SASB_NOTIFICATIONS 0x86
> +#define GB_SASB_BLOCK_RECORDING 0x8a
> +#define GB_SASB_PERFORMANCE_MODE 0x91
>  
> -#define GB_SAWB_RFLG_POS     4
> -#define GB_SAWB_GB_GUNM_POS  5
> +#define GB_SAWB_RFLG_POS 4
> +#define GB_SAWB_GB_GUNM_POS 5
>  
> -#define GB_RFLG_SUCCESS  0xaa
> -#define GB_GUNM_FAIL     0xff
> +#define GB_RFLG_SUCCESS 0xaa
> +#define GB_GUNM_FAIL 0xff
>  
> -#define GB_GUNM_FEATURE_ENABLE          0xbb
> -#define GB_GUNM_FEATURE_ENABLE_SUCCESS  0xdd
> -#define GB_GUDS_FEATURE_ENABLE          0xaa
> -#define GB_GUDS_FEATURE_ENABLE_SUCCESS  0xcc
> +#define GB_GUNM_FEATURE_ENABLE 0xbb
> +#define GB_GUNM_FEATURE_ENABLE_SUCCESS 0xdd
> +#define GB_GUDS_FEATURE_ENABLE 0xaa
> +#define GB_GUDS_FEATURE_ENABLE_SUCCESS 0xcc
>  
> -#define GB_GUNM_GET  0x81
> -#define GB_GUNM_SET  0x82
> +#define GB_GUNM_GET 0x81
> +#define GB_GUNM_SET 0x82
>  
> -#define GB_GUNM_POWER_MANAGEMENT  0x82
> +#define GB_GUNM_POWER_MANAGEMENT 0x82
>  
> -#define GB_GUNM_USB_CHARGING_GET            0x80
> -#define GB_GUNM_USB_CHARGING_ON             0x81
> -#define GB_GUNM_USB_CHARGING_OFF            0x80
> -#define GB_GUDS_POWER_ON_LID_OPEN           0xa3
> -#define GB_GUDS_POWER_ON_LID_OPEN_GET       0x81
> -#define GB_GUDS_POWER_ON_LID_OPEN_SET       0x80
> -#define GB_GUDS_BATTERY_CHARGE_CONTROL      0xe9
> -#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
> -#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
> -#define GB_GUNM_ACPI_NOTIFY_ENABLE          0x80
> -#define GB_GUDS_ACPI_NOTIFY_ENABLE          0x02
> +#define GB_GUNM_USB_CHARGING_GET 0x80
> +#define GB_GUNM_USB_CHARGING_ON 0x81
> +#define GB_GUNM_USB_CHARGING_OFF 0x80
> +#define GB_GUDS_POWER_ON_LID_OPEN 0xa3
> +#define GB_GUDS_POWER_ON_LID_OPEN_GET 0x81
> +#define GB_GUDS_POWER_ON_LID_OPEN_SET 0x80
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL 0xe9
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_GET 0x91
> +#define GB_GUDS_BATTERY_CHARGE_CONTROL_SET 0x90
> +#define GB_GUNM_ACPI_NOTIFY_ENABLE 0x80
> +#define GB_GUDS_ACPI_NOTIFY_ENABLE 0x02
>  
> -#define GB_BLOCK_RECORDING_ON   0x0
> -#define GB_BLOCK_RECORDING_OFF  0x1
> +#define GB_BLOCK_RECORDING_ON 0x0
> +#define GB_BLOCK_RECORDING_OFF 0x1
>  
> -#define GB_FNCN_PERFORMANCE_MODE       0x51
> -#define GB_SUBN_PERFORMANCE_MODE_LIST  0x01
> -#define GB_SUBN_PERFORMANCE_MODE_GET   0x02
> -#define GB_SUBN_PERFORMANCE_MODE_SET   0x03
> +#define GB_FNCN_PERFORMANCE_MODE 0x51
> +#define GB_SUBN_PERFORMANCE_MODE_LIST 0x01
> +#define GB_SUBN_PERFORMANCE_MODE_GET 0x02
> +#define GB_SUBN_PERFORMANCE_MODE_SET 0x03
>  
>  /* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
>  static const guid_t performance_mode_guid =
> -	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0x92, 0x1b, 0x8f);
> +	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b,
> +		  0x92, 0x1b, 0x8f);
>  #define GB_PERFORMANCE_MODE_GUID performance_mode_guid
>  
> -#define GB_PERFORMANCE_MODE_FANOFF          0xb
> -#define GB_PERFORMANCE_MODE_LOWNOISE        0xa
> -#define GB_PERFORMANCE_MODE_OPTIMIZED       0x0
> -#define GB_PERFORMANCE_MODE_OPTIMIZED_V2    0x2
> -#define GB_PERFORMANCE_MODE_PERFORMANCE     0x1
> -#define GB_PERFORMANCE_MODE_PERFORMANCE_V2  0x15
> -#define GB_PERFORMANCE_MODE_ULTRA           0x16
> -#define GB_PERFORMANCE_MODE_IGNORE1         0x14
> -#define GB_PERFORMANCE_MODE_IGNORE2         0xc
> -
> -#define GB_ACPI_METHOD_ENABLE            "SDLS"
> -#define GB_ACPI_METHOD_ENABLE_ON         1
> -#define GB_ACPI_METHOD_ENABLE_OFF        0
> -#define GB_ACPI_METHOD_SETTINGS          "CSFI"
> -#define GB_ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
> -
> -#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS  3
> -
> -#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
> -#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
> -#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
> -#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> -
> -#define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
> -#define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
> -#define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
> -#define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
> -#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
> -#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
> +#define GB_PERFORMANCE_MODE_FANOFF 0xb
> +#define GB_PERFORMANCE_MODE_LOWNOISE 0xa
> +#define GB_PERFORMANCE_MODE_OPTIMIZED 0x0
> +#define GB_PERFORMANCE_MODE_OPTIMIZED_V2 0x2
> +#define GB_PERFORMANCE_MODE_PERFORMANCE 0x1
> +#define GB_PERFORMANCE_MODE_PERFORMANCE_V2 0x15
> +#define GB_PERFORMANCE_MODE_ULTRA 0x16
> +#define GB_PERFORMANCE_MODE_IGNORE1 0x14
> +#define GB_PERFORMANCE_MODE_IGNORE2 0xc
> +
> +#define GB_ACPI_METHOD_ENABLE "SDLS"
> +#define GB_ACPI_METHOD_ENABLE_ON 1
> +#define GB_ACPI_METHOD_ENABLE_OFF 0
> +#define GB_ACPI_METHOD_SETTINGS "CSFI"
> +#define GB_ACPI_METHOD_PERFORMANCE_MODE "CSXI"
> +
> +#define GB_KBD_BACKLIGHT_MAX_BRIGHTNESS 3
> +
> +#define GB_ACPI_NOTIFY_BATTERY_STATE_CHANGED 0x61
> +#define GB_ACPI_NOTIFY_DEVICE_ON_TABLE 0x6c
> +#define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE 0x6d
> +#define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE 0x70
> +#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT 0x7d
> +#define GB_ACPI_NOTIFY_HOTKEY_CAMERA 0x6f
> +#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE 0x6e
> +
> +#define GB_KEY_KBD_BACKLIGHT_KEYDOWN 0x2c
> +#define GB_KEY_KBD_BACKLIGHT_KEYUP 0xac
> +#define GB_KEY_BLOCK_RECORDING_KEYDOWN 0x1f
> +#define GB_KEY_BLOCK_RECORDING_KEYUP 0x9f
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP 0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN 0x8f
>  
>  /*
>   * Optional features which have been determined as not supported on a particular
> @@ -217,10 +224,11 @@ static const guid_t performance_mode_guid =
>   * ACPI method handling
>   */
>  
> -static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
> -				  struct sawb *buf, size_t len)
> +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook,
> +				  acpi_string method, struct sawb *buf,
> +				  size_t len)
>  {
> -	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>  	union acpi_object in_obj, *out_obj;
>  	struct acpi_object_list input;
>  	acpi_status status;
> @@ -233,18 +241,20 @@ static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_st
>  	input.count = 1;
>  	input.pointer = &in_obj;
>  
> -	status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method, &input, &output,
> -					    ACPI_TYPE_BUFFER);
> +	status = acpi_evaluate_object_typed(galaxybook->acpi->handle, method,
> +					    &input, &output, ACPI_TYPE_BUFFER);
>  
>  	if (ACPI_FAILURE(status)) {
> -		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\n",
> -			method, acpi_format_exception(status));
> +		dev_err(&galaxybook->acpi->dev,
> +			"failed to execute method %s; got %s\n", method,
> +			acpi_format_exception(status));
>  		return -EIO;
>  	}
>  
>  	out_obj = output.pointer;
>  
> -	if (out_obj->buffer.length != len || out_obj->buffer.length < GB_SAWB_GB_GUNM_POS + 1) {
> +	if (out_obj->buffer.length != len ||
> +	    out_obj->buffer.length < GB_SAWB_GB_GUNM_POS + 1) {
>  		dev_err(&galaxybook->acpi->dev,
>  			"failed to execute %s; response length mismatch\n",
>  			method);
> @@ -274,7 +284,8 @@ static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_st
>  	return err;
>  }
>  
> -static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook, const u16 sasb)
> +static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook,
> +					  const u16 sasb)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -284,8 +295,8 @@ static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook,
>  	buf.gunm = GB_GUNM_FEATURE_ENABLE;
>  	buf.guds[0] = GB_GUDS_FEATURE_ENABLE;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -310,8 +321,8 @@ static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook,
>  	buf.sasb = GB_SASB_KBD_BACKLIGHT;
>  	buf.gunm = GB_GUNM_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -331,8 +342,8 @@ static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook,
>  
>  	buf.guds[0] = brightness;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				      &buf, GB_SAWB_LEN_SETTINGS);
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				      GB_SAWB_LEN_SETTINGS);
>  }
>  
>  static enum led_brightness kbd_backlight_show(struct led_classdev *led)
> @@ -352,8 +363,8 @@ static enum led_brightness kbd_backlight_show(struct led_classdev *led)
>  static int kbd_backlight_store(struct led_classdev *led,
>  			       const enum led_brightness brightness)
>  {
> -	struct samsung_galaxybook *galaxybook =
> -		container_of_const(led, struct samsung_galaxybook, kbd_backlight);
> +	struct samsung_galaxybook *galaxybook = container_of_const(
> +		led, struct samsung_galaxybook, kbd_backlight);
>  
>  	return kbd_backlight_acpi_set(galaxybook, brightness);
>  }
> @@ -364,21 +375,24 @@ static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *galaxybook)
>  	enum led_brightness brightness;
>  	int err;
>  
> -	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_backlight_lock);
> +	err = devm_mutex_init(&galaxybook->platform->dev,
> +			      &galaxybook->kbd_backlight_lock);
>  	if (err)
>  		return err;
>  
>  	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLIGHT);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to enable kbd_backlight feature, error %d\n", err);
> +			"failed to enable kbd_backlight feature, error %d\n",
> +			err);
>  		return GB_NOT_SUPPORTED;
>  	}
>  
>  	err = kbd_backlight_acpi_get(galaxybook, &brightness);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to get initial kbd_backlight brightness, error %d\n", err);
> +			"failed to get initial kbd_backlight brightness, error %d\n",
> +			err);
>  		return GB_NOT_SUPPORTED;
>  	}
>  
> @@ -389,17 +403,21 @@ static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *galaxybook)
>  	galaxybook->kbd_backlight.brightness_get = kbd_backlight_show;
>  	galaxybook->kbd_backlight.brightness_set_blocking = kbd_backlight_store;
>  	galaxybook->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
> -	galaxybook->kbd_backlight.max_brightness = GB_KBD_BACKLIGHT_MAX_BRIGHTNESS;
> +	galaxybook->kbd_backlight.max_brightness =
> +		GB_KBD_BACKLIGHT_MAX_BRIGHTNESS;
>  
>  	return devm_led_classdev_register_ext(&galaxybook->platform->dev,
> -					      &galaxybook->kbd_backlight, &init_data);
> +					      &galaxybook->kbd_backlight,
> +					      &init_data);
>  }
>  
>  /*
>   * Battery Extension (adds charge_control_end_threshold to the battery device)
>   */
>  
> -static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *galaxybook, u8 *value)
> +static int
> +charge_control_end_threshold_acpi_get(struct samsung_galaxybook *galaxybook,
> +				      u8 *value)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -410,8 +428,8 @@ static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *gala
>  	buf.guds[0] = GB_GUDS_BATTERY_CHARGE_CONTROL;
>  	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -420,7 +438,9 @@ static int charge_control_end_threshold_acpi_get(struct samsung_galaxybook *gala
>  	return 0;
>  }
>  
> -static int charge_control_end_threshold_acpi_set(struct samsung_galaxybook *galaxybook, u8 value)
> +static int
> +charge_control_end_threshold_acpi_set(struct samsung_galaxybook *galaxybook,
> +				      u8 value)
>  {
>  	struct sawb buf = {};
>  
> @@ -431,15 +451,14 @@ static int charge_control_end_threshold_acpi_set(struct samsung_galaxybook *gala
>  	buf.guds[1] = GB_GUDS_BATTERY_CHARGE_CONTROL_SET;
>  	buf.guds[2] = value;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				      &buf, GB_SAWB_LEN_SETTINGS);
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				      GB_SAWB_LEN_SETTINGS);
>  }
>  
> -static int galaxybook_battery_ext_property_get(struct power_supply *psy,
> -					       const struct power_supply_ext *ext,
> -					       void *ext_data,
> -					       enum power_supply_property psp,
> -					       union power_supply_propval *val)
> +static int galaxybook_battery_ext_property_get(
> +	struct power_supply *psy, const struct power_supply_ext *ext,
> +	void *ext_data, enum power_supply_property psp,
> +	union power_supply_propval *val)
>  {
>  	struct samsung_galaxybook *galaxybook = ext_data;
>  	u8 value;
> @@ -464,11 +483,10 @@ static int galaxybook_battery_ext_property_get(struct power_supply *psy,
>  	return 0;
>  }
>  
> -static int galaxybook_battery_ext_property_set(struct power_supply *psy,
> -					       const struct power_supply_ext *ext,
> -					       void *ext_data,
> -					       enum power_supply_property psp,
> -					       const union power_supply_propval *val)
> +static int galaxybook_battery_ext_property_set(
> +	struct power_supply *psy, const struct power_supply_ext *ext,
> +	void *ext_data, enum power_supply_property psp,
> +	const union power_supply_propval *val)
>  {
>  	struct samsung_galaxybook *galaxybook = ext_data;
>  	u8 value;
> @@ -491,10 +509,9 @@ static int galaxybook_battery_ext_property_set(struct power_supply *psy,
>  	return charge_control_end_threshold_acpi_set(galaxybook, value);
>  }
>  
> -static int galaxybook_battery_ext_property_is_writeable(struct power_supply *psy,
> -							const struct power_supply_ext *ext,
> -							void *ext_data,
> -							enum power_supply_property psp)
> +static int galaxybook_battery_ext_property_is_writeable(
> +	struct power_supply *psy, const struct power_supply_ext *ext,
> +	void *ext_data, enum power_supply_property psp)
>  {
>  	if (psp == POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD)
>  		return true;
> @@ -507,15 +524,16 @@ static const enum power_supply_property galaxybook_battery_properties[] = {
>  };
>  
>  static const struct power_supply_ext galaxybook_battery_ext = {
> -	.name			= DRIVER_NAME,
> -	.properties		= galaxybook_battery_properties,
> -	.num_properties		= ARRAY_SIZE(galaxybook_battery_properties),
> -	.get_property		= galaxybook_battery_ext_property_get,
> -	.set_property		= galaxybook_battery_ext_property_set,
> -	.property_is_writeable	= galaxybook_battery_ext_property_is_writeable,
> +	.name = DRIVER_NAME,
> +	.properties = galaxybook_battery_properties,
> +	.num_properties = ARRAY_SIZE(galaxybook_battery_properties),
> +	.get_property = galaxybook_battery_ext_property_get,
> +	.set_property = galaxybook_battery_ext_property_set,
> +	.property_is_writeable = galaxybook_battery_ext_property_is_writeable,
>  };
>  
> -static int galaxybook_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
> +static int galaxybook_battery_add(struct power_supply *battery,
> +				  struct acpi_battery_hook *hook)
>  {
>  	struct samsung_galaxybook *galaxybook =
>  		container_of(hook, struct samsung_galaxybook, battery_hook);
> @@ -524,13 +542,15 @@ static int galaxybook_battery_add(struct power_supply *battery, struct acpi_batt
>  					       &battery->dev, galaxybook);
>  }
>  
> -static int galaxybook_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
> +static int galaxybook_battery_remove(struct power_supply *battery,
> +				     struct acpi_battery_hook *hook)
>  {
>  	power_supply_unregister_extension(battery, &galaxybook_battery_ext);
>  	return 0;
>  }
>  
> -static int galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybook)
> +static int
> +galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybook)
>  {
>  	u8 value;
>  	int err;
> @@ -538,7 +558,8 @@ static int galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybo
>  	err = charge_control_end_threshold_acpi_get(galaxybook, &value);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to get initial battery charge end threshold, error %d\n", err);
> +			"failed to get initial battery charge end threshold, error %d\n",
> +			err);
>  		return 0;
>  	}
>  
> @@ -546,14 +567,16 @@ static int galaxybook_battery_threshold_init(struct samsung_galaxybook *galaxybo
>  	galaxybook->battery_hook.remove_battery = galaxybook_battery_remove;
>  	galaxybook->battery_hook.name = "Samsung Galaxy Book Battery Extension";
>  
> -	return devm_battery_hook_register(&galaxybook->platform->dev, &galaxybook->battery_hook);
> +	return devm_battery_hook_register(&galaxybook->platform->dev,
> +					  &galaxybook->battery_hook);
>  }
>  
>  /*
>   * Platform Profile / Performance mode
>   */
>  
> -static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook, u8 *performance_mode)
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook,
> +				     u8 *performance_mode)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -564,8 +587,9 @@ static int performance_mode_acpi_get(struct samsung_galaxybook *galaxybook, u8 *
>  	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
>  	buf.subn = GB_SUBN_PERFORMANCE_MODE_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
> -				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +	err = galaxybook_acpi_method(galaxybook,
> +				     GB_ACPI_METHOD_PERFORMANCE_MODE, &buf,
> +				     GB_SAWB_LEN_PERFORMANCE_MODE);
>  	if (err)
>  		return err;
>  
> @@ -586,8 +610,9 @@ static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
>  	buf.subn = GB_SUBN_PERFORMANCE_MODE_SET;
>  	buf.iob0 = performance_mode;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
> -				      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +	return galaxybook_acpi_method(galaxybook,
> +				      GB_ACPI_METHOD_PERFORMANCE_MODE, &buf,
> +				      GB_SAWB_LEN_PERFORMANCE_MODE);
>  }
>  
>  static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,
> @@ -615,15 +640,17 @@ static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,
>  		return -EOPNOTSUPP;
>  	default:
>  		dev_warn(&galaxybook->platform->dev,
> -			 "unrecognized performance mode 0x%x\n", performance_mode);
> +			 "unrecognized performance mode 0x%x\n",
> +			 performance_mode);
>  		return -EOPNOTSUPP;
>  	}
>  
>  	return 0;
>  }
>  
> -static int galaxybook_platform_profile_get(struct device *dev,
> -					   enum platform_profile_option *profile)
> +static int
> +galaxybook_platform_profile_get(struct device *dev,
> +				enum platform_profile_option *profile)
>  {
>  	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
>  	u8 performance_mode;
> @@ -633,7 +660,8 @@ static int galaxybook_platform_profile_get(struct device *dev,
>  	if (err)
>  		return err;
>  
> -	return get_performance_mode_profile(galaxybook, performance_mode, profile);
> +	return get_performance_mode_profile(galaxybook, performance_mode,
> +					    profile);
>  }
>  
>  static int galaxybook_platform_profile_set(struct device *dev,
> @@ -641,11 +669,12 @@ static int galaxybook_platform_profile_set(struct device *dev,
>  {
>  	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
>  
> -	return performance_mode_acpi_set(galaxybook,
> -					 galaxybook->profile_performance_modes[profile]);
> +	return performance_mode_acpi_set(
> +		galaxybook, galaxybook->profile_performance_modes[profile]);
>  }
>  
> -static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choices)
> +static int galaxybook_platform_profile_probe(void *drvdata,
> +					     unsigned long *choices)
>  {
>  	struct samsung_galaxybook *galaxybook = drvdata;
>  	u8 *perfmodes = galaxybook->profile_performance_modes;
> @@ -660,11 +689,13 @@ static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choic
>  	buf.fncn = GB_FNCN_PERFORMANCE_MODE;
>  	buf.subn = GB_SUBN_PERFORMANCE_MODE_LIST;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
> -				     &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
> +	err = galaxybook_acpi_method(galaxybook,
> +				     GB_ACPI_METHOD_PERFORMANCE_MODE, &buf,
> +				     GB_SAWB_LEN_PERFORMANCE_MODE);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to get supported performance modes, error %d\n", err);
> +			"failed to get supported performance modes, error %d\n",
> +			err);
>  		return err;
>  	}
>  
> @@ -672,7 +703,8 @@ static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choic
>  	perfmodes[PLATFORM_PROFILE_LOW_POWER] = GB_PERFORMANCE_MODE_FANOFF;
>  	perfmodes[PLATFORM_PROFILE_QUIET] = GB_PERFORMANCE_MODE_LOWNOISE;
>  	perfmodes[PLATFORM_PROFILE_BALANCED] = GB_PERFORMANCE_MODE_OPTIMIZED;
> -	perfmodes[PLATFORM_PROFILE_PERFORMANCE] = GB_PERFORMANCE_MODE_PERFORMANCE;
> +	perfmodes[PLATFORM_PROFILE_PERFORMANCE] =
> +		GB_PERFORMANCE_MODE_PERFORMANCE;
>  
>  	/*
>  	 * Value returned in iob0 will have the number of supported performance
> @@ -682,10 +714,12 @@ static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choic
>  	 * values along the way if a non-legacy value exists.
>  	 */
>  	for (i = 1; i <= buf.iob0; i++) {
> -		err = get_performance_mode_profile(galaxybook, buf.iobs[i], &profile);
> +		err = get_performance_mode_profile(galaxybook, buf.iobs[i],
> +						   &profile);
>  		if (err) {
>  			dev_dbg(&galaxybook->platform->dev,
> -				"ignoring unmapped performance mode 0x%x\n", buf.iobs[i]);
> +				"ignoring unmapped performance mode 0x%x\n",
> +				buf.iobs[i]);
>  			continue;
>  		}
>  		switch (buf.iobs[i]) {
> @@ -695,7 +729,8 @@ static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choic
>  		case GB_PERFORMANCE_MODE_PERFORMANCE_V2:
>  			/* only update if not already overwritten by Ultra */
>  			if (perfmodes[profile] != GB_PERFORMANCE_MODE_ULTRA)
> -				perfmodes[profile] = GB_PERFORMANCE_MODE_PERFORMANCE_V2;
> +				perfmodes[profile] =
> +					GB_PERFORMANCE_MODE_PERFORMANCE_V2;
>  			break;
>  		case GB_PERFORMANCE_MODE_ULTRA:
>  			perfmodes[profile] = GB_PERFORMANCE_MODE_ULTRA;
> @@ -711,7 +746,8 @@ static int galaxybook_platform_profile_probe(void *drvdata, unsigned long *choic
>  
>  	/* initialize performance_mode using balanced's mapped value */
>  	if (test_bit(PLATFORM_PROFILE_BALANCED, choices))
> -		return performance_mode_acpi_set(galaxybook, perfmodes[PLATFORM_PROFILE_BALANCED]);
> +		return performance_mode_acpi_set(
> +			galaxybook, perfmodes[PLATFORM_PROFILE_BALANCED]);
>  
>  	return 0;
>  }
> @@ -722,7 +758,8 @@ static const struct platform_profile_ops galaxybook_platform_profile_ops = {
>  	.profile_set = galaxybook_platform_profile_set,
>  };
>  
> -static int galaxybook_platform_profile_init(struct samsung_galaxybook *galaxybook)
> +static int
> +galaxybook_platform_profile_init(struct samsung_galaxybook *galaxybook)
>  {
>  	struct device *platform_profile_dev;
>  	u8 performance_mode;
> @@ -731,13 +768,14 @@ static int galaxybook_platform_profile_init(struct samsung_galaxybook *galaxyboo
>  	err = performance_mode_acpi_get(galaxybook, &performance_mode);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to get initial performance mode, error %d\n", err);
> +			"failed to get initial performance mode, error %d\n",
> +			err);
>  		return GB_NOT_SUPPORTED;
>  	}
>  
> -	platform_profile_dev = devm_platform_profile_register(&galaxybook->platform->dev,
> -							      DRIVER_NAME, galaxybook,
> -							      &galaxybook_platform_profile_ops);
> +	platform_profile_dev = devm_platform_profile_register(
> +		&galaxybook->platform->dev, DRIVER_NAME, galaxybook,
> +		&galaxybook_platform_profile_ops);
>  
>  	return PTR_ERR_OR_ZERO(platform_profile_dev);
>  }
> @@ -748,7 +786,8 @@ static int galaxybook_platform_profile_init(struct samsung_galaxybook *galaxyboo
>  
>  /* Power on lid open (device should power on when lid is opened) */
>  
> -static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook,
> +				      bool *value)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -759,8 +798,8 @@ static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, boo
>  	buf.guds[0] = GB_GUDS_POWER_ON_LID_OPEN;
>  	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -769,7 +808,8 @@ static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxybook, boo
>  	return 0;
>  }
>  
> -static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook,
> +				      const bool value)
>  {
>  	struct sawb buf = {};
>  
> @@ -782,13 +822,14 @@ static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxybook, con
>  	buf.guds[1] = GB_GUDS_POWER_ON_LID_OPEN_SET;
>  	buf.guds[2] = value ? 1 : 0;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				      &buf, GB_SAWB_LEN_SETTINGS);
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				      GB_SAWB_LEN_SETTINGS);
>  }
>  
>  /* USB Charging (USB ports can provide power when device is powered off) */
>  
> -static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook,
> +				 bool *value)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -797,8 +838,8 @@ static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *va
>  	buf.sasb = GB_SASB_USB_CHARGING_GET;
>  	buf.gunm = GB_GUNM_USB_CHARGING_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -807,7 +848,8 @@ static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook, bool *va
>  	return 0;
>  }
>  
> -static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook,
> +				 const bool value)
>  {
>  	struct sawb buf = {};
>  
> @@ -817,13 +859,14 @@ static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook, const bo
>  	buf.sasb = GB_SASB_USB_CHARGING_SET;
>  	buf.gunm = value ? GB_GUNM_USB_CHARGING_ON : GB_GUNM_USB_CHARGING_OFF;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				      &buf, GB_SAWB_LEN_SETTINGS);
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				      GB_SAWB_LEN_SETTINGS);
>  }
>  
>  /* Block recording (blocks access to camera and microphone) */
>  
> -static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook, bool *value)
> +static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook,
> +				    bool *value)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -832,8 +875,8 @@ static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook, bool
>  	buf.sasb = GB_SASB_BLOCK_RECORDING;
>  	buf.gunm = GB_GUNM_GET;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -842,7 +885,8 @@ static int block_recording_acpi_get(struct samsung_galaxybook *galaxybook, bool
>  	return 0;
>  }
>  
> -static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const bool value)
> +static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook,
> +				    const bool value)
>  {
>  	struct sawb buf = {};
>  	int err;
> @@ -854,8 +898,8 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
>  	buf.gunm = GB_GUNM_SET;
>  	buf.guds[0] = value ? GB_BLOCK_RECORDING_ON : GB_BLOCK_RECORDING_OFF;
>  
> -	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				     &buf, GB_SAWB_LEN_SETTINGS);
> +	err = galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				     GB_SAWB_LEN_SETTINGS);
>  	if (err)
>  		return err;
>  
> @@ -866,15 +910,18 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
>  	return 0;
>  }
>  
> -static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook)
> +static int
> +galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook)
>  {
>  	bool value;
>  	int err;
>  
> -	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECORDING);
> +	err = galaxybook_enable_acpi_feature(galaxybook,
> +					     GB_SASB_BLOCK_RECORDING);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to initialize block_recording, error %d\n", err);
> +			"failed to initialize block_recording, error %d\n",
> +			err);
>  		return GB_NOT_SUPPORTED;
>  	}
>  
> @@ -883,7 +930,8 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
>  	err = block_recording_acpi_get(galaxybook, &value);
>  	if (err) {
>  		dev_dbg(&galaxybook->platform->dev,
> -			"failed to get initial block_recording state, error %d\n", err);
> +			"failed to get initial block_recording state, error %d\n",
> +			err);
>  		return GB_NOT_SUPPORTED;
>  	}
>  
> @@ -892,11 +940,13 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
>  	if (!galaxybook->camera_lens_cover_switch)
>  		return -ENOMEM;
>  
> -	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
> +	galaxybook->camera_lens_cover_switch->name =
> +		"Samsung Galaxy Book Camera Lens Cover";
>  	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
>  	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
>  
> -	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
> +	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW,
> +			     SW_CAMERA_LENS_COVER);
>  
>  	err = input_register_device(galaxybook->camera_lens_cover_switch);
>  	if (err)
> @@ -911,28 +961,33 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
>  
>  /* Firmware Attributes setup */
>  
> -static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			 char *buf)
>  {
>  	return sysfs_emit(buf, "enumeration\n");
>  }
>  
>  static struct kobj_attribute fw_attr_type = __ATTR_RO(type);
>  
> -static ssize_t default_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +static ssize_t default_value_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
>  {
>  	return sysfs_emit(buf, "0\n");
>  }
>  
>  static struct kobj_attribute fw_attr_default_value = __ATTR_RO(default_value);
>  
> -static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +static ssize_t possible_values_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
>  {
>  	return sysfs_emit(buf, "0;1\n");
>  }
>  
> -static struct kobj_attribute fw_attr_possible_values = __ATTR_RO(possible_values);
> +static struct kobj_attribute fw_attr_possible_values =
> +	__ATTR_RO(possible_values);
>  
> -static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj_attribute *attr,
> +static ssize_t display_name_language_code_show(struct kobject *kobj,
> +					       struct kobj_attribute *attr,
>  					       char *buf)
>  {
>  	return sysfs_emit(buf, "%s\n", GB_ATTR_LANGUAGE_CODE);
> @@ -941,15 +996,18 @@ static ssize_t display_name_language_code_show(struct kobject *kobj, struct kobj
>  static struct kobj_attribute fw_attr_display_name_language_code =
>  	__ATTR_RO(display_name_language_code);
>  
> -static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +static ssize_t display_name_show(struct kobject *kobj,
> +				 struct kobj_attribute *attr, char *buf)
>  {
>  	struct galaxybook_fw_attr *fw_attr =
>  		container_of(attr, struct galaxybook_fw_attr, display_name);
>  
> -	return sysfs_emit(buf, "%s\n", galaxybook_fw_attr_desc[fw_attr->fw_attr_id]);
> +	return sysfs_emit(buf, "%s\n",
> +			  galaxybook_fw_attr_desc[fw_attr->fw_attr_id]);
>  }
>  
> -static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +static ssize_t current_value_show(struct kobject *kobj,
> +				  struct kobj_attribute *attr, char *buf)
>  {
>  	struct galaxybook_fw_attr *fw_attr =
>  		container_of(attr, struct galaxybook_fw_attr, current_value);
> @@ -963,8 +1021,9 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>  	return sysfs_emit(buf, "%u\n", value);
>  }
>  
> -static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> -				   const char *buf, size_t count)
> +static ssize_t current_value_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr, const char *buf,
> +				   size_t count)
>  {
>  	struct galaxybook_fw_attr *fw_attr =
>  		container_of(attr, struct galaxybook_fw_attr, current_value);
> @@ -988,24 +1047,26 @@ static ssize_t current_value_store(struct kobject *kobj, struct kobj_attribute *
>  	return count;
>  }
>  
> -#define NUM_FW_ATTR_ENUM_ATTRS  6
> +#define NUM_FW_ATTR_ENUM_ATTRS 6
>  
> -static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
> -				   const enum galaxybook_fw_attr_id fw_attr_id,
> -				   int (*get_value)(struct samsung_galaxybook *galaxybook,
> -						    bool *value),
> -				   int (*set_value)(struct samsung_galaxybook *galaxybook,
> -						    const bool value))
> +static int galaxybook_fw_attr_init(
> +	struct samsung_galaxybook *galaxybook,
> +	const enum galaxybook_fw_attr_id fw_attr_id,
> +	int (*get_value)(struct samsung_galaxybook *galaxybook, bool *value),
> +	int (*set_value)(struct samsung_galaxybook *galaxybook,
> +			 const bool value))
>  {
>  	struct galaxybook_fw_attr *fw_attr;
>  	struct attribute **attrs;
>  
> -	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
> +	fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr),
> +			       GFP_KERNEL);
>  	if (!fw_attr)
>  		return -ENOMEM;
>  
> -	attrs = devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_ATTRS + 1,
> -			     sizeof(*attrs), GFP_KERNEL);
> +	attrs = devm_kcalloc(&galaxybook->platform->dev,
> +			     NUM_FW_ATTR_ENUM_ATTRS + 1, sizeof(*attrs),
> +			     GFP_KERNEL);
>  	if (!attrs)
>  		return -ENOMEM;
>  
> @@ -1036,7 +1097,8 @@ static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
>  	fw_attr->get_value = get_value;
>  	fw_attr->set_value = set_value;
>  
> -	return sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
> +	return sysfs_create_group(&galaxybook->fw_attrs_kset->kobj,
> +				  &fw_attr->attr_group);
>  }
>  
>  static void galaxybook_kset_unregister(void *data)
> @@ -1058,12 +1120,14 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>  	bool value;
>  	int err;
>  
> -	err = devm_mutex_init(&galaxybook->platform->dev, &galaxybook->fw_attr_lock);
> +	err = devm_mutex_init(&galaxybook->platform->dev,
> +			      &galaxybook->fw_attr_lock);
>  	if (err)
>  		return err;
>  
> -	galaxybook->fw_attrs_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
> -						 NULL, "%s", DRIVER_NAME);
> +	galaxybook->fw_attrs_dev = device_create(&firmware_attributes_class,
> +						 NULL, MKDEV(0, 0), NULL, "%s",
> +						 DRIVER_NAME);
>  	if (IS_ERR(galaxybook->fw_attrs_dev))
>  		return PTR_ERR(galaxybook->fw_attrs_dev);
>  
> @@ -1073,12 +1137,13 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>  	if (err)
>  		return err;
>  
> -	galaxybook->fw_attrs_kset = kset_create_and_add("attributes", NULL,
> -							&galaxybook->fw_attrs_dev->kobj);
> +	galaxybook->fw_attrs_kset = kset_create_and_add(
> +		"attributes", NULL, &galaxybook->fw_attrs_dev->kobj);
>  	if (!galaxybook->fw_attrs_kset)
>  		return -ENOMEM;
>  	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> -				       galaxybook_kset_unregister, galaxybook->fw_attrs_kset);
> +				       galaxybook_kset_unregister,
> +				       galaxybook->fw_attrs_kset);
>  	if (err)
>  		return err;
>  
> @@ -1094,8 +1159,7 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>  
>  	err = usb_charging_acpi_get(galaxybook, &value);
>  	if (!err) {
> -		err = galaxybook_fw_attr_init(galaxybook,
> -					      GB_ATTR_USB_CHARGING,
> +		err = galaxybook_fw_attr_init(galaxybook, GB_ATTR_USB_CHARGING,
>  					      &usb_charging_acpi_get,
>  					      &usb_charging_acpi_set);
>  		if (err)
> @@ -1110,8 +1174,7 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>  
>  	galaxybook->has_block_recording = true;
>  
> -	return galaxybook_fw_attr_init(galaxybook,
> -				       GB_ATTR_BLOCK_RECORDING,
> +	return galaxybook_fw_attr_init(galaxybook, GB_ATTR_BLOCK_RECORDING,
>  				       &block_recording_acpi_get,
>  				       &block_recording_acpi_set);
>  }
> @@ -1138,11 +1201,13 @@ static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
>  	err = led_set_brightness_sync(&galaxybook->kbd_backlight, brightness);
>  	if (err) {
>  		dev_err(&galaxybook->platform->dev,
> -			"failed to set kbd_backlight brightness, error %d\n", err);
> +			"failed to set kbd_backlight brightness, error %d\n",
> +			err);
>  		return;
>  	}
>  
> -	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight, brightness);
> +	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight,
> +						  brightness);
>  }
>  
>  static void galaxybook_block_recording_hotkey_work(struct work_struct *work)
> @@ -1167,8 +1232,8 @@ static void galaxybook_block_recording_hotkey_work(struct work_struct *work)
>  			"failed to set block_recording, error %d\n", err);
>  }
>  
> -static bool galaxybook_i8042_filter(unsigned char data, unsigned char str, struct serio *port,
> -				    void *context)
> +static bool galaxybook_i8042_filter(unsigned char data, unsigned char str,
> +				    struct serio *port, void *context)
>  {
>  	struct samsung_galaxybook *galaxybook = context;
>  	static bool extended;
> @@ -1186,14 +1251,17 @@ static bool galaxybook_i8042_filter(unsigned char data, unsigned char str, struc
>  			return true;
>  		case GB_KEY_KBD_BACKLIGHT_KEYUP:
>  			if (galaxybook->has_kbd_backlight)
> -				schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +				schedule_work(
> +					&galaxybook->kbd_backlight_hotkey_work);
>  			return true;
>  
>  		case GB_KEY_BLOCK_RECORDING_KEYDOWN:
>  			return true;
>  		case GB_KEY_BLOCK_RECORDING_KEYUP:
>  			if (galaxybook->has_block_recording)
> -				schedule_work(&galaxybook->block_recording_hotkey_work);
> +				schedule_work(
> +					&galaxybook
> +						 ->block_recording_hotkey_work);
>  			return true;
>  
>  		/* battery notification already sent to battery + SCAI device */
> @@ -1223,7 +1291,8 @@ static void galaxybook_i8042_filter_remove(void *data)
>  	cancel_work_sync(&galaxybook->block_recording_hotkey_work);
>  }
>  
> -static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
> +static int
> +galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
>  {
>  	int err;
>  
> @@ -1240,7 +1309,25 @@ static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook
>  		return err;
>  
>  	return devm_add_action_or_reset(&galaxybook->platform->dev,
> -					galaxybook_i8042_filter_remove, galaxybook);
> +					galaxybook_i8042_filter_remove,
> +					galaxybook);
> +}
> +
> +static int galaxybook_hotkey_init(struct samsung_galaxybook *galaxybook)
> +{
> +	galaxybook->hotkey_dev =
> +		devm_input_allocate_device(&galaxybook->platform->dev);
> +	if (!galaxybook->hotkey_dev)
> +		return -ENOMEM;
> +
> +	galaxybook->hotkey_dev->name = "Samsung Galaxy Book hotkeys";
> +	galaxybook->hotkey_dev->phys = DRIVER_NAME "/input1";
> +	galaxybook->hotkey_dev->id.bustype = BUS_HOST;
> +
> +	input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_MICMUTE);
> +	input_set_capability(galaxybook->hotkey_dev, EV_KEY, KEY_CAMERA);
> +
> +	return input_register_device(galaxybook->hotkey_dev);
>  }
>  
>  /*
> @@ -1260,13 +1347,37 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		if (galaxybook->has_performance_mode)
>  			platform_profile_cycle();
>  		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
> +		if (galaxybook->has_kbd_backlight)
> +			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
> +		if (galaxybook->hotkey_dev) {
> +			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE,
> +					 1);
> +			input_sync(galaxybook->hotkey_dev);
> +			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE,
> +					 0);
> +			input_sync(galaxybook->hotkey_dev);
> +		}
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
> +		if (galaxybook->has_block_recording)
> +			schedule_work(&galaxybook->block_recording_hotkey_work);
> +		else if (galaxybook->hotkey_dev) {
> +			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 1);
> +			input_sync(galaxybook->hotkey_dev);
> +			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 0);
> +			input_sync(galaxybook->hotkey_dev);
> +		}
> +		break;
>  	default:
>  		dev_warn(&galaxybook->platform->dev,
>  			 "unknown ACPI notification event: 0x%x\n", event);
>  	}
>  
> -	acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->platform->dev),
> -					event, 1);
> +	acpi_bus_generate_netlink_event(
> +		DRIVER_NAME, dev_name(&galaxybook->platform->dev), event, 1);
>  }
>  
>  static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *galaxybook)
> @@ -1283,8 +1394,8 @@ static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *galaxybook)
>  	buf.gunm = GB_GUNM_ACPI_NOTIFY_ENABLE;
>  	buf.guds[0] = GB_GUDS_ACPI_NOTIFY_ENABLE;
>  
> -	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS,
> -				      &buf, GB_SAWB_LEN_SETTINGS);
> +	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_SETTINGS, &buf,
> +				      GB_SAWB_LEN_SETTINGS);
>  }
>  
>  static void galaxybook_acpi_remove_notify_handler(void *data)
> @@ -1300,7 +1411,8 @@ static void galaxybook_acpi_disable(void *data)
>  	struct samsung_galaxybook *galaxybook = data;
>  
>  	acpi_execute_simple_method(galaxybook->acpi->handle,
> -				   GB_ACPI_METHOD_ENABLE, GB_ACPI_METHOD_ENABLE_OFF);
> +				   GB_ACPI_METHOD_ENABLE,
> +				   GB_ACPI_METHOD_ENABLE_OFF);
>  }
>  
>  static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
> @@ -1308,7 +1420,8 @@ static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
>  	acpi_status status;
>  	int err;
>  
> -	status = acpi_execute_simple_method(galaxybook->acpi->handle, GB_ACPI_METHOD_ENABLE,
> +	status = acpi_execute_simple_method(galaxybook->acpi->handle,
> +					    GB_ACPI_METHOD_ENABLE,
>  					    GB_ACPI_METHOD_ENABLE_ON);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
> @@ -1317,21 +1430,26 @@ static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
>  	if (err)
>  		return err;
>  
> -	status = acpi_install_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
> -					     galaxybook_acpi_notify, galaxybook);
> +	status = acpi_install_notify_handler(galaxybook->acpi->handle,
> +					     ACPI_ALL_NOTIFY,
> +					     galaxybook_acpi_notify,
> +					     galaxybook);
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
>  	err = devm_add_action_or_reset(&galaxybook->platform->dev,
> -				       galaxybook_acpi_remove_notify_handler, galaxybook);
> +				       galaxybook_acpi_remove_notify_handler,
> +				       galaxybook);
>  	if (err)
>  		return err;
>  
>  	err = galaxybook_enable_acpi_notify(galaxybook);
>  	if (err)
> -		dev_dbg(&galaxybook->platform->dev, "failed to enable ACPI notifications; "
> +		dev_dbg(&galaxybook->platform->dev,
> +			"failed to enable ACPI notifications; "
>  			"some hotkeys will not be supported\n");
>  
> -	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANAGEMENT);
> +	err = galaxybook_enable_acpi_feature(galaxybook,
> +					     GB_SASB_POWER_MANAGEMENT);
>  	if (err)
>  		dev_dbg(&galaxybook->platform->dev,
>  			"failed to initialize ACPI power management features; "
> @@ -1382,8 +1500,9 @@ static int galaxybook_probe(struct platform_device *pdev)
>  
>  	err = galaxybook_battery_threshold_init(galaxybook);
>  	if (err)
> -		return dev_err_probe(&galaxybook->platform->dev, err,
> -				     "failed to initialize battery threshold\n");
> +		return dev_err_probe(
> +			&galaxybook->platform->dev, err,
> +			"failed to initialize battery threshold\n");
>  
>  	err = galaxybook_kbd_backlight_init(galaxybook);
>  	if (!err)
> @@ -1394,8 +1513,15 @@ static int galaxybook_probe(struct platform_device *pdev)
>  
>  	err = galaxybook_fw_attrs_init(galaxybook);
>  	if (err)
> -		return dev_err_probe(&galaxybook->platform->dev, err,
> -				     "failed to initialize firmware-attributes\n");
> +		return dev_err_probe(
> +			&galaxybook->platform->dev, err,
> +			"failed to initialize firmware-attributes\n");
> +
> +	err = galaxybook_hotkey_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(
> +			&galaxybook->platform->dev, err,
> +			"failed to initialize hotkey input device\n");
>  
>  	err = galaxybook_i8042_filter_install(galaxybook);
>  	if (err)
> @@ -1406,12 +1532,8 @@ static int galaxybook_probe(struct platform_device *pdev)
>  }
>  
>  static const struct acpi_device_id galaxybook_device_ids[] = {
> -	{ "SAM0426" },
> -	{ "SAM0427" },
> -	{ "SAM0428" },
> -	{ "SAM0429" },
> -	{ "SAM0430" },
> -	{}
> +	{ "SAM0426" }, { "SAM0427" }, { "SAM0428" },
> +	{ "SAM0429" }, { "SAM0430" }, {}
>  };
>  MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);
>  
> 
