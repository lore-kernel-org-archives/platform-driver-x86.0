Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5F32B113;
	Mon, 28 Sep 2026 15:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610580; cv=none; b=XX+tIXkm1Oyfz9tgGneRN4VYKIE+ARBcUHZj/AGS35q6omgi87rxWCfIBmDYFime5r+YkVzlhq0Iqh8qOVLwkR/QSYVuzAlA3jQxfSkL91KmXlP+5YUpIIUtiEPst+GfSV4DjpzWAbrMO8sFb6wuzexn4ddMYizrV+VFU29AFsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610580; c=relaxed/simple;
	bh=2M6lmgor+nmSnlHzPQZtmx93kmR8PSoUoJE/yeReAHg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YsvrbTjsbsvyv4KvCoBejjYK1lwZrQ6PA1q0qiWDtt6a4+98R8Odg4EbcQciYrBROJvqeyJB9Da7SUMg0jVEMNv0SbxFf7Yz4Q7racXfeGLrU3aUMpiCWGJHkBhFqNYAIS1YC2rEH79gMP+gnKHW44SxO/3Tf8tmiwWIZCZvhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrYuJtVS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrYuJtVS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790610578; x=1822146578;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2M6lmgor+nmSnlHzPQZtmx93kmR8PSoUoJE/yeReAHg=;
  b=WrYuJtVSadiR0sMl+Q5cfC2+KPD7zVP3uFRjRD+9LZPkRAAkqp1GAFxa
   nfr40pU4F3pV8cVhydgeyj8GXAbXm4F0t2Z4zQRg021yFhbnkyrgQ8ZPe
   PNQMUtiBUOYvg/zpH604dzOZWIbefMcI3bNs2CfCEfxXw//yglwkWqccF
   W8Q3RshF34ectJg4Y0h/RoX8KgGq9hhI89nep8MKDCr1Zz0UvHckRV9l9
   gNgKlcmrV6L2HPEki0gVW109QjbHfN19rwQcmIxeZPH9kn04PCiQzQm0N
   2VnPQbMO6AOBmp95XcvGF81PGNOoAlTjgbrselviTK+SzIs/USfUTiOTg
   g==;
X-CSE-ConnectionGUID: H3hz7Z4YQ8WLqRaccfBy8Q==
X-CSE-MsgGUID: /t7w7EFaTfGckcgoXtWJCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="101972449"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="101972449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:49:38 -0700
X-CSE-ConnectionGUID: 3XNGWEx9RbC/bSY8CuWruQ==
X-CSE-MsgGUID: xvqCOagCS8ivW7wvEf6HiA==
X-ExtLoop1: 1
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.109])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:49:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 28 Sep 2026 18:49:31 +0300 (EEST)
To: Chris Taraszka <chris@miget.com>, 
    TuteMthCD <matias.civadda2342001@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14
 platform profile values
In-Reply-To: <20260928153902.139956-1-chris@miget.com>
Message-ID: <5430348c-8ff3-c31a-927f-321b2cf94883@linux.intel.com>
References: <20260928153902.139956-1-chris@miget.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, Chris Taraszka wrote:

