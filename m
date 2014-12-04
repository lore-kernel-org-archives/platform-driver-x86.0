From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [patch] dell-laptop: fix kbd_timeout handling
Date: Thu, 04 Dec 2014 11:58:27 +0100
Message-ID: <1858088.hYJHB71vOy@xps13>
References: <1417597233.14672.2.camel@Pali-Nokia-N900> <20141203073324.GA8568@vmdeb7> <201412041042.37888@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:52999 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210AbaLDK6m convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 4 Dec 2014 05:58:42 -0500
Received: by mail-wg0-f43.google.com with SMTP id l18so22163214wgh.30
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Dec 2014 02:58:41 -0800 (PST)
In-Reply-To: <201412041042.37888@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, kbuild@01.org

On Thursday 04 December 2014 10:42:37 Pali Roh=E1r wrote:
> On Wednesday 03 December 2014 08:33:25 Darren Hart wrote:
> > On Wed, Dec 03, 2014 at 01:01:59PM +0300, Dan Carpenter wrote:
> > > The original code had a static checker warning:
> > > 	drivers/platform/x86/dell-laptop.c:1389
> > > 	kbd_led_timeout_store() warn: this array is probably
> > > 	non-NULL. 'quirks->kbd_timeouts'
> > >=20
> > > This warning does indicate a bug.  I have added a
> > > .needs_kbd_timeouts flag which is true if the
> > > .kbd_timeouts[] array has been declared. Otherwise, in the
> > > original code the quirk_dell_vostro_v130 struct didn't
> > >=20
> > > have .kbd_timeouts[] declared so the loop:
> > > 	for (i =3D 0; quirks->kbd_timeouts[i] !=3D -1; i++) {
> > >=20
> > > Would have read beyond the end of the struct with
> > > unpredictable results.
> > >=20
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >=20
> > Thanks Dan,
> >=20
> > Pali, any objections?
> >=20
> > Dan, any objection to Pali rolling this into another revision?
> > No point in introducing the bug to next and mainline.
> >=20
> > Thanks,
>=20
> No problem from my side. This quirks code was done by Gabriele to
> fix BIOS problems on some laptops.
>=20
> Gabriele, any objections?

No objections.

Gabriele.
