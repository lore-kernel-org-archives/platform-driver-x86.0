Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD42F3618
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637958; cv=none; b=Bpz3IX2e4cVK2OcmM+yF/ucdnS7svrutTeTsGpxPMB+S4uvrYLMYosDOSSUACOD3xD1uBJzplBPHnEXxs2tknqdFWgStpGTanavxJrvw9CPWf5BDJyP4jLJ2R20Wc/kWAd7SWz6GruNZlri3gdBOo1Yd53GqE76bXeWX4PvNr68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637958; c=relaxed/simple;
	bh=yCITRcWWy80bXr+Z/cJPFp2UH3PTE3pxF+Fin/baCM8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URbNn1cCpKZc0AA8UrIQ2aoC6IEk1Img/KtDsXMFT9kUhrZrObKaP/J1Gzat5ghlN7avtmCFE+5+DxatfDfeeMZfnphwV1ws05T2X1Ac5CdkjPq9XikpHqhhyukN+wprAmkz0qndGFcpRaoJ3vuI6XfurnEgrfyaaPDycTtnuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBWtxx5E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBWtxx5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559B3C2BC87
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770637958;
	bh=yCITRcWWy80bXr+Z/cJPFp2UH3PTE3pxF+Fin/baCM8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=SBWtxx5E0aOUWPoH4zjCvcwNUipXZEsD133JHf3hcM+ctmUvJft211jCmP/JcIRTW
	 92E9mEKQHzEHeOKNX2yUwDbtik+b73HQ64DpeQje2yVNWP+lFz44UGaVA0tXiZLq15
	 BwHEHibwAtuA52gjmpekv7ShkR+VuIj99BNx+V0ond1iYNvl7Me5AhH7UZwNjJjdbR
	 M3HFjXg/MjlTMeRASjeLywqOtUYh6bBCaCFgnvQ4130IGk32+UnAKbbmuxzXWhffm8
	 i40MxdKIbm21h5AFMM07rt1XrjY8HtCZpTju5Aii02mAwqAG4IQ5u8BItyB+NHVXT9
	 t8WdgidA+9Rwg==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dd490be5fso4874064e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 03:52:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOGkMtqoILwGoGLAY2RxB/sMFTdFntS5P8g36cTJax1M0tceeiiG8zpyKa5PEwjty+DpaHvSDAUZr9EEcK06jD34JY@vger.kernel.org
X-Gm-Message-State: AOJu0YzpAZp67im+yROKVnm0ZLCEKjcVWdfa+J5NXZT/2uiX7LVAgQNH
	vZVtZdpb/bXY65VfbeNDNN5bq0ydVpo+pdCF7tayqSho11d+3Cg1IgwOwzIObgqUMVb+hkm40be
	q5IVDNSfBreK6AMVyr6a5shrp6qQswg+oIN+Qc0zqfA==
X-Received: by 2002:a05:6512:118d:b0:59e:17b:f4ce with SMTP id
 2adb3069b0e04-59e4516974cmr3578468e87.50.1770637956929; Mon, 09 Feb 2026
 03:52:36 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:52:35 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 05:52:35 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aYmV5Axyfo76D19T@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
Date: Mon, 9 Feb 2026 05:52:35 -0600
X-Gmail-Original-Message-ID: <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
X-Gm-Features: AZwV_QjBG6HflQsGqx1j3Sx3aP35lDYf_L4VdsoHMEbYHic0yMhvG0zG9XT_teg
Message-ID: <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko
<andriy.shevchenko@intel.com> said:
> +Cc: Bart.
>
> On Mon, Feb 09, 2026 at 01:32:57AM +0200, Yauhen Kharuzhy wrote:
>> On Sat, Sep 20, 2025 at 10:06:54PM +0200, Hans de Goede wrote:
>
>> > Now that gpiolib supports software nodes to describe GPIOs, switch the
>> > driver away from using GPIO lookup tables for Goodix touchscreens to
>> > using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.
>> >
>> > Since the tablets are using either Baytrail or Cherryview GPIO
>> > controllers x86_dev_info structure has been extended to carry gpiochip
>> > type information so that the code can instantiate correct set of
>> > software nodes representing the GPIO chip.
>>
>> Hi, it seems that the mechanism for looking up GPIOs using software
>> node names is broken now (checked on next-20260503) by commit
>> e5d527be7e6984882306b49c067f1fec18920735 "gpio: swnode: don't use the swnode's name as the key for GPIO lookup".
>>
>> As I understand, some of the issues caused by it were addressed in the
>> series [1], but not for the x86-android-tablets driver. Now any GPIO
>> belonging to SoC's gpiochips cannot be found by drivers. For example,
>> for the Lenovo YB1-X90F keyboard touchpad:
>>
>> [   27.297279] i2c i2c-goodix_ts: bus: 'i2c': __driver_probe_device: matched device with driver Goodix-TS
>> [   27.297285] i2c i2c-goodix_ts: bus: 'i2c': really_probe: probing driver Goodix-TS with device
>> [   27.297291] Goodix-TS i2c-goodix_ts: no default pinctrl state
>> [   27.297330] Goodix-TS i2c-goodix_ts: supply AVDD28 not found, using dummy regulator
>> [   27.297359] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_add
>> [   27.297454] devices_kset: Moving i2c-goodix_ts to end of list
>> [   27.297459] PM: Moving i2c:i2c-goodix_ts to end of list
>> [   27.297463] Goodix-TS i2c-goodix_ts: Linked as a consumer to regulator.0
>> [   27.297472] Goodix-TS i2c-goodix_ts: supply VDDIO not found, using dummy regulator
>> [   27.297492] Goodix-TS i2c-goodix_ts: using swnode 'node11' for 'irq' GPIO lookup
>> [   27.297505] Goodix-TS i2c-goodix_ts: No GPIO consumer irq found
>> [   27.297511] Goodix-TS i2c-goodix_ts: error -EPROBE_DEFER: Failed to get irq GPIO
>> [   27.297552] Goodix-TS i2c-goodix_ts: Dropping the link to regulator.0
>> [   27.297558] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_unregister
>> [   27.297612] Goodix-TS i2c-goodix_ts: Driver Goodix-TS requests probe deferral
>> [   27.297624] i2c i2c-goodix_ts: Added to deferred list
>>
>> Could somebody advise on how to fix this, or does a fix already exist? I am
>> not familiar with the swnode/fwnode framework but can do some investigation to
>> resolve this.
>>

I really don't want to revert to the label lookup and string comparison as this
is totally broken so let me help you.

The fix should be relatively easy - we need the address of the software node
associated with the GPIO chip we want to get the pin from, and we can reference
it using the PROPERTY_ENTRY_GPIO() macro in the software node of the consumer.

Can you point me to the place in code where this fails? Is this
drivers/platform/x86/lenovo/yogabook.c? This is the only place where
"i2c-goodix_ts" if even referenced upstream. If you could enable
CONFIG_DEBUG_GPIO and post the kernel log somewhere, it would help me too.

Bartosz
