Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7065772053
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0I99koe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702904370; x=1734440370;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4XeXHGCM8wZt7MHN2QdizA6b5XwlfcVb6P1Qh4V13vo=;
  b=n0I99koeZtJdW2CWMLy6BbCOHweSyG6ztZ1DQVzlguXc7hlEDHgBoA6a
   EDJtX0XNcuzlw9eolBYgDYH2LjoJ+mtPuZ6aR+K8UHHDU1PB7kZJFUNH/
   67zsKCJwhTO7DYPZft/KxEB+KQBTDro3Xbif/LIx3wp3pIlAOf7jnWW6S
   T8PKKl+iGlNobadzRJ/XPWQ2InSDf14uq3F/Oj80WTySnp1tNTuDO+9yX
   vB67IhWeXUnHsh2rCPc4MT8sBbXPVey/YvhtoJMQJd7FyEhSlI3vv9NE9
   Ui8fjwDYlImh15cXASFP4rJAnCeatL96ZKbWPlZ/kNfOvKYEkYdEQh8Jp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="459826106"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="459826106"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:59:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="866208780"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="866208780"
Received: from gmarin-mobl1.ger.corp.intel.com ([10.252.34.78])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 04:59:28 -0800
Date: Mon, 18 Dec 2023 14:59:25 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, 
    "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>, 
    Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
    Goswami Sanket <Sanket.Goswami@amd.com>
Subject: Re: [PATCH 2/4] platform/x86/amd/pmc: Only run IRQ1 firmware version
 check on Cezanne
In-Reply-To: <20231212045006.97581-3-mario.limonciello@amd.com>
Message-ID: <b341cde-aafe-b676-f018-1ee9cf26913a@linux.intel.com>
References: <20231212045006.97581-1-mario.limonciello@amd.com> <20231212045006.97581-3-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Dec 2023, Mario Limonciello wrote:

> amd_pmc_wa_czn_irq1() only runs on Cezanne platforms currently but
> may be extended to other platforms in the future.  Rename the function
> and only check platform firmware version when it's called for a Cezanne
> based platform.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index 666cc6e98267..824673a8673e 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -756,19 +756,22 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>  	return -EINVAL;
>  }
>  
> -static int amd_pmc_czn_wa_irq1(struct amd_pmc_dev *pdev)
> +static int amd_pmc_wa_irq1(struct amd_pmc_dev *pdev)
>  {
>  	struct device *d;
>  	int rc;
>  
> -	if (!pdev->major) {
> -		rc = amd_pmc_get_smu_version(pdev);
> -		if (rc)
> -			return rc;
> -	}
> +	/* cezanne platform firmware has a fix in 64.66.0 */
> +	if (pdev->cpu_id == AMD_CPU_ID_CZN) {
> +		if (!pdev->major) {
> +			rc = amd_pmc_get_smu_version(pdev);
> +			if (rc)
> +				return rc;
> +		}
>  
> -	if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
> -		return 0;
> +		if (pdev->major > 64 || (pdev->major == 64 && pdev->minor > 65))
> +			return 0;
> +	}
>  
>  	d = bus_find_device_by_name(&serio_bus, NULL, "serio0");
>  	if (!d)
> @@ -928,7 +931,7 @@ static int amd_pmc_suspend_handler(struct device *dev)
>  	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
>  
>  	if (pdev->cpu_id == AMD_CPU_ID_CZN && !disable_workarounds) {
> -		int rc = amd_pmc_czn_wa_irq1(pdev);
> +		int rc = amd_pmc_wa_irq1(pdev);
>  
>  		if (rc) {
>  			dev_err(pdev->dev, "failed to adjust keyboard wakeup: %d\n", rc);
> 

Hi Mario,

This doesn't look necessary for the fix in this series, right?

I'd prefer to leave it to next and only take 1,3-4 to fixes.

-- 
 i.

