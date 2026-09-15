Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D913B3F1ACE;
	Tue, 15 Sep 2026 23:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514214; cv=none; b=oGbJrPJht28BeigNbV3A1qdHpXa0UjfqeFV5kI9AXkPPl55sMpcHtYsAUkoDQAyRkYaQI0FzVazuIzsuXpNE4Jr4gbhxpwYt4ka20HXsdezx9OEsaBncQHJXyzP1OGQbotkiQ2X+4Sng/t7JsBBvoMyT3POd+6SHhIhmIUCjOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514214; c=relaxed/simple;
	bh=SljWeATqPsVeoHUtObIq8pPC/7gEKAKH4tUIyCQrg9w=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NvbSn/iyl12gKj5nX3/PTpQYLxH80wrNrlr+vebd4KO1OmKVQx/lOcBChyCZQH7dnafc6wnbODAXi14oJzYfY4ntAhHWoO90IsSvopYXfh6JMWUW/x2R4YcyNeoASNm22bZbUn5D8Qv+QdGLH60SlEIWPAIR1yNh71QqsSCXvzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/zteoiN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/zteoiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789514213; x=1821050213;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SljWeATqPsVeoHUtObIq8pPC/7gEKAKH4tUIyCQrg9w=;
  b=l/zteoiNR0dNxRbXSfkHbM/TDvBb+Z/SnOnuBSMvHH/J7QFIpTR79bte
   2h1bT8yx1XwCdpLcmY0FzFB9B6rIIQnmpBA49CfEsVcnIoCcg1GnMsMyb
   LtYpNDXrEn9ZmK86Fv0zqP6TWlCTF75cAuVvynpwVslaurd92hmZRibxe
   rhlykGaB9pmcWGrhzqbTWWseWRFrrvFGbYorGRoDTzVRvuOee8F9CNNz8
   I/9AeM05l+zd4MHRVJgzeFQybIC0Um7ycJ/QIORtSOQovlZOH5a3yoTpx
   p7KQ9MVvZ8+pJ1uoxCjIi7niJQ4vbOKBoBOsDsPR22iNqJg1NzpCfWoN1
   w==;
X-CSE-ConnectionGUID: QvSF47hISCiEo9Tjn7DxkA==
X-CSE-MsgGUID: yZ2tfLClSpOh9wY4vNEoAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100214022"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100214022"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:16:53 -0700
X-CSE-ConnectionGUID: FvwwVIXGT6+eF3lz5Ffvww==
X-CSE-MsgGUID: 06cIT3mWTtGq/FAMv0CIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273695233"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.24])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 16:16:48 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 16 Sep 2026 02:16:44 +0300 (EEST)
To: Thierry Chatard <tchatard@gmail.com>
cc: LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
    lee@kernel.org, platform-driver-x86@vger.kernel.org, djrscally@gmail.com, 
    linux-media@vger.kernel.org, mchehab@kernel.org, 
    sakari.ailus@linux.intel.com, jacopo.mondi@ideasonboard.com, 
    nicholas@rothemail.net, andriy.shevchenko@intel.com, v.vitovt@gmail.com
Subject: Re: [PATCH v8 1/6] platform/x86: intel_lpss: add resource conflict
 quirk for Dell Latitude 5285
In-Reply-To: <20260826112452.13539-2-tchatard@gmail.com>
Message-ID: <f777df5b-0f19-5e86-94e8-11fb73cd341b@linux.intel.com>
References: <20260826112452.13539-1-tchatard@gmail.com> <20260826112452.13539-2-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Aug 2026, Thierry Chatard wrote:

Why is this platform/x86: prefixed??

--
 i.

> The Dell Latitude 5285 2-in-1 has a BIOS bug where the ACPI GEXP device
> and the I2C4 controller (INT3446) both claim the same MMIO region via the
> shared SB04 variable. This causes intel_lpss_acpi to fail binding to I2C4
> with -EBUSY, preventing the front camera (OV5670) sensor from being
> registered.
> 
> Match the affected machine by DMI and the affected device by ACPI ID,
> carrying QUIRK_IGNORE_RESOURCE_CONFLICTS in the ACPI match data and
> applying it to the per-device info in probe. This follows the quirk
> organisation used by the PCI counterpart.
> 
> Signed-off-by: Thierry Chatard <tchatard@gmail.com>
> ---
>  drivers/mfd/intel-lpss-acpi.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
> index 63406026d..1ac1dcc41 100644
> --- a/drivers/mfd/intel-lpss-acpi.c
> +++ b/drivers/mfd/intel-lpss-acpi.c
> @@ -8,7 +8,9 @@
>   *          Mika Westerberg <mika.westerberg@linux.intel.com>
>   */
>  
> +#include <linux/acpi.h>
>  #include <linux/device.h>
> +#include <linux/dmi.h>
>  #include <linux/gfp_types.h>
>  #include <linux/ioport.h>
>  #include <linux/mod_devicetable.h>
> @@ -172,6 +174,27 @@ static const struct acpi_device_id intel_lpss_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_lpss_acpi_ids);
>  
> +/*
> + * Devices that need a quirk applied only on the machines matched by
> + * intel_lpss_quirk_dmi[] below. The quirk to apply is carried in the
> + * matching entry's driver_data.
> + */
> +static const struct acpi_device_id intel_lpss_acpi_quirk_ids[] = {
> +	/* Dell Latitude 5285: ACPI GEXP device conflicts with I2C4 (INT3446) */
> +	{ "INT3446", QUIRK_IGNORE_RESOURCE_CONFLICTS },
> +	{ }
> +};
> +
> +static const struct dmi_system_id intel_lpss_quirk_dmi[] = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Latitude 5285"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  {
>  	const struct intel_lpss_platform_info *data;
> @@ -186,6 +209,15 @@ static int intel_lpss_acpi_probe(struct platform_device *pdev)
>  	if (!info)
>  		return -ENOMEM;
>  
> +	/* Apply per-device quirks that are only needed on certain machines */
> +	if (dmi_check_system(intel_lpss_quirk_dmi)) {
> +		const struct acpi_device_id *id;
> +
> +		id = acpi_match_device(intel_lpss_acpi_quirk_ids, &pdev->dev);
> +		if (id)
> +			info->quirks |= id->driver_data;
> +	}
> +
>  	/* No need to check mem and irq here as intel_lpss_probe() does it for us */
>  	info->mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	info->irq = platform_get_irq(pdev, 0);
> 
