From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Sat, 04 Jul 2015 22:34:48 +0200
Message-ID: <2840244.Y1b1VTO7hU@xps13>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl> <2310738.zonLnARZZM@xps13> <20150704194151.GA13641@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:38586 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806AbbGEKBY convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 06:01:24 -0400
Received: by wibdq8 with SMTP id dq8so129861745wib.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 03:01:23 -0700 (PDT)
In-Reply-To: <20150704194151.GA13641@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Saturday 04 July 2015 21:41:51 Pali Roh=C3=A1r wrote:
> On Friday 03 July 2015 20:22:22 Gabriele Mazzotta wrote:
> > On Friday 03 July 2015 16:14:54 Pali Roh=C3=A1r wrote:
> > > On Friday 03 July 2015 16:09:01 Pali Roh=C3=A1r wrote:
> > > > Yes, "vendor does not say anything" is also what could happen..=
=2E
> > > >=20
> > > > Then in your case, I would need to know format of *all* events =
which can
> > > > your laptop via WMI receive. If we collect as more as possible =
events
> > > > from different laptops we can try to abstract format/interface.
> > > >=20
> > >=20
> > > CCing Gabriele, can you please provide buffers of all possible WM=
I
> > > events which can be received on your dell machine via dell-wmi.ko=
?
> > > (just enable pr_debug() in dell-wmi.c)
> >=20
> > Hi,
> >=20
> > here below there's what I could get from my XPS13 9333.
> >=20
> > [ 6115.412615] wifi - disable/enable
> > [ 6115.710966] dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 0=
3 0a 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6115.710972] dell_wmi: Key e008 pressed
> > [ 6116.766483] dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 0=
3 09 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6116.766483] dell_wmi: Key e008 pressed
> > [ 6121.555618] battery health
> > [ 6122.093304] dell_wmi: Received WMI event (02 00 00 00 07 e0 1d 0=
3 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6122.093313] dell_wmi: Key e007 pressed
> > [ 6128.550329] brightness down
> > [ 6129.739787] dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 0=
0 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6129.739799] dell_wmi: Key e005 pressed
> > [ 6134.469814] brightness up
> > [ 6134.853151] dell_wmi: Received WMI event (03 00 00 00 06 e0 0f 0=
0 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6134.853157] dell_wmi: Key e006 pressed
> > [ 6143.153178] keyboard illumination - level 2 1 0
> > [ 6143.056422] dell_wmi: Received WMI event (03 00 00 00 0c e0 02 0=
0 09 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6143.056427] dell_wmi: Key e00c pressed
> > [ 6143.768556] dell_wmi: Received WMI event (03 00 00 00 0c e0 01 0=
0 09 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6143.768566] dell_wmi: Key e00c pressed
> > [ 6144.340347] dell_wmi: Received WMI event (03 00 00 00 0c e0 00 0=
0 09 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6144.340357] dell_wmi: Key e00c pressed
> > [ 6176.922331] volume down
> > [ 6177.325737] dell_wmi: Received WMI event (02 00 00 00 2e e0 01 0=
0 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6177.325746] dell_wmi: Key e02e pressed
> > [ 6182.892971] volume up
> > [ 6183.240709] dell_wmi: Received WMI event (02 00 00 00 30 e0 01 0=
0 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6183.240715] dell_wmi: Key e030 pressed
> > [ 6188.932940] mute
> > [ 6190.453967] dell_wmi: Received WMI event (02 00 00 00 f7 e0 01 0=
0 08 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00)
> > [ 6190.453975] dell_wmi: Key e0f7 pressed
>=20
> Hi!
>=20
> I have looked at your DSDT table which you sent me months ago and I s=
ee
> that your ACPI code does not clear WMI buffer before sending it to OS
> driver (buffer named INFO, and u16* values in INF0, INF1, ... INF7).
>=20
> And I see that your ACPI code always send one "message" in WMI buffer=
,
> not like on my E6440 when I receive one "message" for keypress event =
and
> appended "message" that keyboard backlight was changed.
>
> Because your ACPI code does not clear buffer before filling it, it is
> impossible to parse correctly on both machines (my and your)... :-(

I guess this is because the size of the meaningful data is stored at
the beginning of the buffer (INF0, the first 2 bytes in the output here
above) and so there's no need to clear it entirely.

> But I see that on your machine ACPI set "WMI Interface Version" to 0x=
0.
> On my machine and Micha=C5=82's too it is set to 0x1. (See ACPI-WMI%2=
0.pdf)
> So maybe this information is important?
>=20
> Anyway your ACPI DSDT code contains all possible WMI events (for your
> machine) as they are generated by ACPI and not by EC/firmware...

Yes, there are some events that I don't even know how to trigger.

Here an additional event that I get from time to time:
[20052.604628] dell_wmi: Received WMI event (02 00 00 00 0e e0 0f 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[20052.604634] dell_wmi: Unknown key e00e pressed

According to my acpi table, this has to do with battery related stuff.
On a side note, I guess this event can be added to the "ignore list" of
the legacy keymap.

Anyway, I think that reading the acpi dump of my laptop is easier
than collecting and reading these logs. However, things are implemented
in a different way (probably this is the difference between "WMI
Interface Version" 0 and 1), so I don't know how helpful it can be.

In any case, here the acpidump in case someone is interested:
https://bugzilla.kernel.org/attachment.cgi?id=3D178381
