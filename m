Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFD1B219E
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Dec 2024 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733431247; cv=none; b=A3+Oxb2K3GLAZ0I07VLURdGK2a/CT2wJ9EEySkqsLQI9VeMw/SGpIysqPQRbpQAZ34LNzBSSTo3GA7Kda4/kCDN19CiGQ25lI4ej0dwkQSqdGXFHYpJVnbXRl/9P5LI3lmtclafzg5l8xjbdXVNSjm7JYisHzY8O6cGJxqX9rL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733431247; c=relaxed/simple;
	bh=tIlmsPCZarDGfZcrh/vEy10d3SEgjMhGCyepmerVmtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SAGUFPnygJ21hSU76QyvTfhVpq7QlExQTDIA8IfBzg7ozqul6oD1/w/2aQcRgppl0Q3kGKD0TahvOjlzYRyWKFWyj+HIEEjqMKjnoyic2unu4EHD1jMOAGAZjLc/rvf2FNLhUevnnv58X1YWT81Jeh8/wBeHQcs/HLwxpzMGO7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-841837213b1so97578539f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2024 12:40:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733431244; x=1734036044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dyX8kpdpE/Xfi55aV6OcDjSw9XRRDCcrs299S6t4fSo=;
        b=o/Bl6oEEVK+yhVBLwdVvo4Pz1M084emPK3CmqMoEdPHWUydWHF71EEgyRsZ4Qu4yC/
         Y2iZTXFE3ah1JSBsvSlgFlHy+55xTS/xImRB98n+23HVfUqjAtxgwYzn8l+9uRfVvcvq
         A6e1rqyEaYfRzas6fTLvc3hKoatQbUpSDR6WpfmYLiQWbKsiT84Ze2dSsOIP2+befhET
         AOnrLn1m629qbgierVJEsKoIokpI+kUcQmSUmURrb48TpSveWzxFfNXNp7wtk73xIhTM
         zEQ1H48bgMv9NYrh8UvyL4r/ar5wBGyb4djUszWtXXSXpBNaC06No76Swi8uTUMGqqSt
         soGw==
X-Forwarded-Encrypted: i=1; AJvYcCVv/eQcy2AT51h72vz/5JLKLukvpchIXw+mi+eCu/mDM3RPIU2dcZnPE4yB6W3y6T3bMr6q3hl1jR6niBJauHLMnJD/@vger.kernel.org
X-Gm-Message-State: AOJu0YwK565SxdRK63/rvTKl0YA7kj6fLXTUbsRLmU6NhNO04r7PvD1Q
	otNipOh6TBSBSLYvyKQ/eKHSqLdB/Is9n/HiK2zAIiG8U1o4loBY4jZ8Cg==
X-Gm-Gg: ASbGncsk0ssCEVBgFl2OL3oq6kxVG59AhxC74xCniI1IzFL8Yn82AEX8mmWg28Fni3u
	mmsHZDxOCTlk6K+q8Hi9Yrxl8wVuP/tLm1LTQJ+sGuZotSPUIB5Kg0W3+dAXlVis5G2vtHDT9l/
	piGTp2ozBFfcZhctH+iiwpkGReU0tJKKx0NE5eGacw3n7a1noHyx+pzxqSGV/lsGoaLAO3OM2p8
	dIHsHjNxezw7Eyr3k3zqIL5gZ8JRbSfPxFxhncKuPIdwXAg6FK4QtLw28aoGALFBMpkeoNYhEwf
	aH0XCQK/wLstLTI=
