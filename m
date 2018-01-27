From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v12 10/16] platform/x86: dell-smbios: Introduce
 dispatcher for SMM calls
Date: Sat, 27 Jan 2018 15:48:23 +0100
Message-ID: <20180127144823.innndhmtaus3k7op@pali>
References: <cover.1509561822.git.mario.limonciello@dell.com>
 <19848e4dec380f91efd1536bbfad092050d232d2.1509561822.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vx4leyovcl24qgzk"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38324 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751353AbeA0Os0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Jan 2018 09:48:26 -0500
Content-Disposition: inline
In-Reply-To: <19848e4dec380f91efd1536bbfad092050d232d2.1509561822.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>


--vx4leyovcl24qgzk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Wednesday 01 November 2017 14:25:31 Mario Limonciello wrote:
> This splits up the dell-smbios driver into two drivers:
> * dell-smbios
> * dell-smbios-smm
>=20
> dell-smbios can operate with multiple different dispatcher drivers to
> perform SMBIOS operations.
>=20
> Also modify the interface that dell-laptop and dell-wmi use align to this
> model more closely.  Rather than a single global buffer being allocated
> for all drivers, each driver will allocate and be responsible for it's own
> buffer. The pointer will be passed to the calling function and each
> dispatcher driver will then internally copy it to the proper location to
> perform it's call.
>=20
> Add defines for calls used by these methods in the dell-smbios.h header
> for tracking purposes.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> ---
=2E..
> @@ -85,6 +73,7 @@ static struct platform_driver platform_driver =3D {
>  	}
>  };
> =20
> +static struct calling_interface_buffer *buffer;
>  static struct platform_device *platform_device;
>  static struct backlight_device *dell_backlight_device;
>  static struct rfkill *wifi_rfkill;
> @@ -283,6 +272,27 @@ static const struct dmi_system_id dell_quirks[] __in=
itconst =3D {
>  	{ }
>  };
> =20
> +void dell_set_arguments(u32 arg0, u32 arg1, u32 arg2, u32 arg3)
> +{
> +	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	buffer->input[0] =3D arg0;
> +	buffer->input[1] =3D arg1;
> +	buffer->input[2] =3D arg2;
> +	buffer->input[3] =3D arg3;
> +}
> +
> +int dell_send_request(u16 class, u16 select)
> +{
> +	int ret;
> +
> +	buffer->cmd_class =3D class;
> +	buffer->cmd_select =3D select;
> +	ret =3D dell_smbios_call(buffer);
> +	if (ret !=3D 0)
> +		return ret;
> +	return dell_smbios_error(buffer->output[0]);
> +}
> +
>  /*
>   * Derived from information in smbios-wireless-ctl:
>   *
=2E..
> @@ -413,20 +422,16 @@ static int dell_rfkill_set(void *data, bool blocked)
>  	int status;
>  	int ret;
> =20
> -	buffer =3D dell_smbios_get_buffer();
> -
> -	dell_smbios_send_request(17, 11);
> -	ret =3D buffer->output[0];
> +	dell_set_arguments(0, 0, 0, 0);
> +	ret =3D dell_send_request(CLASS_INFO, SELECT_RFKILL);
> +	if (ret)
> +		return ret;
>  	status =3D buffer->output[1];

Now I'm looking at this patch again and I think it introduced a new race
condition.

Prior this patch, dell_smbios_get_buffer() acquired mutex and returned
pointer to buffer which caller used and then released.

Now buffer is allocated at module load time and is shared for all
functions in this module. And hen is used, there is no mutex protection
for it.

First call is to dell_set_arguments() which modifies that shared buffer
and then dell_send_request() is used to modify and pass buffer to
another function dell_smbios_call().

And function below dell_update_rfkill() is called work queue which also
modifies buffer by dell_set_arguments() function.

Therefore it looks like when dell_update_rfkill() is scheduled at the
same time as dell_rfkill_set() is executed, then both functions
overwrite one shared buffer and something unexpected would be sent to
SMM.

> @@ -613,46 +596,36 @@ static const struct file_operations dell_debugfs_fo=
ps =3D {
> =20
>  static void dell_update_rfkill(struct work_struct *ignored)
>  {
> -	struct calling_interface_buffer *buffer;
>  	int hwswitch =3D 0;
>  	int status;
>  	int ret;
> =20
> -	buffer =3D dell_smbios_get_buffer();
> -
> -	dell_smbios_send_request(17, 11);
> -	ret =3D buffer->output[0];
> +	dell_set_arguments(0, 0, 0, 0);
> +	ret =3D dell_send_request(CLASS_INFO, SELECT_RFKILL);
>  	status =3D buffer->output[1];

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--vx4leyovcl24qgzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWmyRNAAKCRCL8Mk9A+RD
UrSeAKDGwNWrSSKCTakN2QxCtTpSJDv42gCeOH+RZGItnIiWfCWoD1VTIhvDiyY=
=kteA
-----END PGP SIGNATURE-----

--vx4leyovcl24qgzk--
