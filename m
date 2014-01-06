From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Mon, 06 Jan 2014 17:20:03 +0100
Message-ID: <52CAD7B3.6060508@rempel-privat.de>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>	 <1388116274.3539.6046.camel@linux-s257.site>	 <1388118336.3539.6055.camel@linux-s257.site>	 <52C42821.3020801@rempel-privat.de> <1388666346.3539.6065.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hHChWgoID9R9bX4vJTSXmts1o919RWPMu"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:56282 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754824AbaAFQUO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 6 Jan 2014 11:20:14 -0500
Received: from [192.168.1.221] ([93.218.64.233]) by mail.gmx.com (mrgmx001)
 with ESMTPSA (Nemesis) id 0LdHeL-1VZylJ1mev-00iTEL for
 <platform-driver-x86@vger.kernel.org>; Mon, 06 Jan 2014 17:20:12 +0100
In-Reply-To: <1388666346.3539.6065.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hHChWgoID9R9bX4vJTSXmts1o919RWPMu
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 02.01.2014 13:39, schrieb joeyli:
> =E6=96=BC =E4=B8=89=EF=BC=8C2014-01-01 =E6=96=BC 15:37 +0100=EF=BC=8COl=
eksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
>> Am 27.12.2013 05:25, schrieb joeyli:
> [...]
>>>>>  		},
>>>>>  	},
>>>>> +	{
>>>>> +		.callback =3D video_set_backlight_video_vendor,
>>>>> +		.ident =3D "Acer Aspire E1-572",
>>>>> +		.matches =3D {
>>>>> +			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
>>>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire E1-572"),
>>>>> +		},
>>>>> +	},
>>>>>  	{}
>>>>>  };
>>>>> =20
>>>>
>>>> I have applied this patch, build and load acer-wmi driver, didn't se=
e
>>>> problem.
>>>>
>>>> Acked-by: Lee, Chun-Yi <jlee@suse.com>
>>>>
>>>>
>>>> Thanks for your patch!
>>>> Joey Lee
>>>
>>> I just aware Aspire E1-572 shipped with Windows 8. Before merge this
>>> patch. Could you please try v3.13-rc5 kernel with
>>> video.use_native_backlight=3D1 kernel parameter?
>>>
>>> Aaron Lu's "[PATCH v5 0/4] Fix Win8 backlight issue" merged to mainli=
ne
>>> in v3.13-rc1, his patches works to me on a Gateway Windows 8 notebook=
=2E
>>>
>>> Please try it, if Aaron's patches works on E1-572, then we don't need=

>>> this patch.
>>
>> Hi,
>>
>> suddenly i do not have access to this Laptops any more. It was a
>> purchase for a friend. I tested it, provided some patch and gave it aw=
ay :(
>>
>=20
> I think Aaron's patches can fix it on E1-572. Let's wait until v3.13
> version released then look at maybe someone report issue again.
>=20
> Very appreciate for your patch.
>=20
> Joey Lee
>=20

Hi Joey,

i have access to this hardware for next two weeks. Theoretically this
kernel should have patches you was talking about:
http://kernel.ubuntu.com/~kernel-ppa/mainline/daily/2014-01-06-trusty/

it works with video.use_native_backlight=3D1.

If you need more testing, you have two weeks ;)

--=20
Regards,
Oleksij


--hHChWgoID9R9bX4vJTSXmts1o919RWPMu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.15 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iF4EAREIAAYFAlLK17gACgkQHwImuRkmbWllOAEAjLMqpUnmL4pTw+U7cnbBt5JP
lcvl+svM0OLhAUbP6EMBAIyzjlYczP+yFneMD+sBCa+VN3Zw0jaOqgueZj7MjAyn
=32bP
-----END PGP SIGNATURE-----

--hHChWgoID9R9bX4vJTSXmts1o919RWPMu--
