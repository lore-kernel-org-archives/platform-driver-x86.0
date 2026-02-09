Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074138A298
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 17:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770657817; cv=none; b=LahBfo3MReuDZSC+Pftv2zmTLL7cOIrGH9jgZQVV3BbkFW4RFFCYAlJeIdj3nyR/so3yRvlRxrSHXjwRnBNxSIH4g7qcrmnPjqYPLXpm46yi+xKrLlyhrJl+yA+MaGEvdjMUUcPwvqr6hgCufoLlwOsRpvUiP4HOXhskIxBDMLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770657817; c=relaxed/simple;
	bh=NwoT8iBYoY9MZ3Te0H7sAW6j2TJfRl+aES3TbihlPAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da44sVMDadICcvoW4KRp9j3IFrZnXYKSMh0sqQ6iflhY52zQlGn2UEaogEKSoykvAYZSKSB0OKPj0u62N8czAFy9mJXKbEbdQYXIgS6sn3G/EGGaEWrNphyK++B3W4zsGpKuXaTKzAm3lHipx3yixEHLwoa7xKlDnHIAJIWHWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDXVEZjE; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDXVEZjE"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-124a1b4dd40so2659766c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 09:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770657816; x=1771262616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2bqvxp+Ffvj0M+KgR9SWBfP7AHL1dM/Epc0kfWhZik=;
        b=RDXVEZjEgqjJNrOfoVRCWUfQUZ1RlQbPawij/xMJzJOjUs4xmApR5hKlODQmBszX25
         /pn1xmYNuxCTlyRPwlZZnBuxuUM2z+KyAhf+WQJZbfunEFIoUAh30B1Nq6lZuj03jzhA
         1YLxKahvBuGhUFOvr6ujKSxU9TcBKaMt6Cpvs+/5Mve+DPresRbcfPMSYhsyOWmA755C
         oUIHeas29ECChZ9DrYeWE/5yGECVOHxye8dN6soTQpoUB7FZkSIK9VziOgzKArRcAYVZ
         BvMa4sjSpgc93Sqt0Qd/uPSkmxf+FwGVKAVZtuW21tp9/nZhWTT4I0uV1zWXdboBaiI2
         B5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770657816; x=1771262616;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2bqvxp+Ffvj0M+KgR9SWBfP7AHL1dM/Epc0kfWhZik=;
        b=ZNCtFAHQmmPbl1gnddz2DJuS3ZfXdxfzuRCrXjKaszOqX+bJIjSCXKaJTIJRVk/Sk7
         5vrnDq6k7PtvR/Kj8vWFHd7eyYousPL9YLoxOvhz/bhH15r+r9HAjSAgOhaARzcZQ01e
         74NmUcl6LxciLlyUWzmu3NgKz3C4GWLe9DCLPhOXZg7kT9qPBIYtTLQ2O7T5N1JAh+M2
         X3Sg2ZqECkisvMUMCn9VNbdSoBU6KjG5rBfKXKovCfv8N15AGNirTPmDpmTGuc3oC5nn
         wAkvhU7T33g16REIhUqv9m4gtHmUW/eiXB7l4rcuDIHKdInWUnYHEajbE5l4AjkVO9aW
         RgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXv5rh13G1p2kRNeJ3MlZ67XJ0MrVb75kGV9Qc12OVeUGFMmHdwdo7ASta3nxb6kNSg2o4SO8TruexcwiKun0CS1eAE@vger.kernel.org
X-Gm-Message-State: AOJu0YzDXwH+Bk3fJwklcrJbM6B/njfL8jOx7k77M49NXXLzxEhEPYBV
	gHRoouRwHo2J5AJS7dDPneMo0JGCxQukSCxtbApRoOMbbfdVHu/lJmTr
