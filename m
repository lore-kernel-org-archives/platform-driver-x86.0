Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BCA2DAFCB;
	Mon, 11 May 2026 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503007; cv=none; b=HyaDkRluXU+COMjkdVfDdVGmXWlp+7JGJDrHWx50V315ySV3j/0W9tEdE6EZjHwANGKJqCMRbpZbmsQrtnmeqHwVGgzPy+jgajA+3RDmt80LZsAy4NE874Kt93I239TFZoaxBUh/lRk760wm0kJLqv3vmAXn7/ehzVqcrzH/nfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503007; c=relaxed/simple;
	bh=RR4AzaXpV6JP6QpXTwasB8ib5j5Os4asoYx7611aMNs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SmAYH0w8Cn74jSMGy1SQm9v6xuCh5nBu/2pZCp4Vo5qOPhXQhzARJHsBvacJi90PRSsbJgBU6loEa4VKzNQM12JQLmNA96VWdCEa/5M7239txfWPF7/jhdHGilovyKJnVZyyFYwaMyuPv55OuZfXxsuRlGZQl9JvPOs0T/OAjp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhQHPprt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhQHPprt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778503006; x=1810039006;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RR4AzaXpV6JP6QpXTwasB8ib5j5Os4asoYx7611aMNs=;
  b=BhQHPprtMNeCFmUp9YjqdzZWOj9R5bzNnM8WnBQcsuz6m5MXh33ODjx5
   opzST3aE6cw4OR8DV1zLABQf9LxgMZO5JJOz8RtDMRun3Kxi4YNfnVq2P
   cxfUtMJHJUuXsrvEkFEZitsLGg6YbgAvLRDOppgKVk+Ohl2T5IgIempQ0
   +K/XMIXGysfxTWM4e8lxvlHxmne+IbE5VR97O12dH2f7AoiTXw4ttf0dh
   7o1OZ2uq21KmR2+LYX7xrzC+kcJYh/D7Jvqgi7Y8qH3MTpX8YgyF8xyXq
   LZFM3zk1NsfrC+RYwttRvIwWhiY1MgHfzZOFlTtuye12BefrgRAxdLl7D
   Q==;
X-CSE-ConnectionGUID: 1wV+eUVFRt2hZCFwm0KvYg==
X-CSE-MsgGUID: KfH418unSq657/XYdHaPyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="83234542"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="83234542"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:36:45 -0700
X-CSE-ConnectionGUID: 63jGwtWCSbOsHG3CMbdjjw==
X-CSE-MsgGUID: M45M1BTFSPq2+YmeqwpM/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="239257443"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.28])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 05:36:43 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 11 May 2026 15:36:39 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] platform/x86/amd/pmc: Add delay_suspend module
 parameter
In-Reply-To: <20260509013105.816339-4-daniel@gibson.sh>
Message-ID: <8de3f9e9-3de8-baf7-3aad-874bd286fd75@linux.intel.com>
References: <20260509013105.816339-1-daniel@gibson.sh> <20260509013105.816339-4-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 9 May 2026, Daniel Gibson wrote:

> Enabling the new delay_suspend module parameter delays suspend for
> 2.5 seconds which is known to help for some AMD-based Lenovo Laptops
> that otherwise failed to send/receive events for key presses or the
> lid switch after s2idle.
> Apparently the EC needs to do some things in the background before

Please fill in paragraphs to ~72 chars or clearly make another 
paragraph with a line in between, if that's what you want.

> suspend or it gets into a bad state.
> 
> There are many reports of AMD-based laptops (mostly but not exclusively
> IdeaPads) about similar issues on the web; this parameter gives
> affected users an easy way to try out if their issues have the same
> root cause and to work around them until their specific device is added
> to the quirks list.
> I added a note to the parameter description encouraging users to report
> their device so it can be added to the quirks list, inspired by a
> similar request in parameter descriptions of the ideapad-laptop module.
> 
> The module parameter can be set to "1" to explicitly enable it,
> "0" to disable it even on devices that are assumed to be affected,
> or -1 (the default) to enable it if the device is assumed to be affected
> (according to fwbug_list[])
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221383
> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 6bafd8661d68..2d3d180c15d2 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -16,6 +16,7 @@
>  #include <linux/bits.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/dmi.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/limits.h>
> @@ -89,6 +90,11 @@ static bool disable_workarounds;
>  module_param(disable_workarounds, bool, 0644);
>  MODULE_PARM_DESC(disable_workarounds, "Disable workarounds for platform bugs");
>  
> +static int delay_suspend = -1;
> +module_param(delay_suspend, int, 0644);
> +MODULE_PARM_DESC(delay_suspend,
> +		 "Delays s2idle by 2.5 seconds to work around buggy ECs, often causing keyboard issues after suspend. 0: don't delay, 1: do delay, -1 (default): let amd_pmc decide. If you need this please report this to: platform-driver-x86@vger.kernel.org");
> +
>  static struct amd_pmc_dev pmc;
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
> @@ -625,8 +631,23 @@ static bool amd_pmc_want_suspend_delay(struct amd_pmc_dev *pdev)
>  	 *
>  	 * See https://bugzilla.kernel.org/show_bug.cgi?id=221383
>  	 */
> -	if (!disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev)) {
> -		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> +	if (amd_pmc_quirk_need_suspend_delay(pdev)) {
> +		/*
> +		 * delay_suspend=1 force-enables this, otherwise it can be
> +		 * disabled with disable_workarounds or delay_suspend=0
> +		 */
> +		if (delay_suspend == 1 || (delay_suspend == -1 && !disable_workarounds)) {
> +			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> +			return true;
> +		}
> +		dev_info(pdev->dev, "Not delaying suspend because of module parameter, even though your device is assumed to need it!\n");
> +	} else if (delay_suspend == 1) {

At least the parameter interactions madness is a bit more contained now 
that it's in these smaller functions. :-/

Still not a big fan of it but I guess it's not worth fighting over 
something that normally shouldn't be needed (if we've all the needed 
quirk info in place).

> +		dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1. If this solves problems on your machine, please report this whole line to: platform-driver-x86@vger.kernel.org so it can be automatically detected as affected in the future. System Vendor: \"%s\" Product Name: \"%s\" Product Family: \"%s\" Board Vendor: \"%s\" Board Name: \"%s\"\n",
> +			 dmi_get_system_info(DMI_SYS_VENDOR),
> +			 dmi_get_system_info(DMI_PRODUCT_NAME),
> +			 dmi_get_system_info(DMI_PRODUCT_FAMILY),
> +			 dmi_get_system_info(DMI_BOARD_VENDOR),
> +			 dmi_get_system_info(DMI_BOARD_NAME));
>  		return true;
>  	}
>  	return false;
> 

-- 
 i.

