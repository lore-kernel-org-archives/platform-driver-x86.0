Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7751A3B0AED;
	Thu,  7 May 2026 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160825; cv=none; b=JAvwWj+YaByy5mudGeXtiGk7fI0lkNTRHmYWzRlAXk7sh0rWWPVqZrdHZf/vFnyOnjKjfMdoRDzkhIrxxI4o8ThBOIwyeMWnIJI2r4w4sqnF8HbTqlPxDZAuY29dD8p3fg9Y6Syizwwn5xnpMi8CkYmt/7nBe/mzsSIM6oSM9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160825; c=relaxed/simple;
	bh=kPQucksjzIDzkuR+FFJtR7p+zcLWtPpxXocIEbPNLAg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pWDKhRjj3dw8w66iAPNc8tBJ7RVDneQ/NpFFM+eVr8oasHvRLe7JA0DLVafsi+rEqNMaGD2Rxlhrq56k4sQ8MElctMtEI5cOZIP06QNsnLPQrbE5TTg/FrhHeBFR2548ylzRULkZ8C7GLbkwPU8LTBDkQxF6FNtyQ6MUggdr9KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvUGvReV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvUGvReV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778160823; x=1809696823;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kPQucksjzIDzkuR+FFJtR7p+zcLWtPpxXocIEbPNLAg=;
  b=RvUGvReVZbg9qklKDinIvVrCARMb8006Javj1DFk9NCY8wRI3c+cYwvf
   GjL+PveuA2GPjbTK3bv82GZDP+Q41YW3eOQrSxpp+pbvBGeUT2xrfmFNT
   +vo7f3aPkGyitMtRSluRjfQiNggoxQKLVftYu9W6N3jM5c8ywDvYjWNsw
   g2aRP2uCtLXQqj6M5rq1a0PW/b/ZqWk0egob2WvYQG5iJNjW22FA9Q3IZ
   B0fThP5+MCjvfLhBzUR41rAbPlquX4n+0Qc+0xvlA/w44peuww7lDpVq9
   918v7yCAQRdoJuHFG/l0ngEVgBomBY+5oRMAaA5fRmX3qdK2b3dj7ozeJ
   g==;
X-CSE-ConnectionGUID: RLaYT7SwRZSxwH7sbHCfcQ==
X-CSE-MsgGUID: WOwtGGGZQXKLAa3M2PwAVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="82730857"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="82730857"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:33:39 -0700
X-CSE-ConnectionGUID: sYcDNPzWSVGctCKvne8lvA==
X-CSE-MsgGUID: 8OCsBTAhTTet4VOjUxSiEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="240446027"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 06:33:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 16:33:33 +0300 (EEST)
To: Daniel Gibson <daniel@gibson.sh>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, 
    Mario Limonciello <superm1@kernel.org>
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module
 argument
In-Reply-To: <20260501032655.283789-3-daniel@gibson.sh>
Message-ID: <80f46c50-18eb-7f02-0bec-d124e3867839@linux.intel.com>
References: <20260501032655.283789-1-daniel@gibson.sh> <20260501032655.283789-3-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 1 May 2026, Daniel Gibson wrote:

> Enabling it delays suspend for 2.5 seconds which is known to help for

Please don't link shortlog to longer description like this. Write them 
such that either can be read entirely on its own.

> some AMD-based Lenovo Laptops that otherwise failed to send/receive
> events for key presses or the lid switch after s2idle.
> Apparently the EC needs to do some things in the background before
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
> This is related to https://bugzilla.kernel.org/show_bug.cgi?id=221383

Link: ...

> Signed-off-by: Daniel Gibson <daniel@gibson.sh>
> Tested-by: Daniel Gibson <daniel@gibson.sh>

Normally, we don't tag our own testing. :-)

> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index c604dc7207ed..f76936036d1f 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -89,6 +89,11 @@ static bool disable_workarounds;
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
> @@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
>  	struct amd_pmc_dev *pdev = &pmc;
>  	struct smu_metrics table;
>  	int rc;
> -	bool ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
> +	bool ec_needs_sleep;
> +
> +	if (delay_suspend < 0)
> +		ec_needs_sleep = !disable_workarounds && amd_pmc_quirk_need_suspend_delay(pdev);
> +	else
> +		ec_needs_sleep = delay_suspend != 0;

By doing this, you added overlap between disable_workarounds and 
delay_suspend. It gets confusing.

>  	/* Avoid triggering OVP */
>  	if (ec_needs_sleep || (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)) {
> -		dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");
> +		if (delay_suspend > 0)
> +			dev_info(pdev->dev, "Delaying suspend by 2.5s because delay_suspend=1\n");
> +		else
> +			dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid platform bug\n");

Overall, the end result looks pretty messy.


-- 
 i.