X-Gm-Gg: AZuq6aL3R59oH5whz29TmfbWaCWC0dKGtnEQt6lVCnleY66lMnI26p/gve99sQBpA0L
	/FEeZGaJLIFbI6xTBIRI4EqBo0r18gk4otwepd+OkyBQPqM1/26L/3ZxpMaNGaY7n8CnaU7d0vZ
	zUavx8l1RMWi403kP9zamBMPLlj2B3XMCxAx3KJTDAaknR31cb7rcdPakiBPJibYTnPoLXF8eGV
	jMMNaYrYGXdtd+n8Qh5U1N0EfWxUFBxSailKpBAcorF5HjG3ck6L2IxV+jVBUDnMYtvziZN3iQu
	vbPk1hyF4kHKQa/vBubwXF4pJs42Je6vpNznbfKEwiy9Kblf35BySx4fa/bCnC2VvA/hxn/5VDt
	12ry08GrhncZT2YS1ZyyQGVaAT1gHHVF/J+2ts/PPu2Gs+Qr+WYDNp3zAVTe+7c23U0f5wlCbdu
	PfXbpmCskpP6axLEK5Nj2u/7DM40A6Fwg8uMJ7/GBemMuxot3txBF0RIvm6OKOMg3/sNqt10tk
X-Received: by 2002:a05:7022:4a2:b0:119:e56b:957b with SMTP id a92af1059eb24-12703e8eadamr5801720c88.0.1770657816193;
        Mon, 09 Feb 2026 09:23:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d70d:15:1011:7b14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12715c4dd76sm5251746c88.10.2026.02.09.09.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:23:35 -0800 (PST)
Date: Mon, 9 Feb 2026 09:23:33 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	platform-driver-x86@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
Message-ID: <aYoOKBMAsTuwHKK0@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>

On Mon, Feb 09, 2026 at 10:25:47AM -0600, Bartosz Golaszewski wrote:
> On Mon, 9 Feb 2026 15:41:54 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Hi Bartosz, Hans,
> >
> 
> [snip]
> 
> >> >>>
> >> >>> Could somebody advise on how to fix this, or does a fix already exist? I am
> >> >>> not familiar with the swnode/fwnode framework but can do some investigation to
> >> >>> resolve this.
> >> >>>
> >> >
> >> > I really don't want to revert to the label lookup and string comparison as this
> >> > is totally broken
> >
> > I would start with explaining why exactly this is broken. So far the
> > explanation has been:
> >
> > "
> >     Looking up a GPIO controller by label that is the name of the software
> >     node is wonky at best - the GPIO controller driver is free to set
> >     a different label than the name of its firmware node. We're already being
> >     passed a firmware node handle attached to the GPIO device to
> >     swnode_get_gpio_device() so use it instead for a more precise lookup.
> > "
> >
> > This is weak. Indeed the controller is free to select a different label,
> > breaking the link. This is a weakness of software nodes in general,
> > where we do not have a mechanism to validate the scheme.
> >
> 
> I would even say that if we keep comparing strings, then it's no better
> than GPIO lookup tables.

I would like to stop using lookup tables so that we always excessive the
common (fwnode-based) paths for finding gpios in consumers, and not an
exception like we have with the lookup tables.

> 
> > However switching to matching strictly by fwnode requires knowledge of
> > the instance of the fwnode. This may work OK-ish for some drivers but
> > breaks for the main intended users of this: legacy board files, where we
> > want to specify static mappings and do not want to "reach" into
> > individual gpiochip drivers to fish out the actual firmware node.
> >
> 
> I'm not sure I'm following. We can (and do a lot!) reference static struct
> software_node instances before we register them with driver core, creating
> whole trees of property nodes. I get that here we're talking about *real*
> firmware nodes but see below:

If your fwnode pointer is not a compile-time constant (since you have to
look it up somehow) you can not make corresponding property entries
static constant arrays, and have to build them dynamically (or fix them
up in place after doing the lookup).

> 
> > From the docs that were accepted (Documentation/driver-api/gpio/board.rst)
> 
> Quick `git blame`, `git log`, ah, yes, I signed off on this. I guess it's on
> me now too. :)
> 
> >
> > "
> >     The software node representing a GPIO controller need not be attached to the
> >     GPIO controller device. The only requirement is that the node must be
> >     registered and its name must match the GPIO controller's label.
> > "
> >
> > Note that this is different from OF or ACPI nodes because there parsing
> > and creating nodes is a separate process. You get the whole graph
> > available to you right away, so it is possible to know the exact node
> > you are referencing.
> >
> 
> The device that creates devices not tied to a real OF or ACPI node, is
> typically responsible for creating the software nodes for its children. It
> can check if given GPIO controller already exists (gpio_device_find_by_label())
> and if not - just return -EPROBE_DEFER and not create children. If it does,
> then it can pass its fwnode to the children. A bit like so:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/reset/core.c#n910
> 
> Just with the lookup done by label and not fwnode.

