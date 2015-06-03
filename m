From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter
 when possible
Date: Tue, 2 Jun 2015 20:55:05 -0700
Message-ID: <20150603035505.GA81094@vmdeb7>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
 <20150528025213.GA30250@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150528025213.GA30250@fury.dvhart.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, May 27, 2015 at 07:52:13PM -0700, Darren Hart wrote:
> On Wed, May 27, 2015 at 11:28:25PM +0200, Pali Roh=E1r wrote:
> > Until now module dell-laptop registered rfkill device which used i8=
042
> > filter function for receiving HW switch rfkill events (handling spe=
cial
> > keycode).
> >=20
> > But for some dell laptops there is native ACPI driver dell-rbtn whi=
ch can
> > receive rfkill events (without i8042 hooks).
> >=20
> > So this patch will combine best from both sides. It will use native=
 ACPI
> > driver dell-rbtn for receiving events and dell-laptop SMBIOS interf=
ace for
> > enabling or disabling radio devices. If ACPI driver or device will =
not be
> > available fallback to i8042 filter function will be used.
> >=20
> > Patch also changes module_init() to late_initcall() to ensure that =
init
> > function will be called after initializing dell-rbtn.c driver.
> >=20
> > Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> > Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> > Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>=20
>=20
> Several basic checkpatch.pl errors in this one. Please always run che=
ckpatch.pl
> before submitting patches, these sorts of issues should be caught bef=
ore hitting
> the mailing list.
>=20
> Please provide some details on the scenarios you have tested to verif=
y you have
> addressed the build and runtime issues reported.
>=20

Checking in so this doesn't fall through the cracks. Do you have a v5 i=
n the
works for the 4.2 merge window?

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
