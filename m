Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FCE37BE93
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 14:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770648119; cv=none; b=VsEiiDF8iF650VyL80aixEo8hmz1YiASPbUjIIJFcNl4l5nerhWTt6M7LxTl4SUkk/iAhuv5ysz4E1dz/i8O/RrW3bnJPTe3vxO8slqPRhe7xrH0k3a7i6xr9RC+kBm6eW0DtDuzAfmpsesz9EYxql3TLZAZZPSlk/eUT64TR3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770648119; c=relaxed/simple;
	bh=IqG1cP3Q0OBjMgGP62/fDVh9r+OEv7Mh+FPXxz8Phfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWqtRxUqvzXcxXvmbteLnaVuOKzMdBvvh5kO5ZHQyrsBMCPGiXyLImfVTjxsD0GcwpMJ6hU5MYQkIEu9aDKZSzSi7C/n3ZPUGbgBElyQTCAmEUUXGn9Ar+uL1tLarIxi2gjY/3vdwPtxdg9BtxPNSk2ZpP9QlqcRRM6GJ0rQefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Atkal46C; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Atkal46C"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b81ebac5d6so5048132eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 06:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770648118; x=1771252918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdlCJy6US3+xhq7YYis9i3kySNQVu935gP24z6xev5U=;
        b=Atkal46CH6u6YzwOS6GMS4Um7QkxEsSOIVC5dKfGvKgYIXSvFF6S9enmZ7kRxFTxpA
         hSIYRav74cm+eeaTGpZ6t9HrEf17uK2GHkXiCaelLidUJ85I0o5sHY4b4r1f818Dt4/t
         XXjTmj6N/3gd8r/Vxg0D0qepcdYFzw22tX0AZjlG5KgVlGaOn56D2RnO0MniiFz6GnpL
         NjCrwhpGJPI6v4VVnOH+sGrkn7ni/Dg9rP+YSEKqzyNddxgrXHrXMnHZVD0AHC9NMFoE
         oIugT2XOm6cvfxoCzkr2lRVVzRlTxr6VYafvjTwWRKYMbHYvTXMLUn8bwXi3KoK7Stfj
         oAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770648118; x=1771252918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdlCJy6US3+xhq7YYis9i3kySNQVu935gP24z6xev5U=;
        b=ndohoDc83YBpFHgzH0G0Gnx45HKKQ6UmNwbk89lqF1J12K+amXsHds3N75HHKdpIDX
         8FruhDkhE8FfYfdKR/myruR7dWHc3XYnDkYT9b2bnfp6h9vTXCxoH8lE5I7DAW3Uzndm
         WXiwOxIODSwUkIzubVE/nesDePMvknxHG60XXC/5f2QP9iSjZ2mW0p5dIflKhHucD0bh
         Z/Pc5up0Wu9tA3lZhhFpD3PR3uBpIh9TjCQ8JSXY2sQOf9NYjicOch3VGPnPSzW09+cT
         N/hPPz7XZAMXOwaRLJo5KIxXypEFQGGcXJ6Mgt5MAjI3xI7+zWBv/jYwKBIpDZ1shJdY
         7UZA==
X-Forwarded-Encrypted: i=1; AJvYcCWzljVWjzabNeVLncbgzRt1AgyKnqPKyd6kmneDofVEdJnIRvHiS+arR/OYaVNXurqZoIprEayvXVIcUx2RR1LyxRu8@vger.kernel.org
X-Gm-Message-State: AOJu0YwrZKzBN46wRn7hDJx8DQyJe0Z+J0whL7jRQTxqH8D80wXjRREy
	AtpyXPIyBjw0x2PD6Vpc265woORf0JKbxOWaTuId//TqfaTZx2jB7ezR
