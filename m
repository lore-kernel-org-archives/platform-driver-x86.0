From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Dell Vostro V131 hotkeys revisited
Date: Tue, 23 Jun 2015 13:26:21 +0200
Message-ID: <20150623112621.GA3071@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:32992 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753370AbbFWL0Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Jun 2015 07:26:25 -0400
Received: by wgck11 with SMTP id k11so6856525wgc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2015 04:26:24 -0700 (PDT)
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>, Rezwanul Kabir <Rezwanul_Kabir@dell.com>, Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org

Hi all,

I'm trying to get all of the Dell Vostro V131 special hotkeys working.
This issue has been previously raised [1] by Peter Meiser, but it wasn'=
t
solved. I decided to share my findings on this subject, hoping that
someone will have an idea how to proceed.

TL;DR: it looks like pressing these hotkeys should be reported by the
firmware using WMI, but the DSDT doesn't contain a code path which
notifies the ACPI WMI object upon a hotkey event.

Vostro V131 has 3 special hotkeys. Hotkey #1 is simply translated to
Super+X, so it's not an issue. Hotkey #2 generates keycode 0xEE (it als=
o
raises a GPE - see below) and can reportedly be coerced to behave [2],
which leaves us with hotkey #3. While the Dell event GUID is present in
the ACPI WMI object, the dell-wmi driver does not report any events whe=
n
hotkey #3 is pressed - only the ACPI interrupt counter increases as GPE
0x17 is raised. Diving into the DSDT [3], you'll find that the _L17
method only calls another method (NEVT), where some value is retrieved
(using yet another method, ECG1) and acted upon accordingly. Using ACPI
method customization, I discovered that ECG1 returns 0x2000 for hotkey
#2 and 0x1000 for hotkey #3. But if you look at the code of the NEVT
method, it turns out these values don't cause any code path to be
executed (while I would expect them to cause the WMIA method to be
called as it notifies the ACPI WMI object).

I decompiled the MOF buffer (WQMO) using wmimofck.exe, but no magic
initialization method popped up. While in Windows, I copied a sample
VBScript from MSDN for receiving event notifications via WMI, set prope=
r
namespace ("root\wmi") and notification query ("SELECT * FROM
BIOSEvent") and it worked. This is why I believe the WMI route is the
correct one.

However, even when I customized the NEVT method to call WMIA for values
0x1000 and 0x2000, the dell-wmi driver reported all zeros for the event
data retrieved using _WED.

Using acpi_os_name didn't change anything. Neither did updating the BIO=
S
to the latest version, A04.

So I wrote a kernel module which installs a custom GPE 0x17 handler,
which in turn calls the ECG1 method to retrieve the event code and
generates input events. While this works, GPE 0x17 is also used for
power and lid events (among others), so loading the module cripples
other ACPI-based features, rendering it useless.

If anyone has an idea where to go from here to solve this issue in an
elegant manner, I'm all ears.

[1] http://www.spinics.net/lists/platform-driver-x86/msg03232.html
[2] http://www.spinics.net/lists/platform-driver-x86/msg04555.html
[3] https://launchpadlibrarian.net/146038073/DSDT.dsl

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
