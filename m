Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DB35968;
	Sat, 18 Jan 2025 19:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737229914; cv=none; b=NWDYgE2+YbmNiGaBr6rbih7Dvf60abZehD0ddO2oaWob31FSywYJpcQXAC97oDtj1Aw6+d+byse7doy3UUjQiro7Y+cWKhEqaGudmEJ5xOEd6jWjR1B13SBz0zbagZOd5tweICNp7bFQ4UdeWt3cb6NOEwaP2o7JhF22dSufOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737229914; c=relaxed/simple;
	bh=NrioQWBNCFowwK9QsPABFfoeLm+9JcBFp6eZEkEeACk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swQN7M+owswC5ynxVXWqQ4//VuUiDTNsU8La4+BHoVpZ6Ktr6LXi+WZUnRakD6DA+Sksk2Akd7HdWjYTv+eTvXsX3pEwSSUawOQbaI/9GoKffDClpTdPZl7xjB14r1F40rDSr7+2Y0GV9fv2ttEXJ+Jnl3rjjMZob2mhXIniGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ce7a33ea70so12102075ab.3;
        Sat, 18 Jan 2025 11:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737229912; x=1737834712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AzH1R41/+stMzeesEvLMZKX5Ljm2s44ACQb90QYPAQc=;
        b=E2+w3hCuGX3jTIzSopLYZ/8A/r7LuKS08LP1mZR1t4n3McDAb4nDj4CeQG+9SSGEfj
         WkgP2dMP1OqZXaA1wh04Hgd1KGXTAPoKhi0uUxQihy+iPwIsjvtOUA8xR3GrIPvLaq36
         jcofGUnyBAek4Am0zOEtwoBzCTK6zqdQr84LjLbRHWgWkogGJVA2ZH2OFfN1WuhFJWH5
         4mHtD9Eo+38rMdN1uM/MzD7YV731TZHvu7ZiLl2umhczfvDWTXAaO6PGwYs8UUOZ2Svu
         NXVbpJOj0j776ZOjw+tM4Jxxrp65BYZFDvimIOAtD7CcnY20Nfkd/kCJ9WuSA17fPEz8
         87sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHcB/N4ZyN96n8WL75vq6OxC6238Qo30E9inPIBcECvk7jX5AetTbGYzoi8Ar1Gxfg66MsN1FUJBw=@vger.kernel.org, AJvYcCXUm8EVJ7Mc+PQG2AmM1rH/MhP7jKEKhmbHMrAJXNuY/Sadm22CG2IreOaWaK+yZiZ+uxyYBS5dVMTEznuL@vger.kernel.org, AJvYcCXcl/SDHnmiUHw7ngOsJj5Qka80+TkK2YtsCQuSEHpykUH3TrhwuG6vKmcm6MpV5GsXWTvITTly34njk7OuOtLjGnk0fA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcJzJDFX+op75JyQvkn+ks7BFSnwWdfRNEdBDXBFb43eEUzYpU
	CPtEIkB5QrBO1p3okMW4O7NXG5re8iqKkXJe9Jx1edb+y3D8p4zV7DOTX9eZUuI=
X-Gm-Gg: ASbGnctvuQi8VwmU+q1RWcKdlqEqk3ChD3Rrd+qnMZJlDpLgyM4Mbyx3a58x1FialDW
	UGegkDqp3q/JL09EG2BqBKekB0Q4qXL5AG6Q++oicDi1hZfxdTPR11DockPXpsAmmix3UBH4O4c
	wxHjvRKTViCBhzw56WWawHT7rw+7MmTXoxv6fVX92a8YFTgLWDuJnAU5HSrAtBBMbMNMD5chvKy
	C/+fsKzZz9rBm+vdR618A9LXvRblQsCNjvvyD8v1O6lligD/r4U2ZGOsqmyU02OnQUIgt2WPdkU
	cSNKcjR+mZGMkgdec+fe4Nq9385Xpy6OQox98Oc=
