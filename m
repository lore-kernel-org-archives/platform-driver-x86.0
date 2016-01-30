From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] Remove ambiguous logging for "Unsupported brightness
 interface"
Date: Sat, 30 Jan 2016 10:20:45 -0200
Message-ID: <20160130122045.GA14919@khazad-dum.debian.net>
References: <CANpvso5_jzOgRv25isy0x6HJcTgKP4dabSH-_a5fM-uihdAUYw@mail.gmail.com>
 <1453937211.10099.31.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:57609 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754037AbcA3MUs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 30 Jan 2016 07:20:48 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id 21B9E27647
	for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jan 2016 07:20:48 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <1453937211.10099.31.camel@perches.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Eric Curtin <ericcurtin17@gmail.com>, platform-driver-x86@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net

On Wed, 27 Jan 2016, Joe Perches wrote:
> On Wed, 2016-01-27 at 22:14 +0000, Eric Curtin wrote:
> > Message gets logged on machines that are well supported.
> >=20
> > Signed-off-by: Eric Curtin <ericcurtin17@gmail.com>
> > ---
> > =A0drivers/platform/x86/thinkpad_acpi.c | 1 -
> > =A01 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c
> > b/drivers/platform/x86/thinkpad_acpi.c
> > index a268a7a..4eb41aa 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -6661,7 +6661,6 @@ static void __init
> > tpacpi_detect_brightness_capabilities(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("detected a=
 8-level brightness capable
> > ThinkPad\n");
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > =A0=A0=A0=A0=A0=A0=A0=A0default:
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0pr_info("Unsupported =
brightness interface\n");
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0tp_features.bright_=
unkfw =3D 1;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0bright_maxlvl =3D b=
 - 1;
> > =A0=A0=A0=A0=A0=A0=A0=A0}
>=20
> Perhaps this should be something like this instead:
> ---
> =A0drivers/platform/x86/thinkpad_acpi.c | 4 +---
> =A01 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/=
x86/thinkpad_acpi.c
> index a268a7a..bd12c71 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -6653,18 +6653,16 @@ static void __init tpacpi_detect_brightness_c=
apabilities(void)
> =A0	switch (b) {
> =A0	case 16:
> =A0		bright_maxlvl =3D 15;
> -		pr_info("detected a 16-level brightness capable ThinkPad\n");
> =A0		break;
> =A0	case 8:
> =A0	case 0:
> =A0		bright_maxlvl =3D 7;
> -		pr_info("detected a 8-level brightness capable ThinkPad\n");
> =A0		break;
> =A0	default:
> -		pr_info("Unsupported brightness interface\n");
> =A0		tp_features.bright_unkfw =3D 1;
> =A0		bright_maxlvl =3D b - 1;
> =A0	}
> +	pr_info("detected %u brightness levels\n", bright_maxlvl + 1);
> =A0}

This can be made pr_debug, since we're touching it...

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
