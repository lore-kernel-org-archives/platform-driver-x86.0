From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 13:26:11 +0200
Message-ID: <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f45.google.com ([209.85.215.45]:32901 "EHLO
	mail-la0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755061AbbGCL0Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 07:26:16 -0400
Received: by laar3 with SMTP id r3so81723521laa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 04:26:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703074813.GD1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> It looks like above buffer has format of *new* event (0002 - length o=
f
> event, 0000 - type of event, e025 - data). But when using legacy keym=
ap
> then dell-wmi.c parse events with old format (which means type=3D0000=
 is
> dropped and data=3De025 is translated to some key).
>=20
> This is even harder as I thought. Looks like big mess and now I would
> say, without documentation for Dell WMI events we are not able to fix
> this correctly without breaking other laptops...

As far as I understand, the specific case that we're dealing with here
is that on one laptop model a certain WMI event is generated along with
a keycode while another mothel generates the same WMI event without an
accompanying keycode. Currently the Dell WMI driver ignores the WMI
event in question, but it is processed by i8042.

Could we perhaps do the opposite for this specific event, i.e. filter i=
t
out using the i8042 filter in dell-laptop.c and translate the WMI event
into a keycode in dell-wmi.c? This shouldn't conflict with the dell-rbt=
n
driver as there are no ACPI devices on an XPS L502X that could be
handled by that driver [1] and thus the i8042 filter should be
installed. However, that i8042 keycode could potentially be generated o=
n
other, WMI-less models and such a change would break them, rendering it
unacceptable. I also assumed pressing the hotkey in question on an XPS
L502X produces the same i8042 keycode as the WMI event code indicates..=
=2E

[1] this statement is based on the DSDT dump from a Dell XPS L502X that
    I found here: https://launchpadlibrarian.net/68880655/DSDT.dsl

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
