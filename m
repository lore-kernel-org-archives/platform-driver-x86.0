From: "Joey Lee" <jlee@suse.com>
Subject: Re: [PATCH v2] acer-wmi: No wifi rfkill on Lenovo machines
Date: Mon, 06 Feb 2012 03:04:48 -0700
Message-ID: <4F3040700200002300007E4A@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from novprvlin0050.provo.novell.com ([137.65.248.33]:48007 "EHLO
	novprvlin0050.provo.novell.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754435Ab2BFKEy (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:7:1>);
	Mon, 6 Feb 2012 05:04:54 -0500
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ike.pan@canonical.com
Cc: corentincj@iksaif.net, dtor@mail.ru, mjg@redhat.com, carlos@strangeworlds.co.uk, trenn@suse.de, platform-driver-x86@vger.kernel.org

Hi Ike,=20

=E6=96=BC =E4=BA=94=EF=BC=8C2012-02-03 =E6=96=BC 16:46 +0800=EF=BC=8CIk=
e Panhc =E6=8F=90=E5=88=B0=EF=BC=9A
> We have several reports which says acer-wmi is loaded on ideapads
> and register rfkill for wifi which can not be unblocked.
>=20
> Since ideapad-laptop also register rfkill for wifi and it works
> reliably, it will be fine acer-wmi is not going to register rfkill
> for wifi once VPC2004 is found.
>=20
> Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
> wifi rfkill capability, there are reports which says acer-wmi also
> block wireless on Thinkpad E520/E420.
>=20
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>

Thanks for your patch, it's good to me after tested.


Tested on Acer TravelMate 4750.

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++++=
-
>  1 files changed, 29 insertions(+), 1 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index b848277..1e5290b 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
>  	return AE_OK;
>  }
> =20
> +static int AMW0_set_cap_acpi_check_device_found;
> +
> +static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle han=
dle,
> +	u32 level, void *context, void **retval)
> +{
> +	AMW0_set_cap_acpi_check_device_found =3D 1;
> +	return AE_OK;
> +}
> +
> +static const struct acpi_device_id norfkill_ids[] =3D {
> +	{ "VPC2004", 0},
> +	{ "IBM0068", 0},
> +	{ "LEN0068", 0},
> +	{ "", 0},
> +};
> +
> +static int AMW0_set_cap_acpi_check_device(void)
> +{
> +	const struct acpi_device_id *id;
> +
> +	for (id =3D norfkill_ids; id->id[0]; id++)
> +		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
> +				NULL, NULL);
> +	return AMW0_set_cap_acpi_check_device_found;
> +}
> +
>  static acpi_status AMW0_set_capabilities(void)
>  {
>  	struct wmab_args args;
> @@ -692,7 +718,9 @@ static acpi_status AMW0_set_capabilities(void)
>  	 * work.
>  	 */
>  	if (wmi_has_guid(AMW0_GUID2)) {
> -		interface->capability |=3D ACER_CAP_WIRELESS;
> +		if ((quirks !=3D &quirk_unknown) ||
> +		    !AMW0_set_cap_acpi_check_device())
> +			interface->capability |=3D ACER_CAP_WIRELESS;
>  		return AE_OK;
>  	}
> =20
