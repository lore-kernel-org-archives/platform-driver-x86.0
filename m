From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Wed, 25 Feb 2015 22:06:16 -0800
Message-ID: <20150226060616.GA7331@fury.dvhart.com>
References: <1424343509-13639-1-git-send-email-gabriele.mzt@gmail.com>
 <201502221204.24003@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36289 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbbBZGGU (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 01:06:20 -0500
Content-Disposition: inline
In-Reply-To: <201502221204.24003@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, A.Sloman@cs.bham.ac.uk, computersforpeace@gmail.com, dan.carpenter@oracle.com

On Sun, Feb 22, 2015 at 12:04:23PM +0100, Pali Roh=E1r wrote:
> On Thursday 19 February 2015 11:58:29 Gabriele Mazzotta wrote:
> > This patch adds the support for the configuration of the
> > keyboard backlight on supported Dell laptops.
> >=20
> > With this patch it is possible to set:
> > * keyboard backlight level
> > * timeout after which the backlight will be automatically
> > turned off * input activity triggers (keyboard, touchpad,
> > mouse) that enable the backlight * ambient light settings
> >=20
> > The settings are exposed via
> > /sys/class/leds/dell::kbd_backlight/
> >=20
> > The code is based on the newly released documentation by Dell
> > in the libsmbios project.
> >=20
> > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > Signed-off-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > Cc: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  .../ABI/testing/sysfs-platform-dell-laptop         |   69 ++
> >  drivers/platform/x86/dell-laptop.c                 | 1089
> > +++++++++++++++++++- 2 files changed, 1152 insertions(+), 6
> > deletions(-)
> >  create mode 100644
> > Documentation/ABI/testing/sysfs-platform-dell-laptop
> >=20
>=20
> This patch is same as combination of previous, just contains all=20
> changes in single patch file. Difference between v3.19-rc5 and=20
> current version is just als code was moved to separate functions=20
> and als backlight can be enabled via new sysfs attribute (like in=20
> second patch which was sent).
>=20
> I tested this patch on top of linus tree (commit 79513d0) and=20
> keyboard backlight works fine.
>=20
> Darren, what do you think, can be this patch which brings=20
> keyboard backlight support finally moved to mainline kernel?

So sorry for the delay folks, bad week :( This landed too late for 3.20=
=2E.. her
durr 4.0, but should make 4.1. Expect to see it in next in the next few=
 days.

--=20
Darren Hart
Intel Open Source Technology Center
