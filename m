Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E8E2F36;
	Sat,  4 Jan 2025 01:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735952860; cv=none; b=kD0lQQwl0TrvV8g+rDtSgF2RNKwZGFThQPgjK10jzroKVIXP9YlsDrZrdSm6HtK/9zqtHMU0g0qh1e88LPVMrNDOQsbUI7Nmw5h0gJsecEOUmJu3kzXnD3xluClRGyQBnHlHTAt4+vW//PjGNRQIgFmAFF17ntbsxpCz0o2JEt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735952860; c=relaxed/simple;
	bh=H7P1iWJNDGXy2504Gdqqywf3Gde52eUnuXZCjcRsbrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1ZAH9dpKvjjEgMP1hX0zUZCA+ZkGxYhR7iOvlW7o5jiZTABIca+vgzV+IBHW2pz85POdCMSDD9DQhQp1hXTy8wgxgotJKazltIEn5Avyn/yvrG00uEig8iTwIYX+SH2yEu8YBw3fM8jNUVFvFZyN+CtuWZO14KyGoMnyCYX0mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-844e161a957so1002770139f.0;
        Fri, 03 Jan 2025 17:07:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735952857; x=1736557657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dw6KK5JtXFbd+d5Fqi1GUSbKIBoX0aBmLwEhl9Z2fbo=;
        b=rs76FZFlq7GLMSbzbzPV5kcXm3c1h1+zZi2vTmdu3hMfCw347KoQmYGssqjBaZHF7G
         jC8P7WDC4/l7i1vv1wb/w9m2Bpz9D8jCm46A19oICQZyK/Uvzb2fXTrxn0WtCHSNE3jq
         7x2EmF0h/Am5yrREfyHaq6EwwcdLe+BFTGCVT2DsMxq425QmuN3fyR6JbGo5Cr2aodsn
         e8LXTHRbfYJ7TSzs4YKp9szdFNoJJW64zJmq2uda6wwBIK5XD6qayeSEq3BfVJ84qVpu
         PQr/G7gXoFMqW754o57syfNOiRlHHh6xJGlucCBerJw8kTpQA8P202iODGzmM2tj4kfs
         7+wg==
X-Forwarded-Encrypted: i=1; AJvYcCV7LqRrGtFEGaqjs8CBT2F8lhJFn8tSrGyFD67+F647cKvyIdmu/SDDSzYwCoTIavgibskBP5XOUSdWvL8m1XGqxgmP3A==@vger.kernel.org, AJvYcCXaNEHZ3KcjVahaSLcQqSkN5hwhsFGmTPINSXU3285rlhYYomHnAB3Txssw9va7ZqVkn6Dzn3JPBHE+4ufd@vger.kernel.org, AJvYcCXqeOkxfEnttH+/bRT8Xp1yw7/vB16io++9A6otKRS1lcW+vt6jiNVzCAhECqhQhO8TUnMHq5Wj+A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPyjFRa0jTZYKYEl1Vty9LCBBMha2mNJsqHFam9+l67gXQRNiA
	l/836BiI5CaqYRgiBc+Gt16ASyGfWAV7UyPNfaaU4G7UiCeHmqPj5RHNf37hqZw=
X-Gm-Gg: ASbGnctXCDyevBVzT1SLZwJCy1n0hYJpKrNw7jOG4RzTVkB2MNeLW+AEcLG3CZ7Kh7a
	0HGXaIsUvveTGMdeCG4J9PJI2Iia4Xk85yXTWswZ3DTKOARsXiUEHvPLvIWf5gwiF+lms9MFmMQ
	hIN7Unyx15vwr8i4TquJmcFUeSbe3TnFZvJ+ckmutvx+H5doEe/3hFzHikMrHQswknO77upwoHM
	wdNWxXXiRUzBGnsWdQR8ah69cgRmvgqB6oM+ZS9IrCmlywUnR1O8MJCLSoGSzdvZ4n1tRz/CPIF
	PfVQuaFOw6AuhpW91cBlBpUimw==