X-Google-Smtp-Source: AGHT+IEcMm/fNZCd7dua3vOCNpMY6XIPdssvAmd1BZr8zC8g8s4ceCitVuf4rEnVe0dEFF7cOJLb3A==
X-Received: by 2002:a05:6602:1613:b0:841:95b5:8953 with SMTP id ca18e2360f4ac-8447e3ddb98mr108833539f.14.1733431244216;
        Thu, 05 Dec 2024 12:40:44 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-84473a7411esm52392039f.49.2024.12.05.12.40.43
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 12:40:43 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-841837213b1so97576939f.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2024 12:40:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1O8W6C/u8W/Y5Of/xiLix7I1NI5nw9gIta5wcu+2P8qJlP+JrMkCR9YBDmgoUkcsU30mgN1vZfwJd93rCwo0A3aNs@vger.kernel.org
X-Received: by 2002:a6b:6511:0:b0:842:ff2d:c3de with SMTP id
 ca18e2360f4ac-8447e202021mr82852939f.1.1733431243279; Thu, 05 Dec 2024
 12:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <40b82b39-3bba-4eac-8eb0-b4cee4868737@redhat.com> <CAMF+KeYKxiG0h4K39Fzbeoa30VZsvN68XMcQ5382YdfRDgeUdQ@mail.gmail.com>
 <d84a8908-543e-4537-86d0-ce3089ba481f@redhat.com> <121f408b-bf43-4ad4-baa3-ae47068d8f40@gmx.de>
