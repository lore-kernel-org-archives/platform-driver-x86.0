From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Wed, 22 Jul 2015 09:35:13 +0200
Message-ID: <20150722073513.GA2381@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <559C1C17.3060009@dell.com>
 <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:36176 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755982AbbGVHfS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jul 2015 03:35:18 -0400
Received: by lagw2 with SMTP id w2so132602830lag.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jul 2015 00:35:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150708035346.GB2413@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, "Gowda, Srinivas G" <Srinivas_G_Gowda@dell.com>, "Brown, Michael E" <Michael_E_Brown@dell.com>, "Warzecha, Douglas" <Douglas_Warzecha@dell.com>, Matthew Garrett <mjg@redhat.com>, "Kabir, Rezwanul" <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

> > Now as for actually simulating a keypress, it can be programmed usi=
ng
> > the following calling interface (on receiving the e025 WMI notifica=
tion).
> > To actually simulate the keypress:
> > Arg1=3D0x41
> > Arg2 Byte [1:0]: Scan code to simulate
> > Byte [3:2]
> > * Bit0 - L Alt
> > * Bit1 - R Alt
> > * Bit2 - L Ctrl
> > * Bit3 - R Ctrl
> > * Bit4 - L Shift
> > * Bit5 - R shift
> > * Bit6 - L Win
> > * Bit7 - R Win
> > * Bit8 - Fn key
>=20
> And is it possible to disable keypress simulation on systems that hav=
e
> that capability?
>=20
> My understanding is that all hardware equipped with an Instant Launch
> button is capable of generating a WMI event upon its press, but not a=
ll
> models can generate a keypress at the same time, correct? If that's t=
he
> case, then the arguably cleanest solution would be to change the keym=
ap
> entry for event 0xe025 in dell-wmi.c to KE_KEY and ensure (probably i=
n
> dell-laptop.c) no i8042 interrupt is raised when the Instant Launch
> button is pressed. Though that would still leave us with the question=
 of
> how to determine (ideally without side effects) whether a given model
> needs disabling keypress simulation. I imagine the pseudocode would b=
e
> like:
>=20
>     if (ec_can_simulate_keypresses)
>         disable_keypress_simulation();
>     else
>         enable_wmi_event_generation();
>=20
> If disabling keypress simulation is not possible, dell-wmi.c has to
> somehow determine whether a 0xe025 WMI event should be ignored or not=
=2E
>=20
> Am I making any sense here?

Mario,

Just pinging; any chance you could comment on these issues? Thanks,

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
