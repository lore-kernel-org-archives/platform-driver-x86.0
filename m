Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A22154C04;
	Thu, 19 Dec 2024 17:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629497; cv=none; b=BXPrgUXPuOMHzwIziMhScEtvJuKkukDMNyj5i5Nf8VJJoTDYjc8wE8KzOZDFQbEkOSDusKcYxxqWNKKLXWSGr54crRVukH5B7U7T7YZuUi3Jee3XJBm5wAJSAu72hwXZuV/9UMBA3ubCweqR3ef27c40hm3JR5TcT085+qH6bZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629497; c=relaxed/simple;
	bh=864pAgfmKQf//4O2IhEEwaTqgaNKE8D5q9hM+FeQgFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHrCzzibf0/0rIMewAm7gDdTahaxbCfcZyfKkuBIvnl6n2TfedqW9Xk5j9BH56L9UqgiDbCQqMGKU/IU6uJ0uCnXEFARGLD0tHGV//ZyjUDmYg6Y/yHBr96hHWgi51c8oesrpmvOLovZ6WReQVpOa1w8xSY/FyHYoy+E2oLFLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a81324bbdcso6767655ab.1;
        Thu, 19 Dec 2024 09:31:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734629495; x=1735234295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=864pAgfmKQf//4O2IhEEwaTqgaNKE8D5q9hM+FeQgFk=;
        b=kSbdjH9LkCPx8Twn2j7XR2VsS3n0Ne4RHm88tuWfzhb+VQIAtnckPsfb+YdCHstpVy
         +zffI/N9PFilnF/DxcXjalGICcrCMxZOYhYEYhSkkhrRVvAZOfKifNBpHChHSOVXVOHG
         Hcd3LmuhEu9aGYc8R9kMtTOXf/ANniiUxUG9ScNSPuBBli+MTBZ70+RTzEn/HeK3vgVz
         7jvAI2cTKDCqzmRhnGQzXRCif00pight2iUI0LVO2J3GOZ/p6rLTzP1Ux6MEuoyfM+T7
         4zCzfeRKKpcPE3DZZZ6vkEXxyuW8TKSOOhxOmJanSybcLXfhfaUditsrQ327i1qjbdIB
         dWUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ+upEBIe6I+hIDrCp9/1doNXXTFBY6SrglOkafM2MLg1Oz0Mzez3OeN6uNd5faqqp0ccjnbCFHo0qb/fbs9VHY0nfew==@vger.kernel.org, AJvYcCX1IVZjHgnjDnQ4OODRl/CjQMgq0ZL5XbH9UGOg8j9W8H2lKnxwMuKWWI8BrIh6oaKOA7wLcGWZIbk=@vger.kernel.org, AJvYcCXB5+3urBWM44gOGYNw0ymp3dWc+FdkYfEW5hhANrkDdfFUcrQXArqnAvMKf2NMEAwLCWjmYjaAe9Y4HFR2@vger.kernel.org
X-Gm-Message-State: AOJu0YzzxIH0DMb9MqBLPPoIBdfeaBofHtxNL4mLFWCOj+0BLzsVPxAJ
	xx0u00gu5T/2f4ElbQ8bP4hvdSuKcichV4cBfknROnK8e2VbGarYovZEWh02Qqs=
X-Gm-Gg: ASbGncuFo49VzjopKeASzgbXHzN18KCG5lFBhe0GUEzFco4s4dURBgMRSRhuhJB/DOI
	EeQJ8+xEQ7h5rzfIc9bnhcuGKz/6vJWF5gkHn7nkUuXoD6EhK3KW7xWliVv/MncCszeVC2qomqn
	S6IQeosYE8uAO9xYN+rOqCDhKiQYp7UcJkFOpxhn7/ldv1VV/dAsCAvLn8iJN+qNn3vLwhVtGBg
	l54df4Lfqp2h9ynDUtycpY6PHxg9EtYJAP36nvsYB7GHIHPGtmpH/i7c0Ejsxh1w6YxrB9oPqbq
	OWy0ZOK27PIdXVUgkphTB/nkyA==
