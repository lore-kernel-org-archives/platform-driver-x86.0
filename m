Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C711DDC24
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732296613; cv=none; b=rLtSZ2P6i4uqFvNkpodRXAws/S51CaWr/RAJJpUxRSAPkMY6/64EyMcDlra+pxEe3XWih06UyrUpN7wA1MiNJGnenNZVV0h48L1PYEy55Hwgqci5O3ehLwaIZ2RXMFmT7D3megvSc/shuK/t+qhecBHXWx7vco9v+T/YJ+lG+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732296613; c=relaxed/simple;
	bh=EUZuHKWZknJku54SJ6vrlITMLqjLXwQYQg3tm1Juj88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XA0JaK6xSIoRT2D0DD6HMlfb7gUYRg5J/MbK/heFufrAuxPSyCpZ3I9AIbOL5iXafjlX3sci+95hegarjFj2tPi5fOAXyi+zibL/93Z3SjCQAkrnEtJD823NAww/h4LwUwD+jdYyYC+5TwD/aOWA5cFsTgaMZ/oWw7p9Ss3eFbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e6010a3bbfso1323717b6e.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 09:30:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732296610; x=1732901410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EUZuHKWZknJku54SJ6vrlITMLqjLXwQYQg3tm1Juj88=;
        b=tvKDSAySLJr5NtlGfIZxf0sqqPPAfEPFVsPHgJN2jn/fdNNRDKTt0AxxfVn59nOS+2
         poJmD2+QT5bIqg95HR/9CRjHXhYqVlyb1ceuTcJE2r0L8xUVk5vxgPnKu7+pNmH9qs8u
         rrAdaJ6RyN9W5b56yFNXfADHUHMOxtgJDQc39FFpk7BzSytqE3qYqmuAg9l5Df+ootHO
         T31gT0hgIOLY9uQbrcxgmYYecHO+GAnfxpbyXHeb7GLNRxe5COpvOqkg1uoHkf5Mx1vr
         puXaex9lAgJwAemUTf7tIbx6B6YPjT1RAHBr8rNufQgik1tW4pGtvodOU4bT3ugiRNm5
         6wMQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2d0TU0XnfQu/CFQ3uFOlVqOnr/mJLNMMl4Lyn37N30Fb0aNAnK5Rd2IgLUaiO1/pQxT09mVgaKhF4fUgRKgUHjnDF@vger.kernel.org
X-Gm-Message-State: AOJu0YxLTdRhPsMW7NitqgQhiIEgEkHTc3QTGrbsHT5j5HxM2LGwSQWW
	RQ2aeqOq7o77+bxDAVcQCE+NmIOKx4DJYZlTZNjys7KqjTSTeso6LupDfwqN
X-Gm-Gg: ASbGncvZYfrPRui73ABUjj08Vs47hYvKlSxzbeoTvZJXk/RVUAKLGmY48nsWTiae8wI
	SVX/Me0Tr76DmEC9C4B5B45mMm0OgWKDwwxpCceRe4nQNp0y7+IcNJoQJWAkIOk3W5FDdKtziW1
	wCsN5NEpx3QEXciBBBRLBKE0eP2mX7NLa4SPR2ZTYAWUtSBqkmqhlxZt9k4IKxr+S1d0PVmRrgg
	eX1yq4h1MaxiHyr9OWMALfQ10nSqFFIIaIr71QBI76/gOtM/1Pby82QA2PgTDVk4OOdbSTBLOLg
	HgPt6gYHrwmGBH0=
X-Google-Smtp-Source: AGHT+IGoZOzq4SBxhJ/4Hf2DlwAlK/k83UXEvvo7wyiEAuh1WSUbDCQk/n06iwRwxhECbPwVZI7aTw==
X-Received: by 2002:a05:6808:1526:b0:3e6:28cc:fec0 with SMTP id 5614622812f47-3e915b12e37mr3982763b6e.43.1732296610106;
        Fri, 22 Nov 2024 09:30:10 -0800 (PST)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1cff34eb0sm743296173.149.2024.11.22.09.30.09
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 09:30:09 -0800 (PST)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83e5ae95815so96110339f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 09:30:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSxMCV2auxDDLEmxqI5qnhEBqgS9u6cqnh8zh5hD9xSHz5MmolP6K7WCMXVXvd4xN8/OFhxIApB+i/sCfox5ILK/re@vger.kernel.org
X-Received: by 2002:a05:6602:6405:b0:82c:ed57:ebd9 with SMTP id
 ca18e2360f4ac-83ecdd1bd3dmr430953939f.10.1732296608965; Fri, 22 Nov 2024
 09:30:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