X-Google-Smtp-Source: AGHT+IFdhI8GsXWq+SgI1fJrqkjtkclRcQf5y9LiPv/l79p4ZMf7PN4Z4ElGixBByH6TdyEwvFOkwQ==
X-Received: by 2002:a05:6e02:2149:b0:3a7:e0a5:aa98 with SMTP id e9e14a558f8ab-3cf74426a36mr50731205ab.13.1737229911486;
        Sat, 18 Jan 2025 11:51:51 -0800 (PST)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com. [209.85.166.182])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3cf71b44121sm11433355ab.50.2025.01.18.11.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jan 2025 11:51:51 -0800 (PST)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3ce7a33ea70so12101975ab.3;
        Sat, 18 Jan 2025 11:51:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz6zsx1xPuONP2vOjK3JdDC55wQGdSULWqLs6aVRurijkhAkAJnVfxIUEn1/EbN+QZpnmy2ffvlhH/312zIAf1j7fc6w==@vger.kernel.org, AJvYcCXLZRC7zXhUUBIxlbk9r7GmdAjR+rJhHaQ6DbqrMRy6iG8pDR9sf3AGW8Zin690TTwLmI/w11khFsY2wQCl@vger.kernel.org, AJvYcCXY8XdWy+RPrL2O7oq9G1pxJAAQI6fceO9XJRaGUzhDv+xvW2/tHkGeWEZ5dIgzr13+Zb3VuT9DA2o=@vger.kernel.org
X-Received: by 2002:a05:6e02:1aa8:b0:3cf:6d33:d40d with SMTP id
 e9e14a558f8ab-3cf742812e4mr54642335ab.0.1737229910953; Sat, 18 Jan 2025
 11:51:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250118004322.10062-1-josh@joshuagrisham.com> <D750ADJIJO3T.JVSA3PBBPXGP@gmail.com>
In-Reply-To: <D750ADJIJO3T.JVSA3PBBPXGP@gmail.com>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Sat, 18 Jan 2025 20:51:39 +0100
X-Gmail-Original-Message-ID: <CAMF+KeZ=iUQzunGUdv3-=PLC+i7JpO82bUtKp02-PsothThgug@mail.gmail.com>
X-Gm-Features: AbW1kvZJx9wL3EYAgFfsVln9drAT0FxgPziat7SqS_YbquXuKSQBv9wcM8UkBEA
Message-ID: <CAMF+KeZ=iUQzunGUdv3-=PLC+i7JpO82bUtKp02-PsothThgug@mail.gmail.com>
Subject: Re: [PATCH v7] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Kurt Borja <kuurtb@gmail.com>
Cc: W_Armin@gmx.de, thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com, 
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kurt, thanks for getting back so fast on this!

Den l=C3=B6r 18 jan. 2025 kl 08:04 skrev Kurt Borja <kuurtb@gmail.com>:
>
> Hi Joshua,
>
> I have some comments on the platform profile section. The most important
> one is the platform_profile probe one, the rest are suggetions.
>
> ...
> > +static int galaxybook_platform_profile_probe(void *drvdata, unsigned l=
ong *choices)
> > +{
> > +     struct samsung_galaxybook *galaxybook =3D drvdata;
> > +     int i;
> > +
> > +     for_each_set_bit(i, galaxybook->platform_profile_choices, PLATFOR=
M_PROFILE_LAST)
> > +             set_bit(i, choices);
>
> The intended use of this callback is to "probe" for available choices
> here. You should move all galaxybook_performance_mode_profile_init()
> logic to this method. This would eliminate the need to have a copy of
> the choices bitmap.
>

Yes at first I was really thinking a lot about how to cleanly break
apart the logic as I wanted it to work so that if this feature is not
supported on the particular device (e.g. the ACPI methods return an
error code, so you can assume that this feature does not exist on this
device, as is the case for SAM0427 devices for example, possibly
others that I am not aware of..) that we would not even try to create
the platform profile device.

I think I have decided now that maybe a fair amount of this was sub
optimization and I will instead now just try to do a "get" of the
current performance_mode using the ACPI method as a sort of litmus
test if the feature is working or not (just exactly as I have done on
most of the other features) in the galaxybook_platform_profile_init;
if that fails, then I will exit gracefully without trying to create
the platform_profile (return 0), otherwise I will pass all of the rest
to the probe function and if it fails, it fails :) (because, remember,
in theory we were able to successfully get the value using ACPI so the
feature *should* work at that point, right?)

