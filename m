Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560AF1DE884
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 17:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742577627; cv=none; b=Q4Aaspcbx4++r2CiHu+8L4bLoi7e8k2r/DdLcqwjV8TgHDkhaJjyU61OcyF1lsQenDvZ8aGnjFCumMyeuV7yPDdvFGoi4JdCzdgwMPCLvs+NJc62dgWe84TYsj7OBMQBpGdpSiiS9jHzUmkaK5sHE1W4gb1eVKQRQF0+4UG3CHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742577627; c=relaxed/simple;
	bh=83Dg5Q+2cOCQ9QElSSy06IMv7z2N6Z+ih6hnQ2aMYgA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ObVnihPExHAwSYKDkywBIDYm7HtTvxi590He0EASW2OGucvU7olxlbPJ7E5eI8x3c/0bsVqd+kx9N8EaV403wWqok/DXsk+6HBcWyrnK7YB2AOVCyuE/uJDeDXgXQblM/281YZO6wegp3Ljt7jjEuY8ABwQaWIKP7ZWBY9PUfg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHKBeDTt; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHKBeDTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742577627; x=1774113627;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=83Dg5Q+2cOCQ9QElSSy06IMv7z2N6Z+ih6hnQ2aMYgA=;
  b=XHKBeDTtpWZFFcR12L0NyL1ko0XLWhR5Lr6aLvFP8J5EHKkRIJnTwCUy
   aNuE38eZrUBwhU45SCNRNukrwyDYhLjG0+v2nEXyiC/K+0La9csOWvkou
   EHd9XowYMlxmPsVFR5h0GTm5FUfGyWOHvq3iMIDK79AtsPVZsohGsYfon
   htEzX1vHrzM5gBtfO2Gk+xqnFz4i/SSifhLGTAdp2bcvbA6q6VzcaRyHO
   w+/4Q2aIgqmqY0J7BgXsSXeP3FNCuyEm4ZaLPt1BdaQh/oAtw3E/ZlYmO
   HAOwD6doZuR6KBeyU8+DEYFAR4RDgidrCOv+N9idjBPiPlFOPI6y1iq5b
   A==;
X-CSE-ConnectionGUID: r/cp+KR9QHeL5ipX4rCDUg==
X-CSE-MsgGUID: IriSHWA2SryzGlXIRtGl2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="31443165"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="31443165"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 10:20:26 -0700
X-CSE-ConnectionGUID: 8IDjPd70S8usCOSF6IBSBg==
X-CSE-MsgGUID: pWAolr2vT8CV9Ssj4qjP8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="123423189"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.112])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 10:20:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Mar 2025 19:20:20 +0200 (EET)
To: Kevin Stravers <kevin@stravers.net>
cc: luke@ljones.dev, platform-driver-x86@vger.kernel.org, 
    corentin.chary@gmail.com
Subject: Re: [PATCHv2] platform/x86: asus-wmi: Add quirk for ASUS Vivobook
 S14
In-Reply-To: <a22c2077-4f74-4972-be2b-f60b67f67bab@stravers.net>
Message-ID: <e125a6d3-78ca-bf85-434e-e81d23bdff3a@linux.intel.com>
References: <a22c2077-4f74-4972-be2b-f60b67f67bab@stravers.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Mar 2025, Kevin Stravers wrote:

> From 9af8ba6cfd6305d7696d6cfc8eedb12405cb572f Mon Sep 17 00:00:00 2001
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
> diff --git a/drivers/platform/x86/asus-nb-wmi.c
> b/drivers/platform/x86/asus-nb-wmi.c
> index 3f8b2a324efd..1e6fb9308560 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -150,6 +150,10 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {

When I try various means to have this as file, this line is turned into 
this:

@@ -150,6 +150,10 @@ static struct quirk_entry 
quirk_asus_zenbook_duo_kbd = {

And it obviously results in failure_:

$ patch -p1 --dry-run < 0001
checking file drivers/platform/x86/asus-nb-wmi.c
patch: **** malformed patch at line 35: quirk_asus_zenbook_duo_kbd = {

And if I try to manually fix that, all hunks still fail to apply so I 
think there more wrong with the diff.

Did you try to use git am after mailing the patch to yourself? Please do 
that if you didn't because it might otherwise take many round-trips to 
correct the problems.

It might be easier to use git send-email to send patch out as it 
shouldn't mangle the patch in any way.

-- 
 i.

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

