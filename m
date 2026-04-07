Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E533EAE6;
	Tue,  7 Apr 2026 06:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775543987; cv=none; b=NChmlfpQsE8115IN3MVuSlSW8cqXhQWiVLDxkHMDbhAsxII+59HzN1uWvuXKuJJLIp3ZDtyJKOyK3iy6iY5RvqDiaTwos3x1oBYu6hFIoPqBV5OK/5znOU57PdVRleXvgGSijVbhhSkIzDYL30IcYjA1u5lP7W2dBTHFnm7yXCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775543987; c=relaxed/simple;
	bh=oAiMkGXqMucZZvKVZbqT1bRHBWi7VW/DCmDLnRqYoWs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Co0p6WJWjbBr6D1gjE3gtb84hjVgE/FdbzqNdjyZB4FPrTkf+s4eRG+gqyh8IA29KKjP1SB/RRSia+eO9OjObfg/H0sc5j2eJDItaoFNZddZFt2b3W07wzNJUsFDlJ6z+1zJdTAumdlRbBcB2VcuCdPADp8uFvZskvwv2inwb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oIr1tRs4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oIr1tRs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775543984; x=1807079984;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oAiMkGXqMucZZvKVZbqT1bRHBWi7VW/DCmDLnRqYoWs=;
  b=oIr1tRs47wvOyiuDkb1S3zcRIbH1qp4EBFOTcETA0uVuf031v3HKQpYO
   agkPwmj6zZqkR0d+nveP6f947057GEuogTkCfPrd1Y8MzpgNr9lX5YuDp
   64p9C6u6gIyfBecQl3bZMVUyfl2HVH/JzszS0Ttt04WkKVPJhNRq1YN0X
   MHoRz252SzsxZ+N7VVHc4yli6yUmSiw0qJ0lqIO3253NxmsTnziucoe1v
   hYzuv19y0p0UciSRqMwIwq5WthE9Zmp3T3puMxYwz6ifEjhP4aJYXbuTA
   DG+hpB1S7Zxs3jmmNjZ8kizgm+GP6AEH1mGG0u7/VIxNJqH4S5VtXrH2c
   w==;
X-CSE-ConnectionGUID: a8MCoo6AQRKgcamkzoqHcQ==
X-CSE-MsgGUID: sAEQmAyqRFmrWB1fU7yf8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99125212"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="99125212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:39:43 -0700
X-CSE-ConnectionGUID: 1CXTsxcATwWEEVsv9hA30Q==
X-CSE-MsgGUID: hCoEQx+zSR26IDuuD5EtOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228352637"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.110])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 23:39:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Apr 2026 09:39:37 +0300 (EEST)
To: Joshua Grisham <josh@joshuagrisham.com>
cc: ayaanmirzabaig85@gmail.com, ayaanmirza788@gmail.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Handle ACPI hotkey
 notifications
In-Reply-To: <20260403155620.14276-1-josh@joshuagrisham.com>
Message-ID: <c46938e0-02f0-22b1-1730-4ce87603667c@linux.intel.com>
References: <CAMF+KeaTRH2JGs53VSJ_WMFJQMBW4wDbCkW6u3=ySxkPknDvpQ@mail.gmail.com> <20260403155620.14276-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Apr 2026, Joshua Grisham wrote:

> From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> 
> On Samsung Galaxy Book 5 (SAM0430), the keyboard backlight, microphone
> mute, and camera block hotkeys do not generate i8042 scancodes.
> Instead they arrive as ACPI notifications 0x7d, 0x63, and 0x6f
> respectively, all of which previously fell through to the default
> "unknown" warning in galaxybook_acpi_notify().
> 
> This patch refactors the existing camera lens cover input device to a
> generic input device and adds handling for these three ACPI events:
> 
> - 0x7d (Fn+F9, keyboard backlight): schedule the existing
>   kbd_backlight_hotkey_work which cycles brightness.
> 
> - 0x6e (Fn+F10, microphone mute): emit KEY_MICMUTE to the driver's
>   input device.
> 
> - 0x6f (Fn+F11, camera block): if block_recording is active use the
>   existing block_recording_hotkey_work; otherwise emit a toggle of the
>   SW_CAMERA_LENS_COVER switch event to the driver's input device.
> 
> Tested on Samsung Galaxy Book 5 (SAM0430) and Samsung Galaxy Book2 Pro
> (SAM0429).
> 
> Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
> Co-developed-by: Joshua Grisham <josh@joshuagrisham.com>
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> 
> ---
> 
> v3->v4: Joshua's update to Ayaan's patch with the following changes:
> - refactor the camera lens cover input device to a generic input device

Hi,

Could you please do this in a two step series where you refactor the 
existing code first and add new stuff in a second patch on top of that.

-- 
 i.