X-Gm-Gg: AZuq6aIr//t1xLih/6ldK+bBe2Vl2eFcmh7FdWKwlgohJy3QXcc60JJJSYfUOFEgslL
	J5v+tgtNvdR/cRNkTjuTQwB/mzbnEJ02O7PXI0JCUI5pu8KrNCFfOa90FXeyc+bcwWhtrBQDvpY
	vbrRY1jKkXuoSTR+6rM1GSyD/KPTJyXfGvwHBsuz2zWedet1iyEXIBWocXTZ7P4eIjgDGpC/eKW
	NOM6W+AHjLZGboAvyicmyB2k4neuFMXXeFNlvJQuH/44ALT1gJah2dJFt8DDXnYQCvqGhVwLXG/
	eiQHwDplvQdI1b5dF4Y97N0KK6MRB6X/HH4gRM8o1hdSpS3FsEqPND21ua7++azTyQdQC0Bh5Hd
	nL1UnUquuAhkwTkngwnITSQX42PaNjybsZ2Rpc4jvguLcuAxPlmVYLcfq1122/hiZL1Yoke9138
	wgy1YbaWSmhUh39RvDfl+fnU6mjI4V9h9bJSlsth7mAuXb5KJpZFDllBSOBKtg
X-Received: by 2002:a05:7301:1988:b0:2b0:59da:f799 with SMTP id 5a478bee46e88-2b85645ef43mr4780091eec.5.1770648117994;
        Mon, 09 Feb 2026 06:41:57 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855b0f624sm8628684eec.14.2026.02.09.06.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:41:57 -0800 (PST)
Date: Mon, 9 Feb 2026 06:41:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYnqY4KPq2Gqj3Dv@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>

Hi Bartosz, Hans,

On Mon, Feb 09, 2026 at 03:00:40PM +0100, Hans de Goede wrote:
> Hi Bartosz,
> 
> On 9-Feb-26 12:52, Bartosz Golaszewski wrote:
> > On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko
> > <andriy.shevchenko@intel.com> said:
> >> +Cc: Bart.
> >>
> >> On Mon, Feb 09, 2026 at 01:32:57AM +0200, Yauhen Kharuzhy wrote:
> >>> On Sat, Sep 20, 2025 at 10:06:54PM +0200, Hans de Goede wrote:
> >>
> >>>> Now that gpiolib supports software nodes to describe GPIOs, switch the
> >>>> driver away from using GPIO lookup tables for Goodix touchscreens to
> >>>> using PROPERTY_ENTRY_GPIO() to keep all touchscreen properties together.
> >>>>
> >>>> Since the tablets are using either Baytrail or Cherryview GPIO
> >>>> controllers x86_dev_info structure has been extended to carry gpiochip
> >>>> type information so that the code can instantiate correct set of
> >>>> software nodes representing the GPIO chip.
> >>>
> >>> Hi, it seems that the mechanism for looking up GPIOs using software
> >>> node names is broken now (checked on next-20260503) by commit
> >>> e5d527be7e6984882306b49c067f1fec18920735 "gpio: swnode: don't use the swnode's name as the key for GPIO lookup".
> >>>
> >>> As I understand, some of the issues caused by it were addressed in the
> >>> series [1], but not for the x86-android-tablets driver. Now any GPIO
> >>> belonging to SoC's gpiochips cannot be found by drivers. For example,
> >>> for the Lenovo YB1-X90F keyboard touchpad:
> >>>
> >>> [   27.297279] i2c i2c-goodix_ts: bus: 'i2c': __driver_probe_device: matched device with driver Goodix-TS
> >>> [   27.297285] i2c i2c-goodix_ts: bus: 'i2c': really_probe: probing driver Goodix-TS with device
> >>> [   27.297291] Goodix-TS i2c-goodix_ts: no default pinctrl state
> >>> [   27.297330] Goodix-TS i2c-goodix_ts: supply AVDD28 not found, using dummy regulator
> >>> [   27.297359] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_add
> >>> [   27.297454] devices_kset: Moving i2c-goodix_ts to end of list
> >>> [   27.297459] PM: Moving i2c:i2c-goodix_ts to end of list
> >>> [   27.297463] Goodix-TS i2c-goodix_ts: Linked as a consumer to regulator.0
> >>> [   27.297472] Goodix-TS i2c-goodix_ts: supply VDDIO not found, using dummy regulator
> >>> [   27.297492] Goodix-TS i2c-goodix_ts: using swnode 'node11' for 'irq' GPIO lookup
> >>> [   27.297505] Goodix-TS i2c-goodix_ts: No GPIO consumer irq found
> >>> [   27.297511] Goodix-TS i2c-goodix_ts: error -EPROBE_DEFER: Failed to get irq GPIO
> >>> [   27.297552] Goodix-TS i2c-goodix_ts: Dropping the link to regulator.0
> >>> [   27.297558] device: 'regulator:regulator.0--i2c:i2c-goodix_ts': device_unregister
> >>> [   27.297612] Goodix-TS i2c-goodix_ts: Driver Goodix-TS requests probe deferral
> >>> [   27.297624] i2c i2c-goodix_ts: Added to deferred list
> >>>
> >>> Could somebody advise on how to fix this, or does a fix already exist? I am
> >>> not familiar with the swnode/fwnode framework but can do some investigation to
> >>> resolve this.
> >>>
> > 
> > I really don't want to revert to the label lookup and string comparison as this
> > is totally broken

