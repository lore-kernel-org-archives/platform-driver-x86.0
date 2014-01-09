From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH] acer-wmi: add video_vendor quirk for Acer Aspire E1-572
Date: Thu, 09 Jan 2014 09:11:57 +0100
Message-ID: <52CE59CD.7070805@rempel-privat.de>
References: <1386248428-5767-1-git-send-email-linux@rempel-privat.de>	 <1388116274.3539.6046.camel@linux-s257.site>	 <1388118336.3539.6055.camel@linux-s257.site>	 <52C42821.3020801@rempel-privat.de>	 <1388666346.3539.6065.camel@linux-s257.site>	 <52CAD7B3.6060508@rempel-privat.de> <1389251197.24105.20.camel@linux-s257.site>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MvLvSWbgm3dWiim9rxBO2RTi6upV2bxhl"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:51799 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751201AbaAIIMG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jan 2014 03:12:06 -0500
Received: from [192.168.1.100] ([79.218.109.69]) by mail.gmx.com (mrgmx001)
 with ESMTPSA (Nemesis) id 0MI5Ve-1VxJu91eMY-003sEf for
 <platform-driver-x86@vger.kernel.org>; Thu, 09 Jan 2014 09:12:03 +0100
In-Reply-To: <1389251197.24105.20.camel@linux-s257.site>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, Aaron Lu <aaron.lu@intel.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MvLvSWbgm3dWiim9rxBO2RTi6upV2bxhl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 09.01.2014 08:06, schrieb joeyli:
> =E6=96=BC =E4=B8=80=EF=BC=8C2014-01-06 =E6=96=BC 17:20 +0100=EF=BC=8COl=
eksij Rempel =E6=8F=90=E5=88=B0=EF=BC=9A
>>> I think Aaron's patches can fix it on E1-572. Let's wait until v3.13
>>> version released then look at maybe someone report issue again.
>>>
>>> Very appreciate for your patch.
>>>
>>> Joey Lee
>>>
>>
>> Hi Joey,
>>
>> i have access to this hardware for next two weeks. Theoretically this
>> kernel should have patches you was talking about:
>> http://kernel.ubuntu.com/~kernel-ppa/mainline/daily/2014-01-06-trusty/=

>>
>> it works with video.use_native_backlight=3D1.
>>
>> If you need more testing, you have two weeks ;)
>>
>> --=20
>> Regards,
>> Oleksij
>>
>=20
> Thanks for your testing, then I think just use
> video.use_native_backlight to fix issue on Aspire E1-572. Don't need ad=
d
> quirk to acer-wmi driver.

You mean editing grub and adding kernel option?

--=20
Regards,
Oleksij


--MvLvSWbgm3dWiim9rxBO2RTi6upV2bxhl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iF4EAREIAAYFAlLOWdIACgkQHwImuRkmbWk3QgD/VRX/E3Jis8F9Dz4O9iyhhpUz
La+qFv9xp2MgeGNW8ZoA/iiCbQR8QBPigeuzz295b6OO1g5tsXxLIbk6kptMFyHk
=rg9J
-----END PGP SIGNATURE-----

--MvLvSWbgm3dWiim9rxBO2RTi6upV2bxhl--
