From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Wed, 6 May 2015 09:49:22 +0200
Message-ID: <20150506074922.GB30910@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
 <20150430074429.GT24346@pali>
 <1828808.mVmCDTOvJh@xps13>
 <20150506055546.GA7523@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f180.google.com ([209.85.212.180]:35647 "EHLO
	mail-wi0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756428AbbEFHt0 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 03:49:26 -0400
Content-Disposition: inline
In-Reply-To: <20150506055546.GA7523@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tuesday 05 May 2015 22:55:46 Darren Hart wrote:
> On Tue, May 05, 2015 at 11:23:05PM +0200, Gabriele Mazzotta wrote:
> > On Thursday 30 April 2015 09:44:29 Pali Roh=C3=A1r wrote:
> > > On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> > > > Method ABRT is to be used by driver to disable BIOS handling of=
 radio
> > > > button. So the changes in behaviours observed by Gabriele is ex=
pected.
> > > > I have seen other systems behave the same way.
> > > >=20
> > >=20
> > > Right, that after that ARBT call operating system get full contro=
l over
> > > radio devices and ACPI/BIOS will not automatically enable/disable=
 them.
> > > I think this is OK.
> > >=20
> > > But for that we need also support for manually enable/disable rad=
io
> > > devices and code for this support is missing. Or do DELLABCE/RBTN=
 acpi
> > > devices somehow support enabling/disabling it via system/kernel r=
equest?
> > >=20
> > > > I do also see firmware only sends Notify(RBTN, 0x80) and no har=
d block
> > > > whether ABRT(1) is called or not.  Thus keycode are the only op=
tion on
> > > > those machines.
> > > >=20
> > >=20
> > > Key is ok, but we *must* have ability to hard block it via some
> > > ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users=
 should
> > > be able to enable/disable their radio devices (bluetooth for powe=
rsave)
> >=20
> > Does it really matter in the end? As I understand it, radio devices=
 are
> > off either way.
>=20
> As a point of reference for consideration, we recently dropped the Th=
inkpad
> hardware mute button because it seriously complicated everything in w=
hat appears
> to be a similar sort of situation. By eliminating the hardware mute a=
nd relying
> purely on software mute, we were able to provide a much more consiste=
ntly
> functional driver.
>=20
> Also note that this driver provided a "software_mute" module paramete=
r to allow
> the user to control this.
>=20
> I believe this provides some relevant precedent for your consideratio=
n. I don't
> want to add parameters casually, but it could be one is warranted her=
e.
>=20

Yes, this driver transfter hardware function (implemented in EC ACPI
firmware) into software kernel solution. But my point was that software
solution must be able to call all those "functions" which was called
previously by ACPI/firmware.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
