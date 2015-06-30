From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 30 Jun 2015 10:00:04 +0200
Message-ID: <20150630080004.GB27720@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
 <20150624132303.GK21149@pali>
 <20150625090206.GA2554@eudyptula.hq.kempniu.pl>
 <201506272050.24352@pali>
 <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:38112 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750980AbbF3IAH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 30 Jun 2015 04:00:07 -0400
Received: by wibdq8 with SMTP id dq8so8451304wib.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2015 01:00:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150630073835.GA3612@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Tuesday 30 June 2015 09:38:35 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > now I looked deeply at your problem. I read that part of ACPI code =
and=20
> > it really looks like that NEVT method does not handle all possible=20
> > events.
>=20
> Thank you for taking your time to review my findings.
>=20
> > But how can windows driver handle that? In my opinion it either do =
some
> > init magic so NEVT will receive event with mask 0x0800 or it overwr=
ite
> > some ACPI method and handle it locally...
>=20
> I have no idea, but Kyle Evans had a few in a message I referenced
> earlier in this thread [1].
>=20
> > You can try to play with overwriting ACPI function NEVT at runtime =
and=20
> > patch it to call WMIA also for other masks.
>=20
> I already tried that before writing the first message in this thread,
> which includes the following quote:
>=20
> "However, even when I customized the NEVT method to call WMIA for val=
ues
> 0x1000 and 0x2000, the dell-wmi driver reported all zeros for the eve=
nt
> data retrieved using _WED."
>=20
> > Are you 100% sure that keypress is not sent to i8042 controller and=
 that=20
> > linux kbd driver does not filter it somehow? Ideally test events wi=
th=20
> > userspace application input-events and not with some X utility (to =
be=20
> > sure that X does not consume that keypress too).
>=20
> Yes, I'm sure. First I booted the kernel with i8042.debug=3D1. Interr=
upts
> were raised as expected for hotkey #2, but not for hotkey #3. Then I
> enabled CONFIG_INPUT_EVBUG. As expected, events were generated for
> hotkey #2, but not for hotkey #3.
>=20
> [1] http://www.spinics.net/lists/linux-acpi/msg34577.html=20
>=20

Are you able to detect if Windows receive keypress via WMI or keyboard
controller or from other driver?

Also what you can try is to dump EC registers and DSDT table from
Windows and compare it with Linux.

I have no idea other idea. Either we miss some EC init code to enable
receiving events (via i8042 or WMI) or some other driver which use othe=
r
ACPI device or GPIO...

Alex, can you ask for some documentation about Dell Vostro V131 hotkeys=
?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
