Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1AF383305;
	Fri,  3 Jul 2026 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084941; cv=none; b=YWTf8QuteY+3MUpmliSvv1j8XKOT/JL/oy99r0zlBsX9ne1jl7WY79fwIAAUkEPQU5ZKv7C/nYDvZzpIbMjxNu6LRuGyICj6Pw1KxVauk70A+23Pmdo/OUCqM0wyopuRzXxj8po4Df4+5feHs9PhoGnwBMz5J11VK6tFWX/6wJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084941; c=relaxed/simple;
	bh=vh7gSx8BQnKMOJHafdStGSFy0QN0oXxBFN2wiUIUlN4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EW5o5kQpWqdYhMptQUmKZKuTSkRoygFBWhXs/+W7OTpHzE/SiGX/vlvn+Gr0hhPP+32C8B3PTL+TeB+FEbCdJegiL/OzhYNA3ExB864Og1DQ+yM/Ofq0xn7pYN5RoKSjVCNUVNA/92Fyy7xxk776dCgtj+51PC25oRO0DFDQVTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EqBwg0fa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EqBwg0fa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783084940; x=1814620940;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vh7gSx8BQnKMOJHafdStGSFy0QN0oXxBFN2wiUIUlN4=;
  b=EqBwg0fadRl+NHqTHlpaBiGdkHzWf0oHJBf81u225ShelIU9wDgL61tx
   RxiKPmCUZOMSUThCZ89AYMO+JI2KrA/ee29TKeN9rUkx8dH+LFZumhszc
   TV2t73pZwUhRjoFKrFcU/zP1bAGuivud4TirQrcl0dzv5FsHm+m5lCWT2
   VMw/++kwICoO9UysOyzmbrJ3Ee67wZa2i5AXUxGfwKMmEGKoGNmoAZi8f
   vRTuPWr8pZs0w4+jqZRb8/rf32MS7xeEl9UGJ0Q3muYCIp0d+eQwxHnk2
   FtsARB6+CVry8aEAIs/InWwnxgj0ocWpemRIXmLscWwjZ2/ZpjSgVFseM
   Q==;
X-CSE-ConnectionGUID: 0cqTR8sISF2NH0uri8sekw==
X-CSE-MsgGUID: GvU5GuQuTZuQ4qkZ8uk2Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83821083"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83821083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:22:20 -0700
X-CSE-ConnectionGUID: jzTsw+IWQYyr2jygOMCXoA==
X-CSE-MsgGUID: n2le+QuLS2ukkPTrvGYGOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="276325389"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:22:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 16:22:13 +0300 (EEST)
To: Armin Wolf <W_Armin@gmx.de>
cc: matan@svgalib.org, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] platform/x86: lg-laptop: Fix keyboard backlight
 support on LG Gram 16T90SP
In-Reply-To: <20260622193914.116999-6-W_Armin@gmx.de>
Message-ID: <6d134940-9dba-cc0d-dfb0-a375c4071310@linux.intel.com>
References: <20260622193914.116999-1-W_Armin@gmx.de> <20260622193914.116999-6-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Jun 2026, Armin Wolf wrote:

> On the LG Gram 16T90SP, the ACPI firmware will only accept the values
> 0x80, 0xA2 and 0xA4 when setting the keyboard backlight. After a bit
> of research using ACPI tables from older models it seems that bit 8
> is supposed to be always written as 1.
> 
> Fix the keyboard backlight support on this model by always setting
> bit 8 inside the argument passed to the WMAB ACPI control method.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/lg-laptop.c | 47 ++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index d1b33a6b5206..22f8a6368f7c 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -86,6 +86,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware debug messages");
>  #define WMBB_USB_CHARGE 0x10B
>  #define WMBB_BATT_LIMIT 0x10C
>  
> +#define KBD_LED_BRIGHTNESS_MASK GENMASK(4, 0)
> +#define KBD_LED_BRIGHTNESS_OFF	0x0
> +#define KBD_LED_BRIGHTNESS_HALF 0x2
> +#define KBD_LED_BRIGHTNESS_FULL 0x4
> +#define KBD_LED_MODE_MASK	GENMASK(6, 5)

bits.h needed.

> +#define KBD_LED_MODE_OFF	0x0
> +#define KBD_LED_MODE_ON		0x1
> +#define KBD_LED_STATUS		BIT(7)
> +#define KBD_LED_MAGIC_MASK	GENMASK(15, 8)
> +/* Exact purpose is unknown, maybe some sort of brightness limit? */
> +#define KBD_LED_MAGIC		0x05
> +
>  #define FAN_MODE_LOWER GENMASK(1, 0)
>  #define FAN_MODE_UPPER GENMASK(5, 4)
>  
> @@ -601,15 +613,25 @@ static LED_DEVICE(tpad_led, 1, 0);
>  static void kbd_backlight_set(struct led_classdev *cdev,
>  			      enum led_brightness brightness)
>  {
> -	u32 val;
> +	/* Must always be written */
> +	u32 value = KBD_LED_STATUS;
> +	u32 mode, bright;
> +
> +	if (brightness <= LED_OFF) {
> +		mode = KBD_LED_MODE_OFF;
> +		bright = KBD_LED_BRIGHTNESS_OFF;
> +	} else {
> +		mode = KBD_LED_MODE_ON;
> +		if (brightness >= LED_FULL)
> +			bright = KBD_LED_BRIGHTNESS_FULL;
> +		else
> +			bright = KBD_LED_BRIGHTNESS_HALF;
> +	}
>  
> -	val = 0x22;
> -	if (brightness <= LED_OFF)
> -		val = 0;
> -	if (brightness >= LED_FULL)
> -		val = 0x24;
> +	value |= FIELD_PREP(KBD_LED_BRIGHTNESS_MASK, bright);
> +	value |= FIELD_PREP(KBD_LED_MODE_MASK, mode);
>  
> -	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, val);
> +	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, value);
>  }
>  
>  static enum led_brightness get_kbd_backlight_level(struct device *dev)
> @@ -621,13 +643,16 @@ static enum led_brightness get_kbd_backlight_level(struct device *dev)
>  	if (ret < 0)
>  		return LED_OFF;
>  
> -	if ((value & 0xFF00) != 0x0500)
> +	if (FIELD_GET(KBD_LED_MAGIC_MASK, value) != KBD_LED_MAGIC)
> +		return LED_OFF;
> +
> +	if (FIELD_GET(KBD_LED_MODE_MASK, value) == KBD_LED_MODE_OFF)
>  		return LED_OFF;
>  
> -	switch (value & 0x27) {
> -	case 0x24:
> +	switch (FIELD_GET(KBD_LED_BRIGHTNESS_MASK, value)) {
> +	case KBD_LED_BRIGHTNESS_FULL:
>  		return LED_FULL;
> -	case 0x22:
> +	case KBD_LED_BRIGHTNESS_HALF:
>  		return LED_HALF;
>  	default:
>  		return LED_OFF;

Superb, I was already wanting to see this in patch 4 but had enough 
patience to look the subsequent patch first. Thanks for naming them!

-- 
 i.