I would start with explaining why exactly this is broken. So far the
explanation has been:

"
    Looking up a GPIO controller by label that is the name of the software
    node is wonky at best - the GPIO controller driver is free to set
    a different label than the name of its firmware node. We're already being
    passed a firmware node handle attached to the GPIO device to
    swnode_get_gpio_device() so use it instead for a more precise lookup.
"
 
This is weak. Indeed the controller is free to select a different label,
breaking the link. This is a weakness of software nodes in general,
where we do not have a mechanism to validate the scheme.

However switching to matching strictly by fwnode requires knowledge of
the instance of the fwnode. This may work OK-ish for some drivers but
breaks for the main intended users of this: legacy board files, where we
want to specify static mappings and do not want to "reach" into
individual gpiochip drivers to fish out the actual firmware node.

From the docs that were accepted (Documentation/driver-api/gpio/board.rst)

"
    The software node representing a GPIO controller need not be attached to the
    GPIO controller device. The only requirement is that the node must be
    registered and its name must match the GPIO controller's label.
"

Note that this is different from OF or ACPI nodes because there parsing
and creating nodes is a separate process. You get the whole graph
available to you right away, so it is possible to know the exact node
you are referencing.

This is what I wrote to Hans when he raised his concerns:

"
    I agree it is a bit weird, but this allows to disconnect the board file
    from the GPIO driver and makes it easier to convert to device tree down
    the road as it can be done in a piecemeal fashion. If you want fwnode
    actually attached to the gpiochip then:

    1. You can't really have static/const initializers in most of the cases
    2. Fishing it out from an unrelated subsystem is much harder than
    matching on a name.
"

> > so let me help you.
> > 
> > The fix should be relatively easy - we need the address of the software node
> > associated with the GPIO chip we want to get the pin from, and we can reference
> > it using the PROPERTY_ENTRY_GPIO() macro in the software node of the consumer.
> > 
> > Can you point me to the place in code where this fails? Is this
> > drivers/platform/x86/lenovo/yogabook.c? This is the only place where
> > "i2c-goodix_ts" if even referenced upstream. If you could enable
> > CONFIG_DEBUG_GPIO and post the kernel log somewhere, it would help me too.
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

I think the hardest breakages are here:

arch/arm/mach-omap1/board-nokia770.c
arch/arm/mach-pxa/gumstix.c
arch/arm/mach-pxa/spitz.c
arch/arm/mach-tegra/board-paz00.c

If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
can see it does not even have a fwnode assigned: it either does not have
parent or its parent is a platform device instantiated by the driver
itself and does not have a firmware node associated with it.

So in the end name matching allows weakly referencing objects elsewhere
in the kernel for legacy and one-off devices.

Maybe we should allow for both? Do a fwnode lookup and when it fails
fall back to matching on name?

Thanks.

-- 
Dmitry