> > +static int galaxybook_performance_mode_init(struct samsung_galaxybook =
*galaxybook)
> > +{
> > +     enum platform_profile_option profile =3D PLATFORM_PROFILE_LAST;
> > +     u8 performance_mode;
> > +     int err;
> > +     int i;
> > +
> > +     err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> > +     if (err)
> > +             return err;
> > +
> > +     err =3D get_performance_mode_profile(galaxybook, performance_mode=
, &profile);
> > +     if (err)
>
> If this method failed we can't safely continue. I think you should
> return here, else you may get an out of bounds access bellow.
>
> > +             dev_warn(&galaxybook->platform->dev,
> > +                      "initial startup performance mode 0x%x is not ma=
pped\n",
> > +                      performance_mode);
> > +
> > +     for_each_set_bit(i, galaxybook->platform_profile_choices, PLATFOR=
M_PROFILE_LAST)
> > +             dev_dbg(&galaxybook->platform->dev,
> > +                     "enabled platform profile %d using performance mo=
de 0x%x\n",
> > +                     i, galaxybook->profile_performance_modes[i]);
>
> Maybe we can log this directly in the switch-case block inside
> galaxybook_performance_mode_profile_init() instead of having to iterate.
>

Both of these (and the entirety of how this
galaxybook_performance_mode_init() is working) I also realized are sub
optimizations .. the only thing they are really helping is the case
where someone loads removes and then loads the module again (I did not
want that their performance_mode should be updated if they had already
set a valid one previously in their session). But, yeah, that is a
super corner case and the code should not be extra complicated for
that (is what I am now thinking instead, anyway), so I think now I
will just force set the initial performance_mode on probe to what was
eventually mapped as Balanced and if someone is removing and reloading
the module in their session, they are probably capable of dealing with
the profile being reset to balanced each time :)

(Existing userspace tools like power-profiles-daemon etc are taking
care of "restoring" your session's last-used profile after startup so
even after this init sets to Balanced then userspace tools will kick
in to set it to something else later that you probably wanted/last
used anyway; this has been my experience, anyway!, so I am not worried
about setting to Balanced at Init but the reason to set anything is
because of how the ACPI Get method always responds with 0 after
startup, so I just want that it sets something that should actually be
used according to the result of the mapping -- same behavior as the
Samsung Windows apps).

