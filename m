From: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH] pvpanic: handle missing _STA correctly
Date: Mon, 1 Jun 2015 09:33:22 +0200
Message-ID: <20150601093322.4ec8de60@nial.brq.redhat.com>
References: <1432930732-16568-1-git-send-email-rkrcmar@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:33037 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751003AbbFAHdZ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 1 Jun 2015 03:33:25 -0400
In-Reply-To: <1432930732-16568-1-git-send-email-rkrcmar@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Radim =?UTF-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Fri, 29 May 2015 22:18:52 +0200
Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com> wrote:

> pvpanic was not properly detected when _STA was missing.
>=20
> ACPI 6.0 April 2015, 6.3.7 _STA (Status)
>   If a device object (including the processor object) does not have a=
n
>   _STA object, then OSPM assumes that all of the above bits are set
>   (i.e., the device is present, enabled, shown in the UI, and
>   functioning).
>=20
> Not adhering to the specification made pvpanic dormant under QEMU 2.3=
=2E
>=20
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  drivers/platform/x86/pvpanic.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pv=
panic.c
> index 073a90a63dbc..7b6860333267 100644
> --- a/drivers/platform/x86/pvpanic.c
> +++ b/drivers/platform/x86/pvpanic.c
> @@ -95,8 +95,7 @@ static int pvpanic_add(struct acpi_device *device)
>  	acpi_status status;
>  	u64 ret;
> =20
> -	status =3D acpi_evaluate_integer(device->handle, "_STA", NULL,
> -				       &ret);
> +	status =3D acpi_bus_get_status_handle(device->handle, &ret);
> =20
>  	if (ACPI_FAILURE(status) || (ret & 0x0B) !=3D 0x0B)
>  		return -ENODEV;
