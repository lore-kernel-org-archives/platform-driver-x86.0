From: Darren Hart <dvhart@infradead.org>
Subject: Re: New dell-wireless driver
Date: Fri, 21 Nov 2014 18:09:06 -0800
Message-ID: <20141122020906.GB24951@vmdeb7>
References: <201411222345.08384@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49976 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752444AbaKVXbA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 22 Nov 2014 18:31:00 -0500
Content-Disposition: inline
In-Reply-To: <201411222345.08384@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Sat, Nov 22, 2014 at 11:45:08PM +0100, Pali Roh=E1r wrote:
> Hello,
>=20
> I saw dell-wireless driver on platform-driver-x86 mailinglist [1]=20
> which using DELLABCE acpi device and I do not like some parts in=20
> this driver.

Hi Pali,

Thanks for reviewing and speaking up :)

>=20
> First is that this driver export rfkill event as keypress which=20
> is also reported to userspace by keyboard controller. So then=20
> userspace receive two rfkill keypresses.

Alex, can you comment? Does the keyboard controller also see this event=
?

>=20
> Second is that DELLABCE acpi device can also control "soft"=20
> rfkill status and this driver does not enable it because it use=20
> input class instead rfkill.
>=20
> Anyway I have unfinished my version of DELLABCE acpi driver which=20
> will use rfkill interface and plus allow to use hw switch events=20
> in dell-laptop.ko driver.

Is this something that could be applied incrementally fo Alex's driver,=
 or is it
something we'd be best starting over with?

We have some precedent for input drivers (there is one nearly identical=
 to the
dell driver for hp, also by Alex). Using rfkill does seem like the bett=
er
approach without digging into it.

>=20
> Currently dell-laptop.ko driver is using i8042 hook function for=20
> detecting hw switch key press event. It is needed to detect if=20
> rfkill state was changed or not.
>=20
> My prepared patches for dell-laptop.ko allows to use acpi event=20
> from DELLABCE driver, so i8042 hook function can be dropped.=20
> Really it is not good idea to pass every PS/2 data from both=20
> keyboard, touchpad and trackpoint to dell-laptop driver and if=20
> there is alternative (DELLABCE) it is better to use it.
>=20
> But now I would like to hear what do you think about it.
>=20
> Because only one kernel driver can attach to DELLABCE acpi=20
> device, I cannot use new dell-wireless driver. And I think only=20
> one driver can hit mainline kernel.

I would like to see your patch, it sounds like it might be a better opt=
ion.

--=20
Darren Hart
Intel Open Source Technology Center
