From: Darren Hart <dvhart@infradead.org>
Subject: Re: drivers/platform/x86/wmi.c bug report
Date: Thu, 5 May 2016 14:06:52 -0700
Message-ID: <20160505210652.GD2113@f23x64.localdomain>
References: <DUB128-W5794F348D2088C349130DF9C670@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49319 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757056AbcEEVGy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 5 May 2016 17:06:54 -0400
Content-Disposition: inline
In-Reply-To: <DUB128-W5794F348D2088C349130DF9C670@phx.gbl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Binderman <dcb314@hotmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sat, Apr 30, 2016 at 09:21:45AM +0000, David Binderman wrote:
> Hello there,
>=20
> drivers/platform/x86/wmi.c:523]: (style) Redundant condition: wmi_sta=
tus=3D=3DAE_OK. 'A || (!A && B)' is equivalent to 'A || B'

Thanks David. Would you care to send a patch?

>=20
> Source code is
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((wmi_status !=3D AE_OK) ||
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((wmi_status =3D=3D AE_=
OK) && (status =3D=3D AE_NOT_EXIST)))
>=20
> Suggest new code
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((wmi_status !=3D AE_OK) ||
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (status =3D=3D AE_NOT_E=
XIST))
>=20
> Also:
>=20
> drivers/platform/x86/wmi.c:567]: (style) Redundant condition: wmi_sta=
tus=3D=3DAE_OK. 'A || (!A && B)' is equivalent to 'A || B'
>=20
> Source code is
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((wmi_status !=3D AE=
_OK) ||
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ((wmi_statu=
s =3D=3D AE_OK) &&
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (status =
=3D=3D AE_NOT_EXIST)))
>=20
> Duplicate.
>=20
>=20
> Regards
>=20
> David Binderman
>=20
>=20
>  		 	   		 =20

--=20
Darren Hart
Intel Open Source Technology Center
