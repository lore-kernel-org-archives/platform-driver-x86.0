Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950B34CE699;
	Mon,  5 Oct 2026 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791216818; cv=none; b=q7Ydmn/v9q3qQonuhJmfGNpwDdCiyhEBZTre1A3J/hsTAnDDyrO/4jILJaZjrCmH6/XF46MB9s8qPGVkGlwLHYp5rhpVbEXQ++Q8MRtFdOZvjUB+k1fLUKD61GpODCdqQN6J3nu1jjIASyeexE/5AWRevv4SEu7Z4pND1FRPmU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791216818; c=relaxed/simple;
	bh=RWiPTusDqo5b+F+8rnMoUPS+IcS8UJao1L2pWpkLrm8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y3v6QjP87UP15QLVkfZbpaJllr91Y1P/xjWj601j8NfhIvQsop0XWge9N1Mx7TdrDy7YrarwvWbK592nKwQVF47/tGHBGNpah2EXO/0ThJ6sPHvuuZlyRejZ1msunicWgCYGsHwfC9oRpHqnZ4mrO6spM/MhG0d8oTl5oSERQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoDUWawn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoDUWawn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791216814; x=1822752814;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RWiPTusDqo5b+F+8rnMoUPS+IcS8UJao1L2pWpkLrm8=;
  b=CoDUWawnAe8N1zKBinaspYaWUKLDHkHIwZxYAJnozh5ovYupCpEJ3JIh
   ZBjfwCgdpzktz3EPzna4CAudKOUjRPx+bZqR1XL3BORsYNIU5Pv/sZavN
   lkv281BIqdTNrjei/FjB5GFT9ceDhZ+kbOicSW/m9X0ULPYsT3DiuT17o
   jVU2yFCljMuMiYqs/g7UP56TXK+u8J6wUFn2k8/7ggdHab/fmppLGEV7t
   m7un6qI1qnYJtYjQA5uHFuAENFEQrvCKX9uLSNxcJe+iHgoNS8YT5JB58
   VulSP0ThZKCPbeUVFv97FHKGUoEgxE/haGmAVa3EZPVnZNpAnPgNDPHRM
   Q==;
X-CSE-ConnectionGUID: H8Pex4mfRM2xGxAhHhJEoA==
X-CSE-MsgGUID: hlwhpqwUS0OGcYEDkeSyvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102472113"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="102472113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:13:29 -0700
X-CSE-ConnectionGUID: 2QqM6cwiTEaMaOMID+h9TQ==
X-CSE-MsgGUID: x//d36DuRlaV1Q+LYl446Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="281645107"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 09:13:26 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 5 Oct 2026 19:13:23 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, wse@tuxedocomputers.com, 
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] platform/x86: uniwill-laptop: Fix breathing animation
 on Intel QC
In-Reply-To: <20260905130138.6814-4-W_Armin@gmx.de>
Message-ID: <151f0983-9ebd-ee6e-bda9-a9158c69a8b9@linux.intel.com>
References: <20260905130138.6814-1-W_Armin@gmx.de> <20260905130138.6814-4-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Sep 2026, Armin Wolf wrote:

> Intel NUC 9 Extreme (Queens County) devices have a separate bit
> inside the EC_ADDR_LIGHTBAR_AC:CTRL register for enabling the

Should be _

-- 
 i.


