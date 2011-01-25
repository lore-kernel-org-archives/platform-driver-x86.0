From: Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH] X86, Acer, WMI: Do not double include linux/dmi.h in
 acer-wmi.c
Date: Tue, 25 Jan 2011 12:03:33 +0100 (CET)
Message-ID: <alpine.LNX.2.00.1101251203260.5725@pobox.suse.cz>
References: <4D3EC34A020000230002799D@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:45596 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750831Ab1AYLDf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Jan 2011 06:03:35 -0500
In-Reply-To: <4D3EC34A020000230002799D@novprvlin0050.provo.novell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: jj@chaosbits.net, mjg@redhat.com, carlos@strangeworlds.co.uk, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Mon, 24 Jan 2011, Joey Lee wrote:

> Hi Jesper,=20
>=20
> =E6=96=BC =E4=B8=80=EF=BC=8C2011-01-24 =E6=96=BC 22:12 +0100=EF=BC=8C=
Jesper Juhl =E6=8F=90=E5=88=B0=EF=BC=9A
> > Including linux/dmi.h once in drivers/platform/x86/acer-wmi.c is en=
ough.
> >=20
> > Signed-off-by: Jesper Juhl <jj@chaosbits.net>
> > ---
> >  acer-wmi.c |    1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index c5c4b8c..f21eb53 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -39,7 +39,6 @@
> >  #include <linux/slab.h>
> >  #include <linux/input.h>
> >  #include <linux/input/sparse-keymap.h>
> > -#include <linux/dmi.h>
> > =20
> >  #include <acpi/acpi_drivers.h>
> > =20
> >=20
>=20
> Reviewed-by: Lee, Chun-Yi <jlee@novell.com>

Applied, thanks.

--=20
Jiri Kosina
SUSE Labs, Novell Inc.
