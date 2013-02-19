From: joeyli <jlee@suse.com>
Subject: re: acer-wmi: fix obj is NULL but dereferenced
Date: Tue, 19 Feb 2013 12:35:17 +0800
Message-ID: <1361248517.6635.8.camel@linux-s257.site>
References: <20130107113210.GA29782@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:60938 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755688Ab3BSEgL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Feb 2013 23:36:11 -0500
In-Reply-To: <20130107113210.GA29782@elgon.mountain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Dan,=20

Sorry for I am late to reply you!

=E6=96=BC =E4=B8=80=EF=BC=8C2013-01-07 =E6=96=BC 14:32 +0300=EF=BC=8CDa=
n Carpenter =E6=8F=90=E5=88=B0=EF=BC=9A
> Hello Lee, Chun-Yi,
>=20
> The patch 727651bf738b: "acer-wmi: fix obj is NULL but dereferenced"=20
> from Dec 14, 2012, leads to the following warning:
> drivers/platform/x86/acer-wmi.c:1227 WMID_set_capabilities()
> 	 warn: calling kfree() when 'out.pointer' is always NULL.
>=20
>   1217          obj =3D (union acpi_object *) out.pointer;
>   1218          if (obj) {
>   1219                  if (obj->type =3D=3D ACPI_TYPE_BUFFER &&
>   1220                          (obj->buffer.length =3D=3D sizeof(u32=
) ||
>   1221                          obj->buffer.length =3D=3D sizeof(u64)=
)) {
>   1222                          devices =3D *((u32 *) obj->buffer.poi=
nter);
>   1223                  } else if (obj->type =3D=3D ACPI_TYPE_INTEGER=
) {
>   1224                          devices =3D (u32) obj->integer.value;
>   1225                  }
>   1226          } else {
>   1227                  kfree(out.pointer);
>   1228                  return AE_ERROR;
>   1229          }
>=20
> I was going to remove the kfree() but looking the patch which introdu=
ced
> it causes GCC warnings and so there is some other stuff which needs t=
o
> be fixed as well.
>=20
> regards,
> dan carpenter
>=20
>=20

The warning will be fixed by Zhang Rui or Paul Bolle's patch:

http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg0401=
6.html
http://lkml.org/lkml/2013/1/24/215

With the above patch, kfree() will called when:
 + obj is not NULL but the type is not BUFFER or INTEGER
or
 + obj is NULL. The kfree() check obj is NULL then direct return.

Still appreciate for your review and suggestion!


Thanks a lot!
Joey Lee