In-Reply-To: <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 22 Nov 2024 18:29:57 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
Message-ID: <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ilpo and Armin and thank you for the replies; these are exactly the
kind of questions I was hoping for! :)

Den ons 20 nov. 2024 kl 13:00 skrev Armin Wolf <W_Armin@gmx.de>:
> After looking at the driver, i would advise you to drop the acpi_driver stuff and instead
> implement the whole driver as a platform_driver. Does the kernel already create a suitable
> platform device with the name "SAM04[number]:[number]"?

Yes, the kernel creates an ACPI device exactly as you asked.

As a bit of history: much of how this driver is structured came from
inspiration I took from existing platform/x86 drivers and this pattern
of having an acpi_driver followed by the platform_driver seems to be
more common than not from what I can see (except for specific cases
like the the WMI-specific drivers for example). I took a cursory look
and it does seem possible to do as you say, but I would still need to
grab a handle to the ACPI device somehow of course, and the full path
might be different for different models, so from what I can tell it
feels a bit more "clumsy" because I don't see any function which will
allow me to pass an array of acpi_device_id or strings but instead
would need to loop through the array and within the loop see if I get
a match and fetch the device that way (e.g. using something like
acpi_dev_get_first_match_dev()). Is this in fact the preferred
approach now? (and just so happens that many of the existing
platform/x86 drivers do not follow this design currently?) I am of
course happy to take this in either direction, but would just want to
know what the preference is so that I know what to do next on it!

> As a general rule driver should be quiet if everything works, so unsupported features should not
> result in a warning message. The other error messages should just contain the message without any
> bugzilla/github links since stable kernel users might want to use the bugtrackers of their distro first.

(Similar comment/question from both of you on this)
I have now gone over to using dynamic debug in the driver now instead
of a custom debug module parameter, and revamped quite a lot of the
print stuff. Now much of the previous information has been moved to
debug but there are still a few cases which warrant warn or error I
think.

One thing I feel like does actually add some value to print to INFO is
that, because how some of the dynamic features will work can vary for
different models, to me it seems like it would be a good thing to
actually tell the user about these specific things (e.g. only power
profiles x, y, z will be available and will be mapped to vendor
performance modes a, b, c, ... just as an example). Otherwise I can
understand how there would be a fair amount of confusion about what
actually happens when you press the hotkey or try and toggle the modes
using various services (power-profiles-daemon, etc..). To me, I see
these messages as similar to what prints to INFO when for example a
new input device is added, a new battery extension is added, etc. Does
this sound ok or should ALL of these kind of prints be moved to debug
instead?


I will also try to reach out to Hans directly to ask this question
regarding if it would make sense to handle hotkey work actions from
the platform driver or not. Otherwise, I feel like once I can resolve
these other two main questions I asked here ( 1) register acpi_driver
vs looping array to get the dev handle and 2) printing some of these
last dynamic things to info vs debug ), then I will go ahead and tidy
up the rest of the bits and send in a patch here.

Thank you again!

Best regards,
Joshua

