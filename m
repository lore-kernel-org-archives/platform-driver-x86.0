From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter
 when possible
Date: Wed, 3 Jun 2015 22:16:55 -0700
Message-ID: <20150604051655.GC31158@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
 <20150528025213.GA30250@fury.dvhart.com>
 <20150603035505.GA81094@vmdeb7>
 <20150603081509.GA14980@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56847 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750849AbbFDFQ4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Jun 2015 01:16:56 -0400
Content-Disposition: inline
In-Reply-To: <20150603081509.GA14980@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, Darren Hart <dvhart@linux.intel.com>

On Wed, Jun 03, 2015 at 10:15:09AM +0200, Pali Roh=E1r wrote:
> On Tuesday 02 June 2015 20:55:05 Darren Hart wrote:
> > On Wed, May 27, 2015 at 07:52:13PM -0700, Darren Hart wrote:
> > > On Wed, May 27, 2015 at 11:28:25PM +0200, Pali Roh=E1r wrote:
> > > > Until now module dell-laptop registered rfkill device which use=
d i8042
> > > > filter function for receiving HW switch rfkill events (handling=
 special
> > > > keycode).
> > > >=20
> > > > But for some dell laptops there is native ACPI driver dell-rbtn=
 which can
> > > > receive rfkill events (without i8042 hooks).
> > > >=20
> > > > So this patch will combine best from both sides. It will use na=
tive ACPI
> > > > driver dell-rbtn for receiving events and dell-laptop SMBIOS in=
terface for
> > > > enabling or disabling radio devices. If ACPI driver or device w=
ill not be
> > > > available fallback to i8042 filter function will be used.
> > > >=20
> > > > Patch also changes module_init() to late_initcall() to ensure t=
hat init
> > > > function will be called after initializing dell-rbtn.c driver.
> > > >=20
> > > > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > > > Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > > > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> > >=20
> > >=20
> > > Several basic checkpatch.pl errors in this one. Please always run=
 checkpatch.pl
> > > before submitting patches, these sorts of issues should be caught=
 before hitting
> > > the mailing list.
> > >=20
> > > Please provide some details on the scenarios you have tested to v=
erify you have
> > > addressed the build and runtime issues reported.
> > >=20
> >=20
> > Checking in so this doesn't fall through the cracks. Do you have a =
v5 in the
> > works for the 4.2 merge window?
> >=20
> > Thanks,
> >=20
>=20
> In last days I did not have time to look at it... When do you need to
> see v5 if it could go to 4.2?

No rush in general, I just wanted to make sure you weren't waiting on m=
e while I
was waiting for you.

We're at the mercy of Linus' decision regarding how many RCs before he =
releases
4.1. I suspect we have another week, but it could be this weekend.

I like to have new functionality in linux-next for two weeks prior to s=
ending a
pull to Linus. To meet that, you should really have it in this weekend.=
 If Linus
releases 4.1 this weekend, that will just barely make two weeks before =
the end
of the merge window.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
