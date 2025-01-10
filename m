Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328AA213230;
	Fri, 10 Jan 2025 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736527518; cv=none; b=Sp8YJSv+K7xnfUcp/PA7Ib3O9UHuZcxUXc9EUwJRzqs/oEK1wWXyDzm/Zp5EPTSVHpu5gLEEsr85qU+geIWCAFlrKHrc21m4JSIegoLxCWRL7hOT1vsTq2KgKCPYzTC9eaX43QfqJV+9jkF2avpyBCZ9VkJG14tbWhgmoPybSxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736527518; c=relaxed/simple;
	bh=L1pF+IWcyThPOuf7JdqMnJdJ1JmPDYBxBgmtP4Nh6kI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+o3OAu6zAKLdKlQPgqk1HR+f+HqXzPZUg8z11SkTmF/IAIyS+2EN9N8WZ83SaSV1oI5apefy6VF9ycArI/D0LH1fgiZOlU9TYz9v+b0/SiV5CIRY0DCLJiJ18+IPJIgfeD8noz4mKrzvcSn1s5MdVkpf/CiJZjdC6ar/WM2WSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-844ef6275c5so69479039f.0;
        Fri, 10 Jan 2025 08:45:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736527515; x=1737132315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3IemSynoDx8cLCUlorRAnU55KImi1xe6Q1cFFow2A4=;
        b=AgCBmteO12u45yH6jXeFXVcgkBP17ayvz5pBrgUWdcDjnnnAuQldSi321odxCqwxQG
         wiA9/tizxWIidYPive0CvqKGnt5MnvqvDhd7dai6APjJ/5poADi8qTtxt+s/9tlJVSfj
         yXXNk/xHvPNvXtOAuWm+VgGwbXhDTZPEvlKJFV2PcWoXIcTKILbR9zQjoufgvkr7FKHQ
         Jlq5Mdq2TiRQVv7YSjxoGDTdWqieBuR64MYu4RijZWN+b/DjZU81IhiDQPwGHDR60ZSa
         hwC4y6hUjVR+if8yZu/LBjQ/ic/NyFtQtORYg7OoxKpOOjhd6hCZ/WTeVvFsKAYGMdy9
         rwoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEed0k4FsMsYKVgkpuUpuV3VCLulqtToo8LM41kDBLp5/N83M1gLElspz5YvwnqJ4ar1haBIVa2dg=@vger.kernel.org, AJvYcCXOoyKuSDlZJDadg89zIi/TveydIO1Os5yM36PqQUiMoEY/hWfm+ulPMo7igMe5i8fM3JmSMSiWG84HdWcY@vger.kernel.org, AJvYcCXacWNhLixOnr0GhhJSI2eey0yj9AB8T+UdiYWildLGk4EIFAFEV6AgD+VJztUZiqe9BKIvEC975kCN8R8pwLqh2nRLkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysGM0UfdPvcNap1rYxL7HeVgPRFlprL6otJftyKgVVg8ejCvW9
	fZPPwd4NLddCEm1yEZmR1EsgIzMfX1MJXpbEISpBLdnSYIbCIGw57zD++DiXXVM=
X-Gm-Gg: ASbGnctnPFI7HQ2qCYp/GTGRy7lAl1B+dob79WBDpTlw1j6fGkgY0r7Vb6KRZocILNc
	r9alNcj/gVT5YpOI1G3Khm93QeqKxZ81jeriMM0FWfFLUTjZsFay2irFbFRECTvwv0ZvmMPo66b
	UWSImXoPn1UNR6ZQIZZPDzK1x88E48vqqNNemeq+KvntNNDAt53e8gC3NZbQxd43yGW9DqNq2sU
	xvqfojXjr9UGjgeVeKBpTkNjOriXb1+DlJF3EN7NtMt1xtOZhMUGmQ5CIl2nZ0FA2EgSCBB5d4b
	A2tZ2+C+dtWvJyT32b8Za6wtuw==
X-Google-Smtp-Source: AGHT+IEP6OMyiQIXblmdZKMzQxFZwwObizpFZJ2/E7TGSipZf7JifpZYIheTphpqCLgtaCnZ8h7z4A==
X-Received: by 2002:a05:6e02:1c2a:b0:3a7:86ab:bebe with SMTP id e9e14a558f8ab-3ce3aa5adc0mr79475885ab.16.1736527515072;
        Fri, 10 Jan 2025 08:45:15 -0800 (PST)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ce4add8827sm10235275ab.35.2025.01.10.08.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 08:45:14 -0800 (PST)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a777958043so7497565ab.2;
        Fri, 10 Jan 2025 08:45:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUzGCfdNnoRf+LEYbp48qiylWNsdvMtC2BFk2sGDyFCFNqgUVGVamZlQ4MdjMuUkcPUvGH85EOKdklESkedHIpNX15rVg==@vger.kernel.org, AJvYcCV7A73QCnnBp3Wt54l6p0+/pYyYAIJ3AS9eWlVX/w0G+gnilETBwhiRdmrr6YXQbBJeztjXxic4UkTodzIo@vger.kernel.org, AJvYcCWn2iwlL3Qh/p465C23UqxVENlrMGO5vGXv0llcsUFCQkiNPu204C59dxFQy3Z4x21EJs32fROecAI=@vger.kernel.org
