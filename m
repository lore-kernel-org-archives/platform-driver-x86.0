From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v1 2/3] platform/x86: thinkpad_acpi: Join string literals
 back
Date: Tue, 09 May 2017 21:24:35 -0300
Message-ID: <1494375875.1064702.971453736.29BB0B11@webmail.messagingengine.com>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
 <20170509141721.15841-2-andriy.shevchenko@linux.intel.com>
 <20170509171040.GD19242@khazad-dum.debian.net>
 <1494351185.30052.94.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:57001 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750951AbdEJAYg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 20:24:36 -0400
In-Reply-To: <1494351185.30052.94.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 9, 2017, at 14:33, Andy Shevchenko wrote:
> On Tue, 2017-05-09 at 14:10 -0300, Henrique de Moraes Holschuh wrote:
> > > While here, print negative error without changing a sign as it is a
> > > common pattern in the kernel.
> >=20
> > A separate patch for this would be better: it would be easier to
> > actually check that no functional changes crept in by mistake.
>=20
> It doesn't make sense to me. It would touch same lines of code I do
> already here and it's only one place, see below.

I had to go line-by-line looking for the darn thing, instead of just
compiling before-and-after and checking for an unchanged  object file.

> > > =C2=A0	rc =3D fan_set_enable();
> > > =C2=A0	if (rc < 0) {
> > > -		pr_err("fan watchdog: error %d while enabling fan,
> > > "
> > > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"will try again later...=
\n", -rc);
> > > +		pr_err("fan watchdog: error %d while enabling fan,
> > > will try again later...\n",
> > > +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc);

Yeah. This one.  I don't have a problem with this change at all (I acked
it), but it took some effort to find the nail in the hailstack.

--=20
  Henrique Holschuh