X-Google-Smtp-Source: AGHT+IFz06edrWGFID21Gz+MaEMA8j5MlhAsDhPBbsqQUsgYtv9r5336uX66cIYSU5PTbOaO/m6oGw==
X-Received: by 2002:a05:6602:3429:b0:83a:b52b:5cbb with SMTP id ca18e2360f4ac-8499e4c69f1mr4517218639f.5.1735952857072;
        Fri, 03 Jan 2025 17:07:37 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c1d9e34sm7902684173.121.2025.01.03.17.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 17:07:36 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso118399065ab.1;
        Fri, 03 Jan 2025 17:07:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSaIL1razEzjgPfr2r3qCAPv6YI4LiLQ0bjdBQLiZC39HSo7xLI9JVFF0UmyfYBYjRaJXuADpYmTE=@vger.kernel.org, AJvYcCWdkflc+LpFNa6gQwQkwmJ3NzEQaVSVLvSM1W33kv9o4Ke9x4ddFKIwejrWwqXer63Qb79JxW2x5EA4+6ha@vger.kernel.org, AJvYcCX27DhrcW0i6gFJoaUzRr8szdR1quQPSIaz3LCezhSeb8Buk1IokR0uSLJj8xUFn2AUrd+zGi+ty+ozvanztINbDvt8ng==@vger.kernel.org
X-Received: by 2002:a05:6e02:3301:b0:3a7:fe8c:b012 with SMTP id
 e9e14a558f8ab-3c2d533f2a0mr504488725ab.18.1735952856377; Fri, 03 Jan 2025
 17:07:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241226153031.49457-1-josh@joshuagrisham.com> <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
In-Reply-To: <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 4 Jan 2025 02:07:24 +0100
X-Gmail-Original-Message-ID: <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
Message-ID: <CAMF+KeYdshNex2h4kLJari=kXVxgcOZw7GDutJrV6vKC0PTe6A@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks again Armin for all of the very detailed comments -- they are
always super helpful!! A few things I think are pretty obvious and I
agree with, as well as where I missed as copy/paste when moving around
stuff that you caught (great!), so I will not bother to respond to
those here and will instead just fix them. :) For other things where I
have some questions, I will respond inline below.

