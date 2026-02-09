Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65713125B2
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 14:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647764; cv=none; b=ibl7CCOHbUl9YwI+XaRlbEMw1E+aoDHPGtXAR7UEZ1X0yoDu3RVanK/7qaEirzYH4fFXB3iDfu28PbzGQJ6+dgWievs+eHkUJH/VRt1PuAYRblFlBMBmlVkcz1S/fSJMcRwBeU1E79sUGRaTMVUmhMegVeBYg+cGNJeZxsWRvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647764; c=relaxed/simple;
	bh=R53fnCBHiZFRQl0qgCtqJPngS1trTrbvzV36Pk9Jthc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUI+h8zrr1TvnWNOzLMrAihbaRfCcYgK0bssIXH1FXxWdI/hlAyAyT0ASzxJUM8r6D+Lvk+6NY+kInjNUPsiqGpz+2JR7Q4JNtV8w9PYfzaPIi8cqbAqlOb1yq8WVxdIuJMp8t3g5BfGzyuC9yWxvkhHMnby9TcEHcVRGW2L2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbnSOkPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbnSOkPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE85C19422
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 14:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647764;
	bh=R53fnCBHiZFRQl0qgCtqJPngS1trTrbvzV36Pk9Jthc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=lbnSOkPhAOoKPFC2brLjWiMzGmbZWleqZWEYMBKn5KN3w8l6QcZnnnT7ZVw8oGNir
	 TdjF9F6/5ex1vbNzoo9muXAS/RyiW5nhUCWQlHoo0OJkoDJ0Av3K7w2usK5l1TvZlW
	 q25KX84AT6djHHnshC/i+69tkaIObhRIGusvFBWzU3xJSveXa+FdCb1jXokme6HXfS
	 xvgOr8sya3sPOPgH4in24NfUOKvNHioPtrm+XkHLq1YWr7r3kmKUoR4QwqBEljGjsq
	 w8+sPNBFxIzdIRjd6pl1guyZiz3QwrH052gHd8NWsQqTtIauDAIEkmKnKPjWNrh3Y5
	 +t66TrZxgmB8w==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38316d0c26eso26593491fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 06:36:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfp9Db4BN0EgRKwfkVxC35NMoh2ZYsITFVNuaE2gDY4oRzl1WhV3tvHjltn/x5fNFWD2G2D7Jf0wZk3qQFm/glBOjX@vger.kernel.org
X-Gm-Message-State: AOJu0YwLJlF176Nc1kv0ymd8YYnorfRlNpZgauGNP0TiA0KBCqLrYo43
	ecrUW9vPJf/TIOw3LX18q3vhA0KgsPFrmiNz2h4bywLjPVDjfggVsxlgXNiCwG9cb7HrB2ZmczE
	pTnPETdUqAX5evTrgOJV8YIJJdHMoRFqcHT0wAN0HnA==
X-Received: by 2002:a05:651c:1542:b0:386:e7a5:e26d with SMTP id
 38308e7fff4ca-386e7a5e46bmr3154751fa.2.1770647762715; Mon, 09 Feb 2026
 06:36:02 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 08:36:01 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 08:36:01 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com> <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
