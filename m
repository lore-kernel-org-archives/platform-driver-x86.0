From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 19 Dec 2015 13:31:24 +0100
Message-ID: <20151219123124.GA2490@eudyptula.hq.kempniu.pl>
References: <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
 <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com>
 <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
 <567284E7.3050103@redhat.com>
 <20151218071037.GA4606@eudyptula.hq.kempniu.pl>
 <5673E39D.8050007@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:35400 "EHLO
	mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932933AbbLSMba (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 07:31:30 -0500
Received: by mail-wm0-f49.google.com with SMTP id l126so16545434wml.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Dec 2015 04:31:30 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <5673E39D.8050007@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> Thanks for both the testing and the dmi info, attached is a patch
> which applies on top of the other 4 which should automatically do the
> right thing, can you please test this patch with an "empty" kernel
> cmdline, once that bit works I'll post the entire set upstream for
> merging.

The patch works as expected, thanks!

> From 3225a9c43a02682e3cae5c02ca6d38e923256de1 Mon Sep 17 00:00:00 200=
1
> From: Hans de Goede <hdegoede@redhat.com>
> Date: Fri, 18 Dec 2015 11:36:16 +0100
> Subject: [PATCH 5/5] acpi-video: Add quirks for the Dell Vostro V131
>=20
> The Dell Vostro V131 has an especially broken acpi-video implementati=
on.
>=20
> The backlight control bits work, but when the brightness is changed v=
ia
> the acpi-video interface the backlight flickers annoyingly before set=
tling
> at the new brightness, switching to using the native interface fixes =
the
> flickering so add a quirk for this (the vendor interface has the same
> problem).
>=20
> Brightness keypresses reported through the acpi-video-bus are also br=
oken,
> they get reported one event delayed, so if you press the brightness-u=
p
> hotkey on the keyboard nothing happens, then if you press brightness-=
down,
> the previous brightness-up event gets reported. Since the keypresses =
are
> also reported via wmi (if active) and via atkbd (when wmi is not acti=
ve)
> add a quirk to simply filter out the delayed (broken) events.

Just my two cents here: those brightness events sourced from acpi-video
are only delayed after the special WMI-enabling SMI is raised.  So if
you boot the kernel today, those events won't be lagged because the
special WMI-enabling SMI isn't merged yet.  Of course, those events are
still just useless duplicates.  Extending the commit message by
including this detail might spare posterity confusion.  It's just a
thought, though.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
