From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Wed, 01 Jan 2014 15:37:21 +0100
Message-ID: <52C42821.3020801@rempel-privat.de>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>	 <1388116274.3539.6046.camel@linux-s257.site> <1388118336.3539.6055.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9xP0AIQ85VbEqvsHat7mhfQrGFErkCg5S"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:56131 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754272AbaAAOh3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 1 Jan 2014 09:37:29 -0500
Received: from [192.168.1.221] ([93.218.64.233]) by mail.gmx.com (mrgmx003)
 with ESMTPSA (Nemesis) id 0LmbZb-1VQ8ZA2oBX-00aHq9 for
 <platform-driver-x86@vger.kernel.org>; Wed, 01 Jan 2014 15:37:27 +0100
In-Reply-To: <1388118336.3539.6055.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9xP0AIQ85VbEqvsHat7mhfQrGFErkCg5S
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 27.12.2013 05:25, schrieb joeyli:
> Hi Oleksij,=20
>=20
> =E6=96=BC =E4=BA=94=EF=BC=8C2013-12-27 =E6=96=BC 11:51 +0800=EF=BC=8Cjo=
eyli =E6=8F=90=E5=88=B0=EF=BC=9A
>> Hi Oleksij,=20
>>
>> =E6=96=BC =E5=9B=9B=EF=BC=8C2013-12-05 =E6=96=BC 14:00 +0100=EF=BC=8CO=
leksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
>>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>>> ---
>>>  drivers/platform/x86/acer-wmi.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
>>> index c9076bd..d5ca1648 100644
>>> --- a/drivers/platform/x86/acer-wmi.c
>>> +++ b/drivers/platform/x86/acer-wmi.c
>>> @@ -572,6 +572,14 @@ static const struct dmi_system_id video_vendor_d=
mi_table[] =3D {
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
>>>  		},
>>>  	},
>>> +	{
>>> +		.callback =3D video_set_backlight_video_vendor,
>>> +		.ident =3D "Acer Aspire E1-572",
>>> +		.matches =3D {
>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
>>> +		},
>>> +	},
>>>  	{}
>>>  };
>>> =20
>>
>> I have applied this patch, build and load acer-wmi driver, didn't see
>> problem.
>>
>> Acked-by: Lee, Chun-Yi <jlee@suse.com>
>>
>>
>> Thanks for your patch!
>> Joey Lee
>=20
> I just aware Aspire E1-572 shipped with Windows 8. Before merge this
> patch. Could you please try v3.13-rc5 kernel with
> video.use_native_backlight=3D1 kernel parameter?
>=20
> Aaron Lu's "[PATCH v5 0/4] Fix Win8 backlight issue" merged to mainline=

> in v3.13-rc1, his patches works to me on a Gateway Windows 8 notebook.
>=20
> Please try it, if Aaron's patches works on E1-572, then we don't need
> this patch.

Hi,

suddenly i do not have access to this Laptops any more. It was a
purchase for a friend. I tested it, provided some patch and gave it away =
:(

--=20
Regards,
Oleksij


--9xP0AIQ85VbEqvsHat7mhfQrGFErkCg5S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iF4EAREIAAYFAlLEKCYACgkQHwImuRkmbWkhagD8CwahcHnkSOW4qXaC2T9ae600
Apgr3a0xj6ljigR/AFUA/2SWTHik89tVyecPZ84jw5UaavZQ6ZZpBhiqmu5aJjbV
=z2Sv
-----END PGP SIGNATURE-----

--9xP0AIQ85VbEqvsHat7mhfQrGFErkCg5S--
