From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 16 Dec 2015 10:30:57 +0100
Message-ID: <20151216093057.GQ13531@pali>
References: <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
 <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:36501 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754648AbbLPJbA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 16 Dec 2015 04:31:00 -0500
Received: by mail-wm0-f43.google.com with SMTP id n186so201283091wmn.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Dec 2015 01:30:59 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wednesday 16 December 2015 10:05:31 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> > > I have recently noticed that backlight control on a Vostro V131 r=
unning
> > > Linux has some glitches as well.  Before WMI gets enabled, pressi=
ng
> > > either the "brightness down" (Fn+F4) or the "brightness up" (Fn+F=
5) key
> > > causes two "presses" of the respective keycode (KEY_BRIGHTNESSUP =
or
> > > KEY_BRIGHTNESSDOWN) to be reported.  This itself seems buggy to m=
e, but
> > > whatever.  The worse part is that there is an irritating flickeri=
ng
> > > effect as well [1].
> >=20
> > From that bug I understood that solution is to use native backlight
> > control (via acpi_backlight=3Dnative). This is something which can =
be
> > forced or changed by default per DMI type (for buggy machines like
> > this). Right?
>=20
> Setting acpi_backlight=3Dnative only solves the flickering problem.  =
So if
> you don't want to enable WMI (i.e. use the Dell Instant Launch hotkey=
),
> that's it, you're good.  But once you add the WMI-enabling SMI into t=
he
> mix, things go awry again.  In other words, I see no way of making al=
l
> features of this laptop work correctly at the same time without
> resorting to DSDT patching (or properly fixing the firmware).
> Hopefully, someone will.  See below for a detailed explanation.
>=20
> > > But if that wasn't enough, it gets even worse after
> > > issuing the WMI-enabling SMI call, because the keycode simulated =
by ACPI
> > > gets "shifted" by one event while the WMI events are reported cor=
rectly.
> > > Consider the following sequence of key presses:
> > >=20
> > > Key pressed     Keycode reported        WMI event reported=20
> > > -----------     ----------------        ------------------
> > > Fn+F4           (none)                  0xe005
> > > Fn+F4           KEY_BRIGHTNESSDOWN      0xe005
> > > Fn+F5           KEY_BRIGHTNESSDOWN      0xe006
> > > Fn+F5           KEY_BRIGHTNESSUP        0xe006
> > > Fn+Mute         KEY_BRIGHTNESSUP        0x0000
> > > Fn+Mute         (none)                  0x0000
> >=20
> > Hm... I'm not sure if I understood this problem correctly, but thos=
e
> > keycodes are reported on i8042 bus by atk keyboard? Or are reported=
 by
> > ACPI video.ko module? And problem is only with brightness keys?
> >=20
> > What happen if you boot 4.2+ kernel with acpi_backlight=3Dnative?
>=20
> Okay, so here is the full story.  First, assume you're booting an
> unpatched kernel with default command line arguments.  When you press
> the "brightness up" or "brightness down" key, its scancode is reporte=
d
> by the i8042 driver.  That's perfect, but the CESM method still does =
two
> things: it sends a request to the i915 driver using the ASLE OpRegion
> _and_ notifies the ACPI video driver about brightness change.  Note t=
hat
> it probably does both of these things due to a broken conditional
> expression in the AML code.  With acpi_backlight=3Dnative, the ASLE
> request is ignored by the i915 driver (which alleviates the flickerin=
g
> problem), but the Notify() calls inside the CESM method still cause
> another (identical) scancode to be emitted by acpi-video (to be preci=
se,
> by acpi_video_device_notify()).  dell-wmi is not involved, because no
> WMI events are generated.  In total, you get two identical scancodes =
for
> a single key press.  It's suboptimal, but at least not completely
> broken.
>=20
> Now, assume you perform the WMI-enabling SMI call.  It causes the
> brightness keys to no longer be reported by i8042, but rather using W=
MI
> events.  Unless acpi_backlight=3Dnative, dell-wmi will remain idle, b=
ut
> the ACPI video driver will still emit scancodes.  In other words, you
> will get a single scancode for each key press.  Sounds good, but not
> really because the generated scancodes are shifted (see the table fro=
m
> my previous message in this thread) and you are still left with the
> flickering issue.  If you use acpi_backlight=3Dnative, the flickering=
 will
> be gone, but then dell-wmi will start reacting to key presses as well
> and in the extreme case you might get two different scancodes
> (KEY_BRIGHTNESSUP and KEY_BRIGHTNESSDOWN) for a single key press - on=
e
> (the correct one) will be generated by dell-wmi and the other (the
> shifted one) by acpi-video.
>=20
> The most straightforward hack seems to be to just kill CESM with fire
> and then with acpi_backlight=3Dnative you will get a single, correct
> scancode for each key press.  Though that solution is still not ideal
> because it makes it impossible to change brightness without using som=
e
> userspace helper.
>=20
> Answering your question, AFAICT brightness keys are the only ones
> affected by the WMI-enabling SMI call, but that's bad enough.  Withou=
t
> DSDT patching you have to choose between hotkey support and sane
> brightness control.  Unless you can prove me wrong, which I am hoping
> for.
>=20

CCing Hans de Goede

Hans, you tried to fix problems with acpi backlight... do you have idea
how to fix above problem with those two brightness keys?

In my opinion we should drop keypress events in acpi-video module. And
use event from dell-wmi if SMM was enabled.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
