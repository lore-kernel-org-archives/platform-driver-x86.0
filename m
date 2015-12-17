From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Thu, 17 Dec 2015 09:05:10 +0100
Message-ID: <20151217080510.GA3534@eudyptula.hq.kempniu.pl>
References: <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
 <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
 <20150831095107.GA2397@eudyptula.hq.kempniu.pl>
 <20150910043812.GB108260@vmdeb7>
 <20151113101716.GA5458@eudyptula.hq.kempniu.pl>
 <20151207114320.GC13893@pali>
 <20151216090531.GA2425@eudyptula.hq.kempniu.pl>
 <20151216093057.GQ13531@pali>
 <56713CFE.8090201@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:37332 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750811AbbLQIFP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 03:05:15 -0500
Received: by mail-wm0-f50.google.com with SMTP id p187so9252432wmp.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2015 00:05:15 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56713CFE.8090201@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Mario Limonciello <mario_limonciello@dell.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Hans,

> Pali, thanks for bringing this one to my attention, so as I see it we
> need to do a number of things:
>=20
> 1) Add a dmi based quirk to: drivers/acpi/video_detect.c to
>    use native backlight on this model, so that the flickering gets fi=
xed,
>    for now you can use acpi_backlight=3Dnative for testing, until we'=
ve got
>    the keys sorted out and then we should submit a kernel patch with =
this
>    quirk
>=20
> 2a) I'm not familiar with the WMI bits, but as I see it we want that =
driver to
>    be loaded to get other hotkeys to work, so lets load it (I assume =
this will
>    already happen automatically if enabled). If I understand things c=
orrectly
>    then doing this will silence the i8042 generated brightness key ev=
ents, but
>    it will cause the acpi-video bus generated key events lag in time =
by one
>    event. So we will need an option in drivers/acpi/acpi_video.c to s=
top it
>    from generating key-presses, this may be useful in some other (rar=
e) cases
>    too. I've written a patch for this (attached), can you build a ker=
nel with
>    this patch and then add "video.report_key_events=3D1" to the kerne=
l cmdline
>    and see if that helps ?

Thank you for a quick response.  Your patch works fine.  If per-model
key event generation suppression is acceptable, I believe this would
indeed work around V131's issues.  The elegance of this solution is tha=
t
it doesn't depend on the state of WMI event reporting - if it is off,
events will still be correctly reported by i8042; if it is on, dell-wmi
will generate them.  Either way, the behavior will be correct.

> Or alternatively we could not load the wmi driver, and fix the double=
 events
> being reported by the i8042 / atkbd driver by adding a udev hwdb entr=
y to
> filter these out, we already do that for some laptops because of simi=
lar issues,
> see e.g. this part of: /lib/udev/hwdb.d/60-keyboard.hwdb
>=20
> # Dell Inspiron 1520
> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnDell*:pnInspiron*1520:pvr*
> KEYBOARD_KEY_85=3Dunknown # Brightness Down, also emitted by acpi-vid=
eo, ignore
> KEYBOARD_KEY_86=3Dunknown # Brightness Up, also emitted by acpi-video=
, ignore
>=20
> To test this you need to edit /lib/udev/hwdb.d/60-keyboard.hwdb add a=
n entry
> for your laptop (see "cat /sys/class/dmi/id/product_name" output to f=
ind what to
> put after "pn" ), then rebuild the hwdb: "sudo udevadm hwdb --update"=
 and then
> reboot, yes reboot there is another way to re-apply the rules but reb=
ooting is
> really so much easier.
>=20
> I think you should try this method too and see if the flickering goes=
 away
> when fixing the double events, without needing to use acpi_backlight=3D=
native.

The flickering is caused by two things happening in short succession:

  * an erroneous ASLE request, which is only ignored by the i915 driver
    with acpi_backlight=3Dnative,

  * a notification sent to the ACPI video driver, which causes
    brightness to be switched after HZ / 10 with acpi_backlight=3Dvideo=
=2E

So I believe those double events are just a side effect, not the root
cause of the flickering.

> It is also not clear to me if you've tried using the WMI events witho=
ut
> acpi_backlight=3Dnative, maybe that fixes things magically ?

In order for WMI events to be reported at all on Vostro V131, a special
SMI has to be invoked.  That SMI always messes up the key events
reported by the ACPI video driver, no matter what acpi_backlight is set
to.  And the flickering is caused by yet another piece of faulty AML
inside the CESM method.  Is this what you were asking?  If not, I'll be
happy to answer any further questions you might have.

Also, I need to apologize.  While testing your patch I noticed that my
notes got mixed up at some point, rendering the story in my previous
message partially invalid.  I wrote that in order for dell-wmi to repor=
t
key events, acpi_backlight has to be set to "native".  That is not true
as it has to be set to "vendor", as the code in dell_wmi_init() and
dell_wmi_process_key() clearly shows.

To clear things up, here is the current state of affairs:

  * acpi_backlight=3Dnative solves the flickering issue, but doesn't he=
lp
    with key event "lagging" after WMI is enabled,

  * using the patch provided by Hans (or a similar one), the "lagged"
    events can be filtered, leaving key event generation to dell-wmi,

  * dell-wmi won't generate events unless acpi_backlight=3Dvendor, whic=
h
    in turn breaks brightness control due to faulty ASLE requests.

To break out of this loop, I suggest that:

  * acpi_backlight should default to "native" for Vostro V131, based on
    a DMI check,

  * brightness key event generation performed by the ACPI video driver
    should always be suppressed on Vostro V131, because it's faulty due
    to firmware bugs (and correct events will be reported anyway by
    either i8042 or WMI),

  * yet another quirk should be added to dell-wmi, so that brightness
    key events are generated not only when acpi_backlight=3Dvendor, but
    also when acpi_backlight=3Dnative.

The only downside I see to such a solution is that by default the user
would have to use a userspace helper in order for the key events to be
translated into brightness changes.  However, if they so desire,
acpi_backlight may still be set to "video", which would enable
brightness changes to be done by the kernel, though with the flickering
effect still in place.  Sounds like a fair choice to me.  What do you
think?

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