In-Reply-To: <121f408b-bf43-4ad4-baa3-ae47068d8f40@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 5 Dec 2024 21:40:32 +0100
X-Gmail-Original-Message-ID: <CAMF+KebH8FqV-ZrvS6NeSOjtBDc08_Ei8M97XO727TX=4FrDgQ@mail.gmail.com>
Message-ID: <CAMF+KebH8FqV-ZrvS6NeSOjtBDc08_Ei8M97XO727TX=4FrDgQ@mail.gmail.com>
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	Kurt Borja <kuurtb@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Den ons 4 dec. 2024 kl 23:19 skrev Armin Wolf <W_Armin@gmx.de>:
>
> Am 04.12.24 um 23:00 schrieb Hans de Goede:
>
> > Hi Joshua,
> >
> > On 4-Dec-24 9:33 PM, Joshua Grisham wrote:
> >> Hi Hans, thank you so much for taking the time to read through the
> >> questions and get back to me!
> >>
> >> Den ons 4 dec. 2024 kl 18:31 skrev Hans de Goede <hdegoede@redhat.com>:
> >>> So I think it is best to just emulate what the laptops where
> >>> the cycling is directly done by the embedded-control do.
> >>>
> >>> That is:
> >>>
> >>> 1. Add LED_BRIGHT_HW_CHANGED to the flags of the led_classdev
> >>> for the "xxx:kbd_backlight" led class device you expose
> >>>
> >>> 2. Filter out kbd-backlight-cycle keypresses and on such
> >>> a keypress:
> >>>
> >>> 2.1 Determine new brightness level
> >>> 2.2 Apply new brightness level
> >>> 2.3 Call:
> >>>
> >>> led_classdev_notify_brightness_hw_changed(&kbd_backlight_led_classdev, new_brightness_level);
> >>>
> >> This is actually exactly what I have already implemented with the one
> >> exception: I am executing exactly the same kind of logic you mentioned
> >> (via schedule_work()) but I have NOT filtered out the keypress;
> >> instead, it is just scheduling this logic to run in a workqueue and
> >> then going ahead and passing along the keypress as well, just in case
> >> anyone wanted to trigger any other kind of event from this hotkey.
> >>
> >> I have actually submitted a patch to the keyboard hwdb which was
> >> merged in to systemd that maps this particular key to "unknown" with
> >> the idea that someone who has this model would also likely have this
> >> platform driver module loaded, so by default the kernel-space action
> >> to actually change the brightness level would be executed (the
> >> "EC-like" behavior as you mentioned that they could not change), but
> >> the user would also have the option of remapping the key and
> >> triggering additional actions on top of this if they wanted.  Does
> >> that sound appropriate or is it better to just filter out the keypress
> >> entirely once the above actions are scheduled/executed?
> > In my experience it is best to pick one approach of
> >
> > 1. Deliver event to userspace and let userspace handle everything
> > 2. Handle everything in kernel and stick with that
> >
> > We actually have what you are suggesting for display brightness
> > up/down presses in the drivers/acpi/acpi_video.c driver
> > which exposes both a /sys/class/backlight device and an evdev
> > device delivering key-press events and which automatically
> > increases the brightness of the /sys/class/backlight device on
> > brightness up/down hotkey presses.
> >
> > And that combination is a hot mess. GNOME/KDE see the keypress
> > and then race with the kernel increasing the brightness. Typically
> > they loose the race reading the new brigthness increasing the
> > brightness by 2 steps on one keypress. And some older laptops
> > have only 8 steps, so that is a problem.
> >
> > I disabled the in kernel handling of the brightness up/down
> > keypresses in the ACPI video bus driver because of this, but
> > some users complained about this breaking old X11 setups using
> > e.g. Window Maker of fvwm. Linus Torvalds ended up "fixing"
> > this by instead of having the kernel immediately react giving
> > userspace like 0.25 seconds or something to respond and if
> > it does not, then handle it in the kernel. Which of course
> > is racy so sometimes users still hit the 2 steps for one
> > keypress issue if the laptop is under load.
> >
> > Note this is meant as an example of what NOT to do.
> >
> > As for the hwdb mapping of they keypress to unknown I predict
> > that at some point a well intending user is going to notice
> > this, map it to KEY_KBDILLUMTOGGLE and submit a PR to systemd
> > upstream.  Then the systemd upstream maintainers will trust
> > this user, who actually has such a laptop which they don't to
> > be doing the right thing and merge it.
> >
> > And then if GNOME/KDE/xxxx grow support for actually acting
> > on KEY_KBDILLUMTOGGLE (if they do not do so already) we have
> > the kernel hotkey and userspace hotkey handling fighting
> > each other just like the example above.
> >
> > So based on this I would strongly advice you to filter out
> > the key event completely at the kernel level.
> >
> > If someone ever really needs / wants that event then my
> > suggestion would be to add a module option which *completely*
> > disables all in kernel handling for the key in kernelspace
> > and instead delivers the events to userspace.
> >
> > TL;DR: IMHO mixing in kernel handling with keypress reporting
> > is a bad idea. Please chose one model and stick with it.
>
> I agree with this viewpoint. Also the user still sees the event when you filter out
> the special keypress, since calling led_classdev_notify_brightness_hw_changed() sends a
> poll notification to the led class device. So when using poll(), select(), etc. the user
> can still react to this event.
>
> >> Also as an aside, I have had a few users who have mentioned that if
> >> they have compiled and loaded i8042 as a module (which is then marked
> >> as "used by" samsung_galaxybook due to the i8042 filter), if they
> >> execute a modprobe -r then it also removes i8042 and their keyboard
> >> stops working. Is this known/expected behavior and/or is there
> >> anything that can be done in this driver itself to try and help
> >> prevent this from happening? Otherwise I guess a "fix" for this would
> >> be if users compile their kernel with CONFIG_SERIO_I8042=y then they
> >> would not have this problem?
> > IMHO, the best way to solve this issue is to tell users to do
> > "rmmod samsung_galaxybook" instead of modprobe -r. And you can do
> > the same in any Makefiles / scripts you may have.
> >
> > Regards,
> >
> > Hans
> >
> Same problem with any driver which registers a acpi_battery_hook, if you unload the driver you also unload
> the ACPI battery driver itself :( The reason for this seems to be that modprobe assumes that the ACPI battery
> driver is a pure dependency of the first driver and can be unloaded if no other module depend on it.
>
> I think this problem could be fixable, but i have no experience when it comes to the kernel modules infrastructure.
>
> For now using rmmmod instead of modprobe -r should indeed do the job.
>
> Thanks,
> Armin Wolf
>

Perfect, thank you both! All of this makes perfect sense to me and I
will make these suggested changes.

I am planning to try and fix up some documentation which I will also
add for this platform driver, plus add relevant KConfig/Makefile/etc
entries, do some additional testing, and will try to get a patch
submitted here hopefully sometime within the next few days.

My plan was to take the latest commit at the time from the 'for-next'
branch of pdx86/platform-drivers-x86.git and then submit it all
together as a patch via a new thread here. Please let me know if there
are any problems with that plan or anything else I might need to
adjust before doing so.

Thank you again!

Best regards,
Joshua
