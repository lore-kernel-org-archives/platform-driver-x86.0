Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B431B4F1F
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082465; cv=none; b=mN/vH5QN0Z7zFpmAYAMZCgbQIAShe7s79oRGkCpwA1+cU3YIgQ/Rtg1w1mXpIHhjKMTz3nFl8WZvpqfb5A0G+u8A4pdsZLqPoLM534Q11tac475iTCHkECogWSii5xKTKZ5TkTGmF2IrhsZoKhAIzvKsGQM2k3mJ7xfyxX4p0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082465; c=relaxed/simple;
	bh=/SBqgkhGVOqe7d4Lo1OX2JG0qMgJNLKM/qMt32vlq5M=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FzYThIY7jFI52Ky7288cj/cQ65T5l9y3CZUMUnqTglRLNQqLCravhrfRxCSCeiWC0mry77O4hYXG5pA14FMjdyf1LrbqBkL2eALYTz6KEGPkasa2NnQGeJFjJMrME8AH52NzBSwasK6W+igD78CDrIPzkVYobSLBhNqqZf4s0ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fN8zsJ6P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fN8zsJ6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783082464; x=1814618464;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=/SBqgkhGVOqe7d4Lo1OX2JG0qMgJNLKM/qMt32vlq5M=;
  b=fN8zsJ6PYMcXNajFyM2PLwZIjTdQkpJhSWn5oMejeFC34Lm8FB6CQ4Nb
   4Bkusqvz8Ku9p8WRWccekr/4odw+VLCDpVhnqngLqR0hzpC61rFbfoKZF
   Uv2N1ABO7O2LPflFz241ZzvVDfqkWj4QDNFoI5qyYK0AACgExvhcqlr25
   cyfbv9lyWsktacYj3/tbOwfvzjxxxcrC0sPcBeuHqOVn+NdQJPCm0u7hA
   wfqpanTiCgnxOcnIJvV3zhDz3PjnA25/mW6DpWpqjx3y1/E/UcNl/F91q
   41EWv1x9Yx3ixlUOyvOyTgyCpBRkwDlkbivhfz2GUOzAGEkdlIPG98aCc
   g==;
X-CSE-ConnectionGUID: ZdAKt6M2TwO4Fn53XacZhw==
X-CSE-MsgGUID: elbtaCgJThu6hjMmRTJXTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95212822"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="95212822"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:41:04 -0700
X-CSE-ConnectionGUID: oK9hRlknTu2ZJ8JWuhN9tA==
X-CSE-MsgGUID: wh1l6opZRUeAMZxxTZzhUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="253764161"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:41:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 15:40:58 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] hp-wmi: add battery threshold support
In-Reply-To: <20260609101050.50262-1-yahia.a.abdrabou@gmail.com>
Message-ID: <6b94a592-9cdc-b9f7-1998-ade4493661a4@linux.intel.com>
References: <5459a3d7-976a-dbb7-0ca9-540efafe93bd@linux.intel.com> <20260609101050.50262-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Jun 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> Hello, Ilpo
> 
> Rebased the code to the for-next branch and Removed
> unused definitions and changed the style to match
> your earlier comments, Also wanted to query whether
> this feature should be accessible via a sysfs interface
> or by a parameter
> 
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
> v4:
> - Remove redundant definitions
> - Rebase the code
> v3:
> - Fix coding style errors and warning
> - Refine the changelogs for clarity
> 
> v2:
> - Simplify detection logic via battery_get
> - Add Battery Profiles enum table
> - Add functions to set the battery mode
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 48292cc02ee2..369db41ab0bd 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -292,6 +292,17 @@ enum hp_wmi_event_ids {
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
>  };
>  
> +/*
> + * Profiles for hp battery threshold profile 0x05 and 0x06 map to 4 and 5 respectively
> + */
> +enum hp_battery_modes {
> +	HP_BATTERY_MODE_NORMAL    = 0x00,
> +	HP_BATTERY_MODE_ADAPTIVE  = 0x02,
> +	HP_BATTERY_THRESHOLD_80   = 0x05,
> +	HP_BATTERY_THRESHOLD_50   = 0x06,
> +};
> +
> +#define HPWMI_AC_REQUIRED 0x35
>  /*
>   * struct bios_args buffer is dynamically allocated.  New WMI command types
>   * were introduced that exceeds 128-byte data size.  Changes to handle
> @@ -448,6 +459,7 @@ static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
> +static bool battery_threshold_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -1085,6 +1097,60 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static int battery_get(void)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int mode = -1;

No need to initialize this after changes I suggested below.

> +
> +	if (ACPI_SUCCESS(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output))) {

Reverse the logic and return error immediately on failure.

> +		union acpi_object *obj = (union acpi_object *)output.pointer;

Please use __free().

> +
> +		if (obj && obj->type == ACPI_TYPE_PACKAGE && /* standard package sent by bios */

