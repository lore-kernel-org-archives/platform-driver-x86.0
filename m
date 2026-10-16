Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B47331328E;
	Fri, 16 Oct 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150572; cv=none; b=Cbx+bjPmgV+0J/wfDKaGqqVYyafOh5TSOGfnMaGcG9EqbAKHDuYsOBmy4pLjTrul8T3a+5PePXtAVuHOmTqJj474rafwonfHd8X00YjbWOEYddM/6wNMRCq84o7ZRVDx+S1yhX8vJzMtfvlKo69PeUldnlbQdwx4GVSBO90lRYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150572; c=relaxed/simple;
	bh=lP1JaRZd8SJ9aL/z2Ey7Uk+l25m3bdI9BATnKHnwin4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qoSCWGwtSFSbYz3arLSGUgiORqp6Fr+oP66PXRm0oR+UNodbb+mN5BVSELlca4u4eDcBmFoVh+tZ6eGC4UngKCgSnSB6T8vsTfhq/u7wGXin0F7lDctpI41DYtyGbN9S5yzPRXyVaM7+Fw4818v23k+270wFFy+XArZ1i715SfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UkVt5UhU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UkVt5UhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792150568; x=1823686568;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lP1JaRZd8SJ9aL/z2Ey7Uk+l25m3bdI9BATnKHnwin4=;
  b=UkVt5UhUr1TDyrnayGQWTVNZdVlb2szOKGsnKVRQs1GcSpHcPch4SfP4
   4ScbxR5krI8fQJbiM95cy6mIDThS9ZO7kHfrI32UTh+LbpKxUYAbrFeDy
   zqM7MP5QJxWXeocbAyqHVyk4ex1fXM53gmfoCysHma3lP6jdQS12mrHsw
   2XVHQfdo/8aNviNot6GQVZADiL56ZMElqRV7egMB3kkJYK16iHdn02d5G
   TfXYJQ8oukcQnhL6fDC6G9pBg3V+E91Uj/JR4Q+hmuVTTWqkOcB4kRYgM
   A4NtaawFIWloN+j5dpAm94nV7HnacGz5XGc5Ppp/YgL79yAncMvofXHgw
   Q==;
X-CSE-ConnectionGUID: my19EW4FSVOWM/gt4+mfLg==
X-CSE-MsgGUID: puZqDvMyRs6W9SPR77apAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="952357"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="952357"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:36:07 -0700
X-CSE-ConnectionGUID: f6MqJw8KSs6//7HZiG4Zdw==
X-CSE-MsgGUID: g9Ah1glCRXek/4yLE+0YVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3763233"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:36:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 14:36:02 +0300 (EEST)
To: Donjuanplatinum <donplat@barrensea.org>
cc: W_Armin@gmx.de, hans@kernel.org, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 RESEND] platform/x86: uniwill-laptop: Add support
 for
In-Reply-To: <20261016082819.1414285-2-donplat@barrensea.org>
Message-ID: <305b37f0-b1c0-911a-0a07-42f6c4a51b85@linux.intel.com>
References: <87wlridqzx.fsf@barrensea.org> <20261016082819.1414285-2-donplat@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Oct 2026, Donjuanplatinum wrote:

Your shortlog (on subject line) is truncated.

> Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
> Series-X5SP4NAG).
> 
> Signed-off-by: Yifei Yao <donplat@barrensea.org>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c96..bf46f03fb5f5 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2712,6 +2712,20 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
>  	.lightbar_max_brightness = 200,
>  };
>  
> +static struct uniwill_device_descriptor series_x5sp4nag_descriptor __initdata = {
> +	.features = UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +	            UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color = false,
> +	.kbd_led_max_brightness = 4,
> +};
> +
>  /*
>   * The featuresets below reflect somewhat chronological changes:
>   * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
> @@ -2996,6 +3010,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>  		},
>  		.driver_data = &tux_featureset_4_descriptor,
>  	},
> +	{
> +		.ident = "MECHREVO WUJIE Series 15 X Pro",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
> +		},
> +		.driver_data = &series_x5sp4nag_descriptor,
> +	},
>  	{
>  		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
>  		.matches = {
> 

-- 
 i.

