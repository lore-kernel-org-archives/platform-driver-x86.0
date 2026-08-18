Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD09C3ACA6E;
	Tue, 18 Aug 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048123; cv=none; b=qIKOgzB/bFYxLkWubut+VvLd+r7UNTHYq6dBYAQBsMtP66o/SuzKRgtNbaNPhqK/6jNxobE9qzy1cYoLU86UZQGapL4Lf5RRU1dXk28yfe/VXeSjMwVEExeM3iBhAPESo7n/7rDJjPd9Gwl7lG2Ec/ZgCmD/Dde5OOA+zHBJlNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048123; c=relaxed/simple;
	bh=s9xQW02rgBx4m4H1s7qUHntQNLerorLAjrdGy20aSGw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=O5P6yVxedR3zfWzeKmG8cgx5dae1r+Ill9MgOnsifqm48dA66+Ch7F8CM4yR+8+X2HCcpdvSfMF3nEYWoAxsaedeMcQdoILyLvG3RBilV6Xan0cu7S+JNMSAdB5VtFUDe9/R/qABqAO6DZnC6qQgjj1UqoNWq2CEkIFl+YRyoCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VEXrXfWP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VEXrXfWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787048118; x=1818584118;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=s9xQW02rgBx4m4H1s7qUHntQNLerorLAjrdGy20aSGw=;
  b=VEXrXfWPdC2fHGggkB3rh77fL/XNAc45ZxsaaxQ7H2d3Z1IGu0l4t1OY
   Gcb4NvFTx89wYW08sud/Ye2duU5QcVj7J4kdxHi1ecylqgbqTfWGuYwI+
   3deM5ZD9Hpy4hm5yCvEI1oL38mVs8kf6gipmRMGHR1EmW0duHlGKrQm38
   GaEdKdiYEtqou3jSaOmCqeTTZ93thDAsetyPhiapfXmM5/0HwoN9DVYZM
   n92n4is4h3rB1lmGBaoFGfqLpm8V0cjczPSitG2TXcK0aODNAGc1McPLd
   H8v1TEg78vgDqN0aqgxluiyO1K//XWUAl10zyI3eCshObnFV5613EkNnq
   g==;
X-CSE-ConnectionGUID: SN0RP4Z5S/e9NbOTddF2rA==
X-CSE-MsgGUID: sD/onSiWTiqyEwmJcS5siA==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87452512"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87452512"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:15:18 -0700
X-CSE-ConnectionGUID: CnIpiULsSqGjrO+CcuDOiQ==
X-CSE-MsgGUID: xTsc0SHZSuGBiTwBBvP+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="268693205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:15:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 13:15:12 +0300 (EEST)
To: James Alexander <opensource@inspiredexperts.com>
cc: Daniel Scally <dan.scally@ideasonboard.com>, 
    Sakari Ailus <sakari.ailus@linux.intel.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: int3472: add HP Spectre handshake delay
In-Reply-To: <20260816204247.2844986-1-opensource@inspiredexperts.com>
Message-ID: <efd97842-f8af-e2eb-c2ea-2e5a13f57040@linux.intel.com>
References: <20260816204247.2844986-1-opensource@inspiredexperts.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 16 Aug 2026, James Alexander wrote:

> The OVTI08F4 sensor on an HP Spectre x360 14-eu0xxx failed to read its
> chip ID with error -121 when the existing 45 ms handshake delay was used.
> Increasing the delay to 150 ms allowed the sensor to probe.
> 
> Keep the existing delay for other OVTI08F4 systems. Add a reusable
> handshake-delay field to the discrete-device quirks and set it only for the
> affected HP Spectre family through DMI matching.
> 
> Compile-tested against Linux base fd923b32d761. Hardware-tested with the
> full patch set across 25 consecutive reboots on the affected laptop running
> Ubuntu 7.0.0-29-generic; the sensor probed successfully on every boot.
> 
> Signed-off-by: James Alexander <opensource@inspiredexperts.com>
> ---
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index 115bb3757..80efeb452 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -193,6 +193,9 @@ static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3
>  			      GPIO_ACTIVE_LOW : GPIO_ACTIVE_HIGH;
>  		*con_id = int3472_gpio_map[i].con_id;
>  		*enable_time_us = int3472_gpio_map[i].enable_time_us;
> +		if (int3472_gpio_map[i].type_to == INT3472_GPIO_TYPE_HANDSHAKE &&
> +		    int3472->quirks.handshake_enable_time_us)
> +			*enable_time_us = int3472->quirks.handshake_enable_time_us;
>  		return;
>  	}
>  
> diff --git a/drivers/platform/x86/intel/int3472/discrete_quirks.c b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> index 552869ef9..d31f7c764 100644
> --- a/drivers/platform/x86/intel/int3472/discrete_quirks.c
> +++ b/drivers/platform/x86/intel/int3472/discrete_quirks.c
> @@ -8,6 +8,10 @@ static const struct int3472_discrete_quirks lenovo_miix_510_quirks = {
>  	.avdd_second_sensor = "i2c-OVTI2680:00",
>  };
>  
> +static const struct int3472_discrete_quirks hp_spectre_14_eu0xxx_quirks = {
> +	.handshake_enable_time_us = 150 * USEC_PER_MSEC,

Hi,

Please add include for USEC_PER_MSEC.

--
 i.

> +};
> +
>  const struct dmi_system_id skl_int3472_discrete_quirks[] = {
>  	{
>  		/* Lenovo Miix 510-12IKB */
> @@ -17,5 +21,14 @@ const struct dmi_system_id skl_int3472_discrete_quirks[] = {
>  		},
>  		.driver_data = (void *)&lenovo_miix_510_quirks,
>  	},
> +	{
> +		/* HP Spectre x360 2-in-1 Laptop 14-eu0xxx */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "HP"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME,
> +					"HP Spectre x360 2-in-1 Laptop 14-eu0xxx"),
> +		},
> +		.driver_data = (void *)&hp_spectre_14_eu0xxx_quirks,
> +	},
>  	{ }
>  };
> diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
> index a73841dfa..797694aa8 100644
> --- a/include/linux/platform_data/x86/int3472.h
> +++ b/include/linux/platform_data/x86/int3472.h
> @@ -96,6 +96,8 @@ struct int3472_cldb {
>  struct int3472_discrete_quirks {
>  	/* For models where AVDD GPIO is shared between sensors */
>  	const char *avdd_second_sensor;
> +	/* Override the default delay for handshake GPIO regulators */
> +	unsigned int handshake_enable_time_us;
>  };
>  
>  struct int3472_gpio_regulator {
> 
