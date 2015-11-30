From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] dell-wmi: add module param to control Dell Instant
 Launch hotkey processing
Date: Mon, 30 Nov 2015 15:14:00 +0100
Message-ID: <20151130141400.GA5398@eudyptula.hq.kempniu.pl>
References: <1f6ac54784b39ebb6ce02a9fb9e944c840fddb7b.1448547341.git.kernel@kempniu.pl>
 <20151126144130.GI14190@pali>
 <20151126145556.GA9371@eudyptula.hq.kempniu.pl>
 <201511292050.18883@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201511292050.18883@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Pali,

Thanks again for your efforts.

> $ sudo /usr/bin/input-events 4
> /dev/input/event4
>     bustype : BUS_I8042
>     vendor  : 0x1
>     product : 0x1
>     version : 43841
>     name    : "AT Translated Set 2 keyboard"
>     phys    : "isa0060/serio0/input0"
>     bits ev : EV_SYN EV_KEY EV_MSC EV_LED EV_REP
>=20
> waiting for events
>=20
> 10:26:29.945739: EV_MSC MSC_SCAN 219
> 10:26:29.945739: EV_KEY KEY_LEFTMETA (0x7d) pressed
> 10:26:29.945739: EV_SYN code=3D0 value=3D0
> 10:26:29.946468: EV_MSC MSC_SCAN 45
> 10:26:29.946468: EV_KEY KEY_X (0x2d) pressed
> 10:26:29.946468: EV_SYN code=3D0 value=3D0
> 10:26:29.948469: EV_MSC MSC_SCAN 45
> 10:26:29.948469: EV_KEY KEY_X (0x2d) released
> 10:26:29.948469: EV_SYN code=3D0 value=3D0
> 10:26:29.951473: EV_MSC MSC_SCAN 219
> 10:26:29.951473: EV_KEY KEY_LEFTMETA (0x7d) released
> 10:26:29.951473: EV_SYN code=3D0 value=3D0
> x
>=20
> (Press+release first key with name "Windows Mobility Center control")
> (key X was printed to console)
>=20
> 10:26:32.898689: EV_MSC MSC_SCAN 133
> 10:26:32.898689: EV_KEY KEY_BRIGHTNESSDOWN (0xe0) pressed
> 10:26:32.898689: EV_SYN code=3D0 value=3D0
> 10:26:32.898730: EV_MSC MSC_SCAN 133
> 10:26:32.898730: EV_KEY KEY_BRIGHTNESSDOWN (0xe0) released
> 10:26:32.898730: EV_SYN code=3D0 value=3D0
>=20
> (Press+release second key with name "Instant launch control")
>=20
> 10:26:35.090018: EV_MSC MSC_SCAN 132
> 10:26:35.090018: EV_KEY KEY_NEXTSONG (0xa3) pressed
> 10:26:35.090018: EV_SYN code=3D0 value=3D0
> 10:26:35.092765: EV_MSC MSC_SCAN 132
> 10:26:35.092765: EV_KEY KEY_NEXTSONG (0xa3) released
> 10:26:35.092765: EV_SYN code=3D0 value=3D0
>=20
> (Press+release third key with name "Audio control-panel control")
>=20
> As you can see events are send also via keyboard controller!
>=20
> Key codes are configured by userspace (udev/systemd) and looks like=20
> there is bug in userspace rules (reason for brightnes or nextsong), s=
ee:
> https://wiki.ubuntu.com/HardwareSupport/Machines/Laptops/Dell/XPS/15

Well, the V131 also sends its second hotkey (Dell Support Center) as a
scancode, which can be mapped in userspace.  But I fail to understand
why this would be problematic, see below.

> So it is not easy to make both machines (Dell XPS L502X and Dell Vost=
ro=20
> V131) works correctly :-( At least I do not see how.

As far as I understand, it's not the keyboard events that are a problem
for us, it's the WMI events, because some models generate them along
with the scancode (L502x) while on others the WMI event is the only
notification the OS can get that the hotkey was pressed (V131).  So the
only sparse keymap entry which has to vary between models seems to be
the 0xe025 entry (obviously that's just the current state of our
knowledge, not vendor-provided information).  That is why I submitted a
patch attempting to resolve this conflict.

If you disagree with the above, could you please elaborate?

> And that mapping "Windows Mobility Center control" key to combination=
 of=20
> two keys (KEY_LEFTMETA + X) is some total stupid nonsense...

Well, it is unfortunate, but at least I can map it to what I please in
my window manager.  What I am really struggling to understand is why on
earth would one employ something as complicated as ACPI/WMI for handlin=
g
keypresses.  Not to mention requiring cryptic SMI calls for enabling th=
e
notifications in the first place.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