> breathing animation in s2idle mode.
> 
> Add support for this additional setting.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  .../ABI/testing/sysfs-driver-uniwill-laptop   |  4 +--
>  drivers/platform/x86/uniwill/uniwill-acpi.c   | 27 ++++++++++++++-----
>  2 files changed, 22 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> index b9b9feebe2ed..f3060aaf8a76 100644
> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
> @@ -35,8 +35,8 @@ KernelVersion:	6.19
>  Contact:	Armin Wolf <W_Armin@gmx.de>
>  Description:
>  		Causes the integrated lightbar to display a breathing animation when the machine
> -		has been suspended and is running on AC power. Writing "1"/"0" into this file
> -		enables/disables this functionality.
> +		has been suspended, is running on AC power and the lightbar brightness not zero.
> +		Writing "1"/"0" into this file enables/disables this functionality.
>  
>  		Reading this file returns the current status of the breathing animation
>  		functionality.
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 6366171c6981..e527ed7461c3 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -165,9 +165,10 @@
>  #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
>  #define LIGHTBAR_APP_EXISTS		BIT(0)
>  #define LIGHTBAR_POWER_SAVE		BIT(1)
> -#define LIGHTBAR_S0_OFF			BIT(2)
> -#define LIGHTBAR_S3_OFF			BIT(3)	// Breathing animation when suspended
> -#define LIGHTBAR_WELCOME		BIT(7)	// Rainbow animation
> +#define LIGHTBAR_S0_OFF			BIT(2)	/* Also disables animations */
> +#define LIGHTBAR_S3_OFF			BIT(3)	/* No breathing animation when in s2ram */
> +#define LIGHTBAR_MODERN_STANDBY_ON	BIT(6)	/* Breathing animation when in s2idle */
> +#define LIGHTBAR_WELCOME		BIT(7)	/* Rainbow animation */
>  
>  #define EC_ADDR_LIGHTBAR_AC_RED		0x0749
>  
> @@ -306,7 +307,7 @@
>  #define EC_ADDR_USB_C_POWER_PRIORITY	0x07CC
>  #define USB_C_POWER_PRIORITY		BIT(7)
>  
> -/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF */
> +/* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR_S3_OFF and LIGHTBAR_MODERN_STANDBY_ON */
>  #define EC_ADDR_LIGHTBAR_BAT_CTRL	0x07E2
>  
>  #define EC_ADDR_LIGHTBAR_BAT_RED	0x07E3
> @@ -911,12 +912,13 @@ static ssize_t breathing_in_suspend_store(struct device *dev, struct device_attr
>  		return ret;
>  
>  	if (enable)
> -		value = 0;
> +		value = LIGHTBAR_MODERN_STANDBY_ON;
>  	else
>  		value = LIGHTBAR_S3_OFF;
>  
>  	/* We only access a single register here, so we do not need to use data->led_lock */
> -	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, LIGHTBAR_S3_OFF, value);
> +	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL,
> +				 LIGHTBAR_S3_OFF | LIGHTBAR_MODERN_STANDBY_ON, value);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -934,6 +936,10 @@ static ssize_t breathing_in_suspend_show(struct device *dev, struct device_attri
>  	if (ret < 0)
>  		return ret;
>  
> +	/*
> +	 * We only test LIGHTBAR_S3_OFF here, because LIGHTBAR_MODERN_STANDBY_ON
> +	 * should have the exact opposite value.
> +	 */
>  	return sysfs_emit(buf, "%d\n", !(value & LIGHTBAR_S3_OFF));
>  }
>  
> @@ -1541,7 +1547,8 @@ static struct led_trigger uniwill_lightbar_trigger = {
>  	.trigger_type = &uniwill_lightbar_trigger_type,
>  };
>  
> -#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S3_OFF | LIGHTBAR_WELCOME)
> +#define LIGHTBAR_MASK	(LIGHTBAR_APP_EXISTS | LIGHTBAR_S0_OFF | LIGHTBAR_S3_OFF | \
> +			 LIGHTBAR_MODERN_STANDBY_ON | LIGHTBAR_WELCOME)
>  
>  static int uniwill_led_init(struct uniwill_data *data)
>  {
> @@ -1574,6 +1581,11 @@ static int uniwill_led_init(struct uniwill_data *data)
>  		return ret;
>  
>  	value |= LIGHTBAR_APP_EXISTS;
> +	if (value & LIGHTBAR_S3_OFF)
> +		value &= ~LIGHTBAR_MODERN_STANDBY_ON;
> +	else
> +		value |= LIGHTBAR_MODERN_STANDBY_ON;
> +
>  	ret = regmap_write(data->regmap, EC_ADDR_LIGHTBAR_AC_CTRL, value);
>  	if (ret < 0)
>  		return ret;
> @@ -1583,6 +1595,7 @@ static int uniwill_led_init(struct uniwill_data *data)
>  	 * running on battery power.
>  	 */
>  	value |= LIGHTBAR_S3_OFF;
> +	value &= ~LIGHTBAR_MODERN_STANDBY_ON;
>  	ret = regmap_update_bits(data->regmap, EC_ADDR_LIGHTBAR_BAT_CTRL, LIGHTBAR_MASK, value);
>  	if (ret < 0)
>  		return ret;
> 
