Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8F83B52EA
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783324514; cv=none; b=SFOSu6XZQLLeL30oS6QPS/A6OOTV96y9Jn5DECdPTCQxO9idLXD63o/oe+iXfz9BY/kiQBRoSMESZgymM4LaVjGpMnYkXiNlRVtyj+xt74jz5oD7L4R/TwRrlZcBGOhQaR1rTZUKsf4co8DewTQ/U8mSGlX+FIGG4Q6oejZzsbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783324514; c=relaxed/simple;
	bh=gyFp3xhZ+Ul0dJLS1iaLgXmRN/9TGLmOKU5JBNODHIs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pOIsLKEgHlmBpIBhoV1InKr7iA4nYTp+xk/tWY53HZslTVdN7vf+rbY+zE2BxhM9vqmu2kjcCHXMEhIIuxLCGSnYWVrmWhl7Pn9zjohFqOUfwLE7qWBJBxSc/SoetGQQvHMN20ggbfY4WXBHUj22hefMzDU79+q6MLG7mkZuns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVBvIhQc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVBvIhQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783324508; x=1814860508;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=gyFp3xhZ+Ul0dJLS1iaLgXmRN/9TGLmOKU5JBNODHIs=;
  b=aVBvIhQccNASXuJobY0Pm34Dix6qyJYQuOLiu3LVWe2dOOImu7AsSujr
   5ndpJEY8vkG5hIgQxbm3TyaoQX+5ARZmHRo+CNbicxEVNX++LI6mtn5Ou
   5zp+5MFwXkaXdf+70xnUGzgqdbclTWTWBotBUTCZ6Se4dcEEYYtNIxA6A
   n5GJvm7p8OcSKZSzBrShRzMACHzyR22dm5QRA18/KHSV4LAQ6totREN45
   kDTMagYuLbxsrQQDXRiSM4FapvgXE1/fBJ7i0w0yN+3u3cqEbPvl3msiC
   QOnO0O/1D2W6zpQnFhmXBULyC6eWXdsXMPudSfHmaFsdgRupBiJ0PGpjQ
   A==;
X-CSE-ConnectionGUID: KCNaMIT9TBSkyPdxXihBVw==
X-CSE-MsgGUID: sGlRQIDfRnanTsmLdm9ZKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83981609"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83981609"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 00:55:05 -0700
X-CSE-ConnectionGUID: xYt+m/cUT8iiCOFx2MWIUA==
X-CSE-MsgGUID: c4L293mYTB+/v/WAS0waSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="250284323"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.95])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 00:55:03 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 Jul 2026 10:54:59 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v5] hp-wmi: add battery threshold support
In-Reply-To: <20260703163207.37515-1-yahia.a.abdrabou@gmail.com>
Message-ID: <4792e5f8-8af3-f227-2291-ccd10e1be868@linux.intel.com>
References: <6b94a592-9cdc-b9f7-1998-ade4493661a4@linux.intel.com> <20260703163207.37515-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Jul 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> Introduce battery threshold support via SBCO and
> GBCO WMI methods, add battery_get function to retrieve

All function names in changelog text should include ().

> the current battery mode and to test compatibility, add
> battery_set function to set a battery mode with any
> value between 0 and 5, anything larger creates a crash
> or creates a softbrick of the laptop that requires AC
> power to boot.

Please reflow to 72 chars.

> 
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
> v5:
> - Use hp_wmi_perform_query for battery_set
> - Remove mode 6 as it requires AC power to boot
> - Fix styling errors and remove redundant comments
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
>  drivers/platform/x86/hp/hp-wmi.c | 50 +++++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 8ba286ed8721..bf25acf45b02 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -302,8 +302,16 @@ enum hp_wmi_event_ids {
>  	HPWMI_FN_P_HOTKEY		= 0x1B,
>  	HPWMI_OMEN_KEY			= 0x1D,
>  	HPWMI_SMART_EXPERIENCE_APP	= 0x21,
> +	HPWMI_BATTERY_CONTROL		= 0x2b,
>  };
>  
> +enum hp_battery_modes {
> +	HP_BATTERY_MODE_NORMAL    = 0x00,
> +	HP_BATTERY_MODE_ADAPTIVE  = 0x02,
> +	HP_BATTERY_THRESHOLD_80   = 0x05,
> +};
> +
> +#define HPWMI_AC_REQUIRED 0x35
>  /*
>   * struct bios_args buffer is dynamically allocated.  New WMI command types
>   * were introduced that exceeds 128-byte data size.  Changes to handle
> @@ -460,6 +468,7 @@ static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
> +static bool battery_threshold_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -1097,6 +1106,43 @@ static ssize_t postcode_store(struct device *dev, struct device_attribute *attr,
>  	return count;
>  }
>  
> +static int battery_get(void)
> +{
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	int mode;
> +
> +	if (ACPI_FAILURE(acpi_evaluate_object(NULL, "\\_SB.WMID.GBCO", NULL, &output)))
> +		return -EIO;
> +	union acpi_object *obj __free(kfree) = (union acpi_object *)output.pointer;
> +
> +	if (!obj || obj->type != ACPI_TYPE_PACKAGE || obj->package.count < 3)
> +		return -EIO;

The logic flow is now better but the blank line is in wrong place. The 
!obj etc check should immediately follow the assignment as it's kind of 
"error check" for it.

I suggest placing blank line instead before obj declaration.

> +	mode = (int)obj->package.elements[2].buffer.pointer[0];
> +	return mode;
> +}
> +
> +static int battery_set(u8 profile)

There are no callers for this function???

This patch also in general has the feel it is missing something.

> +{
> +	u8 data[4];
> +	int status;
> +
> +	if (!battery_threshold_support) {
> +		pr_err("Battery threshold is not supported");

This lacks \n.

BUT, what info does this offer beyond the function already returning 
-EOPNOTSUPP which alone tells very much the same thing? I suggest dropping 
it.

> +		return -EOPNOTSUPP;
> +	}
> +	memset(&data, 0, sizeof(data));
> +	data[1] = profile;


Nothing checked the value so using this function can result in 
crash/softbrick (as per your changelog text)??

> +	status = hp_wmi_perform_query(HPWMI_BATTERY_CONTROL, HPWMI_WRITE, &data, sizeof(data), 0);
> +
> +	if (status < 0)

There shouldn't be blank line between call and its error handling.

> +		return -EIO;
> +	if (status == HPWMI_AC_REQUIRED) {
> +		pr_err("You have to be plugged in to set a profile");

\n missing here as well.

> +		return -EIO;
> +	}
> +	return status;
> +}
> +
>  static int camera_shutter_input_setup(void)
>  {
>  	int err;
> @@ -2303,7 +2349,9 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  
>  	if (err < 0)
>  		return err;
> -
> +	err = battery_get();
> +	if (err >= 0)
> +		battery_threshold_support = true;
>  	thermal_profile_setup(device);
>  
>  	return 0;
> 

-- 
 i.

