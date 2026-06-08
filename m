Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2173134CFC2;
	Mon,  8 Jun 2026 12:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780922115; cv=none; b=kcn3nCY/+KvBRUi6EWokKmfGZ9Q+Of8T+OcvkDlbTGCbQs63Augcn6M2Vj9tKhQRklOD7tqn06Su2Ed4d+uIvDFyx0fS8ueFvKq+orK9TaCrVyvqrK0kOPF91KbiVvrU1VIUEN2gwXxQhb0x9OORmNYYqNU71DbCILUWTNt3EEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780922115; c=relaxed/simple;
	bh=ZrUg/jfH0ZGjipwbsHdd84iLyMVd3en/n067GFN5t9E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YdeZGgONKjSNrKJ9ZWtoq7XQmQabCcz1y6W8YPPp71wjvY3vkiIJR+vckpbDJn3k2VOQvlN14N0Ojn9SnPYE+CxZXV9Hy1suDj00245bvof9JtK9eHF+uEedFKTC+kvT7iQ1lNApwaPpraLMBsoQmgYhg6X2n9WK2enbr45RrvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jW12ffCy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jW12ffCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780922113; x=1812458113;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ZrUg/jfH0ZGjipwbsHdd84iLyMVd3en/n067GFN5t9E=;
  b=jW12ffCyBGg9t/HVGLfQ7VCCsuV6nSD69UGR1a2xDd39wqI7jIo0OSPX
   ScuKiA3YAvml1dGhNqw/6CaE/IdZlJRA27ntkaE/tI+QhAMgQ6YWL9M+Z
   32B6Wvw7BsX8lIDCOEJimIPlYUCWznYxJQ4ASE51WJNCKys+FlGRhs2/8
   p4ITMWLLQGbFg8FE5lMdd99wXXUVB74cxws0AxaRgQs9JjOCSPIhg+NAu
   KstJZVp3MCv0tuhCtCsKqiJh0egZRmk/HAIUdOrYFd4pPooYBETnjNm9R
   7N2pCJZsKujjw7b6GBBX1bPkN20Zgkzofz6Mr2etWD6xgBRObR4EWmbvr
   A==;
X-CSE-ConnectionGUID: BsxSVUw4RyyyL7GAbGpfKQ==
X-CSE-MsgGUID: Cjb01gXPQ9SVGZqpMw1hog==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="84227808"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="84227808"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:35:12 -0700
X-CSE-ConnectionGUID: s3/hKZjsTseLy34neU5tzg==
X-CSE-MsgGUID: Ca8+247hTWS3Q5Dg/MxnTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="241092202"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:35:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 15:35:07 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [PATCH] platform/x86: Add Battery Threshold support
In-Reply-To: <20260605231909.17028-1-yahia.a.abdrabou@gmail.com>
Message-ID: <0d81219b-7a0b-fe57-aa28-f36967e414c4@linux.intel.com>
References: <20260605231909.17028-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 6 Jun 2026, yahia wrote:

Thanks for the patch.

One PATCH is enough on the subject lines. :-)

> Hello,
> I aim in this patch to add support to
> Battery threshold via SBCT and GBCT
> acpi methods from the acpi table

acpi -> ACPI

Please write a proper changelog using imperative tone and real English 
sentences.

Don't use "I" (or "we") nor "this patch" but start with the verb:

Add support ...

> 
> Signed-off-by: yahia <yahia.a.abdrabou@gmail.com>

Please add also your surname before the email address.

For more information, please see 
Documentation/process/submitting-patches.rst

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index f63bc00d9a9b..3d035ad9f03d 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -59,6 +59,8 @@ enum hp_ec_offsets {
>  #define HP_POWER_LIMIT_DEFAULT	 0x00
>  #define HP_POWER_LIMIT_NO_CHANGE 0xFF
>  
> +#define HP_BATTERY_THRESHOLD_CAP 0x37
> +
>  #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when zero insize is required
>  
>  enum hp_thermal_profile_omen_v0 {
> @@ -448,6 +450,7 @@ static struct notifier_block platform_power_source_nb;
>  static enum platform_profile_option active_platform_profile;
>  static bool platform_profile_support;
>  static bool zero_insize_support;
> +static bool battery_threshold_support;
>  
>  static struct rfkill *wifi_rfkill;
>  static struct rfkill *bluetooth_rfkill;
> @@ -1130,6 +1133,22 @@ static struct attribute *hp_wmi_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(hp_wmi);
>  
> +static int hp_battery_threshold_check(void)
> +{
> +	u8 buffer[128] = {0};

= {}; is enough to initialize it.

> +	int ret;

Add an empty line after local vars.

> +	ret = hp_wmi_perform_query(HP_BATTERY_THRESHOLD_CAP, HPWMI_READ, buffer, 128, 128);

sizeof(buffer)

> +	if (ret != 0) {
> +		battery_threshold_support = false;

battery_threshold_support is initialized to false so do you need this?

> +		return -1;

You should generally pass the error code onwards. Though the positive 
returns you should handle too so it would be better to split it into two 
if()s.

> +	}
> +	if (buffer[28] == 0xAA) {

Please name 0xaa with a define.

Maybe 28 as well should be named with a define.

> +		battery_threshold_support = true;
> +		return 0;
> +	}
> +	return false;

Returning false from int function???

> +}
> +
>  static void hp_wmi_notify(union acpi_object *obj, void *context)
>  {
>  	u32 event_id, event_data;
> @@ -2287,6 +2306,12 @@ static int __init hp_wmi_bios_setup(struct platform_device *device)
>  			hp_wmi_rfkill2_setup(device);
>  	}
>  
> +	err = hp_battery_threshold_check();
> +
> +	if (err == 0) {

Please don't leave empty lines in between call and it's error handling 
(but see the next comment below).

> +		pr_info("Battery Threshold is supported");

Success path should be silent.

After correcting these issues, please send v2.

> +	}
> +
>  	err = hp_wmi_hwmon_init();
>  
>  	if (err < 0)
> 

-- 
 i.

