From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 18 Dec 2015 08:10:37 +0100
Message-ID: <20151218071037.GA4606@eudyptula.hq.kempniu.pl>
References: <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
 <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com>
 <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
 <567284E7.3050103@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:36154 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257AbbLRHKm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Dec 2015 02:10:42 -0500
Received: by mail-wm0-f42.google.com with SMTP id p187so51075934wmp.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2015 23:10:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <567284E7.3050103@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> >To clear things up, here is the current state of affairs:
> >
> >   * acpi_backlight=3Dnative solves the flickering issue, but doesn'=
t help
> >     with key event "lagging" after WMI is enabled,
> >
> >   * using the patch provided by Hans (or a similar one), the "lagge=
d"
> >     events can be filtered, leaving key event generation to dell-wm=
i,
> >
> >   * dell-wmi won't generate events unless acpi_backlight=3Dvendor, =
which
> >     in turn breaks brightness control due to faulty ASLE requests.
> >
> >To break out of this loop, I suggest that:
> >
> >   * acpi_backlight should default to "native" for Vostro V131, base=
d on
> >     a DMI check,
>=20
> Ack.
>=20
> >   * brightness key event generation performed by the ACPI video dri=
ver
> >     should always be suppressed on Vostro V131, because it's faulty=
 due
> >     to firmware bugs (and correct events will be reported anyway by
> >     either i8042 or WMI),
>=20
> s/should always be suppressed/should be suppressed by default/ otherw=
ise
> ack. We can easily do this the same way we currently deal with the
> disable_backlight_sysfs_if option in acpi_video.c
>=20
> >   * yet another quirk should be added to dell-wmi, so that brightne=
ss
> >     key events are generated not only when acpi_backlight=3Dvendor,=
 but
> >     also when acpi_backlight=3Dnative.
>=20
> Nack, the real problem here is that checking if acpi_backlight!=3Dven=
dor
> is the wrong way to check if key event generation should be suppresse=
d.

Well, I'm sure you know better, given that you wrote the code that this
new patch series fixes :)

> This actually reminds me that I've the following item on my
> todo list for a while but I've not gotten around to it yet:
>=20
>  -Add an acpi_video_handles_key_presses() helper, and use this where
>   appropriate (dell-wmi and others).
>=20
> The mean reason for that item on my todo list was to make code doing
> brigthness key-event suppression more readable. But we can also use
> it for this case, if we check the new video.report_key_events paramet=
er
> in the acpi_video_handles_key_presses() helper, and switch dell-wmi
> over to this helper, things will just work without needing yet anothe=
r
> quirk in dell-wmi :)
>=20
> I've written a patch-set implementing this (attached), this obsoletes
> my previous patch. As before, please test this with:
>=20
> acpi_backlight=3Dnative video.report_key_events=3D1
>=20
> On the kernel cmdline, we can add a patch adding dmi quirks to make
> those the default later.

I tested the patch series you submitted and it seems to work fine for
me, given that proper kernel parameters are provided.

> For that patch I'm going to need the dmi strings for your laptop,
> can you please do:
>=20
> for i in /sys/class/dmi/id/*_*; do echo $i; cat $i; done
>=20
> And then include the output in your next mail ? Feel free to leave
> out the serial numbers, asset tags and uuids, those are potentially
> privacy sensitive and I don't need them.

/sys/class/dmi/id/bios_date
06/12/2014
/sys/class/dmi/id/bios_vendor
Dell Inc.
/sys/class/dmi/id/bios_version
A04
/sys/class/dmi/id/board_name
0X3GJK
/sys/class/dmi/id/board_vendor
Dell Inc.
/sys/class/dmi/id/board_version
A04
/sys/class/dmi/id/chassis_type
8
/sys/class/dmi/id/chassis_vendor
Dell Inc.
/sys/class/dmi/id/chassis_version
Not Specified
/sys/class/dmi/id/product_name
Vostro V131
/sys/class/dmi/id/product_version
Not Specified
/sys/class/dmi/id/sys_vendor
Dell Inc.

> >The only downside I see to such a solution is that by default the us=
er
> >would have to use a userspace helper in order for the key events to =
be
> >translated into brightness changes.  However, if they so desire,
> >acpi_backlight may still be set to "video", which would enable
> >brightness changes to be done by the kernel, though with the flicker=
ing
> >effect still in place.  Sounds like a fair choice to me.  What do yo=
u
> >think?
>=20
> I do not see the need for a userspace helper as a problem, this actua=
lly
> is the case on most modern laptops already, as we default to
> acpi_backlight=3Dnative there, and that has the same requirement.

Thanks for the clarification.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
