From: Darren Hart <dvhart@infradead.org>
Subject: Re: drivers/platform/x86/wmi.c bug report
Date: Fri, 6 May 2016 09:50:43 -0700
Message-ID: <20160506165043.GB48432@f23x64.localdomain>
References: <DUB128-W5794F348D2088C349130DF9C670@phx.gbl>
 <20160505210652.GD2113@f23x64.localdomain>
 <DUB128-W72AA260E514F47FFF736AC9C7D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40037 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756308AbcEFQum (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 May 2016 12:50:42 -0400
Content-Disposition: inline
In-Reply-To: <DUB128-W72AA260E514F47FFF736AC9C7D0@phx.gbl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Fri, May 06, 2016 at 05:53:31AM +0000, David Binderman wrote:
> Hello there Darren,
>=20
> ----------------------------------------
> >> drivers/platform/x86/wmi.c:523]: (style) Redundant condition: wmi_=
status=3D=3DAE_OK. 'A || (!A && B)' is equivalent to 'A || B'
> >
> > Thanks David. Would you care to send a patch?
>=20
> Something like
>=20
> --- drivers/platform/x86/wmi.c.sav=A0=A0=A0 2016-05-06 06:50:13.12860=
0783 +0100
> +++ drivers/platform/x86/wmi.c=A0=A0=A0 2016-05-06 06:51:09.497279659=
 +0100
> @@ -521,7 +521,7 @@
> =A0
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 wmi_status =3D wmi_method_enable(blo=
ck, 1);
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if ((wmi_status !=3D AE_OK) ||
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ((wmi_status =3D=3D AE_OK) &=
& (status =3D=3D AE_NOT_EXIST)))
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 (status =3D=3D AE_NOT_EXIST)=
)
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 status =3D wmi_status;
> =A0=A0=A0=A0 =A0=A0=A0 }
> =A0=A0=A0=A0 }
> @@ -565,8 +565,7 @@
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 block->handler =3D NULL;
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 block->handler_data =3D NU=
LL;
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 if ((wmi_status !=3D AE_OK=
) ||
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 ((wmi_status =3D=3D=
 AE_OK) &&
> -=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0=A0 (status =3D=3D =
AE_NOT_EXIST)))
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 (status =3D=3D AE_=
NOT_EXIST))
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 status =3D wmi_s=
tatus;
> =A0=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 }
> =A0=A0=A0=A0 =A0=A0=A0 }
>=20
> with some extra work, would probably work.

Heh, yes, indeed. It was the extra work part I was asking if you would =
be
willing to complete. :-)

If not, thanks for reporting it, we will add this to the todo list.

--=20
Darren Hart
Intel Open Source Technology Center
