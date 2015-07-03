From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Fri, 03 Jul 2015 20:22:22 +0200
Message-ID: <2310738.zonLnARZZM@xps13>
References: <20150702204122.GA2610@eudyptula.hq.kempniu.pl> <20150703140901.GN1841@pali> <20150703141454.GO1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f42.google.com ([74.125.82.42]:33978 "EHLO
	mail-wg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755350AbbGCSW0 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jul 2015 14:22:26 -0400
Received: by wgqq4 with SMTP id q4so94167852wgq.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2015 11:22:25 -0700 (PDT)
In-Reply-To: <20150703141454.GO1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Friday 03 July 2015 16:14:54 Pali Roh=E1r wrote:
> On Friday 03 July 2015 16:09:01 Pali Roh=E1r wrote:
> > Yes, "vendor does not say anything" is also what could happen...
> >=20
> > Then in your case, I would need to know format of *all* events whic=
h can
> > your laptop via WMI receive. If we collect as more as possible even=
ts
> > from different laptops we can try to abstract format/interface.
> >=20
>=20
> CCing Gabriele, can you please provide buffers of all possible WMI
> events which can be received on your dell machine via dell-wmi.ko?
> (just enable pr_debug() in dell-wmi.c)

Hi,

here below there's what I could get from my XPS13 9333.

[ 6115.412615] wifi - disable/enable
[ 6115.710966] dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 0a=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6115.710972] dell_wmi: Key e008 pressed
[ 6116.766483] dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 09=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6116.766483] dell_wmi: Key e008 pressed
[ 6121.555618] battery health
[ 6122.093304] dell_wmi: Received WMI event (02 00 00 00 07 e0 1d 03 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6122.093313] dell_wmi: Key e007 pressed
[ 6128.550329] brightness down
[ 6129.739787] dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 00 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6129.739799] dell_wmi: Key e005 pressed
[ 6134.469814] brightness up
[ 6134.853151] dell_wmi: Received WMI event (03 00 00 00 06 e0 0f 00 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6134.853157] dell_wmi: Key e006 pressed
[ 6143.153178] keyboard illumination - level 2 1 0
[ 6143.056422] dell_wmi: Received WMI event (03 00 00 00 0c e0 02 00 09=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6143.056427] dell_wmi: Key e00c pressed
[ 6143.768556] dell_wmi: Received WMI event (03 00 00 00 0c e0 01 00 09=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6143.768566] dell_wmi: Key e00c pressed
[ 6144.340347] dell_wmi: Received WMI event (03 00 00 00 0c e0 00 00 09=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6144.340357] dell_wmi: Key e00c pressed
[ 6176.922331] volume down
[ 6177.325737] dell_wmi: Received WMI event (02 00 00 00 2e e0 01 00 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6177.325746] dell_wmi: Key e02e pressed
[ 6182.892971] volume up
[ 6183.240709] dell_wmi: Received WMI event (02 00 00 00 30 e0 01 00 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6183.240715] dell_wmi: Key e030 pressed
[ 6188.932940] mute
[ 6190.453967] dell_wmi: Received WMI event (02 00 00 00 f7 e0 01 00 08=
 00 00 01 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00)
[ 6190.453975] dell_wmi: Key e0f7 pressed
