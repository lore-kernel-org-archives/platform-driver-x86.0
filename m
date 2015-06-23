From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Dell Vostro V131 hotkeys revisited
Date: Tue, 23 Jun 2015 14:18:27 +0200
Message-ID: <20150623121827.GO31818@pali>
References: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:32884 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752734AbbFWMSa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Jun 2015 08:18:30 -0400
Received: by wiwl6 with SMTP id l6so64640923wiw.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2015 05:18:30 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Alex Hung <alex.hung@canonical.com>

CCing Alex

On Tuesday 23 June 2015 13:26:21 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> Hi all,
>=20
> I'm trying to get all of the Dell Vostro V131 special hotkeys working=
=2E
> This issue has been previously raised [1] by Peter Meiser, but it was=
n't
> solved. I decided to share my findings on this subject, hoping that
> someone will have an idea how to proceed.
>=20
> TL;DR: it looks like pressing these hotkeys should be reported by the
> firmware using WMI, but the DSDT doesn't contain a code path which
> notifies the ACPI WMI object upon a hotkey event.
>=20
> Vostro V131 has 3 special hotkeys. Hotkey #1 is simply translated to
> Super+X, so it's not an issue. Hotkey #2 generates keycode 0xEE (it a=
lso
> raises a GPE - see below) and can reportedly be coerced to behave [2]=
,
> which leaves us with hotkey #3. While the Dell event GUID is present =
in
> the ACPI WMI object, the dell-wmi driver does not report any events w=
hen
> hotkey #3 is pressed - only the ACPI interrupt counter increases as G=
PE
> 0x17 is raised. Diving into the DSDT [3], you'll find that the _L17
> method only calls another method (NEVT), where some value is retrieve=
d
> (using yet another method, ECG1) and acted upon accordingly. Using AC=
PI
> method customization, I discovered that ECG1 returns 0x2000 for hotke=
y
> #2 and 0x1000 for hotkey #3. But if you look at the code of the NEVT
> method, it turns out these values don't cause any code path to be
> executed (while I would expect them to cause the WMIA method to be
> called as it notifies the ACPI WMI object).
>=20
> I decompiled the MOF buffer (WQMO) using wmimofck.exe, but no magic
> initialization method popped up. While in Windows, I copied a sample
> VBScript from MSDN for receiving event notifications via WMI, set pro=
per
> namespace ("root\wmi") and notification query ("SELECT * FROM
> BIOSEvent") and it worked. This is why I believe the WMI route is the
> correct one.
>=20
> However, even when I customized the NEVT method to call WMIA for valu=
es
> 0x1000 and 0x2000, the dell-wmi driver reported all zeros for the eve=
nt
> data retrieved using _WED.
>=20
> Using acpi_os_name didn't change anything. Neither did updating the B=
IOS
> to the latest version, A04.
>=20
> So I wrote a kernel module which installs a custom GPE 0x17 handler,
> which in turn calls the ECG1 method to retrieve the event code and
> generates input events. While this works, GPE 0x17 is also used for
> power and lid events (among others), so loading the module cripples
> other ACPI-based features, rendering it useless.
>=20
> If anyone has an idea where to go from here to solve this issue in an
> elegant manner, I'm all ears.
>=20
> [1] http://www.spinics.net/lists/platform-driver-x86/msg03232.html
> [2] http://www.spinics.net/lists/platform-driver-x86/msg04555.html
> [3] https://launchpadlibrarian.net/146038073/DSDT.dsl
>=20

Alex, this looks like problem with Dell WMI. Maybe we will not be able
to fix this problem with hotkeys without information/documentation abou=
t
Dell WMI events... Do you have any idea about it?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
