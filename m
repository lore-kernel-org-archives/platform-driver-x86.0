Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0425620A5FB;
	Fri, 10 Jan 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524771; cv=none; b=tca2jIxxdXst7dGrfLGpPf+zXWZx1qNuDhgvv6F62L6z+nM+bILXx5Eseqw1yTa+TUxdLrECjvW7G2sSwCRjK5rJ23BW0Y9v+kc3Ea7B3SKUuZM35RIJn6pd/9aLLaUk2BewsZWCRhZCmu45883dIlat3pIiA3Z0OP/fzFPwTL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524771; c=relaxed/simple;
	bh=VOf3joCRWku7JV0qqkb/JfzkQ/NlhMLlK3RE73Tu0Ec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7o5jK4q1D6DjLkTSWzh1VeP8b2baWvA6aE0dsuTdBRqcuVoo3v5yYXtteuKqtAZ5h9u+wUdNZBx7C2fh/2tM+Txo13saow5ArCZJLABnLGer0Tk1Ej7sUpOLF4eKUOx0IVMRow+S02TC2NGi1n9rgAzwysUA1XTizKOWar78tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3a81324bbdcso13819405ab.1;
        Fri, 10 Jan 2025 07:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524769; x=1737129569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHBFG2hXwHCpEKoHsn8D+NY3oc8cJ69pO24XioRtFak=;
        b=Map6Nm5WLajYQPZ7IukeVVurWm9363g5YSYjZ72xCueXXxjNe0iWqhM3Z+WEA+Kfk0
         xG4TbwUCdCNQjAwSuEEv8DyKoeAf3PHE9VXL8/GvjW7XdDZyaeMhQ+OOzW8y20koPzGQ
         pbfaZzQezAFAeNr09qXNYHtK5DG7VogWsE29+bnwlEFRoFUG8JWJDTR3s6qHx4y+65xi
         aJEHF5XKJoFeti13w3IQRH92xw6ITpdYQ3AUSQXsDkool4Hdi55J2bB4QwZ2mCFFVya9
         ri/ws+EGbejw4/oPFyVjoNLDeL8uuUVQ8/vEz8/mG8ESQnz4aCC3PKbHh6TxxBXnnFVp
         UbRw==
X-Forwarded-Encrypted: i=1; AJvYcCUvxzyEdoepoEdL2H8y3NuiJEvJsxTyWJISR0qq6rGSBzTq+KRFjW6PKQ9u+ez8YKpEHFn6xQRIgu8=@vger.kernel.org, AJvYcCVT8WGIi1dfMhz6N24Ksfd0zgm9I4/GyII60s1eMUYhB/TvAch2wJm+pHgTyqDGHDAjrrgEsJpWhlEjLRyxOElxqFLMxg==@vger.kernel.org, AJvYcCWb/05MEnGaxLKtqA4VWH/N/GVTuHzUE7/qsjZbZksqN+byfQKVKfMRZYYvW822QbynB6r6rXyOYgDDVIZM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2/j6Ad+t8m0elN9KP0kQxtHT8XeRJhktpsOleX5sH1kPEsq+x
	T+yiNIRPDKSsZswWxT1+6/ACP5W6WVkjRB5EB/I9aL8Cts5X84cQqAu7siJ+jTg=
X-Gm-Gg: ASbGnctgMqmfeoirVawvSjeD5kl3pDCVDKPKBgxJZcyUVeFMogqOva/L8OODPLvogy2
	nLAP6ZNRkhmSU+GnDpa51Xf3NFk+4cevcDaf4EXkmA6dYyvw0dIqXR15icZjwI6pnG4k7KiEW+b
	zYnzzI2tj5bCOYbYGrH1W9p0jX4VVDzDqsuPCKzaZQq/3AC0pkoMoAWVI/P7x7uKEZUHcvtjxJg
	jQ3X4VVoFKOryIZVkWvm2AEn6wKDihXXiB7qUFnBzUPXsvgZeJcyMIz8hR+QM+lw5ShU0evnQtk
	2YN7I2h2jW+7HbV3+BokDg==
