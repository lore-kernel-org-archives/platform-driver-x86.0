From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE
 on the 9 / "Laptop" chasis-type
Date: Fri, 15 May 2020 19:19:18 +0000
Message-ID: <2de269e40ca34597815ba7af05693e6a@AUSX13MPC105.AMER.DELL.COM>
References: <20200515183916.82919-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200515183916.82919-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: hdegoede@redhat.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Friday, May 15, 2020 1:39 PM
> To: Darren Hart; Andy Shevchenko
> Cc: Hans de Goede; Limonciello, Mario; platform-driver-x86@vger.kernel.or=
g;
> linux-kernel@vger.kernel.org
> Subject: [PATCH] platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE =
on the
> 9 / "Laptop" chasis-type
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> The HP Stream x360 11-p000nd no longer report SW_TABLET_MODE state / even=
ts
> with recent kernels. This model reports a chassis-type of 10 / "Notebook"
> which is not on the recently introduced chassis-type whitelist
>=20
> Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
> switch on 2-in-1's") added a chassis-type whitelist and only listed 31 /
> "Convertible" as being capable of generating valid SW_TABLET_MOD events.
>=20
> Commit 1fac39fd0316 ("platform/x86: intel-vbtn: Also handle tablet-mode
> switch on "Detachable" and "Portable" chassis-types") extended the
> whitelist with chassis-types 8 / "Portable" and 32 / "Detachable".
>=20
> And now we need to exten the whitelist again with 10 / "Notebook"...
>=20
> The issue original fixed by the whitelist is really a ACPI DSDT bug on
> the Dell XPS 9360 where it has a VGBS which reports it is in tablet mode
> even though it is not a 2-in-1 at all, but a regular laptop.
>=20
> So since this is a workaround for a DSDT issue on that specific model,
> instead of extending the whitelist over and over again, lets switch to
> a blacklist and only blacklist the chassis-type of the model for which
> the chassis-type check was added.
>=20
> Note this also fixes the current version of the code no longer checking
> if dmi_get_system_info(DMI_CHASSIS_TYPE) returns NULL.

Makes sense, thanks.

Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>

>=20
> Fixes: 1fac39fd0316 ("platform/x86: intel-vbtn: Also handle tablet-mode s=
witch
> on "Detachable" and "Portable" chassis-types")
> Cc: Mario Limonciello <mario.limonciello@dell.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note I can even see there being 2-in-1s using intel-vbtn to report
> SW_TABLET_MODE with a chassis-type of 9. So maybe we should make the
> quirk / blacklist stricter by combining it with a
> dmi_name_in_vendors("Dell") check ?
> ---
>  drivers/platform/x86/intel-vbtn.c | 19 ++++++++-----------
>  1 file changed, 8 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-
> vbtn.c
> index ef92c1c3adbd..0487b606a274 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -170,21 +170,18 @@ static bool intel_vbtn_has_buttons(acpi_handle hand=
le)
>  static bool intel_vbtn_has_switches(acpi_handle handle)
>  {
>  	const char *chassis_type =3D dmi_get_system_info(DMI_CHASSIS_TYPE);
> -	unsigned long chassis_type_int;
>  	unsigned long long vgbs;
>  	acpi_status status;
>=20
> -	if (kstrtoul(chassis_type, 10, &chassis_type_int))
> -		return false;
> -
> -	switch (chassis_type_int) {
> -	case  8: /* Portable */
> -	case 31: /* Convertible */
> -	case 32: /* Detachable */
> -		break;
> -	default:
> +	/*
> +	 * Some normal laptops have a VGBS method despite being non-convertible
> +	 * and their VGBS method always returns 0, causing detect_tablet_mode()
> +	 * to report SW_TABLET_MODE=3D1 to userspace, which causes issues.
> +	 * These laptops have a DMI chassis_type of 9 ("Laptop"), do not report
> +	 * switches on any devices with a DMI chassis_type of 9.
> +	 */
> +	if (chassis_type && strcmp(chassis_type, "9") =3D=3D 0)
>  		return false;
> -	}
>=20
>  	status =3D acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
>  	return ACPI_SUCCESS(status);
> --
> 2.26.0