> > +     /*
> > +      * Value returned in iob0 will have the number of supported perfo=
rmance
> > +      * modes per device. The performance mode values will then be giv=
en as a
> > +      * list after this (iob1-iobX). Loop through the supported values=
 and
> > +      * enable their mapped platform_profile choice, overriding "legac=
y"
> > +      * values along the way if a non-legacy value exists.
> > +      */
> > +     for (i =3D 1; i <=3D buf.iob0; i++) {
> > +             dev_dbg(&galaxybook->platform->dev,
> > +                     "device supports performance mode 0x%x\n", buf.io=
b_values[i]);
> > +             err =3D get_performance_mode_profile(galaxybook, buf.iob_=
values[i], &profile);
>
> Here we pass iob_values[i] through a switch-case block inside
> get_performance_mode_profile() and then we do it again bellow. Maybe
> this all could be done here, without having to call
> get_performance_mode_profile().
>

Yes I have cleaned this up in a new draft now also and re-shaped a bit
of how the debug messages look so it hopefully makes more sense and
there are not multiple unnecessary loops.

Note: the whole point of having the messages printed out to debug was
to help with troubleshooting as new devices or new BIOS updates make
things confusing, as I have seen this problem with several different
users and devices while initially writing the logic for this driver
out of tree... so they do help a lot!

> > +             if (err)
> > +                     continue;
> > +             switch (buf.iob_values[i]) {
> > +             case GB_PERFORMANCE_MODE_OPTIMIZED:
> > +                     /* override legacy Optimized value */
> > +                     gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_OPTIMI=
ZED;
> > +                     break;
> > +             case GB_PERFORMANCE_MODE_PERFORMANCE:
> > +                     /* override legacy Performance value */
> > +                     gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_PERFOR=
MANCE;
> > +                     break;
> > +             case GB_PERFORMANCE_MODE_ULTRA:
> > +                     /*
> > +                      * if Ultra is supported, downgrade performance t=
o
> > +                      * balanced-performance
> > +                      */
>
> I haven't been following the entire discussion, so I don't know if Armin
> changed his mind but I agree with him.
>
> I think GB_PERFORMANCE_MODE_PERFORMANCE_LEGACY should be statically
> mapped to BALANCED_PERFORMANCE and TURBO should be PERFORMANCE. This
> would simplify a lot of the logic here.
>

I was a bit worried about this, especially how it would potentially
interplay with other things such as power-profiles-daemon when
bringing in intel_pstate or anything else (it did not sit very well
for me to have a mode on my device that really felt like "High
Performance" but only call it "Balanced Performance" and worried that
it could be aggregated in the wrong way which could impact other
things etc etc .... )

BUT.. none of that matters now, as I have some news on this front: I
did a bit more digging and a bit more homework to really think through
this again, including going back through all of my notes and feedback
plus various log files given by multiple different users, for multiple
different devices in
https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/31,
and then did some detective work looking up how the Samsung Settings
app looks for Ultra devices (looking where reviewers even posted
screenshots of the settings application for these devices in Windows,
etc...).

What I came to realize is that the Ultra devices do not use BOTH
"Performance" and "Ultra", but instead it actually just re-maps the
value for "Ultra" to use AS "Performance". So, they only have 3 modes
in Windows: "Quiet", "Optimized", and "High Performance" (they do not
have a fourth option for "Ultra"). The right solution then is to
re-map so that when a user selects PLATFORM_PROFILE_PERFORMANCE on an
Ultra device, it should send the "Ultra" Galaxy Book performance mode
to the ACPI method.

This should then support a lot more "hard coding" of the mapping and I
have cleaned it up significantly due to this.

Also, I have now tweaked the names of all of the internal symbols to
more closely match the internal names of these modes used by Samsung's
driver and services in Windows so that it will be easier to
troubleshoot and make sense of in the future, as well (e.g. what I had
called "Silent" they actually call "FanOff" etc..). I think it will
help a lot to just re-use their existing names instead of having yet
another "mapping layer" to sort through while troubleshooting.

> > +                     if (test_bit(PLATFORM_PROFILE_PERFORMANCE,
> > +                                  galaxybook->platform_profile_choices=
)) {
> > +                             gb_pfmode(PLATFORM_PROFILE_BALANCED_PERFO=
RMANCE) =3D
> > +                                     gb_pfmode(PLATFORM_PROFILE_PERFOR=
MANCE);
> > +                             set_bit(PLATFORM_PROFILE_BALANCED_PERFORM=
ANCE,
> > +                                     galaxybook->platform_profile_choi=
ces);
> > +                     }
> > +                     /* override performance profile to use Ultra's va=
lue */
> > +                     gb_pfmode(profile) =3D GB_PERFORMANCE_MODE_ULTRA;
> > +                     break;
> > +             default:
> > +                     break;
> > +             }
> > +             set_bit(profile, galaxybook->platform_profile_choices);
> > +     }
> > +
> > +     err =3D galaxybook_performance_mode_init(galaxybook);
>
> If the main goal of this method is to set an initial profile maybe we
> can just directly set it after finding GB_PERFORMANCE_MODE_OPTIMIZED?
>
> This would eliminate a bit of indirection.
>
> Do you know if all devices support OPTIMIZED? either legacy or
> non-legacy.
>

Yes as mentioned above I have decided to rip out all of the sub
optimization here and do as you say: just set the value mapped to
PLATFORM_PROFILE_BALANCED after all of the mapping values are updated
(as long as it was set it in `choices`) and move on from there. I have
not seen any device so far that does not support at least one of the
Optmized modes, but by checking if PLATFORM_PROFILE_BALANCED is set
before using it then the worst that can happen is that the startup
value is something new not actually currently mapped in
get_performance_mode_profile() and it will be "fixed" the next time a
platform_profile_cycle() runs and sets everything back on track.

Does that sound ok or do you think it is better to try and leave in
some of this conditional / detection logic like was here in v7 that I
am now removing?

> > +static int galaxybook_platform_profile_init(struct samsung_galaxybook =
*galaxybook)
> > +{
> > +     struct device *ppdev;
> > +     int err;
> > +
> > +     err =3D galaxybook_performance_mode_profile_init(galaxybook);
> > +     if (err)
> > +             return 0;
> > +
> > +     galaxybook->has_performance_mode =3D true;
> > +
> > +     ppdev =3D devm_platform_profile_register(&galaxybook->platform->d=
ev, DRIVER_NAME,
> > +                                            galaxybook, &galaxybook_pl=
atform_profile_ops);
> > +     if (IS_ERR(ppdev))
> > +             return PTR_ERR(ppdev);
> > +
> > +     platform_profile_notify(ppdev);
>
> No need to notify after registering. You can directly return
> PTR_ERR_OR_ZERO().
>
> ~ Kurt
>
> > <snip>

I think the reason I was thinking to notify was because we are
changing this performance mode during init but I see now that it is
already done in platform_profile_register() so yes I will clean this
up as well :)

v8 coming shortly, hopefully we are getting there!

Thanks again and regards,
Joshua
