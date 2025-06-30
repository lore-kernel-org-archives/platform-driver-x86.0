Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2190823F27B
	for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jun 2025 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751277341; cv=none; b=NTBvYI0bX4wzEubpjRWFLAEuVd0779AIOQLWPLjqzUfuyNmcplQYRQ/x/IHpiilFAHeqMuGxRrgrkHOUGD5OdStK5qpvCP4Gu+K4o/okY7JEwGB9i4j5lXjj2yiw1Th2lPtwkeyAiHG9BR+95H6KuPDPaD6oUACrOtKKwV7GvGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751277341; c=relaxed/simple;
	bh=UZRviixlWmkG0xEQbQJxPrK04I3TTPa/udzmaj9/RB8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MqONNmbeYLwOy5+FUHb62bUMoP0c2fociHBTNTNZC9sZsmgx77KK730vc+buwZattEOLuuKzVE1fW4lUB+D5CvdJ63FPZV4O9xNE2s1bG9N8Ahoj8xi8RoNjkduwrZHTGKMopVj9z/ZFN6r3lkkIcJPG3KJVx+EKcScT9yv0jxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yj1xvkSM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yj1xvkSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751277341; x=1782813341;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UZRviixlWmkG0xEQbQJxPrK04I3TTPa/udzmaj9/RB8=;
  b=Yj1xvkSMAd7Y/FI1rbqqfyK/LxzSiX1+IX4ICdjIYZ6ij47Ku2rQTiTS
   E+Bsg0vDY9AvlpPpfjk8JqII+3H4Pt1m1BoXnguDDTFcosuil/+Agacx1
   NA5nBl0NNSN4VXItPe0a8TF2vImexo6ROg8fZi0DI7TTqbXReos19NlRk
   3o8pFy9kiMH92oWf9j6ZnfoBqTL50y16hQ5nvae83td9i2KpVIW13FrFm
   ZW/dC1EEC7t8jMYjJfnGpx21TrzRQWyg4SVZDLk3/nNt/TtXRSGpW6isT
   DwirTYRmVl6qLqXVresBJyKKasR2dW4mXz1/jNX44QZEHLAtp6DVOwONe
   Q==;
X-CSE-ConnectionGUID: 2dDCM+uMQaWjYAwiz9qRfA==
X-CSE-MsgGUID: g1qPW7/LSnatLdZbFRJ9Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="70932019"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="70932019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:55:40 -0700
X-CSE-ConnectionGUID: C0z/nUJWTbGxqc7ngeNHuQ==
X-CSE-MsgGUID: owO76/NHQGuqfWiva6xrUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="153044065"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 02:55:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 12:55:34 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v2] platform/x86/amd/hsmp: Improve the print messages to avoid
 confusion
In-Reply-To: <20250619170439.5548-1-suma.hegde@amd.com>
Message-ID: <8fbd301d-c1a7-2499-89ee-acb27a8335e3@linux.intel.com>
References: <20250619170439.5548-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Suma Hegde wrote:

> When the HSMP ACPI device is available, then loading the amd_hsmp.ko
> module incorrectly prints the message "HSMP is not supported on
> Family:%x model:%x\n" despite being supported by the hsmp_acpi.ko
> module, leading to confusion.
> 
> To resolve this, relocate the acpi_dev_present() check to the
> beginning of the hsmp_plt_init() and revise the print message
> to better reflect the current support status.
> 
> Also add messages indicating successful probing for both
> hsmp_acpi.ko and amd_hsmp.ko modules.
> 
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> ---
> Changes since v1
> Move successful probe print message inside the if condition in acpi.c.
> 
>  drivers/platform/x86/amd/hsmp/acpi.c |  1 +
>  drivers/platform/x86/amd/hsmp/plat.c | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 2f1faa82d13e..bdfb86eeecf2 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -608,6 +608,7 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		if (ret)
>  			return ret;
>  		hsmp_pdev->is_probed = true;
> +		dev_info(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
>  	}
>  
>  	return 0;
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e3874c47ed9e..724e5c7fc819 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -215,7 +215,12 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	return hsmp_misc_register(&pdev->dev);
> +	ret = hsmp_misc_register(&pdev->dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(&pdev->dev, "AMD HSMP is probed successfully\n");

Printing anything should be avoided when something has probed 
succesfully. Thus, either remove these or make them dev_dbg() level.

I guess you added them to have a positive confirmation after the legacy 
side print below, but I think it should be solved differently.

> +	return 0;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
> @@ -287,15 +292,17 @@ static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
>  
> +	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
> +		pr_info("HSMP is supported through ACPI on this platform, please use hsmp_acpi.ko\n");

I suggest you make this printing depend on whether AMD_HSMP_ACPI is 
enabled.

I think this should be totally silent if the probe is expected to happen 
through the ACPI driver and AMD_HSMP_ACPI is enabled (or do a pr_debug() 
level print at most).

In the case AMD_HSMP_ACPI is not enabled, you might consider adding 
pr_info() that AMD_HSMP_ACPI should be enabled.

That way, there's zero noise on success. Only downside is, that if legacy 
driver is loaded manually, it doesn't tell about the failure other than 
through the error code, but that seems a very minor problem, and as 
mentioned, pr_debug() could be used to cover that case too if wanted.

> +		return -ENODEV;
> +	}
> +
>  	if (!legacy_hsmp_support()) {
> -		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +		pr_info("HSMP interface is either disabled or not supported on family:%x model:%x\n",
>  			boot_cpu_data.x86, boot_cpu_data.x86_model);
>  		return ret;
>  	}
>  
> -	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1))
> -		return -ENODEV;
> -
>  	hsmp_pdev = get_hsmp_pdev();
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
> 

-- 
 i.