X-Received: by 2002:a92:ca4c:0:b0:3a7:8270:3e69 with SMTP id
 e9e14a558f8ab-3ce3aa5acbdmr83190565ab.15.1736527514470; Fri, 10 Jan 2025
 08:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109220745.69977-1-josh@joshuagrisham.com>
 <30f6644c-bf35-dd5e-4f1c-d1f1915b97da@linux.intel.com> <CAMF+KeaN_FXjEHOw72LD7GgfFyhjjXjY+ask4vxd1jV+zXn=Mw@mail.gmail.com>
 <2ce20c14-cc74-5c06-e473-717705e3d7f7@linux.intel.com>
In-Reply-To: <2ce20c14-cc74-5c06-e473-717705e3d7f7@linux.intel.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Fri, 10 Jan 2025 17:45:03 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZcU2_rGGUvkya9psTgdgDoVwNcP6_8a-ihrPTb8cQy6w@mail.gmail.com>
X-Gm-Features: AbW1kva1y_UNnogkx6BjLpAOaBqwFVbsZ_K6AjTBc8MKZ_XBgL7FT-PHOOs_FuI
Message-ID: <CAMF+KeZcU2_rGGUvkya9psTgdgDoVwNcP6_8a-ihrPTb8cQy6w@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, W_Armin@gmx.de, thomas@t-8ch.de, 
	kuurtb@gmail.com, Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Den fre 10 jan. 2025 kl 17:34 skrev Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com>:
