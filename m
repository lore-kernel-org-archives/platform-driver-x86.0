Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724B4086A
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Feb 2026 23:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770593581; cv=none; b=V/ClnNrOs+Ml6OG1DzFlO35I3BKwn69X8Y/f8eT76ymiKEy2ewrCaro/GzzU/PEfkQ/DVlb0BmqNXu2gN8rnvXXSEw+URthWzCFdh+gox8evYIs+qPqYkzIfrQW7zZITR4Srx8qBdiFg6UByn2ZjxDsSM6IGOm5yPrNJHptMH1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770593581; c=relaxed/simple;
	bh=fIlK7QXcQbEOELTBSnIUHiLt/Ipmpb5XimFi3VVD5Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMBqqzS7J0FZ2A0Za3TBI4Rodnv0GI7XNAu5mwj1L4yFVeE3E8w4eDkDNOML5v49pmJbd2qRrBXjU/vkyvI80NUw9TYo46weoUKvWMy38aW25HClaoTSfeH3RLdMtYF8Wq83MlCDCeK/ZrGLKwUdsKTOY5WgT7GeDDMwjO6VTyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRIr+M+l; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRIr+M+l"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-658b511573cso6487269a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Feb 2026 15:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770593579; x=1771198379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N0cUIHOaY22OX3GbmfknlDUKE4jVK7lkjhowp9tiO60=;
        b=CRIr+M+lMGCGp+gW5daXFnsAoOOiu9xMozPFIhmg1QYhvyiSJyWM29ARdBPsegTvp/
         FpOCKCiAyOzfn2KHQnNj+VLu97a4EErSlfb8eiNH4K7SFhogKPIxGJX+L55D/+KXw1AN
         6fWLWBfQhFXKFrLSJlX6cOMuD/kyInf0jT3b2qkx7ugCjNBY6Vr/tDM8rRkdP11NokOT
         jxKrod6y30arXxtUW2/WJmUaKCikHhRuXVparowx1jSjjeC6qQEY+YWSt82XkcnDpxFh
         6wtWXYGiGX9KsfIpIlHHI9ndy+qDOJs2vUmGLC9rFRVrEPUUjcJoKCrEJqlnequXJPZ/
         oY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770593579; x=1771198379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0cUIHOaY22OX3GbmfknlDUKE4jVK7lkjhowp9tiO60=;
        b=Qyrbq9qoNQNJ28+pZhxeGeIcStR1c0GPENaMECHXPkG95fi2JNtj8MYQg4CyYuIKhv
         mzQ3iIn0bCdupw/V6oRdhNxf19m7JV6bCERjom/BLEpHUKEEvOolXQIrsuKw4izyPLcp
         bFJ0floftvBZi0Ge2R2RGVoERFWV1YaOpzUwVJe/cydiYicZl5enj+FASKaMelY2kwNK
         +zurTMZS1G59JoNdqbrY8f3fV5osUHpqwBxTHuvqE5bFQp4vR1mKhi8PhHWVoAikSSjS
         oyKwvwLU+f/DsXeOXHCCGTGOLtdJapwjz1DMzkYCjHpZf469m9OtgWjkVjmBYEyfJ4nO
         Pt7g==
X-Forwarded-Encrypted: i=1; AJvYcCX4q4MAF6RsrvJ6WQvGIIQ/R1+KVTg340UaNRoDyGPRoapAHalzscnK6Zo+o8KNBsQBuDgO/DwzDpivrULqX55JmP0z@vger.kernel.org
X-Gm-Message-State: AOJu0YyL2sB+lKRp6E6512eg00MIpsv3lDFSpcG+IUtbXg1eJHx8maK5
	CVAvvN5orevhfCnOpaRv1lFigL/RtAIs8QoQAEgSnEsIXMXA5cwILNBibE7csg==
