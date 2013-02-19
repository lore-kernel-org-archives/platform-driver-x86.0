From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: do not use 'devices' uninitialized
Date: Tue, 19 Feb 2013 10:38:14 +0800
Message-ID: <1361241494.6635.2.camel@linux-s257.site>
References: <1359033178.1325.15.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:53104 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757003Ab3BSCjI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 18 Feb 2013 21:39:08 -0500
In-Reply-To: <1359033178.1325.15.camel@x61.thuisdomein>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,=20

Sorry for I am late to reply your patch.

=E6=96=BC =E5=9B=9B=EF=BC=8C2013-01-24 =E6=96=BC 14:12 +0100=EF=BC=8CPa=
ul Bolle =E6=8F=90=E5=88=B0=EF=BC=9A
> Commit f20aaba9819d0801fb1314363f97239da0100bac ("acer-wmi: fix obj i=
s
> NULL but dereferenced") introduced a GCC warning:
>     drivers/platform/x86/acer-wmi.c: In function =E2=80=98acer_wmi_in=
it=E2=80=99:
>     drivers/platform/x86/acer-wmi.c:1216:14: warning: =E2=80=98device=
s=E2=80=99 may be used uninitialized in this function [-Wmaybe-uninitia=
lized]
>     drivers/platform/x86/acer-wmi.c:1193:6: note: =E2=80=98devices=E2=
=80=99 was declared here
>=20
> GCC is correct. In WMID_set_capabilities() there are now clearly code=
paths
> that use 'devices' uninitialized. (WMID_set_capabilities() is apparen=
tly
> inlined in acer_wmi_init().) Previously that couldn't happen. So rewo=
rk
> the code to use the previous logic, but also make sure 'obj' will not=
 be
> dereferenced while NULL.
>=20
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Zhang Rui sent similar patch for fix the warning:
http://www.mail-archive.com/platform-driver-x86@vger.kernel.org/msg0401=
6.html


Still appreciate for your contribution!


Thanks a lot!
Joey Lee

> ---
> Compile tested only!
>=20
>  drivers/platform/x86/acer-wmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index afed701..0ddac19 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1197,14 +1197,12 @@ static acpi_status WMID_set_capabilities(void=
)
>  		return status;
> =20
>  	obj =3D (union acpi_object *) out.pointer;
> -	if (obj) {
> -		if (obj->type =3D=3D ACPI_TYPE_BUFFER &&
> +	if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER &&
>  			(obj->buffer.length =3D=3D sizeof(u32) ||
>  			obj->buffer.length =3D=3D sizeof(u64))) {
>  			devices =3D *((u32 *) obj->buffer.pointer);
> -		} else if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +	} else if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
>  			devices =3D (u32) obj->integer.value;
> -		}
>  	} else {
>  		kfree(out.pointer);
>  		return AE_ERROR;