>
> On Fri, 10 Jan 2025, Joshua Grisham wrote:
>
> > Hi Ilpo, thanks for taking the time! Few clarifications/comments below.=
..
> >
> > Den fre 10 jan. 2025 kl 12:30 skrev Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com>:
> > >
> > > > +static int get_performance_mode_profile(struct samsung_galaxybook =
*galaxybook,
> > > > +                                     const u8 performance_mode,
> > > > +                                     enum platform_profile_option =
*profile)
> > > > +{
> > > > +     for (int i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
> > >
> > > unsigned int is preferred for loop variables that never should become
> > > negative.
> > >
> >
> > Thanks for the catch! There are a few other places with a for loop
> > using int i so I will go ahead and change all of them to unsigned ints
> > for the next version unless you say otherwise.
> >
> > > > +     if (num_mapped =3D=3D 0) {
> > > > +             dev_dbg(&galaxybook->platform->dev, "failed to map an=
y performance modes\n");
> > > > +             return 0;
> > >
> > > Should this return error instead? I assume it's because you want to
> > > initialize with part of the features only but...
> > >
> >
> > Yes at this point it is "no harm, no foul": the profile_handler has
> > not been set up, platform profile has not been registered, and
> > has_performance_mode is false, so I want that it just exits and the
> > probe continues to init other features (e.g. devices with SAM0427 have
> > kbd backlight controller and firmware attributes but not this specific
> > performance_mode implementation, so for them this function will just
> > stop anywhere along the way at whatever point it fails and just "not
> > doing anything else" but still let them use the other features of the
> > driver... all other features that then check against
> > has_performance_mode will see that it is false and just skip that
> > part). Does this still seem ok or is there any adjustment you would
> > like to see for this?
> >
> > > > +     /* if startup performance_mode fails to match a profile, try =
to set init mode */
> > > > +     err =3D get_performance_mode_profile(galaxybook, performance_=
mode, NULL);
> > > > +     if (err) {
> > > > +             if (init_performance_mode =3D=3D GB_PERFORMANCE_MODE_=
UNKNOWN) {
> > > > +                     dev_err(&galaxybook->platform->dev, "missing =
initial performance mode\n");
> > > > +                     return -ENODATA;
> > > > +             }
> > > > +             err =3D performance_mode_acpi_set(galaxybook, init_pe=
rformance_mode);
> > > > +             if (err) {
> > > > +                     dev_err(&galaxybook->platform->dev,
> > > > +                             "failed to set initial performance mo=
de 0x%x\n",
> > > > +                             init_performance_mode);
> > > > +                     return err;
> > >
> > > ...why these two cases then result in failing everything vs. just pla=
tform
> > > profile feature? Not an end of the world but it feels inconsistent to=
 me.
> > >
> >
> > I am glad you bring this up, as it forces me think through this a few
> > more rounds... basically what happens is that the device will always
> > come up from a fresh boot with the value of 0x0 as the "current
> > performance mode" as response from the ACPI method, even though for
> > most devices value 0x0 is the "legacy" optimized value that should not
> > be used.
> >
> > In Windows, the Samsung background apps take care of this by storing
> > last-used value from previous session and then re-applying it after
> > startup (and the same happens with various userspace services on
> > platform profile from what I have seen, actually).
> >
> > But since the driver does not map 0x0 to any valid profile unless the
> > device only has the "legacy" optimized mode, then my function
> > get_performance_mode_profile() will return -ENODATA in this initial
> > startup state of 0x0. What I noticed is that the first time after this
> > that you run platform_profile_cycle() after this, there is a little
> > "hiccup" and an error "Failed to get profile for handler .." is
> > printed in the kernel log from platform_profile.c (without pr_fmt by
> > the way), but then it just works anyway and starts to pick up from the
> > first enabled profile and then can continue to cycle.
> >
> > My bit of code here was to basically try to "force" to set the profile
> > to whatever was successfully mapped as "balanced" upon a fresh startup
> > so that when platform_profile_cycle() first runs there would not be
> > any condition where get_performance_mode_profile() would return
> > -ENODATA. Then the userspace tools would take over anyway and restore
> > your last session's latest used profile so it would not matter so
> > much. In the end, really the aim I guess is to avoid this error
> > message in the kernel log, but otherwise everything works even though
> > there is an error message printed, but this is maybe a bit overkill?
> > And by the way, that, as you say, we should probably not fail the
> > entire feature just because of this, but let the error happen anyway
> > and let everything work after that.
> >
> > Possibly more "simple" alternatives I can think of off the top of my he=
ad:
> >
> > 1. Let get_performance_mode_profile() return 0 instead of -ENODATA if
> > nothing is matched , this way a non-mapped performance mode would
> > always just set platform_profile_cycle() to the start of the cycle I
> > guess/would hope? and/or add a special case in
> > get_performance_mode_profile() for performance_mode=3D0 to just return =
0
> > to get the same effect ? (though what happens if we have not enabled
> > PLATFORM_PROFILE_LOW_POWER in the choices? even though the function
> > returned 0, will platform_profile see that 0 is not supported, and
> > just keep moving on until it gets to the first one that is? If so then
> > this will work, but I have not yet tested or fully checked the code to
> > ensure that this will actually be the behavior...)
> >
> > 2. Try to do the logic which I did with this init_performance_mode,
> > but in case init_profile_mode is not set, just skip it and let the
> > error come from platform_profile_cycle() anyway and it should start to
> > work. In this case I think it would be good if the user is maybe
> > flagged somehow and create a bug for this, because I would want to be
> > able to work with them to see what modes are reported by their device
> > and see if the mapping needs to be updated in some way.
> >
> > 3. Do neither of these, remove everything with init_performance_mode,
> > and just let platform_profile_cycle() fail upon startup and print the
> > error message and then it should just start working after anyway.
> >
> > 4. Map 0x0 performance_mode to PLATFORM_PROFILE_CUSTOM in case the
> > "legacy" mode with this value is not mapped, then the hotkey would not
> > work to cycle the profile at first as the user would be forced to set
> > the profile to a value via either a GUI or the sysfs interface before
> > they can begin to use the hotkey to cycle the profile. Once they do
> > this the very first time, then the userspace tools should kick in
> > after this (upon every restart for example) to set the profile to the
> > prior session's last used profile and then the hotkey will start to
> > work to cycle the profile anyway in that session without any
> > intervention from the user at all (so it is the very first time that
> > they start their environment up, assuming that the prior value does
> > not get cleared somehow due to some combo like the module being
> > removed/blacklisted and then they restart, then add it back, etc, or
> > some other corner-case situation?)
> >
> > I do think that something should change, maybe the most
> > straight-forward are either 1 or 2 in this list, but not sure if there
> > are any opinions or preferences on these or if there are other better
> > options I did not think of here?
>
> I think you entirely missed my point, which is that also
> galaxybook_probe() will fail if you return an error from this function.
> That is, you won't have battery, backlight, etc. when the probe fails.
> This is a bit inconsistent with the other case I mentioned above where yo=
u
> get everything else but platform profiles because 0 is returned.
>
> Also, devm_platform_profile_register() won't be called regardless of
> whether you return errno or 0 at this point so there won't be platform
> profile handling registered anyway so most of your discussion seems
> irrelevant.
>

I did get the point I think and was why I said both "I do think that
something should change" and specifically when I said "And by the way,
that, as you say, we should probably not fail the entire feature just
because of this, but let the error happen anyway and let everything
work after that." I can imagine that with my wall of words it is easy
that the message could get lost in there -- that is on me :)

But regardless, yes, it should not return here, but I was more
thinking about how to better/more cleanly handle the situation so that
the logic is less "hacky", if that makes sense :)

> --
>  i.

Thanks again!
Joshua
