From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter
 when possible
Date: Wed, 3 Jun 2015 10:15:09 +0200
Message-ID: <20150603081509.GA14980@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
 <20150528025213.GA30250@fury.dvhart.com>
 <20150603035505.GA81094@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150603035505.GA81094@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 02 June 2015 20:55:05 Darren Hart wrote:
> On Wed, May 27, 2015 at 07:52:13PM -0700, Darren Hart wrote:
> > On Wed, May 27, 2015 at 11:28:25PM +0200, Pali Roh=C3=A1r wrote:
> > > Until now module dell-laptop registered rfkill device which used =
i8042
> > > filter function for receiving HW switch rfkill events (handling s=
pecial
> > > keycode).
> > >=20
> > > But for some dell laptops there is native ACPI driver dell-rbtn w=
hich can
> > > receive rfkill events (without i8042 hooks).
> > >=20
> > > So this patch will combine best from both sides. It will use nati=
ve ACPI
> > > driver dell-rbtn for receiving events and dell-laptop SMBIOS inte=
rface for
> > > enabling or disabling radio devices. If ACPI driver or device wil=
l not be
> > > available fallback to i8042 filter function will be used.
> > >=20
> > > Patch also changes module_init() to late_initcall() to ensure tha=
t init
> > > function will be called after initializing dell-rbtn.c driver.
> > >=20
> > > Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> > > Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> >=20
> >=20
> > Several basic checkpatch.pl errors in this one. Please always run c=
heckpatch.pl
> > before submitting patches, these sorts of issues should be caught b=
efore hitting
> > the mailing list.
> >=20
> > Please provide some details on the scenarios you have tested to ver=
ify you have
> > addressed the build and runtime issues reported.
> >=20
>=20
> Checking in so this doesn't fall through the cracks. Do you have a v5=
 in the
> works for the 4.2 merge window?
>=20
> Thanks,
>=20

In last days I did not have time to look at it... When do you need to
see v5 if it could go to 4.2?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
