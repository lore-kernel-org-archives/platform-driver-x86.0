From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter
 when possible
Date: Wed, 27 May 2015 19:52:13 -0700
Message-ID: <20150528025213.GA30250@fury.dvhart.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56149 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbbE1CwO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 22:52:14 -0400
Content-Disposition: inline
In-Reply-To: <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, Darren Hart <dvhart@linux.intel.com>

On Wed, May 27, 2015 at 11:28:25PM +0200, Pali Roh=E1r wrote:
> Until now module dell-laptop registered rfkill device which used i804=
2
> filter function for receiving HW switch rfkill events (handling speci=
al
> keycode).
>=20
> But for some dell laptops there is native ACPI driver dell-rbtn which=
 can
> receive rfkill events (without i8042 hooks).
>=20
> So this patch will combine best from both sides. It will use native A=
CPI
> driver dell-rbtn for receiving events and dell-laptop SMBIOS interfac=
e for
> enabling or disabling radio devices. If ACPI driver or device will no=
t be
> available fallback to i8042 filter function will be used.
>=20
> Patch also changes module_init() to late_initcall() to ensure that in=
it
> function will be called after initializing dell-rbtn.c driver.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
> Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>


Several basic checkpatch.pl errors in this one. Please always run check=
patch.pl
before submitting patches, these sorts of issues should be caught befor=
e hitting
the mailing list.

Please provide some details on the scenarios you have tested to verify =
you have
addressed the build and runtime issues reported.

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
