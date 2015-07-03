From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 3 Jul 2015 13:43:56 +0200
Message-ID: <20150703114356.GL1841@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150701105544.GD17577@pali>
 <20150702204122.GA2610@eudyptula.hq.kempniu.pl>
 <201507022258.32104@pali>
 <20150703065244.GA2401@eudyptula.hq.kempniu.pl>
 <20150703074813.GD1841@pali>
 <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:35188 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754894AbbGCLn7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 07:43:59 -0400
Received: by wiga1 with SMTP id a1so175898959wig.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 04:43:58 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150703112611.GA3030@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 13:26:11 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > It looks like above buffer has format of *new* event (0002 - length=
 of
> > event, 0000 - type of event, e025 - data). But when using legacy ke=
ymap
> > then dell-wmi.c parse events with old format (which means type=3D00=
00 is
> > dropped and data=3De025 is translated to some key).
> >=20
> > This is even harder as I thought. Looks like big mess and now I wou=
ld
> > say, without documentation for Dell WMI events we are not able to f=
ix
> > this correctly without breaking other laptops...
>=20
> As far as I understand, the specific case that we're dealing with her=
e
> is that on one laptop model a certain WMI event is generated along wi=
th
> a keycode while another mothel generates the same WMI event without a=
n
> accompanying keycode. Currently the Dell WMI driver ignores the WMI
> event in question, but it is processed by i8042.
>=20
> Could we perhaps do the opposite for this specific event, i.e. filter=
 it
> out using the i8042 filter in dell-laptop.c and translate the WMI eve=
nt
> into a keycode in dell-wmi.c? This shouldn't conflict with the dell-r=
btn
> driver as there are no ACPI devices on an XPS L502X that could be
> handled by that driver [1] and thus the i8042 filter should be
> installed. However, that i8042 keycode could potentially be generated=
 on
> other, WMI-less models and such a change would break them, rendering =
it
> unacceptable. I also assumed pressing the hotkey in question on an XP=
S
> L502X produces the same i8042 keycode as the WMI event code indicates=
=2E..
>=20
> [1] this statement is based on the DSDT dump from a Dell XPS L502X th=
at
>     I found here: https://launchpadlibrarian.net/68880655/DSDT.dsl
>=20

I would like to wait for documentation and not to invent/mess something
again and more. Creating big list with DMI names and associate hooks fo=
r
them based on "our" observation is good way to hell!

We even do not know:

1) how to activate code for receiving events
2) what is format of which event
3) which keypress should be reported by i8042 bus and which via ACPI/WM=
I

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
