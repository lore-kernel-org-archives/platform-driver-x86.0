Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F22199FAB;
	Mon, 23 Feb 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857509; cv=none; b=gfaNZ3NQOLCMpIkzQyuZfUtgGwRz1KnD7pxNiuhUkvhTYsixfAdxGzdgxxPqkpdh4rVqCln2bNf5M3xAhg7la2pb5HpUogEbcISOxbdi/V7rFEFncw8jIiHkAyLVFikvdDkOancci1JSa++2sEJBuS3BmSCIy2fYYCBb+JRxV6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857509; c=relaxed/simple;
	bh=6GeZaFF417UMsHGFG3FpDWIrXr7nZ3mOMkmSec1W3lY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rIlF6qtVdc6ZAjX4xma8JPsTfvYqxMZfK2CE8ZPIBLYehqyTRMPQhxMWc04GqR/KrHeO4yJV/srwnaoWsjzQ1WNybbXu7SbkunfSAidy3IRuJxh7y1ZA0+suyy5c+oH8Uop+Qeh73YkT0nh6V6iyC+ZVVXxTVwpt8HptzEqskaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqGlpgi6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqGlpgi6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857508; x=1803393508;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6GeZaFF417UMsHGFG3FpDWIrXr7nZ3mOMkmSec1W3lY=;
  b=BqGlpgi6KI9Wo6xqJPxPufLWFz49Q1B1hgmJXDuIaziu5AHKKSJfcUE5
   OQiTvKvFm8IqWZvxjXc3kLsujC5G2UNljRkHsPWqkmvtF72RqZHMACekN
   UmJFIkkIc88kuzqzeOlc4bsWZTAPFrIz7epBZG2MM7DpbMis29ZQpNjv4
   R693790PE2iwuTgxrIjjAyJyF/D1Pfr9q8+nTyk0m2Xwopd3D6PMxotJv
   TQ+lvYIDGlxiQXSW9yAstosqI1C2u7P/7WsEgvVdMrMwHHv+hTXeXw8yR
   IjtMYQcbIgHg6GCM7hFGc0rylJQMCzhyUEFvRb90AUNvDjuIpUP6dxLaV
   Q==;
X-CSE-ConnectionGUID: 8eaqvfV+QgOMhIPm5xndRQ==
X-CSE-MsgGUID: g7fUPfI5TRGnA+XJ0wuwMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72892224"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72892224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:38:27 -0800
X-CSE-ConnectionGUID: GqXikFh7Sm+o1KYghgoB6g==
X-CSE-MsgGUID: cL61KqGnQnmEpYPgaFC4Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="238549904"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:38:24 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:38:21 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: adjust screenpad power/brightness
 handling
In-Reply-To: <20260212220252.1526337-2-denis.benato@linux.dev>
Message-ID: <71a3278d-d814-87cf-40cc-95bca45146e9@linux.intel.com>
References: <20260212220252.1526337-1-denis.benato@linux.dev> <20260212220252.1526337-2-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Feb 2026, Denis Benato wrote:

> Fix illogical screen off control by hardcoding 0 and 1 depending on the
> requested brightness and also do not rely on the last screenpad
> power state to issue screen brightness commands.

Should this have a Fixes tag?

> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Luke Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 34 +++++++++++++--------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 0775fadedd10..4130dae37e15 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -4254,32 +4254,24 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>  
>  static int update_screenpad_bl_status(struct backlight_device *bd)
>  {
> -	struct asus_wmi *asus = bl_get_data(bd);
> -	int power, err = 0;
> -	u32 ctrl_param;
> +	int err = 0;
> +	u32 ctrl_param = bd->props.brightness;

Please retain reverse xmas-tree order.

>  
> -	power = read_screenpad_backlight_power(asus);
> -	if (power < 0)
> -		return power;
> +	if (ctrl_param >= 0 && bd->props.power) {
> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
> +		if (err < 0)
> +			return err;
>  
> -	if (bd->props.power != power) {
> -		if (power != BACKLIGHT_POWER_ON) {
> -			/* Only brightness > 0 can power it back on */
> -			ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
> -						    ctrl_param, NULL);
> -		} else {
> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> -		}
> -	} else if (power == BACKLIGHT_POWER_ON) {
> -		/* Only set brightness if powered on or we get invalid/unsync state */
> -		ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
> +		if (err < 0)
> +			return err;
>  	}
>  
> -	/* Ensure brightness is stored to turn back on with */
> -	if (err == 0)
> -		asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
> +	if (!bd->props.power) {
> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> +		if (err < 0)
> +			return err;
> +	}
>  
>  	return err;
>  }
> 

-- 
 i.


