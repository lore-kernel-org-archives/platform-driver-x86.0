Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9CA13777E
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 10:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021983; cv=none; b=GMRMW0UGo6VAGpKLI6VskqIXJXba+FYfXxSGG6kzW02n63pP2fIlJKBaoNishh3UhparMD+jSSqY4OdoJa1BgFpN7eEXAdiqXjhWQgS4GfjN/Cbn3qWOTX7PemhpVB41xgtxIceb6ThhhHbsdCS6JmO7S4bQMcEsd/tv3E1i+o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021983; c=relaxed/simple;
	bh=mxF8XWogxuw65392p9SXoJ2IQAYf47ZXcvklijsGEFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1Ba1Gp01Ych6bJdiLr++HUWcT/gg93n4thmsnsyvxKHQKEXu7CRnFyMvEaUJmlXvIuWv05UjgCf669qsIPWHMDP24u2W4NDmo5dTA8T1V3IZzCPQMrDTN5WLxEaz/hjB6C9GxIlfF9UlbOnaSPFqPBZ2zsBq8XTNzvhY1H3Kwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: xk9bEwreRkmLcqukobh0Ig==
X-CSE-MsgGUID: uc1Qt6xeQ56C5YBpxGM1uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45289601"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45289601"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:33:01 -0700
X-CSE-ConnectionGUID: oOXpphsCRSy0qnt3St0dzw==
X-CSE-MsgGUID: ZIWmOEdpTxiRRR3W5XzXWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127667060"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 03:32:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy@kernel.org>)
	id 1u1jmj-0000000A29j-2HG6;
	Mon, 07 Apr 2025 13:32:57 +0300
Date: Mon, 7 Apr 2025 13:32:57 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia Edu
 Atla 10 tablet 5V data
Message-ID: <Z_Op2fnes11oZCRo@smile.fi.intel.com>
References: <20250407092017.273124-1-hdegoede@redhat.com>
 <20250407092017.273124-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407092017.273124-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Apr 07, 2025 at 11:20:16AM +0200, Hans de Goede wrote:
> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
> significantly different mainboards. The only outward difference is that
> the charging barrel on one is marked 5V and the other is marked 9V.
> 
> Both are x86 ACPI tablets which ships with Android x86 as factory OS.
> with a DSDT which contains a bunch of I2C devices which are not actually
> there, causing various resource conflicts. Enumeration of these is skipped
> through the acpi_quirk_skip_i2c_client_enumeration().
> 
> Extend the existing support for the 9V version by adding support for
> manually instantiating the I2C devices which are actually present on
> the 5V version by adding the necessary device info to
> the x86-android-tablets module.

...

> +	{
> +		/* Vexia Edu Atla 10 tablet 5V version */
> +		.matches = {
> +			/* Having all 3 of these not set is somewhat unique */
> +			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
> +			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
> +			/* Above strings are too generic, also match on BIOS date */
> +			DMI_MATCH(DMI_BIOS_DATE, "05/14/2015"),
> +		},

Oh, this is unfortunate matching and quite fragile. Do we have other matching
mechanisms in place in addition to this?

I am not against this change, but perhaps we need also add something to check,
say, CPUID before looking into this table or so?

> +		.driver_data = (void *)&vexia_edu_atla10_5v_info,
> +	},

-- 
With Best Regards,
Andy Shevchenko