X-Google-Smtp-Source: AGHT+IE0Vh8KWue6T3xiiPnp3Qqe14QPR3ysyIZyQbpN0rWNKiVyjR0B4mMqFtFbnVq99gleRAP83A==
X-Received: by 2002:a05:6e02:3b07:b0:3a7:1f72:ad3c with SMTP id e9e14a558f8ab-3c013b07177mr47151195ab.19.1734629494884;
        Thu, 19 Dec 2024 09:31:34 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1d9c7bsm370264173.124.2024.12.19.09.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 09:31:34 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a7e108b491so7560085ab.3;
        Thu, 19 Dec 2024 09:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW06EyBMnLtdgpVQLkd9frdC0/h8YHlnWmGCS+nGW60e/oK3Aqf7p3nKOLLjE1OUZkhmR3vD1Kk2kE=@vger.kernel.org, AJvYcCXQLrdWJIZVbdiI1hHIcRbO2F5WoX+DnRdu31/AVg9qNkO9RBrxoDfN86zTNMjCconCWaXmjVZH4dqYIrJsAqVrIha9Kw==@vger.kernel.org, AJvYcCXsjxKnPVCeoWp7NvJjgGosjf+R0N0SydNjo6ZJXTNm/uxIILxLtH+ppJY6VGHW7Wrln9MRNoW/iJCLBpbh@vger.kernel.org
X-Received: by 2002:a05:6e02:2387:b0:3a7:c5c8:aa53 with SMTP id
 e9e14a558f8ab-3c011b49314mr39069045ab.13.1734629494069; Thu, 19 Dec 2024
 09:31:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de> <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
In-Reply-To: <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 19 Dec 2024 18:31:22 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
Message-ID: <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de, 
	platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you both Thomas and Hans for your review and comments! I am
working on a v4 of the patch but had a few questions which I wanted to
clarify (they can also come after in a v5 etc in case I managed to get
this ready to go before anyone has the time to confirm and/or clarify
some things!).

Den tis 17 dec. 2024 kl 15:23 skrev Hans de Goede <hdegoede@redhat.com>:
>
> On 16-Dec-24 5:46 PM, Thomas Wei=C3=9Fschuh wrote:
> >> +Various hardware settings can be controlled by the following sysfs at=
tributes:
> >> +
> >> +- ``allow_recording`` (allows or blocks usage of built-in camera and =
microphone)
> >> +- ``start_on_lid_open`` (power on automatically when opening the lid)
> >> +- ``usb_charge`` (allows USB ports to provide power even when device =
is off)
> >
> > Non-standard sysfs attributes should be avoided where possible.
> > Userspace will need bespoke code to handle them.
> > This looks like it could be handled by the standard firmware_attributes
> > interface.
> > This would standardize discovery and usage.
>
> Ack this really feels like firmware-attributes. I would not be surprised
> if there are matching BIOS settings and if changing those also changes
> the sysfs files and likewise if the sysfs settings persist over reboot.
>

Yes 2 of these (not this "allow_recording" I think) are available via
BIOS and all 3 of them persist over restarts.

Just so I am 100% clear what you mean here -- these type of attributes
should be created using the utilities available in
drivers/platform/x86/firmware_attributes_class.h so that they are
created under the path /sys/class/firmware-attributes/*/attributes/*/
?

What exactly should they be named (any preference?) and should I also
add some documentation for them in
Documentation/ABI/testing/sysfs-class-firmware-attributes ?

I am fairly sure I understand the concept and can agree that it kind
of makes a lot of sense to be able to standardize the userspace
interface, especially for attributes which do the exact same thing
across different vendors/devices (unless it just as easily possible to
go based on some pattern matching e.g. like is done in udev and upower
with "*kbd_backlight*" etc) but as of now it looks like the only
examples implemented are for thinklmi, dell-wmi, and hp-bioscfg that I
can see so far?

Before, I had tried to look through all of the various platform/x86
drivers and harmonize which names I picked for these sysfs attributes
(that is how I landed on "usb_charge" and "start_on_lid_open" as I
recall correctly) but I am not aware of any existing userspace tools
which are looking for anything like these (apart for
driver/vendor-specific utilities). Any recommendation from the very
wise people here would certainly be appreciated for these :)

>
> The allow-recording setting toggle is new to me. So this is changeable
> at runtime, interesting.
>
> Joshua above you write this toggle both the microphone mute and
> disables the camera?
>
> It would be good to report the camera state to userspace using
> a separate input/evdev device which reports SW_CAMERA_LENS_COVER
> as discussed here:
>
> https://lore.kernel.org/linux-media/CANiDSCtjpPG3XzaEOEeczZWO5gL-V_sj_Fv5=
=3Dw82D6zKC9hnpw@mail.gmail.com/
>
> the plan is to make that the canonical API to reported "muted"
> cameras.
>
> What happens with the camera when recording is disallowed,
> dus it drop of the USB bus or does it only produce black
> frames ?
>
> It is a bit unexpected that this one button controls both
> microphone and camera mute. But given that unique behavior
> I guess that handling this in the kernel is probably best.
>
> The alsamixer should send some events for the mic mute/unmute
> I hope and we can use SW_CAMERA_LENS_COVER to report the camera
> state.
>

