Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644980;
	b=22X90v7GBunQTVOJFjTvKfxzguxpo+KbWwEhcU+siCW3LaRE2AkKTeoARYyftVXARA7w
	 h3VrEowUsQOj7a71EnETWDLmjLRmh6Xo6V7L1TwrQhEsSMihzpykefKODMU53H0/sUPm0
	 dihDH9kEVKIkQg8gJnPxTBKEzgZKdS/H7yrFEFIjEXf6YkCR8IRcXo0uNpG/Xb3B2B8Ci
	 Pmd6oi0+1Pfu4lhoyVkeHM4E27iU0F8re76yYK665pbvzTWF8aoAa9T5R1H2OBJVBMKer
	 Z3aa7896CM5BS9hs79NjVDCMI2/GsFywNycmGSIRtlE3OrIpPowWbsv9Xjk7UweIRaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644980;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=kfUNaRZSkv/Ef6A5TUayjRC4WnjLOM5LEmKK/LXlUrI=;
	b=B8DIaKCcSUbj/wo75ygjXf7McJ7OhxDPZTulVc4HAel9kOU5xZqL+mhAF6SZRtubwpf8
	 ZhhSa/TX8l2pO/xoivnmjEVLiDEBYIfeJO355stmozx11e+/jn/i+wxAezt3eMyhXNNpB
	 DUDf96IZ7UuCd7gtrPod9MiMOXQgkNuZiZY0PDq4sociafZe4kRqrPLj5PmfB2K+NkDTs
	 bvpjQpH22OgHpAD0UH1x1VSmQFxoZ9UzZ2QehefhaFFlNKHl0s4j/vmF08IXzXFzFKnGR
	 D4QyYmybl7h3aAAA+zUz0NrwooGLViSAZryl1UHBzy0pFIuuvzUKNE2Yhgvth3LeGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkOmjp4Z;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A13E606A31E;
	Wed, 25 Nov 2026 22:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A13E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkOmjp4Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795644979; x=1827180979;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=n4ELc8L3YaCmsc2ZSu1ax654BvWJDwQmSQMvIGtVfAY=;
  b=nkOmjp4ZKufpOjzYp6AAeW5ziZ1GBrmprH4KgvfvcuNi+Xf5v4HNnPgp
   Ce94SAn0MZIncWQ2vl6XXBUuMQVXbPLq00XAw+K1Tnq+ELh7MW0LavfWZ
   5pcBZYoWsqofYYfIZOass18OGRg43QMHOg75lXuI6XtflPYjWR8IhQfFQ
   ASIi2nNjZSxIJbZnPSRQXGzEgpMQgKPbjzxiP5qe/d6Akb4IboTJ04e9M
   g6x8lkJ0zk82U9x78r7upTZ+IU7GeJLOic/te1yWLRc4AabN2qYCiq5Om
   rNfujyOPtGlvvw51vzVC8Ra7/621ZNzzPPB0FkDo4Y1auXEhILY6Zi2E6
   g==;
X-CSE-ConnectionGUID: RCeHbLIPR165zi8uIqxaQQ==
X-CSE-MsgGUID: Q1B5tyATTlmeBo/Uy8LnOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4542216"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4542216"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:11:41 -0800
X-CSE-ConnectionGUID: ZKtWRnyHS3GlGsbkOc5cxQ==
X-CSE-MsgGUID: Eu09bAPrQe+nNwEE0Ns01w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12411890"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.96])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 14:11:36 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Nov 2026 00:11:33 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: matan@svgalib.org, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    daxter1992@gmail.com
Subject: Re: [PATCH 2/2] platform/x86: lg-laptop: Improve keyboard backlight
 detection
In-Reply-To: <20261121141221.19245-2-W_Armin@gmx.de>
Message-ID: <c7675821-77f4-74e1-280a-0b28e3ae485a@linux.intel.com>
References: <20261121141221.19245-1-W_Armin@gmx.de> <20261121141221.19245-2-W_Armin@gmx.de>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Nov 2026, Armin Wolf wrote:

> Not all devices support the keyboard backlight feature, instead they
> will return an error when trying to read/write the backlight level.
> 
> Avoid registering the associated LED class device on such devices
> by first verifying that reading of the backlight level works. For
> this the get_kbd_backlight_level() function has to be modified to
> stop hiding any errors coming from the WMAB call.
> 
> Reported-by: Carlos Javier Alvarez <daxter1992@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222275
> Tested-by: Carlos Javier Alvarez <daxter1992@gmail.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/platform/x86/lg-laptop.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index a784071de8b3..72955fc868af 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -641,10 +641,10 @@ static enum led_brightness get_kbd_backlight_level(struct device *dev)
>  
>  	ret = lg_wmab_get(dev, WM_KEY_LIGHT, &value);
>  	if (ret < 0)
> -		return LED_OFF;
> +		return ret;
>  
>  	if (FIELD_GET(KBD_LED_MAGIC_MASK, value) != KBD_LED_MAGIC)
> -		return LED_OFF;
> +		return -EIO;

Please check sashiko's complaint about missing error handling.

-- 
 i.
 
>  	if (FIELD_GET(KBD_LED_MODE_MASK, value) == KBD_LED_MODE_OFF)
>  		return LED_OFF;
> @@ -823,6 +823,21 @@ static int lg_laptop_input_init(struct device *dev, acpi_handle handle)
>  	return 0;
>  }
>  
> +static int lg_laptop_kbd_backlight_init(struct device *dev)
> +{
> +	int ret;
> +
> +	/*
> +	 * Devices that do not support the keyboard backlight feature
> +	 * usually return a error when trying to read the backlight level.
> +	 */
> +	ret = get_kbd_backlight_level(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	return devm_led_classdev_register(dev, &kbd_backlight);
> +}
> +
>  static acpi_status lg_laptop_address_space_write(struct device *dev, acpi_physical_address address,
>  						 size_t size, u64 value)
>  {
> @@ -1035,7 +1050,7 @@ static int acpi_probe(struct platform_device *pdev)
>  		battery_limit_use_wmbb = 1;
>  
>  	/* LEDs are optional */
> -	ret = devm_led_classdev_register(&pdev->dev, &kbd_backlight);
> +	ret = lg_laptop_kbd_backlight_init(&pdev->dev);
>  	if (ret < 0)
>  		kbd_backlight_available = false;
>  	else
> 