> - use this input device for both existing camera lens cover switch and
>   the new KEY_MICMUTE event
> - toggle SW_CAMERA_LENS_COVER instead of emitting KEY_CAMERA event in
>   case device does not support block_recording
> - small comments and spacing tweaks
> ---
>  drivers/platform/x86/samsung-galaxybook.c | 89 ++++++++++++++++-------
>  1 file changed, 63 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 755cb82bdb60..360bfc1e52a9 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -35,6 +35,7 @@
>  struct samsung_galaxybook {
>  	struct platform_device *platform;
>  	struct acpi_device *acpi;
> +	struct input_dev *input;
>  
>  	struct device *fw_attrs_dev;
>  	struct kset *fw_attrs_kset;
> @@ -50,10 +51,9 @@ struct samsung_galaxybook {
>  	/* block in case brightness updated using hotkey and another thread */
>  	struct mutex kbd_backlight_lock;
>  
> -	void *i8042_filter_ptr;
> -
>  	struct work_struct block_recording_hotkey_work;
> -	struct input_dev *camera_lens_cover_switch;
> +
> +	void *i8042_filter_ptr;
>  
>  	struct acpi_battery_hook battery_hook;
>  
> @@ -198,12 +198,19 @@ static const guid_t performance_mode_guid =
>  #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
>  #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
>  
> +/* ACPI hotkey notifications for devices with SAM0430 or higher */
> +#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  0x7d
> +#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         0x6f
> +#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        0x6e
> +
> +/* Keyboard hotkey notifications for devices prior to SAM0430 */
>  #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
>  #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
>  #define GB_KEY_BLOCK_RECORDING_KEYDOWN  0x1f
>  #define GB_KEY_BLOCK_RECORDING_KEYUP    0x9f
> -#define GB_KEY_BATTERY_NOTIFY_KEYUP     0xf
> -#define GB_KEY_BATTERY_NOTIFY_KEYDOWN   0x8f
> +
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP    0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN  0x8f
>  
>  /*
>   * Optional features which have been determined as not supported on a particular
> @@ -859,9 +866,9 @@ static int block_recording_acpi_set(struct samsung_galaxybook *galaxybook, const
>  	if (err)
>  		return err;
>  
> -	input_report_switch(galaxybook->camera_lens_cover_switch,
> -			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
> -	input_sync(galaxybook->camera_lens_cover_switch);
> +	input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
> +			    value ? 1 : 0);
> +	input_sync(galaxybook->input);
>  
>  	return 0;
>  }
> @@ -887,24 +894,9 @@ static int galaxybook_block_recording_init(struct samsung_galaxybook *galaxybook
>  		return GB_NOT_SUPPORTED;
>  	}
>  
> -	galaxybook->camera_lens_cover_switch =
> -		devm_input_allocate_device(&galaxybook->platform->dev);
> -	if (!galaxybook->camera_lens_cover_switch)
> -		return -ENOMEM;
> -
> -	galaxybook->camera_lens_cover_switch->name = "Samsung Galaxy Book Camera Lens Cover";
> -	galaxybook->camera_lens_cover_switch->phys = DRIVER_NAME "/input0";
> -	galaxybook->camera_lens_cover_switch->id.bustype = BUS_HOST;
> -
> -	input_set_capability(galaxybook->camera_lens_cover_switch, EV_SW, SW_CAMERA_LENS_COVER);
> -
> -	err = input_register_device(galaxybook->camera_lens_cover_switch);
> -	if (err)
> -		return err;
> -
> -	input_report_switch(galaxybook->camera_lens_cover_switch,
> -			    SW_CAMERA_LENS_COVER, value ? 1 : 0);
> -	input_sync(galaxybook->camera_lens_cover_switch);
> +	input_report_switch(galaxybook->input, SW_CAMERA_LENS_COVER,
> +			    value ? 1 : 0);
> +	input_sync(galaxybook->input);
>  
>  	return 0;
>  }
> @@ -1120,6 +1112,23 @@ static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybook)
>   * Hotkeys and notifications
>   */
>  
> +static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
> +{
> +	galaxybook->input =
> +		devm_input_allocate_device(&galaxybook->platform->dev);
> +	if (!galaxybook->input)
> +		return -ENOMEM;
> +
> +	galaxybook->input->name = "Samsung Galaxy Book Extra Inputs";
> +	galaxybook->input->phys = DRIVER_NAME "/input0";
> +	galaxybook->input->id.bustype = BUS_HOST;
> +
> +	input_set_capability(galaxybook->input, EV_KEY, KEY_MICMUTE);
> +	input_set_capability(galaxybook->input, EV_SW, SW_CAMERA_LENS_COVER);
> +
> +	return input_register_device(galaxybook->input);
> +}
> +
>  static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *work)
>  {
>  	struct samsung_galaxybook *galaxybook =
> @@ -1260,6 +1269,29 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		if (galaxybook->has_performance_mode)
>  			platform_profile_cycle();
>  		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
> +		if (galaxybook->has_kbd_backlight)
> +			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
> +		input_report_key(galaxybook->input, KEY_MICMUTE, 1);
> +		input_sync(galaxybook->input);
> +		input_report_key(galaxybook->input, KEY_MICMUTE, 0);
> +		input_sync(galaxybook->input);
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
> +		if (galaxybook->has_block_recording) {
> +			schedule_work(&galaxybook->block_recording_hotkey_work);
> +		} else {
> +			/* toggle switch on+off; actual state is unknown */
> +			input_report_switch(galaxybook->input,
> +					    SW_CAMERA_LENS_COVER, 1);
> +			input_sync(galaxybook->input);
> +			input_report_switch(galaxybook->input,
> +					    SW_CAMERA_LENS_COVER, 0);
> +			input_sync(galaxybook->input);
> +		}
> +		break;
>  	default:
>  		dev_warn(&galaxybook->platform->dev,
>  			 "unknown ACPI notification event: 0x%x\n", event);
> @@ -1360,6 +1392,11 @@ static int galaxybook_probe(struct platform_device *pdev)
>  	galaxybook->platform = pdev;
>  	galaxybook->acpi = adev;
>  
> +	err = galaxybook_input_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize input device\n");
> +
>  	/*
>  	 * Features must be enabled and initialized in the following order to
>  	 * avoid failures seen on certain devices:
> 