> The Xiaomi Book Pro 14 firmware (BIOS XMAPT4B0P0909) implements
> SystemPerMode with its own values. Its WMAA SET handler only acts on
> 0x02-0x0a and silently ignores 0 and 1, and GET returns one of 0x02,
> 0x03, 0x04, 0x09 or 0x0a. With the generic values:
> 
>  - balanced (0) and balanced-performance (1) are no-ops,
>  - performance (3) selects the firmware's balanced mode,
>  - reading the profile fails with -EINVAL whenever the firmware is in
>    0x04, 0x09 or 0x0a, which it often is after boot. The failed read also
>    makes bitland_mifs_wmi_suspend() abort system suspend.
> 
> The values were identified from the WMAA method in the firmware's SSDT
> and by setting each one through WMAA on AC and reading the resulting
> sustained package power limit from intel-rapl-mmio:
> 
>   0x02  18 W  (quiet)
>   0x03  37 W  (balanced)
>   0x09  45 W
>   0x04  58 W  (performance)
>   0x0a  18 W
> 
> Map low-power, balanced, balanced-performance and performance to 0x02,
> 0x03, 0x09 and 0x04 on this model. The driver never sets 0x0a, which is
> only reached through the firmware's own mode cycling, so report it as
> low-power.
> 
> Cc: Armin Wolf <W_Armin@gmx.de>
> Cc: Mingyou Chen <qby140326@gmail.com>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
> 
> Notes:
>     Tested on the Xiaomi Book Pro 14 on AC with bitland-mifs-wmi from pdx86
>     for-next plus this patch, loaded on v7.3-rc5: all four profiles apply
>     through power-profiles-daemon and the firmware mode and PL1 follow
>     (0x03/37 W, 0x02/25 W, 0x04/56 W). The same mapping on v7.3-rc4/rc5
>     without the for-next changes was also tested on battery and across
>     s2idle suspend/resume, with the profile restored on resume.
>     
>     This explains the -EINVAL behind my earlier "platform/x86:
>     bitland-mifs-wmi: Don't abort suspend when platform profile access
>     fails" (sent 2026-09-11): the profile read failed because of the unknown
>     mode values. That patch is still useful as a safety net.
>     
>     Note that on for-next each profile change still reports -ENOMSG even
>     though the firmware applies it: this firmware's SET handlers leave the
>     function id in the response at 0, which 23cc56f6dea6 ("platform/x86:
>     bitland-mifs-wmi: Detect failed function calls") rejects. I'll send a
>     separate fix for that.
> 
>  drivers/platform/x86/bitland-mifs-wmi.c | 56 +++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index dd1648b7de77..4a8e5b4e7853 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -14,6 +14,7 @@
>  #include <linux/dev_printk.h>
>  #include <linux/device.h>
>  #include <linux/device/devres.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/hwmon.h>
>  #include <linux/init.h>
> @@ -79,6 +80,29 @@ enum bitland_mifs_power_profile {
>  	WMI_PP_FULL_SPEED	= 3,
>  };
>  
> +/*
> + * The Xiaomi Book Pro 14 firmware uses its own SystemPerMode values and
> + * ignores the ones above. Sustained package power limits (PL1) measured
> + * on AC are noted next to each mode.
> + */
> +enum bitland_mifs_xiaomi_power_profile {
> +	WMI_PP_XIAOMI_QUIET		= 0x02,	/* 18 W */
> +	WMI_PP_XIAOMI_BALANCED		= 0x03,	/* 37 W */
> +	WMI_PP_XIAOMI_PERFORMANCE	= 0x04,	/* 58 W */
> +	WMI_PP_XIAOMI_SMART		= 0x09,	/* 45 W */
> +	WMI_PP_XIAOMI_QUIET_ALT		= 0x0a,	/* 18 W */
> +};
> +
> +static const struct dmi_system_id bitland_mifs_xiaomi_pp_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Xiaomi Book Pro 14"),
> +		},
> +	},
> +	{ }
> +};
> +
>  enum bitland_mifs_event_id {
>  	WMI_EVENT_RESERVED_1		= 1,
>  	WMI_EVENT_RESERVED_2		= 2,
> @@ -161,6 +185,7 @@ struct bitland_mifs_wmi_data {
>  	struct device *hwmon_dev;
>  	struct device *pp_dev;
>  	enum platform_profile_option saved_profile;
> +	bool xiaomi_pp;
>  };
>  
>  static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> @@ -213,6 +238,27 @@ static int laptop_profile_get(struct device *dev,
>  	if (ret)
>  		return ret;
>  
> +	if (data->xiaomi_pp) {
> +		switch (result.data[0]) {
> +		case WMI_PP_XIAOMI_QUIET:
> +		case WMI_PP_XIAOMI_QUIET_ALT:
> +			*profile = PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +		case WMI_PP_XIAOMI_BALANCED:
> +			*profile = PLATFORM_PROFILE_BALANCED;
> +			break;
> +		case WMI_PP_XIAOMI_SMART:
> +			*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			break;
> +		case WMI_PP_XIAOMI_PERFORMANCE:
> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +		return 0;
> +	}
> +
>  	switch (result.data[0]) {
>  	case WMI_PP_BALANCED:
>  		*profile = PLATFORM_PROFILE_BALANCED;
> @@ -272,22 +318,22 @@ static int laptop_profile_set(struct device *dev,
>  
>  	switch (profile) {
>  	case PLATFORM_PROFILE_LOW_POWER:
> -		val = WMI_PP_QUIET;
> +		val = data->xiaomi_pp ? WMI_PP_XIAOMI_QUIET : WMI_PP_QUIET;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED:
> -		val = WMI_PP_BALANCED;
> +		val = data->xiaomi_pp ? WMI_PP_XIAOMI_BALANCED : WMI_PP_BALANCED;
>  		break;
>  	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>  		ret = bitland_check_performance_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_PERFORMANCE;
> +		val = data->xiaomi_pp ? WMI_PP_XIAOMI_SMART : WMI_PP_PERFORMANCE;
>  		break;
>  	case PLATFORM_PROFILE_PERFORMANCE:
>  		ret = bitland_check_performance_capability(data);
>  		if (ret)
>  			return ret;
> -		val = WMI_PP_FULL_SPEED;
> +		val = data->xiaomi_pp ? WMI_PP_XIAOMI_PERFORMANCE : WMI_PP_FULL_SPEED;


Hi,

Thanks for the patch but I won't accept device specific conditionals like 
this done in the code. For a better approach, please see:

bitland-mifs-wmi: Fix TM2107 profile handling

You two could try to coordinate such that transition into the generic 
approach is not worked by both independently.

It might be best to extract the generalization part to own patch and both 
then base their respective device specific patches adding new things on 
top of that.

-- 
 i.

