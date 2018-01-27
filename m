From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v6] Support intel-vbtn based tablet mode switch
Date: Sat, 27 Jan 2018 11:20:59 +0100
Message-ID: <20180127102059.yzu32lk7xnvdukcx@pali>
References: <1517048138-2335-1-git-send-email-notmart@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="e2hboe5rdqyhwwcx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1517048138-2335-1-git-send-email-notmart@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Martin <notmart@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, mario_limonciello@dell.com, andy@infradead.org, dvhart@infradead.org, mjg59@srcf.ucam.org, linux-kernel@vger.kernel.org, bhush94@gmail.com
List-Id: platform-driver-x86.vger.kernel.org


--e2hboe5rdqyhwwcx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Saturday 27 January 2018 11:15:38 Marco Martin wrote:
> Some laptops such as Dell Inspiron 7000 series have the
> tablet mode switch implemented in Intel ACPI,
> the events to enter and exit the tablet mode are 0xCC and 0xCD
>=20
> CC: platform-driver-x86@vger.kernel.org
> CC: Matthew Garrett <mjg59@srcf.ucam.org>
> CC: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Mario Limonciello <mario_limonciello@dell.com>
> CC: Andy Shevchenko <andy@infradead.org>
>=20
> Signed-off-by: Marco Martin <notmart@gmail.com>
>=20
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/int=
el-vbtn.c
> index 58c5ff3..0979811 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -26,6 +26,9 @@
>  #include <linux/suspend.h>
>  #include <acpi/acpi_bus.h>
> =20
> +/* When NOT in tablet mode, VGBS returns with the flag 0x40 */
> +#define TABLET_MODE_FLAG 0x40
> +
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("AceLan Kao");
> =20
> @@ -42,6 +45,8 @@ static const struct key_entry intel_vbtn_keymap[] =3D {
>  	{ KE_IGNORE, 0xC5, { KEY_VOLUMEUP } },		/* volume-up key release */
>  	{ KE_KEY, 0xC6, { KEY_VOLUMEDOWN } },		/* volume-down key press */
>  	{ KE_IGNORE, 0xC7, { KEY_VOLUMEDOWN } },	/* volume-down key release */
> +	{ KE_SW,  0xCC, { .sw =3D { SW_TABLET_MODE, 1 } } }, /* Tablet mode in =
*/
> +	{ KE_SW,  0xCD, { .sw =3D { SW_TABLET_MODE, 0 } } }, /* Tablet mode out=
 */
>  	{ KE_END },
>  };
> =20
> @@ -88,6 +93,7 @@ static void notify_handler(acpi_handle handle, u32 even=
t, void *context)
> =20
>  static int intel_vbtn_probe(struct platform_device *device)
>  {
> +	struct acpi_buffer vgbs_output =3D { ACPI_ALLOCATE_BUFFER, NULL };
>  	acpi_handle handle =3D ACPI_HANDLE(&device->dev);
>  	struct intel_vbtn_priv *priv;
>  	acpi_status status;
> @@ -110,6 +116,22 @@ static int intel_vbtn_probe(struct platform_device *=
device)
>  		return err;
>  	}
> =20
> +	status =3D acpi_evaluate_object(handle, "VGBS", NULL, &vgbs_output);
> +	/* VGBS being present and returning something means
> +	 * we have a tablet mode switch
> +	 */
> +	if (ACPI_SUCCESS(status)) {
> +		union acpi_object *obj =3D vgbs_output.pointer;
> +
> +		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +			input_report_switch(priv->input_dev,
> +								SW_TABLET_MODE,
> +								!(obj->integer.value & TABLET_MODE_FLAG));
> +		}
> +	}
> +
> +	kfree(vgbs_output.pointer);
> +
>  	status =3D acpi_install_notify_handler(handle,
>  					     ACPI_DEVICE_NOTIFY,
>  					     notify_handler,

Now looks good, you can add my:

Acked-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--e2hboe5rdqyhwwcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWmxShgAKCRCL8Mk9A+RD
Us4IAJ9NpmbPfWHaDg8lbVh1pVuj8r7r5gCgxfKDrt/JfCK4RXprWxARZQpG0Yo=
=DDzc
-----END PGP SIGNATURE-----

--e2hboe5rdqyhwwcx--
