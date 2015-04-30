From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Thu, 30 Apr 2015 09:44:29 +0200
Message-ID: <20150430074429.GT24346@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <20150429181606.GR24346@pali>
 <1662732.6WCXK4FVmN@xps13>
 <201504292059.26585@pali>
 <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35285 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750887AbbD3Hod (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Apr 2015 03:44:33 -0400
Content-Disposition: inline
In-Reply-To: <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> Method ABRT is to be used by driver to disable BIOS handling of radio
> button. So the changes in behaviours observed by Gabriele is expected=
=2E
> I have seen other systems behave the same way.
>=20

Right, that after that ARBT call operating system get full control over
radio devices and ACPI/BIOS will not automatically enable/disable them.
I think this is OK.

But for that we need also support for manually enable/disable radio
devices and code for this support is missing. Or do DELLABCE/RBTN acpi
devices somehow support enabling/disabling it via system/kernel request=
?

> I do also see firmware only sends Notify(RBTN, 0x80) and no hard bloc=
k
> whether ABRT(1) is called or not.  Thus keycode are the only option o=
n
> those machines.
>=20

Key is ok, but we *must* have ability to hard block it via some
ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users shoul=
d
be able to enable/disable their radio devices (bluetooth for powersave)

> The idea to have an option (kernel parameter) for calling ABRT is
> great. I can help verify on more machines. Is Gabriele's patch above =
a
> final version that I should test?
>=20

No, I do not think so. This looks like hack or pure design. Kernel
option could be there, but just for buggy BIOSes (and future changed
design).

But now it looks like for correct work is specifying that param
required -- which is bad.

Alex, can you ask Dell people how should system turn off e.g bluetooth
or wifi device if ARTB(1) is called and system/kernel (instead ACPI) is
expected to turn off/on blueooth (and wifi) devices?

I think that without this information (and working driver for it) we
should not enable ARTB(1) or including this driver into kernel tree as
it will break some existing machines...

Darren, I do not know what is better, but it looks like that some dell
machines working fine now and some not (since begining). And after
loading this driver some machines are fixed, but some which worked are
broken... What do you think as maintainer?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
