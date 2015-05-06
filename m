From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Tue, 5 May 2015 22:55:46 -0700
Message-ID: <20150506055546.GA7523@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
 <20150430074429.GT24346@pali>
 <1828808.mVmCDTOvJh@xps13>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56122 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753502AbbEFFzt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 01:55:49 -0400
Content-Disposition: inline
In-Reply-To: <1828808.mVmCDTOvJh@xps13>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Tue, May 05, 2015 at 11:23:05PM +0200, Gabriele Mazzotta wrote:
> On Thursday 30 April 2015 09:44:29 Pali Roh=E1r wrote:
> > On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> > > Method ABRT is to be used by driver to disable BIOS handling of r=
adio
> > > button. So the changes in behaviours observed by Gabriele is expe=
cted.
> > > I have seen other systems behave the same way.
> > >=20
> >=20
> > Right, that after that ARBT call operating system get full control =
over
> > radio devices and ACPI/BIOS will not automatically enable/disable t=
hem.
> > I think this is OK.
> >=20
> > But for that we need also support for manually enable/disable radio
> > devices and code for this support is missing. Or do DELLABCE/RBTN a=
cpi
> > devices somehow support enabling/disabling it via system/kernel req=
uest?
> >=20
> > > I do also see firmware only sends Notify(RBTN, 0x80) and no hard =
block
> > > whether ABRT(1) is called or not.  Thus keycode are the only opti=
on on
> > > those machines.
> > >=20
> >=20
> > Key is ok, but we *must* have ability to hard block it via some
> > ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users s=
hould
> > be able to enable/disable their radio devices (bluetooth for powers=
ave)
>=20
> Does it really matter in the end? As I understand it, radio devices a=
re
> off either way.

As a point of reference for consideration, we recently dropped the Thin=
kpad
hardware mute button because it seriously complicated everything in wha=
t appears
to be a similar sort of situation. By eliminating the hardware mute and=
 relying
purely on software mute, we were able to provide a much more consistent=
ly
functional driver.

Also note that this driver provided a "software_mute" module parameter =
to allow
the user to control this.

I believe this provides some relevant precedent for your consideration.=
 I don't
want to add parameters casually, but it could be one is warranted here.

--=20
Darren Hart
Intel Open Source Technology Center