X-Google-Smtp-Source: AGHT+IEAdGK+Nhqi95tYqBxHQGi/KlTwHX8df1ZQ9G34mxVF90bIqSW+KiWFGDrOrpLy67+BtNNT5g==
X-Received: by 2002:a05:6e02:1f8a:b0:3cc:b7e4:6264 with SMTP id e9e14a558f8ab-3ce3a892c05mr89228965ab.0.1736524768982;
        Fri, 10 Jan 2025 07:59:28 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com. [209.85.166.45])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4addb410sm10371545ab.41.2025.01.10.07.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 07:59:28 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-844e61f3902so155165939f.0;
        Fri, 10 Jan 2025 07:59:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUJmlBtqY3TgWF4KvgGCJuCq2eElY1My8G6NHHkzUJ7VvXJbbMxeMdCtKu32aOSPG/kzBHXHynb7Y=@vger.kernel.org, AJvYcCX39uAn24AmW5fe0JzUQXtuneS5z5fy75TaYzAB96OGTYeB0R47krls11Z5drdqXrDPm/WCLAUssFuLQhm1wyww9PZliQ==@vger.kernel.org, AJvYcCXkF8GDp8E3PvnWwXhG7Zn/ZPrdcbhdJRomOllDb1QdYvL9vv35JUipXOfBHSP6prGKNXSAoMVXq50K7Kpv@vger.kernel.org
X-Received: by 2002:a05:6e02:13a2:b0:3a7:e732:472a with SMTP id
 e9e14a558f8ab-3ce3a9a4ac6mr89825995ab.2.1736524767919; Fri, 10 Jan 2025
 07:59:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220745.69977-1-josh@joshuagrisham.com> <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com>
In-Reply-To: <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 10 Jan 2025 16:59:16 +0100
X-Gmail-Original-Message-ID: <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
X-Gm-Features: AbW1kvYOduiRt--ToaafK15apWbhlB2OstFOd_AfbotoogeTRg7xNSAp_ZuqXSo
Message-ID: <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, W_Armin@gmx.de, thomas@t-8ch.de, 
	kuurtb@gmail.com, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo, thanks for taking the time! Few clarifications/comments below...