Date: Mon, 9 Feb 2026 08:36:01 -0600
X-Gmail-Original-Message-ID: <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
X-Gm-Features: AZwV_QhiNJgbXC5m7Uvi9DExi7x2cAcbvmrVA8mpYVF_StWfkCpa71ByhPOpnxI
Message-ID: <CAMRc=MfMw85D3FoX0ckAxgEyY8D3ZK5uf9sgVXg7_f+mE55dRg@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Hans de Goede <hansg@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Feb 2026 15:00:40 +0100, Hans de Goede <hansg@kernel.org> said:
> Hi Bartosz,
>
> On 9-Feb-26 12:52, Bartosz Golaszewski wrote:
>> On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko
>> <andriy.shevchenko@intel.com> said:
>>> +Cc: Bart.
>>>
>>> On Mon, Feb 09, 2026 at 01:32:57AM +0200, Yauhen Kharuzhy wrote:
>>>> On Sat, Sep 20, 2025 at 10:06:54PM +0200, Hans de Goede wrote:
>>>
>>>>> Now that gpiolib supports software nodes to describe GPIOs, switch the
>>>>> driver away from using GPIO lookup tables for Goodix touchscreens to
>>>>> using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.
>>>>>
>>>>> Since the tablets are using either Baytrail or Cherryview GPIO
>>>>> controllers x86_dev_info structure has been extended to carry gpiochip
>>>>> type information so that the code can instantiate correct set of
>>>>> software nodes representing the GPIO chip.
>>>>
>>>> Hi, it seems that the mechanism for looking up GPIOs using software
>>>> node names is broken now (checked on next-20260503) by commit
>>>> e5d527be7e6984882306b49c067f1fec18920735 "gpio: swnode: don't use the swnode's name as the key for GPIO lookup".
>>>>
>>>> As I understand, some of the issues caused by it were addressed in the
>>>> series [1], but not for the x86-android-tablets driver. Now any GPIO
>>>> belonging to SoC's gpiochips cannot be found by drivers. For example,
>>>> for the Lenovo YB1-X90F keyboard touchpad:
>>>>
>>>> [   27.297279] i2c i2c-goodix_ts: bus: 'i2c': __driver_probe_device: matched device with driver Goodix-TS
>>>> [   27.297285] i2c i2c-goodix_ts: bus: 'i2c': really_probe: probing driver Goodix-TS with device
>>>> [   27.297291] Goodix-TS i2c-goodix_ts: no default pinctrl state
>>>> [   27.297330] Goodix-TS i2c-goodix_ts: supply AVDD28 not found, using dummy regulator
>>>> [   27.297359] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_add
>>>> [   27.297454] devices_kset: Moving i2c-goodix_ts to end of list
>>>> [   27.297459] PM: Moving i2c:i2c-goodix_ts to end of list
>>>> [   27.297463] Goodix-TS i2c-goodix_ts: Linked as a consumer to regulator.0
>>>> [   27.297472] Goodix-TS i2c-goodix_ts: supply VDDIO not found, using dummy regulator
>>>> [   27.297492] Goodix-TS i2c-goodix_ts: using swnode 'node11' for 'irq' GPIO lookup
>>>> [   27.297505] Goodix-TS i2c-goodix_ts: No GPIO consumer irq found
>>>> [   27.297511] Goodix-TS i2c-goodix_ts: error -EPROBE_DEFER: Failed to get irq GPIO
>>>> [   27.297552] Goodix-TS i2c-goodix_ts: Dropping the link to regulator.0
>>>> [   27.297558] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_unregister
>>>> [   27.297612] Goodix-TS i2c-goodix_ts: Driver Goodix-TS requests probe deferral
>>>> [   27.297624] i2c i2c-goodix_ts: Added to deferred list
>>>>
>>>> Could somebody advise on how to fix this, or does a fix already exist? I am
>>>> not familiar with the swnode/fwnode framework but can do some investigation to
>>>> resolve this.
>>>>
>>
>> I really don't want to revert to the label lookup and string comparison as this
>> is totally broken so let me help you.
>>
>> The fix should be relatively easy - we need the address of the software node
>> associated with the GPIO chip we want to get the pin from, and we can reference
>> it using the PROPERTY_ENTRY_GPIO() macro in the software node of the consumer.
>>
>> Can you point me to the place in code where this fails? Is this
>> drivers/platform/x86/lenovo/yogabook.c? This is the only place where
>> "i2c-goodix_ts" if even referenced upstream. If you could enable
>> CONFIG_DEBUG_GPIO and post the kernel log somewhere, it would help me too.
>
> First of all thank you for your offer to help. I actually pointed out
> that the whole name matching instead of using a fwnode reference was weird
> when a bunch of platform-driver-x86 drivers where first converted from using
> GPIO lookup tables to using swnodes:
>
> https://lore.kernel.org/platform-driver-x86/c60ccef1-7213-4dd7-8c10-e8ef03675bd8@kernel.org/
>
> Dmitry convinced me back then that this is how GPIO controller swnode
> matching was supposed to work and now we are here...
>
> By far the biggest user of the name based matching is
> the drivers/platform/x86/x86-android-tablets code which was moved
> to this recent(ish) by this series:
>
> https://lore.kernel.org/platform-driver-x86/20250920200713.20193-1-hansg@kernel.org/
>

Using swnodes is better than lookup tables granted that we actually use the
swnodes. If we just keep comparing strings and only change the strings we
compare then that doesn't make much sense.

