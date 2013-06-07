From: Adam Lee <adam.lee@canonical.com>
Subject: Re: [PATCH 1/3] thinkpad_acpi: return -NODEV while operating
 uninitialized LEDs
Date: Fri, 7 Jun 2013 16:59:05 +0800
Message-ID: <20130607085905.GA7325@adam-laptop>
References: <1370593209-21358-1-git-send-email-adam.lee@canonical.com>
 <1370593209-21358-2-git-send-email-adam.lee@canonical.com>
 <87vc5qxpwh.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:50180 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753602Ab3FGI7Q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 7 Jun 2013 04:59:16 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp12so784030pab.35
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jun 2013 01:59:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <87vc5qxpwh.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Matthew Garrett <matthew.garrett@nebula.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Alex Hung <alex.hung@canonical.com>

On Fri, Jun 07, 2013 at 10:53:50AM +0200, Bj=F8rn Mork wrote:
> Adam Lee <adam.lee@canonical.com> writes:
>=20
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -5401,9 +5401,12 @@ static int led_write(char *buf)
> >  		return -ENODEV;
> > =20
> >  	while ((cmd =3D next_cmd(&buf))) {
> > -		if (sscanf(cmd, "%d", &led) !=3D 1 || led < 0 || led > 15)
> > +		if (sscanf(cmd, "%d", &led) !=3D 1)
> >  			return -EINVAL;
> > =20
> > +		if (!tpacpi_leds[led].led)
> > +			return -ENODEV;
>=20
> This looks risky.  Why did you remove the index sanity check?  What w=
ill
> happen now if the input is e.g "-1" or "42"?
>=20
> BTW, the magic number 15 should probably be (TPACPI_LED_NUMLEDS - 1)
> instead.

Oh, good point! I was thinking led_init() already checked the index.

Will submit patch v2, thanks.

--=20
Regards,
Adam Lee
Hardware Enablement
