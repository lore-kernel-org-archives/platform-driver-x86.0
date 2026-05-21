Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D55348C47;
	Thu, 21 May 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779358178; cv=none; b=jHWOLXWfq5xm7QONt3gSZ1hSjpKp/gfI4moquqU1nWBzSJtS1pYCEyL2U3gukU0ks4blVb13ZQs3FNWHoWu4Rh9m2K3qqRhBvBbAo5ISNQhVSLbWrYOUuBih1LYIprPn82vjdy6GFApfEmrWi1A2FEIUaSGqfQ+LG/7fW50dRc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779358178; c=relaxed/simple;
	bh=Q+9PGL7/Cfzt2MXyqUB5YBEQaQ2j0QYxkhfLczCUFQw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SU4IJm+D/F9uU3RYxAO1PMEh3fu+G64YnH4ByI4bp83MbtYwFVlU1cecSr6HaIXdMS2G/A50COQRT7/lWWI0fEx1AGbBJY0WfuZf9WfG9XqA/nbNkQ3wX9+3/15nUY7qedRRfRyx/ERXI9Ewd83GhMTVnLYhzXQc4zs4qPQgPpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDFwSEuo; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDFwSEuo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779358177; x=1810894177;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Q+9PGL7/Cfzt2MXyqUB5YBEQaQ2j0QYxkhfLczCUFQw=;
  b=VDFwSEuoLSYaxnB0x2foIi/i9YkFASChnTsuL7faEW0cI8t2L3RHiGnz
   B9j+fQqzVRWKiOzBBV7qXoBP0s8ZLGEFeFyn47yv38OHthJX7E+SBmZCn
   U5UHwE1S/oY3Hc7q648XL6/+MxD5XpQSUbkOt5HZ6sPxOe+w3QjZ8u0u6
   LmJu+dn0Md2VYs2DPa6gAShxSUIP7q+DIpx3gE6sxctHlPWvX7yIXfgqR
   P7+sv7/pCTYeZhDnJNNJb5MoGHauAIOp9Xe8iTVq1nAAERfM2L3qCBzQ8
   /FFRxQmwOsZKVqSQ1sif1qPoeoFf6oTXTUhPBmJNS05miUjSa5l+pxU4/
   g==;
X-CSE-ConnectionGUID: lroqriyxQdS0lIH0wO2O1Q==
X-CSE-MsgGUID: VhN4FaR0Th2tGPjkJiaQhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80394168"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80394168"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:09:36 -0700
X-CSE-ConnectionGUID: 4L+FKBXqTGKWngKJ1pYIsw==
X-CSE-MsgGUID: 8exNSATPQmuAKd+n9Y0MDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="244774476"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 03:09:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 13:09:31 +0300 (EEST)
To: yoy95104 <yahia.a.abdrabou@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] platform/x86: hp-wmi: support profiles for HP Laptop
 15
In-Reply-To: <20260515220924.827294-1-yahia.a.abdrabou@gmail.com>
Message-ID: <6acffa40-cb68-04be-9d50-a202b238b383@linux.intel.com>
References: <20260515220924.827294-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 16 May 2026, yoy95104 wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>
> 
> Added board 8B2F to the victus_s_thermal_profile_boards table,
> although it is marketed as a notebook, as said in the hp app,

I don't think hp app has much relevance here.

> my testing confirms it utilizes the same underlying
> structure as other Victus models. In addition i added prt sc
> key and mapped it to event 0xb7 and assigned it to KEY_PRINT.

Please don't combine changes but make a patch series out of them, make 
only one logical (minimal) change per patch.

Write the changelog with imperative tone.

> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>
> ---
>  drivers/platform/x86/hp/hp-wmi.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 6950bec2a9d8..693031aa1f11 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -11,6 +11,7 @@
>   * Copyright (C) 2005 Dmitry Torokhov <dtor@mail.ru>
>   */
>  
> +#include <linux/input-event-codes.h>
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/acpi.h>
> @@ -36,6 +37,13 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> +#include <acpi/acpi_bus.h>
> +#include <acpi/acpi_drivers.h>
> +
> +#ifndef ACPI_AC_CLASS
> +#define ACPI_AC_CLASS "ac_adapter"
> +#endif
> +
>  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
>  MODULE_DESCRIPTION("HP laptop WMI driver");
>  MODULE_LICENSE("GPL");
> @@ -205,10 +213,6 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
>  		.driver_data = (void *)&victus_s_thermal_params,
>  	},
> -	{
> -		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BC2") },
> -		.driver_data = (void *)&omen_v1_thermal_params,
> -	},
>  	{
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
>  		.driver_data = (void *)&omen_v1_thermal_params,
> @@ -253,6 +257,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
>  		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
>  		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
>  	},
> +	{
> +		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8B2F") },
> +		.driver_data = (void *)&victus_s_thermal_params,
> +	},
>  	{},
>  };
>  
> @@ -407,6 +415,7 @@ struct bios_rfkill2_state {
>  static const struct key_entry hp_wmi_keymap[] = {
>  	{ KE_KEY, 0x02,    { KEY_BRIGHTNESSUP } },
>  	{ KE_KEY, 0x03,    { KEY_BRIGHTNESSDOWN } },
> +	{ KE_KEY, 0xb7,		{ KEY_PRINT } },
>  	{ KE_KEY, 0x270,   { KEY_MICMUTE } },
>  	{ KE_KEY, 0x20e6,  { KEY_PROG1 } },
>  	{ KE_KEY, 0x20e8,  { KEY_MEDIA } },
> @@ -1086,6 +1095,7 @@ static int camera_shutter_input_setup(void)
>  	int err;
>  
>  	camera_shutter_input_dev = input_allocate_device();
> +
>  	if (!camera_shutter_input_dev)
>  		return -ENOMEM;

There seem to be lots of unexplained and spurious changes in this?

Also, it makes changes that do not follow the usual conventions.

I'm intentionally vague here with my review as it's looks obvious you 
didn't properly review this change yourself before submitting it.
I suspect this patch comes directly from some tool/AI which you should 
have disclosed as per Documentation/process/generated-content.rst.

If you use such a tool, please carefully review its output whether the 
output makes sense or not compared with the intent of the change as 
stated in the changelog, before sending the patch towards us.

Also make sure the changes do not diverge from normal kernel coding style 
and surroundings you're touching (unless there's a very good reason for 
that you can point to as "why" you're diverging).

-- 
 i.