> But there are some other pdx86 files too:
>
> hans@shalem:~/projects/linux$ ack -l PROPERTY_ENTRY_GPIO drivers/platform/x86/
> drivers/platform/x86/x86-android-tablets/lenovo.c
> drivers/platform/x86/x86-android-tablets/acer.c
> drivers/platform/x86/x86-android-tablets/other.c
> drivers/platform/x86/x86-android-tablets/shared-psy-info.c
> drivers/platform/x86/x86-android-tablets/asus.c
> drivers/platform/x86/barco-p50-gpio.c
> drivers/platform/x86/meraki-mx100.c
> drivers/platform/x86/pcengines-apuv2.c
>
> For the drivers/platform/x86/x86-android-tablets/* I think the following
> fix is both the easiest as well as the best solution is to modify:
>
> drivers/pinctrl/intel/pinctrl-baytrail.c
> drivers/pinctrl/intel/pinctrl-cherryview.c
>
> To register a swnode for each GPIO controller and
> then EXPORT_SYMBOL_GPL an array of fwnode pointers
> which can then be used in the PROPERTY_ENTRY_GPIO()
> entries replacing e.g.:
>
> PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[1], 53, GPIO_ACTIVE_HIGH)
>
> with:
>
> PROPERTY_ENTRY_GPIO("reset-gpios", cherryview_gpiochip_fwnodes[1], 53, GPIO_ACTIVE_HIGH)
>
> (these 2 covers pinctrl for the Bay Trail and Cherry Trail x86
> SoC based Android tablets which x86-android-tablets is for).
>
> This should all be pretty straight forward. Assuming we are allowed
> to dereference an external symbol for the property initialization
> if not then this becomes significantly more complex.
>
> I'm not even sure if we need to add swnodes, we can probably
> just use the existing ACPI fwnodes for matching even and then
> we just need an array with the ACPI fwnode pointers.
>

Yes, we can now reference fwnodes from property entries. The entity that
creates these devices should be able to retrieve the firmware nodes of
the GPIO controllers (e.g.: via gpio_device_find_by_label() - finding it by
labek is what it effectively tried to do now).

> ###
>
> Unfortunately this only covers most of the PROPERTY_ENTRY_GPIO()
> swnode props under drivers/platform/x86/x86-android-tablets.
>
> These are still a problem after fixing all the ones referencing
> baytrail / cherryview SoC GPIO controllers:
>
> static const struct property_entry lenovo_yoga_tab2_830_1050_wm1502_props[] = {
>         PROPERTY_ENTRY_GPIO("reset-gpios",
>                             &crystalcove_gpiochip_node, 3, GPIO_ACTIVE_HIGH),
>         PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
>                             &baytrail_gpiochip_nodes[1], 23, GPIO_ACTIVE_HIGH),
>         PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
>                             &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH),
>         PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios",
>                             &arizona_gpiochip_node, 4, GPIO_ACTIVE_LOW),
>         { }
> };
>
> This one gets added to a device dynamically, so we could lookup
> the GPIO controller, attach a swnode and then dynamically generate
> the above properties before attaching them.
>

No need to attach anything - the main firmware node will do as explained
above.

> This one:
>
> static const struct property_entry lenovo_yt3_wm1502_props[] = {
>         PROPERTY_ENTRY_GPIO("wlf,spkvdd-ena-gpios",
>                             &cherryview_gpiochip_nodes[0], 75, GPIO_ACTIVE_HIGH),
>         PROPERTY_ENTRY_GPIO("wlf,ldoena-gpios",
>                             &cherryview_gpiochip_nodes[0], 81, GPIO_ACTIVE_HIGH),
>         PROPERTY_ENTRY_GPIO("reset-gpios", &cherryview_gpiochip_nodes[0], 82, GPIO_ACTIVE_HIGH
>         PROPERTY_ENTRY_GPIO("wlf,micd-pol-gpios", &arizona_gpiochip_node, 2, GPIO_ACTIVE_HIGH)
>         { }
> };
>
> is more complex though, since this is used for a SPI boardinfo swmode, so generating
> this dynamically is going to involve some more rework.
>
> I think it might be best to just at least partially revert:
>
> https://lore.kernel.org/platform-driver-x86/20250920200713.20193-1-hansg@kernel.org/
>
> the main goal there was to stop using the deprecated desc_to_gpio() function
> which was being used for gpio-button platform-data.
>
> We could revert:
>
> [PATCH v4 10/20] platform/x86: x86-android-tablets: remove support for GPIO lookup tables
> [PATCH v4 07/20] platform/x86: x86-android-tablets: convert wm1502
>
> To solve the problematic WM5102 codec lookups for non main Soc GPIOs,
> assuming we can fix the main SoC GPIO fwnode properties.
>
> ###
>
> Note this just solves all the cases under drivers/platform/x86/x86-android-tablets/
> and I'm happy to help testing fixes. This still leaves:
>
> drivers/platform/x86/barco-p50-gpio.c
> drivers/platform/x86/meraki-mx100.c
> drivers/platform/x86/pcengines-apuv2.c
>
> unresolved. I'm less familiar with these and I cannot test fixes for these.

I'm not very fond of going back to comparing swnode names. I'm also not very
happy that this has only been noticed now - this change has been released in
v6.18! I would prefer to just fix the users and I'm ready to help with that.

Bart
