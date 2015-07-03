From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 08:52:44 +0200
Message-ID: <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:35455 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754645AbbGCGwt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 02:52:49 -0400
Received: by lagh6 with SMTP id h6so74740822lag.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2015 23:52:47 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <201507022258.32104@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

> Can you write which WMI call needs to be called?

Technically, one needs to call method DoBFn (method ID =3D 1) using GUI=
D
A80593CE-A997-11DA-B012-B622A1EF5492. Though if you look at the ACPI
method this GUID maps to (WMBA), you'll notice that the first two
arguments passed to it (instance number and method ID) are simply
ignored and the only one that matters is the buffer passed (third
argument).

> Last time when I looked into dell-led.c code it called some WMI
> functions which are just re-implementation of SMI based SMBIOS
> functions. From information which I have that is just WMI interface f=
or
> dell SMBIOS one.
>=20
> I already asked Alex and other people for official ACPI/WMI Dell
> documentation, so we would be able to solve these hotkey problems onc=
e
> and for all, but I did not get anything yet.
>=20
> What I found on internet is just this one out-of-dated documentation:
> http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WMI%=
20.pdf
>=20
> I would suggest you to read it (it is not long) to see Dell WMI metho=
ds
> are just ACPI "wrapper" around Dell SMBIOS (dcdbas.ko driver) used by
> dell-laptop.ko.

Great, thanks. I'll look into it.
=20
> >  2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event
> > 0xe025, but no keycode. Apparently, Dell XPS L502X generates the
> > same WMI event for a hotkey which also generates a keycode [1].
> > What's the best way to solve this conflict?
> >=20
> > [1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"
>=20
> Look at dell-wmi.c source code. Which event format is that? New one
> (partially described in above PDF document) when dell_new_hk_type is
> true? Or old one?

Vostro V131 is using the legacy keymap.

> Can you please enable pr_debug() in dell-wmi.c and send dmesg output
> from dell-wmi.ko (specially dell_wmi_notify)?

Here's what appears in dmesg after pressing hotkey #3:

-----------------------------------------------------------------------=
-
dell_wmi: Received WMI event (02 00 00 00 25 e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e025 pressed
wmi: DEBUG Event GUID: 9DBB5994-A997-11DA-B012-B622A1EF5492
-----------------------------------------------------------------------=
-

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
