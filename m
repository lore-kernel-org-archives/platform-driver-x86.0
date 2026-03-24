Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CE43DDDC2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 13:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774358395; cv=none; b=pMWtKFZwkaAI2+fjC94nV1o7nFoAHb/9cSSozYLTEp+ghUNvqaWKnwGZtEogwk8BqP4jvXhxmr9cu+bfU8VKHa7FTn0udVqMDT9gfQ2fYCuL/OMpkcl3E597FdX1U7zC0S1COLlz6OIWkfL6ET94CLcz54UkglyQTS1nmVfT2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774358395; c=relaxed/simple;
	bh=MaTaNG5RL4DBGBaibc5tJft6HFKcdd4mhPZLmpwIdNk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bzq5L4lct/C9SR4FA2airXXsUPseJ52qLM3GfdThUwKXeL7xzVOlKdGec5Ihy+DKWefMUx4yYCaRgKJfl9Mx0ceLdV8kR9uq0UoQdLVxoD2GCP7XhF6PCRWJupIvmPl3xr+jw36TDi5YDSkgkIVfHyjR/5LccBYa++loMjuJ8Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBYKjlTf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBYKjlTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774358393; x=1805894393;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MaTaNG5RL4DBGBaibc5tJft6HFKcdd4mhPZLmpwIdNk=;
  b=fBYKjlTfMFw6o8CZW7rl2qR2D1Jznk7PT2tKEMERncQVN2c1h2Q+VEUa
   p9P+hVvotK7FVmZb/BqOgMwpetl0WqdwSnYDycoUibWAhjyu7fKjfeZfi
   mlAuoZisfcIazh0XcLo+qiNjZNnMVerDIq/BuN7gHtLQLk/6QohSMrX5P
   gPdiMQiPeQgtc5h+dVVkBCMC7WEE3o4oQXyy2cHuQvq7v3NaD5tRovurX
   H61DJkVq439W1qGmbsCduqItA3x0Kie+QegbXcrYWoaWLKbCAvdnIkGt4
   /+045KFSXCGI75vApyqSungApISZxkVTlwYwQPXM9rS1oiIPRmQBhI+ju
   w==;
X-CSE-ConnectionGUID: H+bbeUocRjarFrIXyl1pnQ==
X-CSE-MsgGUID: 46v42vEtSVWCAlo49FByQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75279288"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75279288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:19:53 -0700
X-CSE-ConnectionGUID: 8d3McPvDRAKjeF62SZKfrw==
X-CSE-MsgGUID: pRcgmYYoSrGZfU0mbQjLLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254830620"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.217])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 06:19:51 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Mar 2026 15:19:48 +0200 (EET)
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
cc: ayaanmirza788@gmail.com, josh@joshuagrisham.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: samsung-galaxybook: Handle ACPI hotkey
 notifications
In-Reply-To: <20260318054242.24747-1-ayaanmirzabaig85@gmail.com>
Message-ID: <8e55cf70-5147-849a-ad5c-24a32727e620@linux.intel.com>
References: <44912fc0-91fb-0a85-64fa-1b0b3661f0d8@linux.intel.com> <20260318054242.24747-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 18 Mar 2026, Ayaan Mirza Baig wrote:

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
>  drivers/platform/x86/samsung-galaxybook.c | 47 +++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
> index 755cb82bdb60..f6770ede62d2 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -54,6 +54,7 @@ struct samsung_galaxybook {
>  
>  	struct work_struct block_recording_hotkey_work;
>  	struct input_dev *camera_lens_cover_switch;
> +	struct input_dev *hotkey_dev;
>  
>  	struct acpi_battery_hook battery_hook;
>  
> @@ -197,6 +198,9 @@ static const guid_t performance_mode_guid =
>  #define GB_ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
>  #define GB_ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
>  #define GB_ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +#define GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT  	0x7d
> +#define GB_ACPI_NOTIFY_HOTKEY_CAMERA         	0x6f
> +#define GB_ACPI_NOTIFY_HOTKEY_MICMUTE        	0x6e

These are using tabs after space for alignment which is not allowed.

>  #define GB_KEY_KBD_BACKLIGHT_KEYDOWN    0x2c
>  #define GB_KEY_KBD_BACKLIGHT_KEYUP      0xac
> @@ -1223,6 +1227,22 @@ static void galaxybook_i8042_filter_remove(void *data)
>  	cancel_work_sync(&galaxybook->block_recording_hotkey_work);
>  }
>  
> +static int galaxybook_hotkey_init(struct samsung_galaxybook *galaxybook)
> +{
> +	galaxybook->hotkey_dev = devm_input_allocate_device(&galaxybook->platform->dev);
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
> +}
> +
>  static int galaxybook_i8042_filter_install(struct samsung_galaxybook *galaxybook)
>  {
>  	int err;
> @@ -1260,6 +1280,28 @@ static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void *data)
>  		if (galaxybook->has_performance_mode)
>  			platform_profile_cycle();
>  		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_KBD_BACKLIGHT:
> +		if (galaxybook->has_kbd_backlight)
> +			schedule_work(&galaxybook->kbd_backlight_hotkey_work);
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_MICMUTE:
> +		if (galaxybook->hotkey_dev) {
> +			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 1);
> +			input_sync(galaxybook->hotkey_dev);
> +			input_report_key(galaxybook->hotkey_dev, KEY_MICMUTE, 0);
> +			input_sync(galaxybook->hotkey_dev);
> +		}
> +		break;
> +	case GB_ACPI_NOTIFY_HOTKEY_CAMERA:
> +		if (galaxybook->has_block_recording)
> +			schedule_work(&galaxybook->block_recording_hotkey_work);
> +		else if (galaxybook->hotkey_dev) {

Please always use balanced braces with "else" constructs so with a 
multiline block, both need to be using braces.

> +			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 1);
> +			input_sync(galaxybook->hotkey_dev);
> +			input_report_key(galaxybook->hotkey_dev, KEY_CAMERA, 0);
> +			input_sync(galaxybook->hotkey_dev);
> +		}
> +		break;
>  	default:
>  		dev_warn(&galaxybook->platform->dev,
>  			 "unknown ACPI notification event: 0x%x\n", event);
> @@ -1397,6 +1439,11 @@ static int galaxybook_probe(struct platform_device *pdev)
>  		return dev_err_probe(&galaxybook->platform->dev, err,
>  				     "failed to initialize firmware-attributes\n");
>  
> +	err = galaxybook_hotkey_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +					 "failed to initialize hotkey input device\n");
> +
>  	err = galaxybook_i8042_filter_install(galaxybook);
>  	if (err)
>  		return dev_err_probe(&galaxybook->platform->dev, err,
> 

-- 
 i.

