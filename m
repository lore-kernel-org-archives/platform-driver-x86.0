From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 09:48:13 +0200
Message-ID: <20150703074813.GD1841@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f41.google.com ([74.125.82.41]:35189 "EHLO
	mail-wg0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932258AbbGCHsR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 03:48:17 -0400
Received: by wgjx7 with SMTP id x7so81265527wgj.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 00:48:15 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario_Limonciello@Dell.com, Srinivas_G_Gowda@Dell.com, Michael_E_Brown@Dell.com, Douglas_Warzecha@Dell.com
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 08:52:44 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > Can you write which WMI call needs to be called?
>=20
> Technically, one needs to call method DoBFn (method ID =3D 1) using G=
UID
> A80593CE-A997-11DA-B012-B622A1EF5492. Though if you look at the ACPI
> method this GUID maps to (WMBA), you'll notice that the first two
> arguments passed to it (instance number and method ID) are simply
> ignored and the only one that matters is the buffer passed (third
> argument).
>=20
> > Last time when I looked into dell-led.c code it called some WMI
> > functions which are just re-implementation of SMI based SMBIOS
> > functions. From information which I have that is just WMI interface=
 for
> > dell SMBIOS one.
> >=20
> > I already asked Alex and other people for official ACPI/WMI Dell
> > documentation, so we would be able to solve these hotkey problems o=
nce
> > and for all, but I did not get anything yet.
> >=20
> > What I found on internet is just this one out-of-dated documentatio=
n:
> > http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WM=
I%20.pdf
> >=20
> > I would suggest you to read it (it is not long) to see Dell WMI met=
hods
> > are just ACPI "wrapper" around Dell SMBIOS (dcdbas.ko driver) used =
by
> > dell-laptop.ko.
>=20
> Great, thanks. I'll look into it.
> =20
> > >  2) Pressing hotkey #3 on a Dell Vostro V131 generates WMI event
> > > 0xe025, but no keycode. Apparently, Dell XPS L502X generates the
> > > same WMI event for a hotkey which also generates a keycode [1].
> > > What's the best way to solve this conflict?
> > >=20
> > > [1] commit f1566f0: "dell-wmi: Add keys for Dell XPS L502X"
> >=20
> > Look at dell-wmi.c source code. Which event format is that? New one
> > (partially described in above PDF document) when dell_new_hk_type i=
s
> > true? Or old one?
>=20
> Vostro V131 is using the legacy keymap.
>=20
> > Can you please enable pr_debug() in dell-wmi.c and send dmesg outpu=
t
> > from dell-wmi.ko (specially dell_wmi_notify)?
>=20
> Here's what appears in dmesg after pressing hotkey #3:
>=20
> ---------------------------------------------------------------------=
---
> dell_wmi: Received WMI event (02 00 00 00 25 e0 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00)
> dell_wmi: Key e025 pressed
> wmi: DEBUG Event GUID: 9DBB5994-A997-11DA-B012-B622A1EF5492
> ---------------------------------------------------------------------=
---
>=20

It looks like above buffer has format of *new* event (0002 - length of
event, 0000 - type of event, e025 - data). But when using legacy keymap
then dell-wmi.c parse events with old format (which means type=3D0000 i=
s
dropped and data=3De025 is translated to some key).

This is even harder as I thought. Looks like big mess and now I would
say, without documentation for Dell WMI events we are not able to fix
this correctly without breaking other laptops...

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

CCing kernel Dell developers, can you provide Dell WMI documentation fo=
r
events and hotkeys? We have problems with enabling events for additiona=
l
buttons/keys on Dell laptops and also parsing WMI events which BIOS/ACP=
I
generates and send to kernel. Please, I really do not know how to how w=
e
can fix these "hotkey/events" problems.

Something like this document, but updated for new laptops:
http://vpsservice1.sampo.com.tw/sampo_update/document/jimmy/ACPI-WMI%20=
=2Epdf

Thanks!

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
