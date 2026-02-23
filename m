Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501EF27E049;
	Mon, 23 Feb 2026 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771857735; cv=none; b=nUXxp6ecnNUlj68qybBXIPzbHNUJBjg2B7GIIVS2czFItGLZjvJN88RllY55C/LzjuMcZwlT2G4iE8l4aX9rWNIq+I6AZR4qZzUNPYzJPHfwdrrHq9+emE60zPNPuW8wq0tM5atAuL0fW0fBg5rLHy6wO7+96qTFZd3JG2iAYHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771857735; c=relaxed/simple;
	bh=q1tabiFh7bTYC3wCzVueUFfJd3m12smkP6NKuRD/1cA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RG/bV3PfLc/zpY1ldy6Jf5+wEMPb3hIVdniC2wJ0TGk2vG1Or9lBTaTWzDbdPfv9xZFpZSJbBRKVDUA4vevdIogLpQIlHyCobLtFxd0tJFpobN7IXQuAWhbTTyo6kryIw1027nmbBN1qY4l2HYFAqv1KljEyN8ISiQ5LNO6XnOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M21aNhFG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M21aNhFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771857734; x=1803393734;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=q1tabiFh7bTYC3wCzVueUFfJd3m12smkP6NKuRD/1cA=;
  b=M21aNhFG86ERdn1fXUu/wVIEQnWU0ptUfStHH261ex+tmeDzgAlfVMky
   ejnqzfD/RMxgkTW6nNTSQZ81zxIKcn3tnBRs8pI51VijHVETTfyfTe036
   mIyGLBDnaq6xMuQ57BKkaoqiKHxgiExi0XHlO92pmMzMgQAGV0rAfBiyV
   EFLQOxawnvSaeV6B21q3e7bWADQ2nq2d0dZpVRdgFWxGwptl7JfId+f2v
   HufUJJfM31CwDYjlGCcLlJhmy+CuDIQfcQ0aZLZ+mBb6lMNdYS9Dirpkd
   k0NC6C8NiYoXq+8iytJmln6/neXJ7HS5a+f0a/b/EXOXCWEOzsHGuF8ll
   A==;
X-CSE-ConnectionGUID: TMiSOaHfRZeZ5vmpFGNm2w==
X-CSE-MsgGUID: 9Sj94iF9RTCfX5SJ4gTT5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72062668"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72062668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:42:13 -0800
X-CSE-ConnectionGUID: n+tk2hWlR76YVYtTcCi1iQ==
X-CSE-MsgGUID: zCVQVGwFTBCgtodI8apn/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="215428967"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.30])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 06:42:10 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Feb 2026 16:42:06 +0200 (EET)
To: Denis Benato <denis.benato@linux.dev>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>, 
    Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: fix screenpad brightness
 scaling
In-Reply-To: <20260212220252.1526337-3-denis.benato@linux.dev>
Message-ID: <fc9bf191-5795-e29d-7e64-b2bb97d8639b@linux.intel.com>
References: <20260212220252.1526337-1-denis.benato@linux.dev> <20260212220252.1526337-3-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Feb 2026, Denis Benato wrote:

> Fix incorrect brightness scaling by removing the inconsistent use of an
> arbitrary minimum.
> 
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Luke Jones <luke@ljones.dev>

Should this have a Fixes tag?

> ---
>  drivers/platform/x86/asus-wmi.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 4130dae37e15..5443aaf99e38 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -125,7 +125,6 @@ module_param(fnlock_default, bool, 0444);
>  #define NVIDIA_TEMP_MIN		75
>  #define NVIDIA_TEMP_MAX		87
>  
> -#define ASUS_SCREENPAD_BRIGHT_MIN 20
>  #define ASUS_SCREENPAD_BRIGHT_MAX 255
>  #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>  
> @@ -4243,13 +4242,13 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>  		return err;
>  	/* The device brightness can only be read if powered, so return stored */
>  	if (err == BACKLIGHT_POWER_OFF)
> -		return asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> +		return bd->props.brightness;
>  
>  	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &retval);
>  	if (err < 0)
>  		return err;
>  
> -	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) - ASUS_SCREENPAD_BRIGHT_MIN;
> +	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK);
>  }
>  
>  static int update_screenpad_bl_status(struct backlight_device *bd)
> @@ -4289,22 +4288,19 @@ static int asus_screenpad_init(struct asus_wmi *asus)
>  	int err, power;
>  	int brightness = 0;
>  
> -	power = read_screenpad_backlight_power(asus);
> +	power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
>  	if (power < 0)
>  		return power;
>  
> -	if (power != BACKLIGHT_POWER_OFF) {
> +	if (power) {
>  		err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
>  		if (err < 0)
>  			return err;
>  	}
> -	/* default to an acceptable min brightness on boot if too low */
> -	if (brightness < ASUS_SCREENPAD_BRIGHT_MIN)
> -		brightness = ASUS_SCREENPAD_BRIGHT_DEFAULT;

This doesn't seem to be related to the scaling but looks a lowerbound? 
Probably removing it would warrant own patch + justification, IMO.

>  	memset(&props, 0, sizeof(struct backlight_properties));
>  	props.type = BACKLIGHT_RAW; /* ensure this bd is last to be picked */
> -	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX - ASUS_SCREENPAD_BRIGHT_MIN;
> +	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX;
>  	bd = backlight_device_register("asus_screenpad",
>  				       &asus->platform_device->dev, asus,
>  				       &asus_screenpad_bl_ops, &props);
> @@ -4315,7 +4311,7 @@ static int asus_screenpad_init(struct asus_wmi *asus)
>  
>  	asus->screenpad_backlight_device = bd;
>  	asus->driver->screenpad_brightness = brightness;
> -	bd->props.brightness = brightness - ASUS_SCREENPAD_BRIGHT_MIN;
> +	bd->props.brightness = brightness;
>  	bd->props.power = power;
>  	backlight_update_status(bd);
>  
> 

--
 i.


