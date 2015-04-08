From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: Add me on list of Dell laptop drivers
Date: Tue, 7 Apr 2015 21:03:28 -0700
Message-ID: <20150408040328.GB14618@fury.dvhart.com>
References: <1427636330-21091-1-git-send-email-pali.rohar@gmail.com>
 <20150402051027.GD37152@fury.dvhart.com>
 <201504052311.49832@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46617 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750993AbbDHEDa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Apr 2015 00:03:30 -0400
Content-Disposition: inline
In-Reply-To: <201504052311.49832@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>

On Sun, Apr 05, 2015 at 11:11:49PM +0200, Pali Roh=E1r wrote:
> On Thursday 02 April 2015 07:10:27 Darren Hart wrote:
> > On Sun, Mar 29, 2015 at 03:38:50PM +0200, Pali Roh=E1r wrote:
> >=20
> > Please include why. No empty commit messages please.
> >=20
> > For example, you've written nearly a third of the dell-wmi.c
> > driver, and all the dell-smo8800.c driver.
> >=20
>=20
> Ok. If you need description include this:
>=20
> =3D=3D=3D
> MAINTAINERS: Add me on list of Dell laptop drivers
>=20
> I have written more parts of dell laptop drivers dell-laptop.c,=20
> dell-wmi.c and dell-smo8800.c
> =3D=3D=3D
>=20
> > Dell Laptop is still pending the keyboard backlight patches
> > though I believe (have I missed them?), so you don't
> > currently have code ownership there. I agree you should be on
> > the MAINTAINERS list, but it would be good to get your
> > keyboard backlight changes in first.
> >=20
>=20
> ok.
>=20
> > Gosh... sure seems like we should have merged that already...
> > am I missing something? The last thing I see in master,
> > testing, and next is the revert from Jan 21....
> >=20
>=20
> backlight support was merged for 3.19, but has small problem with=20
> ALS settings. And then you decided to revert it for 3.19. After=20
> that problem was fixed and last (2015-03-06) you wrote that you=20
> queued patch again for 4.1 release.

Right you are, and I appear to have dropped that ball. Found it, and it=
's now in
my testing branch, and will run through the 0day testing, then into my =
next
tomorrow, still on track for 4.1.

>=20
> > Also, Matthew, you're the listed maintainer for these, do you
> > agree to adding Pali?

I'm accepted silence as acceptance :-)

--=20
Darren Hart
Intel Open Source Technology Center
