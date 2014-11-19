From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform: x86: dell-laptop: Add support for keyboard
 backlight
Date: Wed, 19 Nov 2014 11:12:51 -0800
Message-ID: <20141119191251.GA58563@vmdeb7>
References: <1415967813-7223-1-git-send-email-pali.rohar@gmail.com>
 <20141119183416.GA100640@vmdeb7>
 <20141119192336.GA942@srcf.ucam.org>
 <201411192051.28998@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:33816 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756124AbaKST6b (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 19 Nov 2014 14:58:31 -0500
Content-Disposition: inline
In-Reply-To: <201411192051.28998@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, libsmbios-devel@lists.us.dell.com, Srinivas_G_Gowda@dell.com, Michael_E_Brown@dell.com, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, Nov 19, 2014 at 08:51:28PM +0100, Pali Roh=E1r wrote:
> On Wednesday 19 November 2014 20:23:36 Matthew Garrett wrote:
> > On Wed, Nov 19, 2014 at 10:34:16AM -0800, Darren Hart wrote:
> > > I'm somewhat concerned that this patch doubles the size of
> > > this driver. When we're adding this much code, I have to
> > > ask - does it make sense to grow this driver rather than
> > > create a new one?
> >=20
> > There'd be a fair amount of code duplication in splitting it.
> >=20
>=20
> Yes. dell-laptop.ko implements functions for doing Dell SMBIOS=20
> calls which are needed for keyboard backlight.
>=20
> > > There is no ACPI backlight driver on these systems? We need
> > > a platform driver?
> >=20
> > ACPI doesn't specify keyboard backlight control, so this ends
> > up being very vendor specific.
>=20
> dell-laptop.ko is not ACPI driver. It is using Dell SMBIOS calls.=20
> And I do not know about Dell specific ACPI interface for keyboard=20
> backlight. So Darren, ask this question someone from Dell.

Right, I asked because there is a block in the original driver to defer
to an ACPI backlight driver if it exists. I understand this is a
keyboard backlight driver and is different, but I wanted to check.

So let's go ahead and move forward with dell-laptop.c being the right
place for this addition.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