Yes this is kind of an interesting one, also... In the user manuals
for these Samsung devices, they actually call this feature "Block
Recording." See the second link here with the same title:

https://www.samsung.com/ca/support/computing/samsung-laptop-disable-the-web=
cam/

There is this software control in their "Samsung Settings" and/or
"Samsung Security" application plus the hotkey, but they both function
exactly the same (executing this ACPI method with the right payload).
The reason I called it "allow recording" is because I was trying to
take a simple approach in the beginning, and let the device value and
userspace value have a 1:1 mapping (you send 0x1 if you want the
webcam and mic to NOT block recording, i.e. be "allowed" and 0x0 if
you them to be blocked). I thought that echo 1 > block_recording to
turn OFF "blocking" felt backwards so I just reversed the name instead
;) But in theory it could as easily be called "block_recording" and
the kernel driver could handle the flip (0x1 from userspace becomes
0x0 to/from the device and vice-versa).

When you press the hotkey in Windows then there is an OSD popup from
their own background software, but nothing actually happens to the
devices themselves. Even in Linux via this driver or if you just
directly execute the ACPI method with the right values in the buffer,
what happens is that the image feed from the camera just becomes solid
black and the mic input is just completely silent. The USB camera
device is not removed or seemingly touched in anyway, and there does
not seem to be any kind of sound device event at all from what I can
tell (I tried to check using "amixer events" and a few other methods
but never saw anything, and the mixer control in alsa is always
un-muted like normal when toggling the feature on and off even though
it stops the sound from being able to be recorded).

It is as this switch name SW_CAMERA_LENS_COVER indicates, almost like
a physical (virtual?) cover has been drawn over the camera and the
microphone but they are still seen as operational and completely
unchanged from a device perspective.

What I have started with for now based on this thread, is that as it
seems like KE_SW key entries should have a "sw" struct with code and
value, that I am assuming I should send .code =3D SW_CAMERA_LENS_COVER,
.value =3D 0 for "cover is removed/off/not blocking", and .code =3D
SW_CAMERA_LENS_COVER, .value =3D 1 for "cover is placed/on/blocking",
also it looks like I should send this event as part of init for the
current state at init time (the input device seems to have a "state"
associated to this switch) -- is this correct?

And then is there any events or functions that should be called to
notify of a mic mute switch (not actually to send the event to toggle
mic mute to userspace, but to just report to userspace somehow that
the mic has been muted by hardware, similar to this
SW_CAMERA_LENS_COVER or led_classdev_notify_brightness_hw_changed()
etc ?

At the same time I am still not convinced what exactly the name of
this attribute should be ("allow_recording" vs "block_recording" vs
"camera_mic_privacy" etc ??)

Other notifications that I am wondering what the "right" way to handle
/ using the right interface:

- Are there better events to use for these which these devices are
reporting for "ACPI_NOTIFY_DEVICE_ON_TABLE" and
"ACPI_NOTIFY_DEVICE_OFF_TABLE" , i.e. some kind of standard
"switch"-like notification that the motion sensor in the device has
detected that it has been placed or lifted from a flat surface?

- When the battery charge control end threshold is reached, there is
an ACPI notification on this device as well that is the one I have
marked "ACPI_NOTIFY_BATTERY_STATE_CHANGED" -- the Samsung background
apps pop up a custom OSD that basically says something to the effect
that their "Battery saver is protecting the battery by stopping
charging" (can't remember the exact verbiage) and they change the
battery icon, but without doing anything else in my driver currently
the battery still reports state of "charging" even though it just sits
constantly at the percentage (and has the charging icon in GNOME etc).
I have seen the event come and go occasionally when I did not expect
it, but my working theory is that maybe it is if/when the battery
starts charging again if it dips too far below the target "end
threshold" and then notifies again when the threshold has been
reached. Armin also mentioned this before in a different mail; I guess
I would hope/expect there is an event or a function I could call to
have the state reflected correctly but I would not want that it
negatively impacts the normal behavior of charging the battery itself
(just that the state/icon would change would be ideal! as it functions
perfectly, it is just that the state and icon are not accurate).

> <snip>
>
> Regards,
>
> Hans
>

Thanks again!

Best regards,
Joshua
