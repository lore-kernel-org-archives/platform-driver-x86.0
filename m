From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Tue, 5 May 2015 13:31:16 -0700
Message-ID: <20150505203116.GB33977@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <20150429181606.GR24346@pali>
 <1662732.6WCXK4FVmN@xps13>
 <201504292059.26585@pali>
 <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
 <20150430074429.GT24346@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38697 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751025AbbEEUbS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 16:31:18 -0400
Content-Disposition: inline
In-Reply-To: <20150430074429.GT24346@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

On Thu, Apr 30, 2015 at 09:44:29AM +0200, Pali Roh=E1r wrote:
> On Thursday 30 April 2015 14:06:27 Alex Hung wrote:
> > Method ABRT is to be used by driver to disable BIOS handling of rad=
io
> > button. So the changes in behaviours observed by Gabriele is expect=
ed.
> > I have seen other systems behave the same way.
> >=20
>=20
> Right, that after that ARBT call operating system get full control ov=
er
> radio devices and ACPI/BIOS will not automatically enable/disable the=
m.
> I think this is OK.
>=20
> But for that we need also support for manually enable/disable radio
> devices and code for this support is missing. Or do DELLABCE/RBTN acp=
i
> devices somehow support enabling/disabling it via system/kernel reque=
st?
>=20
> > I do also see firmware only sends Notify(RBTN, 0x80) and no hard bl=
ock
> > whether ABRT(1) is called or not.  Thus keycode are the only option=
 on
> > those machines.
> >=20
>=20
> Key is ok, but we *must* have ability to hard block it via some
> ACPI/WMI/BIOS/FW/etc... call. Otherwise ARBT(1) is no go as users sho=
uld
> be able to enable/disable their radio devices (bluetooth for powersav=
e)
>=20
> > The idea to have an option (kernel parameter) for calling ABRT is
> > great. I can help verify on more machines. Is Gabriele's patch abov=
e a
> > final version that I should test?
> >=20
>=20
> No, I do not think so. This looks like hack or pure design. Kernel
> option could be there, but just for buggy BIOSes (and future changed
> design).
>=20
> But now it looks like for correct work is specifying that param
> required -- which is bad.
>=20
> Alex, can you ask Dell people how should system turn off e.g bluetoot=
h
> or wifi device if ARTB(1) is called and system/kernel (instead ACPI) =
is
> expected to turn off/on blueooth (and wifi) devices?
>=20
> I think that without this information (and working driver for it) we
> should not enable ARTB(1) or including this driver into kernel tree a=
s
> it will break some existing machines...
>=20
> Darren, I do not know what is better, but it looks like that some del=
l
> machines working fine now and some not (since begining). And after
> loading this driver some machines are fixed, but some which worked ar=
e
> broken... What do you think as maintainer?

We work with a challenging space that forces us to consider doing abnor=
mal
things to support product firmware, I do understand that I try to suppo=
rt it.

I agree with your statement above, the kernel parameter, if used at all=
, should
be used in special cases as a workaround, not as the normal case.

While I'm happy to take incremental improvements, even if they aren't 1=
00%
perfect, we can't fix some laptops by breaking others.


--=20
Darren Hart
Intel Open Source Technology Center