Den fre 10 jan. 2025 kl 12:30 skrev Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> > +static int get_performance_mode_profile(struct samsung_galaxybook *gal=
axybook,
> > +                                     const u8 performance_mode,
> > +                                     enum platform_profile_option *pro=
file)
> > +{
> > +     for (int i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
>
> unsigned int is preferred for loop variables that never should become
> negative.
>

Thanks for the catch! There are a few other places with a for loop
using int i so I will go ahead and change all of them to unsigned ints
for the next version unless you say otherwise.

> > +     if (num_mapped =3D=3D 0) {
> > +             dev_dbg(&galaxybook->platform->dev, "failed to map any pe=
rformance modes\n");
> > +             return 0;
>
> Should this return error instead? I assume it's because you want to
> initialize with part of the features only but...
>

Yes at this point it is "no harm, no foul": the profile_handler has
not been set up, platform profile has not been registered, and
has_performance_mode is false, so I want that it just exits and the
probe continues to init other features (e.g. devices with SAM0427 have
kbd backlight controller and firmware attributes but not this specific
performance_mode implementation, so for them this function will just
stop anywhere along the way at whatever point it fails and just "not
doing anything else" but still let them use the other features of the
driver... all other features that then check against
has_performance_mode will see that it is false and just skip that
part). Does this still seem ok or is there any adjustment you would
like to see for this?

> > +     /* if startup performance_mode fails to match a profile, try to s=
et init mode */
> > +     err =3D get_performance_mode_profile(galaxybook, performance_mode=
, NULL);
> > +     if (err) {
> > +             if (init_performance_mode =3D=3D GB_PERFORMANCE_MODE_UNKN=
OWN) {
> > +                     dev_err(&galaxybook->platform->dev, "missing init=
ial performance mode\n");
> > +                     return -ENODATA;
> > +             }
> > +             err =3D performance_mode_acpi_set(galaxybook, init_perfor=
mance_mode);
> > +             if (err) {
> > +                     dev_err(&galaxybook->platform->dev,
> > +                             "failed to set initial performance mode 0=
x%x\n",
> > +                             init_performance_mode);
> > +                     return err;
>
> ...why these two cases then result in failing everything vs. just platfor=
m
> profile feature? Not an end of the world but it feels inconsistent to me.
>

I am glad you bring this up, as it forces me think through this a few
more rounds... basically what happens is that the device will always
come up from a fresh boot with the value of 0x0 as the "current
performance mode" as response from the ACPI method, even though for
most devices value 0x0 is the "legacy" optimized value that should not
be used.

In Windows, the Samsung background apps take care of this by storing
last-used value from previous session and then re-applying it after
startup (and the same happens with various userspace services on
platform profile from what I have seen, actually).

But since the driver does not map 0x0 to any valid profile unless the
device only has the "legacy" optimized mode, then my function
get_performance_mode_profile() will return -ENODATA in this initial
startup state of 0x0. What I noticed is that the first time after this
that you run platform_profile_cycle() after this, there is a little
"hiccup" and an error "Failed to get profile for handler .." is
printed in the kernel log from platform_profile.c (without pr_fmt by
the way), but then it just works anyway and starts to pick up from the
first enabled profile and then can continue to cycle.

My bit of code here was to basically try to "force" to set the profile
to whatever was successfully mapped as "balanced" upon a fresh startup
so that when platform_profile_cycle() first runs there would not be
any condition where get_performance_mode_profile() would return
-ENODATA. Then the userspace tools would take over anyway and restore
your last session's latest used profile so it would not matter so
much. In the end, really the aim I guess is to avoid this error
message in the kernel log, but otherwise everything works even though
there is an error message printed, but this is maybe a bit overkill?
And by the way, that, as you say, we should probably not fail the
entire feature just because of this, but let the error happen anyway
and let everything work after that.

Possibly more "simple" alternatives I can think of off the top of my head:

1. Let get_performance_mode_profile() return 0 instead of -ENODATA if
nothing is matched , this way a non-mapped performance mode would
always just set platform_profile_cycle() to the start of the cycle I
guess/would hope? and/or add a special case in
get_performance_mode_profile() for performance_mode=3D0 to just return 0
to get the same effect ? (though what happens if we have not enabled
PLATFORM_PROFILE_LOW_POWER in the choices? even though the function
returned 0, will platform_profile see that 0 is not supported, and
just keep moving on until it gets to the first one that is? If so then
this will work, but I have not yet tested or fully checked the code to
ensure that this will actually be the behavior...)

2. Try to do the logic which I did with this init_performance_mode,
but in case init_profile_mode is not set, just skip it and let the
error come from platform_profile_cycle() anyway and it should start to
work. In this case I think it would be good if the user is maybe
flagged somehow and create a bug for this, because I would want to be
able to work with them to see what modes are reported by their device
and see if the mapping needs to be updated in some way.

3. Do neither of these, remove everything with init_performance_mode,
and just let platform_profile_cycle() fail upon startup and print the
error message and then it should just start working after anyway.

4. Map 0x0 performance_mode to PLATFORM_PROFILE_CUSTOM in case the
"legacy" mode with this value is not mapped, then the hotkey would not
work to cycle the profile at first as the user would be forced to set
the profile to a value via either a GUI or the sysfs interface before
they can begin to use the hotkey to cycle the profile. Once they do
this the very first time, then the userspace tools should kick in
after this (upon every restart for example) to set the profile to the
prior session's last used profile and then the hotkey will start to
work to cycle the profile anyway in that session without any
intervention from the user at all (so it is the very first time that
they start their environment up, assuming that the prior value does
not get cleared somehow due to some combo like the module being
removed/blacklisted and then they restart, then add it back, etc, or
some other corner-case situation?)

I do think that something should change, maybe the most
straight-forward are either 1 or 2 in this list, but not sure if there
are any opinions or preferences on these or if there are other better
options I did not think of here?

> > +static ssize_t current_value_store(struct kobject *kobj, struct kobj_a=
ttribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +     struct galaxybook_fw_attr *fw_attr =3D
> > +             container_of(attr, struct galaxybook_fw_attr, current_val=
ue);
> > +     struct samsung_galaxybook *galaxybook =3D fw_attr->galaxybook;
> > +
> > +     bool value;
>
> Remove the extra empty line from within variable declarations.
>

Yes sorry this was just a miss when so much got moved around due to
the big changes between v4 and v5; will fix this and the other small
straight-forward issues for v6 :)

> --
>  i.

Thanks again!
Joshua
