Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4CD1BCA05
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Dec 2024 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733841104; cv=none; b=DhqbDpv4rrPwmfrg8M3NBxi3NFxi+khNtu+Vafc1DHEyq4Dbik4mH08lv08KmxlwTLPpeIBesOrpgiHWo95jkR6LTTzrXEbgTUqr3MFChAYpRgf9YFMRa8JokphzMqyOAoq8vD4muwwYnh/igFYdrSWaVcqxukUrOPP+YzWoDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733841104; c=relaxed/simple;
	bh=MK/jzAyESGqvtBKPpeF2RWQUfFE5/8q3KB719LtytAE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=l9Y6wUS0OHhdr94yf/1RxcxklzOeQ8suHo/GUEvfIqsT7oOvCdAyJ3OuGrgRiNEscVTraodSa/ZM1QUv5edZM5RFc29YNmBoecrU5i8LRBs9yNjrwr3rwjuP5tLhJRbRY1gLdHU3E3Z5HWieofH8CjrH9jgg53On9tpDCfSFA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AN2CYKuk; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AN2CYKuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733841103; x=1765377103;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MK/jzAyESGqvtBKPpeF2RWQUfFE5/8q3KB719LtytAE=;
  b=AN2CYKukQqpIbiYW42fKrYnnw++R8bmGUs00onHYHxhVgG2x7ipjj+K7
   slU3nUDoOcwro+BbqXF6+m8E8PhbW1DxgVASE+Yf7yM/CGlBQbMn+Ap1S
   r0zpiyUTEsMx/M2HVdf7iB3ACP2zbNn5qzZy/0ts0QyeYJRfPiUxAO9Ln
   xUXBb2samnwRlHrOLEwEE9J1uxqUTS2ArOXXhAGwPZl1JCZ6uu3wHWzC3
   fY9pFJcS5DkjDNb47unKmm4uadsCKlDPxB6qeqB1bT2wu7XbX0VpC9r/N
   YLr8Dtw/oH2ccnmnPOrASphwBEGmDuBEixgV1hS4nOxHtYPA6Nb0sJtM7
   g==;
X-CSE-ConnectionGUID: 6iBT1D5PTIurKfjxV9Pm4Q==
X-CSE-MsgGUID: PoR+xGguTPmSva/NNMlJ2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56667746"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="56667746"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:31:42 -0800
X-CSE-ConnectionGUID: AMUZWAicTKm0NAzjlhsd/Q==
X-CSE-MsgGUID: IZsjKunDRKuhSAEg/mL9Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100380763"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.56])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 06:31:41 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Dec 2024 16:31:37 +0200 (EET)
To: hmtheboy154 <buingoc67@gmail.com>
cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Add info for SARY Tab 3
 tablet
In-Reply-To: <20241202221802.9711-1-buingoc67@gmail.com>
Message-ID: <07b324aa-8d32-55e6-3200-0e846ccbf127@linux.intel.com>
References: <20241202221802.9711-1-buingoc67@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 3 Dec 2024, buingoc67@gmail.com wrote:

> From: hmtheboy154 <buingoc67@gmail.com>
> 
> There's no info about the OEM behind the tablet, only online stores
> listing. This tablet uses an Intel Atom x5-Z8300, 4GB of RAM & 64GB
> of storage.
> 
> Signed-off-by: hmtheboy154 <buingoc67@gmail.com>

Hi,

Thank you for the patch.

We need to have your proper name in From and Signed-off-by tag before a 
patch can be accepted. Please send a v2 with that fixed, thanks.

--
 i.

> ---
>  drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 0a39f68c641d..bdc19cd8d3ed 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -855,6 +855,23 @@ static const struct ts_dmi_data rwc_nanote_next_data = {
>  	.properties = rwc_nanote_next_props,
>  };
>  
> +static const struct property_entry sary_tab_3_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1730),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1151),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-sary-tab-3.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data sary_tab_3_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= sary_tab_3_props,
> +};
> +
>  static const struct property_entry schneider_sct101ctm_props[] = {
>  	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>  	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> @@ -1615,6 +1632,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
>  			DMI_MATCH(DMI_BIOS_VERSION, "S8A70R100-V005"),
>  		},
>  	},
> +	{
> +		/* SARY Tab 3 */
> +		.driver_data = (void *)&sary_tab_3_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SARY"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "C210C"),
> +			DMI_MATCH(DMI_PRODUCT_SKU, "TAB3"),
> +		},
> +	},
>  	{
>  		/* Schneider SCT101CTM */
>  		.driver_data = (void *)&schneider_sct101ctm_data,
> 
