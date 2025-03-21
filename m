Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67013B59B
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 16:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742575441; cv=none; b=OjDtYRnsTEB7MKTYyVsaXU7TNIiyDbEKED9D55UzTXIHETJdscEGwHch5nrYeNrJAkoTwHW8EpE9Q7NEcgbeuql7RBx0IeYu+uALp4NYtUF6VgS+HRu5W1KTC6pNZXO7/MEUTx09iHBDOqT0IkVrvRcKhsvZ7sTf6Cj522TLqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742575441; c=relaxed/simple;
	bh=mBNOjliTUtjnuGtop7U7hLVU8u35OkOuf+IpFz73DD8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=hrgMqTxeckVPKGlrZtekdAaJ/J44yTaAWExYD0A9HtIeseXPmUn+lEm7+UBYNzlrmWOalph4NkYENB3pfEV9k7LIcSZa6ptm8BAm/5r3LqRnTz7uCCCCMtFfJKCawXEbhqQmVGi/QPGDF1jePEyDiwCp27685G40VC32wAAN9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mn3wfJcG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mn3wfJcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742575440; x=1774111440;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=mBNOjliTUtjnuGtop7U7hLVU8u35OkOuf+IpFz73DD8=;
  b=mn3wfJcGoabPpCFy53l7vcPNlWhL1caNUBrhmhT4XCsNg0eDx+7z45/n
   Qgrq96mYUAncTsZJb8cAr4RkTktipaGkWHHsWOdhSyR9OFjJA2Oc3qCaG
   AWOu6gDRXZ8s3dUgK7j8ABfNt6+/aHlbSh+rv65WfblH2nlB1yUwWW7Sr
   Son02LkyrhmAvqON+AXy6Rbbg8b6b5rcWqKvX7wD6SMRJXCEluQDasVW5
   FDojqzaPR4Kjzb1Ed2SWDO6FSBqvDhibvspCZA1H/kvIjza2k0UFDX/Vp
   E30er9KHEMpawqnuUl6Co+SMJg/Gi1zZDGa/hsJFunpr0aHiPVEl8LNXt
   Q==;
X-CSE-ConnectionGUID: HU6Yy2mnQTmSMu00n4BuQw==
X-CSE-MsgGUID: naB9DmgqToG+Kg3l9yoCjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43774569"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43774569"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 09:44:00 -0700
X-CSE-ConnectionGUID: jrahvE7kT8e6Rkd80KF7sA==
X-CSE-MsgGUID: CHqEeBuIQyCtDAZm0VV41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123156308"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 09:43:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Mar 2025 18:43:54 +0200 (EET)
To: Kevin Stravers <kevin@stravers.net>
cc: corentin.chary@gmail.com, luke@ljones.dev, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook
 S14
In-Reply-To: <a7bf6573-0d8c-4464-8841-df5df537249e@stravers.net>
Message-ID: <28094cb8-084d-3aa1-12f5-96aa9b0aa31c@linux.intel.com>
References: <fe59465c-3dfc-4d91-baca-ffbc3d4ff138@stravers.net> <1d0863e0-eba2-d8b8-f13a-40ce37aed03d@linux.intel.com> <a7bf6573-0d8c-4464-8841-df5df537249e@stravers.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Kevin Stravers wrote:

> 
> Sorry about that, the email client formatted tabs as spaces. This should be the corre
> ct patch.

Hi,

This now has other issues. It had some html in that comment above and 
please resend not as a reply to any thread but in own thread.

> >From 9af8ba6cfd6305d7696d6cfc8eedb12405cb572f Mon Sep 17 00:00:00 2001
> From: Kevin Robert Stravers <kevin@stravers.net>
> Date: Mon, 17 Mar 2025 20:41:44 -0400
> Subject: [PATCH] platform/x86: asus-wmi: Add quirk for ASUS Vivobook S14
> 
> The ASUS Vivobook S14 will have wifi disabled on boot as well as
> resumption from suspend if the asus-wmi driver invokes rfkill functions.
> 
> This patch disables asus-wmi's rfkill usage to prevent the wifi card
> from being software disabled.
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 13 +++++++++++++
>  drivers/platform/x86/asus-wmi.c    |  5 +++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 3f8b2a324efd..1e6fb9308560 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
>  	.ignore_key_wlan = true,
>  };
>  
> +static struct quirk_entry quirk_asus_vivobook_s14 = {
> +	.skip_rfkill = true,
> +};
> +
>  static int dmi_matched(const struct dmi_system_id *dmi)
>  {
>  	pr_info("Identified laptop model '%s'\n", dmi->ident);
> @@ -530,6 +534,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_zenbook_duo_kbd,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS VivoBook S14",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "S5406SA"),
> +		},
> +		.driver_data = &quirk_asus_vivobook_s14,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 38ef778e8c19..42e58a28c3e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2138,6 +2138,8 @@ static int asus_new_rfkill(struct asus_wmi *asus,
>  
>  static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return;
>  	if (asus->driver->wlan_ctrl_by_user && ashs_present())
>  		return;
>  
> @@ -2188,6 +2190,9 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
>  
>  static int asus_wmi_rfkill_init(struct asus_wmi *asus)
>  {
> +	if (asus->driver->quirks->skip_rfkill)
> +		return 0;
> +
>  	int result = 0;
>  
>  	mutex_init(&asus->hotplug_lock);
> 

