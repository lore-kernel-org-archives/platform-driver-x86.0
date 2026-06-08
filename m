Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B05331E827
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jun 2026 15:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780934236; cv=none; b=dmGln0wSetTUO1Y+Ztff7+H902s7Ix0E1v3DwPVUZIA6GBw0Qe8uxXHKTMv/C0r/H+7ITM9lOqkJ8ox5MmhjEorl+/YeecBHpJN+4Exeaz92WA/R2hXqDCEOtfDtrpwD33moJqdm0GxrDCJv8uCnxtYic7meLhzfDR9B5qPet+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780934236; c=relaxed/simple;
	bh=S2pPTbf22u2rqpbcz8FMSH0xeN0M7yvcB6hubVkOecg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nO+sv2+0VFr7sh9foCxP/w06xvA5M9tEqhjzoW3v55a5gDQMgfcCPAYiN+v0aKinmC/zdjap9VPbt97z9Et3sYrxvq+Q9crVP+/OLr9qPXwWll3TU4QQ3pE7+osKmjwIQauPBNzF+Iut3vEyg5m9nruEuAS4kPxj5zUgsDGFg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B/UidAPu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B/UidAPu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780934234; x=1812470234;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=S2pPTbf22u2rqpbcz8FMSH0xeN0M7yvcB6hubVkOecg=;
  b=B/UidAPud7aqAMJbbVTAbwHeRh4kZ17U+Pm2dGQxre8ARQUWbb7GOQ+3
   UQv/HmhtKoEG4YgsdWVp9uc+geCCQTNjrMeiEFMY9V67IWAUHlCD+sS64
   h8bXWvHX3DzoyDO4RbEVLnAfaLpYRvUaZdyGWlWVTcZZqTRF6W4f4+CQ8
   kIs/sXuwh43vBdXhHlZMZFPB5+IBgKyKrJGmCdK9qEjCbmlIz2uswxCOR
   ow94MJRUbGKeyHkULGQdzZuruXmvCqzEMWToelAwc4UdpKe6T+VmP8418
   VrVgNii6oj64ObvlurOTHW2bqbx7ALY+PiESIsVBl3K+P5gAbi0TeRcqw
   Q==;
X-CSE-ConnectionGUID: xG81xyEzSUK2xyN5Khl97g==
X-CSE-MsgGUID: OtG06hOOQVCvWmiN6nV30w==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81736575"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="81736575"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 08:57:14 -0700
X-CSE-ConnectionGUID: JDOQUa6HSE+WzUApTkePqA==
X-CSE-MsgGUID: dYnOtHBESYeG7bY2L787Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="242624014"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 08:57:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 18:57:08 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] hp-wmi: add battery threshold support
In-Reply-To: <20260608153613.38780-1-yahia.a.abdrabou@gmail.com>
Message-ID: <41309386-12fb-71bf-3ced-8377bf8aaa8b@linux.intel.com>
References: <0d81219b-7a0b-fe57-aa28-f36967e414c4@linux.intel.com> <20260608153613.38780-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Jun 2026, yahia wrote:

> Hello, Ilpo
> Thanks for your review,
> This V2 patch implements Battery threshold support via ACPI methods
> SBCO and GBCO,This Implementation adds battery_get function to retrieve
> the current battery threshold mode and use it to identify capabilities
> to simplify code instead of another function specifically for detection

As already stated, please write proper English sentences.

Anything you want to say that isn't part of the changelog should appear 
under --- line.

> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---

Missing version history.

>  drivers/platform/x86/hp/hp-wmi.c | 61 ++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f63bc00d9a9b..f2180b61b84e 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>

Eh?

> @@ -292,6 +293,18 @@ enum hp_wmi_event_ids {
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
>  };
>  
> +/*
> + * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
> + */
> +enum hp_battery_modes {
> +	HP_BATTERY_MODE_NORMAL = 0x00,
> +	HP_BATTERY_MODE_ADAPTIVE = 0x02,
> +	HP_BATTERY_THRESHOLD_4 = 0x05,
> +	HP_BATTERY_THRESHOLD_5 = 0x06,

The values should be aligned.

> +};
> +
> +#define HPWMI_BATTERY_THRESHOLD_SBCO 0x2B // SBCO Command id
> +#define HPWMI_AC_REQUIRED 0x35 // obscure edge case where the bios requires the user to be charged while setting a profile

???

>  /*
>   * struct bios_args buffer is dynamically allocated.  New WMI command types
>   * were introduced that exceeds 128-byte data size.  Changes to handle
> @@ -448,6 +461,7 @@ static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
> +static bool battery_threshold_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -1085,6 +1099,50 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static int battery_get(void) {
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int mode = -1;
> +	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {
> +		union acpi_object *obj = (union acpi_object *)output.pointer;
> +		if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count >= 3) { // standard package sent by bios
> +			mode = (int)obj->package.elements[2].buffer.pointer[0]; // bios returns the result in the third buffer 
> +		}
> +		kfree(output.pointer);
> +	} else 
> +		mode = -EIO;
> +	return mode;
> +}
> +
> +static int battery_set(int profile) 
> +{
> +	if (!battery_threshold_support) {
> +		pr_err("Battery threshold is not supported");
> +		return -EOPNOTSUPP;
> +	}
> +	union acpi_object args[4];
> +	acpi_status status;
> +	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
> +	memset(args, 0, sizeof(args));
> +	args[0].type = ACPI_TYPE_INTEGER;
> +	args[0].integer.value = 0;
> +	args[1].type = ACPI_TYPE_INTEGER;
> +	args[1].integer.value = profile;
> +	args[2].type = ACPI_TYPE_INTEGER; // padding required by bios
> +	args[2].integer.value = 0;
> +	args[3].type = ACPI_TYPE_INTEGER;
> +	args[3].integer.value = 0;
> +	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
> +	if (unlikely(status == HPWMI_AC_REQUIRED)) {
> +		pr_err("You have to be plugged in while setting a battery profile"); // random edge case in the bios
> +		return -EIO;
> +	}
> +	if (ACPI_FAILURE(status)) {
> +		pr_info("Write failed with Error code 0x%08x\n", status);
> +		return -EIO;
> +	}
> +	return status;
> +}
> +
>  static int camera_shutter_input_setup(void)
>  {
>  	int err;
> @@ -2292,6 +2350,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (err < 0)
>  		return err;
>  
> +	int ret = battery_get();
> +	if (ret >= 0)
> +		battery_threshold_support = true;
>  	thermal_profile_setup(device);
>  
>  	return 0;
> 

Unfortunately, this submission doesn't match kernel coding style 
guidelines you can find under Documentation/.

Please review the patch yourself before submitting the next version and correct 
all error you find before the submission.

-- 
 i.