As I mentioned another email, in case of old legacy boards you do not
really have ACPI or OF nodes. If they were there then we would need to
build trees of software nodes, we would simply extend the DTs for them.

> 
> I may have not paid attention to the docs and signed off on it but it doesn't
> make it correct. The strength of software nodes is that we have an actual
> fwnode link between devices. If we just fake this link, then why are we even
> using software nodes at all?

To allow drivers drop hard coded platform data and switch to generic
device properties. This goes beyond GPIOs.

> 
> > This is what I wrote to Hans when he raised his concerns:
> >
> > "
> >     I agree it is a bit weird, but this allows to disconnect the board file
> >     from the GPIO driver and makes it easier to convert to device tree down
> >     the road as it can be done in a piecemeal fashion. If you want fwnode
> >     actually attached to the gpiochip then:
> >
> >     1. You can't really have static/const initializers in most of the cases
> >     2. Fishing it out from an unrelated subsystem is much harder than
> >     matching on a name.
> > "
> 
> Ok but if we match names then we already have a mechanism for that: lookup
> tables. I really fail to see how creating software nodes with a specific name
> in consumer code is any better.

I do not want to have 2 mechanisms, one for GPIOs, and one for
everything else. Let's take gpio_keys driver. It uses platform data or
device tree properties (generic device properties) to describe the
hardware. I want to drop platform data, and I do not want to encumber
the driver itself with setting up the board specific lookup tables, I
want the configuration be contained in board files. I also do not want
to have to configure all properties but GPIOs through one mechanism
(software nodes) and then have an exception for GPIOs to use lookup
tables.

I understand that matching on firmware node is nice and may even be
preferable in some cases, but I think matching on name has its own
place given all practicalities.

> 
> [snip]
> 
> >
> > I think the hardest breakages are here:
> >
> > arch/arm/mach-omap1/board-nokia770.c
> > arch/arm/mach-pxa/gumstix.c
> > arch/arm/mach-pxa/spitz.c
> > arch/arm/mach-tegra/board-paz00.c
> >
> > If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> > can see it does not even have a fwnode assigned: it either does not have
> > parent or its parent is a platform device instantiated by the driver
> > itself and does not have a firmware node associated with it.
> >
> 
> In that case using software nodes makes absolutely no sense and users should
> stick to GPIO lookup tables. The provider does not have an fwnode attached, how
> can we just fake it in the consumer?

Why not? It allows us to use generic device properties for describing
everything that we need.

> 
> I would rather just attach a software node to the omap controller in
> arch/arm/mach-omap1/gpio16xx.c and use its address in these board files.

That might work, just a bigger change than I wanted to make originally.

> 
> > So in the end name matching allows weakly referencing objects elsewhere
> > in the kernel for legacy and one-off devices.
> >
> > Maybe we should allow for both? Do a fwnode lookup and when it fails
> > fall back to matching on name?
> >
> 
> Isn't it GPIO lookup tables with extra steps and more confusing too? Because
> that's how it works in GPIO core: if you can't find anything using the fwnode
> lookup, you fall back to comparing names in GPIO lookup tables.

What you are missing is that it allows to describe everything, not only
GPIOs, through the common mechanism.

> 
> My point is: it only makes sense to use software nodes if we're creating
> links between them. If we fake them and compare their names instead, then
> it's just abuse of the API. It says PROPERTY_ENTRY_REF() for a reason: it's
> supposed to store an address leading you to the actual device on the other
> side.

No, it is supposed to store a "reference". It does not have to be a
pointer, it is a reference to another object. Could be an IP address or
USB port number, or something else that can uniquely identify that
object. In DTS it is not a pointer, it is "&node". How it is
implemented underneath is an implementation detail.

Thanks.

-- 
Dmitry