X-Gm-Gg: AZuq6aKfFdCXdOwWDj2i0SyZn/qMFUitfR33fNa2dCjTxlcw5bNQY0xeagS2Xl1FwI7
	1JkumJEFbNfCkOv671rNkjWrsmQMWARkrSy+uQSTIG/0s5ihgzjYsIU/jWJCdORTa6pkYMP2w6d
	EY4jREoRF80gJA7AfGUBKnRr+KmGigrk904CrQOcYc0Jqm7EpPmehKxOalJIWGVcTD2GcfzaI4y
	N/wnGNW9cCFxiFHOaU+e3Av8sdXcIy+1tq1LjP5OHApxFcvbYcHX4uy2FIybLSNcHPwFDndEj2S
	wT76xG+nKjkE7nNpddB3cWvNr5mg5qce/jqS8OXhxnct9Nu+0ON2EUgL7/CszlclBGGnKhDMOzY
	4JBy/TYDtn4qEge1OnDRwBtbEGCiDheskYx0uJcswD5b6Sthw54zmFLoZqRUknX1cspJCgjyX6I
	RHDA==
X-Received: by 2002:a05:6402:13c1:b0:659:3ff1:58fa with SMTP id 4fb4d7f45d1cf-659843bdc44mr3819193a12.29.1770593578792;
        Sun, 08 Feb 2026 15:32:58 -0800 (PST)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65984024e11sm2362071a12.32.2026.02.08.15.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 15:32:58 -0800 (PST)
Date: Mon, 9 Feb 2026 01:32:57 +0200
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYkdKfP5fg6iywgr@jekhomev>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920200713.20193-2-hansg@kernel.org>

On Sat, Sep 20, 2025 at 10:06:54PM +0200, Hans de Goede wrote:
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Now that gpiolib supports software nodes to describe GPIOs, switch the
> driver away from using GPIO lookup tables for Goodix touchscreens to
> using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.
> 
> Since the tablets are using either Baytrail or Cherryview GPIO
> controllers x86_dev_info structure has been extended to carry gpiochip
> type information so that the code can instantiate correct set of
> software nodes representing the GPIO chip.
> 

Hi, it seems that the mechanism for looking up GPIOs using software
node names is broken now (checked on next-20260503) by commit
e5d527be7e6984882306b49c067f1fec18920735 "gpio: swnode: don't use the swnode's name as the key for GPIO lookup".

As I understand, some of the issues caused by it were addressed in the
series [1], but not for the x86-android-tablets driver. Now any GPIO
belonging to SoC's gpiochips cannot be found by drivers. For example,
for the Lenovo YB1-X90F keyboard touchpad:

[   27.297279] i2c i2c-goodix_ts: bus: 'i2c': __driver_probe_device: matched device with driver Goodix-TS
[   27.297285] i2c i2c-goodix_ts: bus: 'i2c': really_probe: probing driver Goodix-TS with device
[   27.297291] Goodix-TS i2c-goodix_ts: no default pinctrl state
[   27.297330] Goodix-TS i2c-goodix_ts: supply AVDD28 not found, using dummy regulator
[   27.297359] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_add
[   27.297454] devices_kset: Moving i2c-goodix_ts to end of list
[   27.297459] PM: Moving i2c:i2c-goodix_ts to end of list
[   27.297463] Goodix-TS i2c-goodix_ts: Linked as a consumer to regulator.0
[   27.297472] Goodix-TS i2c-goodix_ts: supply VDDIO not found, using dummy regulator
[   27.297492] Goodix-TS i2c-goodix_ts: using swnode 'node11' for 'irq' GPIO lookup
[   27.297505] Goodix-TS i2c-goodix_ts: No GPIO consumer irq found
[   27.297511] Goodix-TS i2c-goodix_ts: error -EPROBE_DEFER: Failed to get irq GPIO
[   27.297552] Goodix-TS i2c-goodix_ts: Dropping the link to regulator.0
[   27.297558] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_unregister
[   27.297612] Goodix-TS i2c-goodix_ts: Driver Goodix-TS requests probe deferral
[   27.297624] i2c i2c-goodix_ts: Added to deferred list

Could somebody advise on how to fix this, or does a fix already exist? I am
not familiar with the swnode/fwnode framework but can do some investigation to
resolve this.

1. https://lore.kernel.org/linux-sound/20251120-reset-gpios-swnodes-v7-0-a100493a0f4b@linaro.org/

-- 
Yauhen Kharuzhy