And how does that comment help the code reader to understand the code 
better? Please drop it.

> +				obj->package.count >= 3) {

This is misaligned.

Also here, reverse logic so you can return error immediately.

> +			 /* bios returns the result in the third buffer */

That's what the code tells us as well, no need to such comments that add 
no value over what can be easily read from the code itself.

Usually, only comment tricky and unexpected things and rely on developers 
being aware of trivialities like this.

(Another thing that often needs comments is locking.)

> +			mode = (int)obj->package.elements[2].buffer.pointer[0];
> +		}
> +		kfree(output.pointer);
> +	} else {
> +		mode = -EIO;
> +	}
> +	return mode;
> +}
> +
> +static int battery_set(int profile)
> +{
> +	union acpi_object args[4];
> +	acpi_status status;
> +	struct acpi_object_list arg_list = { .count = 4, .pointer = args };
> +
> +	if (!battery_threshold_support) {
> +		pr_err("Battery threshold is not supported");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	memset(args, 0, sizeof(args));
> +	args[0].type = ACPI_TYPE_INTEGER;
> +	args[0].integer.value = 0;
> +	args[1].type = ACPI_TYPE_INTEGER;
> +	args[1].integer.value = profile;
> +	args[2].type = ACPI_TYPE_INTEGER; /* padding required by bios */
> +	args[2].integer.value = 0;
> +	args[3].type = ACPI_TYPE_INTEGER;
> +	args[3].integer.value = 0;
> +	status = acpi_evaluate_object(NULL, "\\_SB.WMID.SBCO", &arg_list, NULL);
> +
> +	if (unlikely(status == HPWMI_AC_REQUIRED)) {
> +		 /* edge case in the bios */
> +		pr_err("You have to be plugged in while setting a battery profile");
> +		return -EIO;
> +	}
> +	if (ACPI_FAILURE(status)) {
> +		pr_info("Write failed with Error code 0x%08x\n", status);

This won't be helpful for a normnal user, either lower to debug level or 
drop.

> +		return -EIO;
> +	}

Put this error handling first and don't leave an empty line between call 
and its error handling.

> +	return status;
> +}
> +
>  static int camera_shutter_input_setup(void)
>  {
>  	int err;
> @@ -2292,6 +2358,10 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  	if (err < 0)
>  		return err;
>  
> +	int ret = battery_get();

You're not allowed to declare variables mid-function/block unless it is 
for using __free() (for which the reasonale is explained in cleanup.h).

There seems already be err variable so I'll not accept adding "ret" 
alongside it.

I personally refer using "ret" because it doesn't carry connotation 
about "error" "err" does but if you want to use "ret" instead, a separate 
rename variable patch is required and the naming should be relatively 
uniform within a driver.

> +

Remove this blank line.

> +	if (ret >= 0)
> +		battery_threshold_support = true;
>  	thermal_profile_setup(device);
>  
>  	return 0;
> 

-- 
 i.

