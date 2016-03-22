From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Tue, 22 Mar 2016 14:30:51 +0100
Message-ID: <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:36455 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753679AbcCVNak (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 22 Mar 2016 09:30:40 -0400
Received: by mail-lb0-f171.google.com with SMTP id qe11so107346719lbc.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2016 06:30:39 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160318120418.GA29889@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Wow, that is a comprehensive explanation.  In principle the patch loo=
ks
> good, but I wonder whether the heuristics you have developed for butt=
on
> detection needs wider testing.

This is indeed my primary concern.

> I can test on my S7020 but only in a few
> days time (this week is a very busy week) which would give us one mor=
e data
> point.

That would be nice, thanks.  The more we know, the better.

> > First of all, this patch raises a couple of checkpatch warnings.
>=20
> The code on the whole reads well so I would be happy with it as is.  =
Making
> it (and the existing code) fully compliant with checkpatch results in=
 harder
> to read code - at least that was the consensus when it was initially =
merged,
> which is why it was left in the current state.  Darren may have an
> alternative view on this though, in which case I'm happy to defer to =
his
> preference.

Thanks for the explanation.  It's just something that crossed my mind.

Darren, feel free to let me know if you would like to get this done.

> > As for detecting whether the LED is present on a given machine, I h=
ad to
> > resort to educated guesswork.  I assumed this LED is present on all
> > devices which have a radio toggle button instead of a slider.  My
> > Lifebook E744 holds 0x01010001 in BTNI.  By comparing the bits and
> > buttons with those of a Lifebook E8420 (BTNI=3D0x000F0101, has a sl=
ider),
> > I put my money on bit 24 as the indicator of the radio toggle butto=
n
> > being present.
>=20
> The other question is how consistent the bit layout is across all dev=
ices
> which might make use of this driver.  The set of potential devices sp=
ans
> nearly 10 years, and in many ways it would be surprising if the bit
> definitions were kept the same over that time.  Testing would be the =
only
> way to get a feeling for that.

My thoughts exactly.

> If you could let me know how you went about
> acquiring the values on your machine I could try the exact same steps=
 on the
> S7020 to see what we get.

The BTNI value is printed to the kernel log buffer by
acpi_fujitsu_hotkey_add(), so all it takes to retrieve it is:

    dmesg | grep BTNI

> > While it's not essential, it would be nice to initialize soft rfkil=
l
> > state of all radio transmitters to the value of RFSW upon boot.
>=20
> I think this would only be necessary for those machines with the RF b=
utton
> in place of the hard slider switch, right?

Yes.  On the E8420 I tested, moving the slider switch to "off" position
caused the Bluetooth device to be removed from the system altogether
while iwlwifi reacted by hard-blocking phy0.

> > One last remark is that I think this LED would best be driven by an
> > inverted airplane mode LED trigger ...
>=20
> In addition to the button interaction, presumedly.

I wanted to reach three objectives:

 1) make the LED indicate current rfkill state by default,

 2) allow rfkill state to be persisted between reboots on models
    with an rfkill button instead of a slider, preferably also ensuring
    /sys/devices/platform/fujitsu-laptop/radios is always consistent
    with actual rfkill state,

 3) allow the user to freely repurpose the LED to their liking.

To achieve all of the above, I decided to, respectively:

 1) assign the LED to an "inverted airplane mode" trigger by default,

 2) consult rfkill_state upon module initialization and set the soft
    rfkill state for all devices appropriately,

 3) refrain from calling radio_led_set() and/or FUNC_RFKILL with
    argument 0x5 from any function inside fujitsu-laptop.c.

The code which could make the first point happen is not yet merged, so
for now the user would probably have to assign the desired trigger from
userspace.  I also failed to implement the second point within
fujitsu-laptop, so I suggested delegating this task to userspace. =20

Could you please explain how the solution you had on your mind compares
to the above?  Are your objectives in line with mine or am I barking up
the wrong tree?

> > And finally, perhaps some of the remarks above belong in the commit
> > message for future reference.  Please advise.
>=20
> I think so - there's useful information in there which would be parti=
cularly
> relevant if the button detection heuristics ever need to be revised. =
 Due to
> the necessarily arbitrary feel of the detection logic a brief in-sour=
ce
> comment may be justified too.

I'll give this some more thought after you test the patch on the S7020.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