Den tors 2 jan. 2025 kl 20:14 skrev Armin Wolf <W_Armin@gmx.de>:
>
> > +What:                /sys/class/firmware-attributes/*/attributes/usb_charging
> > +Date:                December 2024
> > +KernelVersion:       6.13
> > +Contact:     Joshua Grisham <josh@joshuagrisham.com>
> > +Description:
> > +             This attribute can be used to control if USB ports can continue to deliver power to
> > +             connected devices when the device is powered off or in a low sleep state. The value
> > +             is a boolean represented by 0 for false and 1 for true.
>
> Hi,
>
> please move the documentation of the firmware attributes to samsung-galaxybook.rst to avoid cluttering
> the subsystem docs with too much driver-specific entries.
>

I guess I am a bit confused by the intention and usage
firmware-attributes in general (including what should be in this
documentation vs not) -- is the idea that these should be "relatively
generic" attributes that control settings in the firmware that can
persist across reboots and or steer the firmware/hardware in various
ways (e.g. with admin password and/or pending reboot status etc) ? And
if they are "relatively generic" (e.g. could be reused by more than
one platform driver) then would the documentation belong here in a
centralized place? Otherwise, if they are device-specific, why would
they not be device attributes (e.g. via dev_groups for example),
instead of firmware-attributes?

> > +static void galaxybook_fw_attr_class_remove(void *data)
> > +{
> > +     device_destroy(fw_attr_class, MKDEV(0, 0));
>
> Please use device_unregister() instead since multiple devices might share the same devt of MKDEV(0, 0).
> This would also allow you to remove the global variable "fw_attr_class".
>

Here I am a bit confused on exactly how this would/should look; all
existing usages of fw_attr_class I can see use exactly this same
pattern: device_create() and then device_destroy() with MKDEV(0, 0).
Taking a look at the latest proposed changes from Thomas and it stil
seems the intention is the same, just that it is slightly simplified
and use pointer to the firmware_attributes_class directly instead of
fetching it using fw_attributes_class_get(). Or is there a better way
to do this (including usage of device_unregister() and/or something
different with the devt) that will help solve some other problem(s)?

> > +     sysfs_attr_init(&galaxybook->camera_lens_cover_attr);
> > +     galaxybook->camera_lens_cover_attr.attr.name = "camera_lens_cover";
> > +     galaxybook->camera_lens_cover_attr.attr.mode = 0644;
> > +     galaxybook->camera_lens_cover_attr.show = camera_lens_cover_show;
> > +     galaxybook->camera_lens_cover_attr.store = camera_lens_cover_store;
> > +     err = sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> > +                             &galaxybook->camera_lens_cover_attr.attr);
> > +     if (err)
> > +             return err;
> > +     return devm_add_action_or_reset(&galaxybook->platform->dev,
> > +                                     galaxybook_camera_lens_cover_attr_remove, galaxybook);
>
> That is not how the firmware attribute interface is supposed to work. For each firmware attribute you need to
> create an attribute group (with a unique name of course) with the following attributes:
>
> - type: should return "enumeration"
> - current_value: should return the current value of the firmware attribute
> - default_value: should return the default value of the firmware attribute
> - display_name: should contain a user friendly description of the firmware attribute
> - display_name_language_code: should return "en"
> - possible_values: should return "0;1" since this firmware attributes are boolean values
>
> You can theoretically use sysfs_create_groups() to add all groups in one go to simplify error handling. Since each
> attribute_group specifies a .is_visible callback you can handle the visibility of each group there.
>
> Those groups then need to be added to the fw_attrs_kset.
>

I guess as a follow-on to my earlier question regarding
firmware-attributes; here I was assuming that as these are very simple
"on vs off" attributes, I used the attribute "pending_reboot" as a
pattern for what I implemented here as my "best guess" on what to do
:) As there are not very many examples to look at then it was a bit of
a "best guess" on my part; apologies if I completely missed the boat!
I can of course add these entire groups but IMHO it does seem like
quite a bit of overkill to have all of these various attributes for
on/off or enabled/disabled kind of boolean switches -- my guess is
that if it is somehow "known" that an attribute is a boolean, then it
is relatively self-explanatory and the need for current / default /
possible_values etc attributes within this enumeration type group
should not be needed?  (this is why I followed "pending_reboot" as a
pattern when I did this, but as said I can change this to whatever is
deemed appropriate).

Also there are several other platform drivers that implement a very
similar device attribute as ones that I have added here as a firmware
attribute (namely I am thinking of "USB Charging" which exists in
several other pdx86 drivers but a few other devices should/would
probably support this kind of "Power on Lid Open" attribute as well);
in the event that maintainers of those drivers should and eventually
do migrate over to use the same or similar firmware attribute for this
same kind of setting, should it include all of these attributes in the
standard "enumeration" type attribute group or is it possible / would
it make sense to have some sort of boolean-based fw attr type that is
a bit more simple and a bit more self-explanatory?

> Just a small question: is the value of the camera lens cover persistent across reboots?
>

No (and I tested again to confirm), this "block recording" ACPI
setting does not persist over reboots. Should this one be a device
attribute (e.g. via dev_groups) instead of a firmware attribute in
that case?

> > +     /*
> > +      * Value returned in iob0 will have the number of supported performance modes.
> > +      * The performance mode values will then be given as a list after this (iob1-iobX).
> > +      * Loop backwards from last value to first value (to handle fallback cases which come with
> > +      * smaller values) and map each supported value to its correct platform_profile_option.
> > +      */
> > +     for (i = buf.iob0; i > 0; i--) {
> > +             /*
> > +              * Prefer mapping to at least performance, balanced, and low-power profiles, as they
> > +              * are the profiles which are typically supported by userspace tools
> > +              * (power-profiles-daemon, etc).
> > +              * - performance = "ultra", otherwise "performance"
> > +              * - balanced    = "optimized", otherwise "performance" when "ultra" is supported
> > +              * - low-power   = "silent", otherwise "quiet"
> > +              * Different models support different modes. Additional supported modes will be
> > +              * mapped to profiles that fall in between these 3.
> > +              */
>
> To be honest i would prefer if you remove this overly complicated mapping algorithm. I rather suggest that the
> userspace utilities in question are updated to handle such situations themself (other drivers would also benefit
> from this).
>
> I think the following static mappings would make sense:
>
> PERFORMANCE_MODE_ULTRA -> performance
> PERFORMANCE_MODE_PERFORMANCE -> balanced-performance
> PERFORMANCE_MODE_OPTIMIZED -> balanced
> PERFORMANCE_MODE_QUIET -> quiet
> PERFORMANCE_MODE_SILENT -> low-power
>
> The legacy performance modes should not override other performance modes, i. e. PERFORMANCE_MODE_PERFORMANCE_LEGACY
> should not override PERFORMANCE_MODE_PERFORMANCE. However non-legacy performance modes should override legacy
> performance modes.
>
> If you can be sure that legacy performance modes are not mixed with non-legacy performance modes then you can omit
> the override mechanism.
>

This whole thing was a bit "tricky" and the reason why I built the
logic in the way I did is that there are so many variations in these
devices which have different modes enabled depending on the hardware
and what generation (keep in mind that there are around 20-30
different models as of this writing that work with this driver and
many of them have slight variations on what hardware exists and/or
which modes are supported for various features including this
"performance mode"!).

For background, here is the original GitHub issue where I worked with
my community to initially go from hard-coded modes to dynamic based on
response from the ACPI method which gives the list of "supported
modes": https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/31

Basically, some devices only have 2 "actively used" performance modes,
some have 3, and some have 4. Some devices only have the "legacy"
modes, but newer devices report (according to the ACPI method +
payload that responds with "supported modes" on said device) to
support BOTH the "legacy" and the "newer" modes, but in Windows they
are only using the new modes, while "legacy" modes are ignored by the
Samsung-developed apps and services in Windows.

The response from the "supported performance modes" method gives the
total number of supported "modes" followed by a list of each of them,
and will look something like this (using enum names here to hopefully
help make more sense, but leaving out my prefix "PERFORMANCE_MODE_"
for brevity...):

On my "Pro" Galaxy Book, it looks like this:

6 (# of supported modes), OPTIMIZED_LEGACY, PERFORMANCE_LEGACY,
OPTIMIZED, QUIET, SILENT, PERFORMANCE

Because I have seen that upower + GNOME integration does not even
really work unless you have all three of low-power + balanced +
performance available, then my goal was to map the above modes to
these profiles:

PERFORMANCE -> performance
OPTIMIZED -> balanced
QUIET -> quiet
SILENT -> low-power

(and, just as in Windows, ignore the "legacy" modes as I have a valid
non-legacy mode to cover each different one)

On the "Ultra" line of Galaxy Books, it looks like this:

6, OPTIMIZED_LEGACY, PERFORMANCE_LEGACY, OPTIMIZED, QUIET, PERFORMANCE, ULTRA

(so no SILENT, but add an ULTRA...)

In this case, in order to ensure to map at least low-power + balanced
+ performance and fit the rest in between, I would want:

ULTRA -> performance
PERFORMANCE -> balanced-performance
OPTIMIZED -> balanced
QUIET -> low-power

Both of these examples match exactly how these devices also work in
Windows with Samsung's own developed applications and services.
Namely, that when the newer modes exist, they use them instead of the
"legacy" modes even though the ACPI method includes all of them as
"supported." I think it would be good to maintain this behavior, as
these are the values which Samsung is supporting already in Windows
and the others are potentially untested and I would worry about
potential issues including overheating or otherwise harming the device
in some way.

In cases where only the "legacy" modes exist, then those are the modes
that are used in Windows (e.g. for some devices with SAM0427) and the
ACPI method does not respond with anything except the legacy mode
values. Some of the SAM0427 devices I have seen can look like this,
for example:

5, OPTIMIZED_LEGACY, PERFORMANCE_LEGACY, QUIET, SILENT, PERFORMANCE

In this case, we want to map like this:

PERFORMANCE -> performance
OPTIMIZED_LEGACY -> balanced
QUIET -> quiet
SILENT -> low-power

(using OPTIMIZED_LEGACY for balanced, as OPTIMIZED does not exist on
this device, but there is a non-legacy mode for all of the others that
should be used)

So, with all of that background in mind, my idea and what I
implemented was to basically take the list provided in response from
the ACPI method, start from the end, looping backwards, and try to map
them one-at-a-time, all the while checking if the desired profile for
the given performance mode was already mapped or not, and if so,
either "fitting it in" to another profile or just ignoring it.

I am quite certain that the code can be cleaned up and/or refactored a
bit, but I would hope that the result of the logic should stay the
same (per what I described above); having said all of that, does it
still make sense to try and simplify this somehow and/or any tips or
recommendation how to achieve the desired result in a better way?

> > +     if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.max_brightness)
>
> Please use led_get_brightness() here.
>

When I looked at this originally I thought it would make sense to do
this, but then found that this function is not part of leds.h in the
kernel headers but instead you would have to include both
<linux/leds.h> and also  "../../leds/leds.h" as a file header from the
tree. Also, apart from led-core, there is only one LED driver that
uses the function currently .. does this seem reasonable to include
this extra file-based header or would it make more sense to just read
the value of the member directly as all of the other drivers that need
to do this work currently?

(FWIW I did test to include this header file and it works fine to use
the function instead, it just feels a bit "off"...)

> > +static void galaxybook_remove(struct platform_device *pdev)
> > +{
> > +     if (galaxybook_ptr)
> > +             galaxybook_ptr = NULL;
>
> As already being said, this will cause issues with the i8042 filter. I suggest you move the whole galaxybook_ptr
> handling inside galaxybook_i8042_filter_install()/_remove().
>

Yes I think this makes sense as well and is what I will do in the next
version in case your patch to pass a context pointer to i8042 filter
does not go before then :)

> All things considered the driver looks quite good, hoping for a v5 revision in the future :).
>
> Thanks,
> Armin Wolf
>

Yes it has taken me a few days to get back and dig into this again due
to the holidays, but am looking through it all again and will
hopefully have a new version soon-ish to try and resolve more of the
open issues. Thank you again for all of your help!!

Best,
Joshua
