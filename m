From: Axel Lin <axel.lin@gmail.com>
Subject: Re: [PATCH v2] acer-wmi: fix memory leaks in wmab_execute error
	path
Date: Tue, 13 Jul 2010 09:03:55 +0800
Message-ID: <1278983035.13580.3.camel@mola>
References: <1278650256.26099.4.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:49067 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab0GMBD3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Jul 2010 21:03:29 -0400
In-Reply-To: <1278650256.26099.4.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, Matthew Garrett <mjg@redhat.com>, Thomas Renninger <trenn@suse.de>, Alan Jenkins <alan-jenkins@tuffmail.co.uk>, platform-driver-x86@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

hi Andrew,
I just found acer-wmi-fix-memory-leaks-in-wmab_execute-error-path.patch=
 added to -mm tree.
But I think the V2 version is the correct one.
If the second wmab_execute fail (for any reason) , we need to free the =
existing buffer before return status.
Sould I resend the patch?


Regards,
Axel

=E6=96=BC =E4=BA=94=EF=BC=8C2010-07-09 =E6=96=BC 12:37 +0800=EF=BC=8CAx=
el Lin =E6=8F=90=E5=88=B0=EF=BC=9A
> When acpi_evaluate_object() is passed ACPI_ALLOCATE_BUFFER,
> the caller must kfree the returned buffer if AE_OK is returned.
>=20
> Call Trace:
> wmab_execute
>   -> wmi_evaluate_method
>     -> acpi_evaluate_object
>=20
> Thus if callers of wmab_execute() pass ACPI_ALLOCATE_BUFFER,
> the return buffer must be kfreed if wmab_execute return AE_OK.
>=20
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   11 ++++++++++-
>  1 files changed, 10 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 1ea6c43..3f44446 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -555,6 +555,7 @@ static acpi_status AMW0_find_mailled(void)
>  	obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>  		ret =3D *((struct wmab_ret *) obj->buffer.pointer);
>  	} else {
> +		kfree(out.pointer);
>  		return AE_ERROR;
>  	}
> =20
> @@ -598,6 +599,7 @@ static acpi_status AMW0_set_capabilities(void)
>  	obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>  		ret =3D *((struct wmab_ret *) obj->buffer.pointer);
>  	} else {
> +		kfree(out.pointer);
>  		return AE_ERROR;
>  	}
> =20
> @@ -607,15 +609,22 @@ static acpi_status AMW0_set_capabilities(void)
>  	args.ebx =3D 2 << 8;
>  	args.ebx |=3D ACER_AMW0_BLUETOOTH_MASK;
> =20
> +	/*
> +	 * It's ok to use existing buffer for next wmab_execute call.
> +	 * But we need to kfree(out.pointer) if next wmab_execute fail.
> +	 */
>  	status =3D wmab_execute(&args, &out);
> -	if (ACPI_FAILURE(status))
> +	if (ACPI_FAILURE(status)) {
> +		kfree(out.pointer);
>  		return status;
> +	}
> =20
>  	obj =3D (union acpi_object *) out.pointer;
>  	if (obj && obj->type =3D=3D ACPI_TYPE_BUFFER
>  	&& obj->buffer.length =3D=3D sizeof(struct wmab_ret)) {
>  		ret =3D *((struct wmab_ret *) obj->buffer.pointer);
>  	} else {
> +		kfree(out.pointer);
>  		return AE_ERROR;
>  	}
> =20