>
> Am 18.11.24 um 14:51 schrieb Joshua Grisham:
>
> > Hello! I have created a platform driver for Samsung Galaxy Book series
> > notebooks which has now gone through several iterations and
> > contributions from several other community members. Based on stars and
> > community involvement I would guess that the usage of the driver is
> > more than at least 100 users (if not more?) across multiple different
> > generations of devices and many different distributions, so hopefully
> > we have ironed out a lot of issues by now!
>
> Nice work! Improving the hardware support for notebooks under linux is always
> welcomed.
>
> > The existing driver samsung-laptop is of course somewhat
> > famous/notorious for how it works, but on newer devices (primarily
> > Samsung Galaxy Book series devices but does include a few others),
> > Samsung is using a new ACPI device called "SCAI" which is what this
> > new driver is built on, and the functionality is totally different.
> > There are only a few ACPI methods on this device that then actually
> > control a lot of different features; the "magic" is in building
> > various payloads to steer all of these different functionalities even
> > though it is often using the same ACPI method.
> >
> > It is my opinion that, as we now have achieved some level of stability
> > with this driver, it would be good to try and get it added to mainline
> > as having it in mainline will add a lot of benefits (even larger
> > number of users who will gain benefit from this, better quality and
> > standardization with involvement from maintainers and the larger
> > community, etc).
>
> I support your initiative to upstream your driver. Having such a piece of software
> upstream helps everyone.
>
> > I have myself tried to adhere to many of the existing patterns that
> > exist within other pdx86 drivers and the community has helped to find
> > and ensure (and in some cases even directly contributed to that)
> > various features are using standard interfaces such as with the
> > battery extension, platform profile, etc, in a way that seems to be
> > unified with existing platform drivers as well.
> >
> > The driver code is currently located here:
> > https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/samsung-galaxybook.c
> >
> > As there are a few variants of what features are supported on
> > different devices (even devices with the same ACPI device id) then one
> > of the key principles that I have tried to now follow with the driver
> > is that each feature tries to check that it works or not (receives an
> > error code in the payload from the ACPI method) before "enabling" the
> > feature (creating a sysfs attribute or registering a new device etc)
> > when the module is probed and loaded.
>
> Sounds like a good strategy to me, being able to automatically detect which features are
> available is usually better than having a very long quirk list.
>
> > Instead of just sending the code as-is in a new patch then I thought
> > to ask you all as the PDX86 maintainers if there is anything glaring
> > that you would prefer should be changed or re-designed before we try
> > to push this in as a patch and add this driver to the kernel?
>
> After looking at the driver, i would advise you to drop the acpi_driver stuff and instead
> implement the whole driver as a platform_driver. Does the kernel already create a suitable
> platform device with the name "SAM04[number]:[number]"?
>
> > You can see more background and what features are supported in the
> > README file here:
> > https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/README.md
> >
> > A few potentially "controversial" bits that I can highlight already now:
> >
> > 1. various failure messages or "unsupported features" write a warning
> > that directs users to create an issue in my own Github repository
> > instead of in Bugzilla -- maybe this is ok at the beginning but assume
> > it would be better to just remove some of this info from the message
> > and/or direct users to create a new bug in Bugzilla under the right
> > component there ?
>
> As a general rule driver should be quiet if everything works, so unsupported features should not
> result in a warning message. The other error messages should just contain the message without any
> bugzilla/github links since stable kernel users might want to use the bugtrackers of their distro first.
>
> >
> > 2. some features where Kernel version are checked for handling some
> > things different for older versions of the kernel, but all of this I
> > would take away before submitting a patch
>
> Yes, please remove any kernel version checks.
>
> Thanks,
> Armin Wolf
>
> > 3. usage of the i8042 filter and ACPI hotkey notifications to handle a
> > few of the hotkey actions within the driver itself instead of just
> > emitting input events and allow userspace to handle the actions
> > (namely cycling through keyboard backlight levels, performance modes,
> > etc)
> >
> > This last item (executing hotkey actions in kernel space) is not
> > totally unprecedented either, as I have seen there seems to exist
> > similar i8042 filters driving hotkey actions in msi-laptop,
> > toshiba_acpi, and dell-laptop and ACPI notifications from hotkeys
> > driving actions in several x86 platform drivers as well (dell-laptop,
> > acer-wmi, asus-laptop, ideapad-laptop, etc; this is an even more
> > common pattern than using an i8042 filter, it seems).
> >
> > The problem with just emitting the "right" input events and relying on
> > the userspace to handle this stuff in the right way is that 1) there
> > are not really keycodes that exist for exactly the keys we want here
> > (even though "Keyboard Backlight Cycle" and some kind of "Performance
> > Mode" hotkeys are very common on laptops today) and 2) functionality
> > for how to handle these kind of events do not really support these
> > use-cases either (an example if you read through the discussion here:
> > https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/41 and
> > especially several of the comments from Benjamin Berg, that
> > implementation of "Keyboard Backlight Toggle" is just on vs off and
> > does not cycle, and there should either be special handling of this or
> > a new key is created specifically for this purpose... this was from
> > 5-6 years ago and the state of this has not changed since then from
> > what I can tell). It is because of these same problems that I assume
> > the existing PDX86 drivers do in fact implement some of this hotkey
> > action logic in the kernel space, in a similar way that I have tried
> > to do in this new samsung-galaxybook driver. I am not sure the
> > appetite for having even more of this pattern exist and/or if there
> > are any details of the implementation that you all would wish that I
> > should tweak a bit? I am very open to any kind of feedback on this.
> >
> > Any other discussion or questions are of course welcome! Otherwise
> > and/or once things are to a point that is looking good then I can
> > create and submit a patch for this new driver.
> >
> > Thank you!
> >
> > Best regards,
> > Joshua Grisham
> >
