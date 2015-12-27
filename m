From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [PATCH 0/2] Fixes for dell-wmi
Date: Sun, 27 Dec 2015 13:59:57 +0100
Message-ID: <567FE0CD.6080107@gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:37742 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751518AbbL0M77 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Dec 2015 07:59:59 -0500
In-Reply-To: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 24/12/2015 22:18, Pali Roh=C3=A1r wrote:
> This patch series adds check if Dell WMI descriptor structure is vali=
d and
> fixes processing WMI events on devices with WMI interface version 0.
>=20
> After testing, second patch is good candidate for backporting into st=
able
> kernels, but problem is that it cannot be used without first patch. S=
o I
> let decision to other people.
>=20
> Gabriele and Micha=C5=82, this patch series should fix processing eve=
nts on
> yours Dell laptops (you have in DSDT defined version 0). Can you test=
 it?

Hi,

I tested the patches and all the function keys work, but I can see
that there are some differences in the dmesg.

Here a before and after comparison.

The radio button seems to generate longer messages when compared to
the others.


Before:
# Brightness down
dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e005 pressed

# Volume down
dell_wmi: Received WMI event (02 00 00 00 2e e0 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e02e pressed

# Radio
dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 0a 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e008 pressed

# Brightness down
dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 00 0a 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e005 pressed

# Volume down
dell_wmi: Received WMI event (02 00 00 00 2e e0 0f 00 0a 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e02e pressed


After:
# Brightness down
dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 00 00 00 00 00 00 10=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e005 pressed

# Volume down
dell_wmi: Received WMI event (02 00 00 00 2e e0 0e 00 00 00 00 00 00 10=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e02e pressed

# Radio
dell_wmi: Received WMI event (06 00 00 00 08 e0 1d 03 0a 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e008 pressed

# Brightness down
dell_wmi: Received WMI event (03 00 00 00 05 e0 0e 00 09 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e005 pressed

# Volume down
dell_wmi: Received WMI event (02 00 00 00 2e e0 0e 00 09 00 00 01 01 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00)
dell_wmi: Key e02e pressed


> Pali Roh=C3=A1r (2):
>   dell-wmi: Check if Dell WMI descriptor structure is valid
>   dell-wmi: Process only one event on devices with interface version =
0
>=20
>  drivers/platform/x86/dell-wmi.c |   94 +++++++++++++++++++++++++++++=
+++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
>=20
