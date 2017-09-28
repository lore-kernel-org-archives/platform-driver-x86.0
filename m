From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/8] platform/x86: dell-smbios: Introduce a WMI-ACPI interface
Date: Thu, 28 Sep 2017 08:53:50 +0200
Message-ID: <201709280853.51019@pali>
References: <cover.1506571187.git.mario.limonciello@dell.com> <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1760665.q7sSV6L6B2";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:50773 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750794AbdI1Gxy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Sep 2017 02:53:54 -0400
In-Reply-To: <7b632baafbfdc6c55c4d56225c54fd441b747286.1506571188.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com

--nextPart1760665.q7sSV6L6B2
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thursday 28 September 2017 06:02:14 Mario Limonciello wrote:
> The driver currently uses an SMI interface which grants direct access
> to physical memory to the firmware SMM methods via a pointer.
>=20
> Now add a WMI-ACPI interface that is detected by WMI probe and preferred
> over the SMI interface.
>=20
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when SMM calls are performed.
>=20
> This is a safer approach to use in kernel drivers as the SMM will
> only have access to that OperationRegion.
>=20
> As a result, this change removes the dependency on this driver on the
> dcdbas kernel module.  It's now an optional compilation option.
>=20
> When modifying this, add myself to MAINTAINERS.
>=20
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  MAINTAINERS                        |   6 ++
>  drivers/platform/x86/Kconfig       |  14 ++--
>  drivers/platform/x86/dell-smbios.c | 128 +++++++++++++++++++++++++++++++=
+-----
>  drivers/platform/x86/dell-smbios.h |  15 ++++-
>  4 files changed, 138 insertions(+), 25 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 08b96f77f618..6d76b09f46cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3990,6 +3990,12 @@ S:	Maintained
>  F:	drivers/hwmon/dell-smm-hwmon.c
>  F:	include/uapi/linux/i8k.h
> =20
> +DELL SMBIOS DRIVER
> +M:	Pali Roh=C3=A1r <pali.rohar@gmail.com>
> +M:	Mario Limonciello <mario.limonciello@dell.com>
> +S:	Maintained
> +F:	drivers/platform/x86/dell-smbios.*
> +
>  DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
>  M:	Doug Warzecha <Douglas_Warzecha@dell.com>
>  S:	Maintained
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1f7959ff055c..415886d7a857 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -92,13 +92,17 @@ config ASUS_LAPTOP
>  	  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> =20
>  config DELL_SMBIOS
> -	tristate
> -	select DCDBAS
> +	tristate "Dell SMBIOS calling interface"
> +	depends on ACPI_WMI
>  	---help---
> -	This module provides common functions for kernel modules using
> -	Dell SMBIOS.
> +	This module provides common functions for kernel modules and
> +        userspace using Dell SMBIOS.
> +
> +	If you have a Dell computer, say Y or M here.
> =20
> -	If you have a Dell laptop, say Y or M here.
> +	If you have a machine from < 2007 without a WMI interface you
> +	may also want to enable CONFIG_DCDBAS to allow this driver to
> +	work.
> =20
>  config DELL_LAPTOP
>  	tristate "Dell Laptop Extras"
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/de=
ll-smbios.c
> index e9b1ca07c872..4472817ee045 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -4,6 +4,7 @@
>   *  Copyright (c) Red Hat <mjg@redhat.com>
>   *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
>   *  Copyright (c) 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
> + *  Copyright (c) 2017 Dell Inc.
>   *
>   *  Based on documentation in the libsmbios package:
>   *  Copyright (C) 2005-2014 Dell Inc.
> @@ -22,9 +23,15 @@
>  #include <linux/mutex.h>
>  #include <linux/slab.h>
>  #include <linux/io.h>
> -#include "../../firmware/dcdbas.h"
> +#include <linux/wmi.h>
>  #include "dell-smbios.h"
> =20
> +#ifdef CONFIG_DCDBAS
> +#include "../../firmware/dcdbas.h"
> +#endif
> +
> +#define DELL_WMI_SMBIOS_GUID "A80593CE-A997-11DA-B012-B622A1EF5492"
> +
>  struct calling_interface_structure {
>  	struct dmi_header header;
>  	u16 cmdIOAddress;
> @@ -33,12 +40,14 @@ struct calling_interface_structure {
>  	struct calling_interface_token tokens[];
>  } __packed;
> =20
> -static struct calling_interface_buffer *buffer;
> +static void *buffer;
> +static size_t bufferlen;
>  static DEFINE_MUTEX(buffer_mutex);
> =20
>  static int da_command_address;
>  static int da_command_code;
>  static int da_num_tokens;
> +struct wmi_device *wmi_dev;
>  static struct calling_interface_token *da_tokens;
> =20
>  int dell_smbios_error(int value)
> @@ -60,13 +69,15 @@ struct calling_interface_buffer *dell_smbios_get_buff=
er(void)
>  {
>  	mutex_lock(&buffer_mutex);
>  	dell_smbios_clear_buffer();
> +	if (wmi_dev)
> +		return &((struct wmi_calling_interface_buffer *) buffer)->smi;
>  	return buffer;
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_get_buffer);
> =20
>  void dell_smbios_clear_buffer(void)
>  {
> -	memset(buffer, 0, sizeof(struct calling_interface_buffer));
> +	memset(buffer, 0, bufferlen);
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_clear_buffer);
> =20
> @@ -76,7 +87,36 @@ void dell_smbios_release_buffer(void)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_release_buffer);
> =20
> -void dell_smbios_send_request(int class, int select)
> +static int run_wmi_smbios_call(struct wmi_calling_interface_buffer *buf)
> +{
> +	struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	acpi_status status;
> +
> +	input.length =3D sizeof(struct wmi_calling_interface_buffer);
> +	input.pointer =3D buf;
> +
> +	status =3D wmidev_evaluate_method(wmi_dev, 0, 1, &input, &output);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("%x/%x [%x,%x,%x,%x] call failed\n",
> +			buf->smi.class, buf->smi.select,
> +			buf->smi.input[0], buf->smi.input[1],
> +			buf->smi.input[2], buf->smi.input[3]);
> +			return -EIO;
> +	}
> +	obj =3D (union acpi_object *)output.pointer;
> +	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> +		pr_err("invalid type : %d\n", obj->type);
> +		return -EIO;
> +	}
> +	memcpy(buf, obj->buffer.pointer, input.length);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DCDBAS
> +static void run_smi_smbios_call(struct calling_interface_buffer *buf)
>  {
>  	struct smi_cmd command;
> =20
> @@ -85,12 +125,28 @@ void dell_smbios_send_request(int class, int select)
>  	command.command_code =3D da_command_code;
>  	command.ebx =3D virt_to_phys(buffer);
>  	command.ecx =3D 0x42534931;
> -
> -	buffer->class =3D class;
> -	buffer->select =3D select;
> -
>  	dcdbas_smi_request(&command);
>  }
> +#else
> +static void run_smi_smbios_call(struct calling_interface_buffer *buf) {}
> +#endif /* CONFIG_DCDBAS */
> +
> +void dell_smbios_send_request(int class, int select)
> +{
> +	if (wmi_dev) {
> +		struct wmi_calling_interface_buffer *buf =3D buffer;
> +
> +		buf->smi.class =3D class;
> +		buf->smi.select =3D select;
> +		run_wmi_smbios_call(buf);
> +	} else {
> +		struct calling_interface_buffer *buf =3D buffer;
> +
> +		buf->class =3D class;
> +		buf->select =3D select;
> +		run_smi_smbios_call(buf);
> +	}
> +}
>  EXPORT_SYMBOL_GPL(dell_smbios_send_request);
> =20
>  struct calling_interface_token *dell_smbios_find_token(int tokenid)
> @@ -170,10 +226,43 @@ static void __init find_tokens(const struct dmi_hea=
der *dm, void *dummy)
>  	}
>  }
> =20
> -static int __init dell_smbios_init(void)
> +static int dell_smbios_wmi_probe(struct wmi_device *wdev)
> +{
> +	/* no longer need the SMI page */
> +	free_page((unsigned long)buffer);
> +
> +	/* WMI buffer should be 32k */
> +	buffer =3D (void *)__get_free_pages(GFP_KERNEL, 3);
> +	if (!buffer)
> +		return -ENOMEM;
> +	bufferlen =3D sizeof(struct wmi_calling_interface_buffer);
> +	wmi_dev =3D wdev;
> +	return 0;
> +}
> +
> +static int dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
> -	int ret;
> +	wmi_dev =3D NULL;
> +	free_pages((unsigned long)buffer, 3);
> +	return 0;
> +}

This code does not seem to be safe. dell_smbios_wmi_probe and
dell_smbios_wmi_remove are called at any time when kernel register new
device which matches some properties OR when user manually bind this
driver to that device.

buffer and wmi_dev is shared as a global variable which means that when
there are two devices which want to bind to this driver, kernel would
get double free at removing time.

Devices from the bus subsystem should not use global shared variables,
but rather allocate own memory...

Also note that user can at any time unbound device from driver and also
can bind it again.

> +static const struct wmi_device_id dell_smbios_wmi_id_table[] =3D {
> +	{ .guid_string =3D DELL_WMI_SMBIOS_GUID },
> +	{ },
> +};
> +
> +static struct wmi_driver dell_wmi_smbios_driver =3D {
> +	.driver =3D {
> +		.name =3D "dell-smbios",
> +	},
> +	.probe =3D dell_smbios_wmi_probe,
> +	.remove =3D dell_smbios_wmi_remove,
> +	.id_table =3D dell_smbios_wmi_id_table,
> +};
> +
> +static int __init dell_smbios_init(void)
> +{
>  	dmi_walk(find_tokens, NULL);
> =20
>  	if (!da_tokens)  {
> @@ -181,34 +270,39 @@ static int __init dell_smbios_init(void)
>  		return -ENODEV;
>  	}
> =20
> +#ifdef CONFIG_DCDBAS
>  	/*
>  	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
>  	 * is passed to SMI handler.
>  	 */
>  	buffer =3D (void *)__get_free_page(GFP_KERNEL | GFP_DMA32);
> +	bufferlen =3D sizeof(struct calling_interface_buffer);
> +#else
> +	buffer =3D NULL;
> +#endif /* CONFIG_DCDBAS */
> +	wmi_driver_register(&dell_wmi_smbios_driver);
> +
>  	if (!buffer) {
> -		ret =3D -ENOMEM;
> -		goto fail_buffer;
> +		kfree(da_tokens);
> +		return -ENOMEM;
>  	}
> -
>  	return 0;
> -
> -fail_buffer:
> -	kfree(da_tokens);
> -	return ret;
>  }
> =20
>  static void __exit dell_smbios_exit(void)
>  {
>  	kfree(da_tokens);
>  	free_page((unsigned long)buffer);
> +	wmi_driver_unregister(&dell_wmi_smbios_driver);
>  }
> =20
>  subsys_initcall(dell_smbios_init);
>  module_exit(dell_smbios_exit);
> =20
> +
>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>  MODULE_AUTHOR("Gabriele Mazzotta <gabriele.mzt@gmail.com>");
>  MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
> +MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
>  MODULE_DESCRIPTION("Common functions for kernel modules using Dell SMBIO=
S");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x86/de=
ll-smbios.h
> index 45cbc2292cd3..2f6fce81ee69 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -4,6 +4,7 @@
>   *  Copyright (c) Red Hat <mjg@redhat.com>
>   *  Copyright (c) 2014 Gabriele Mazzotta <gabriele.mzt@gmail.com>
>   *  Copyright (c) 2014 Pali Roh=C3=A1r <pali.rohar@gmail.com>
> + *  Copyright (c) 2017 Dell Inc.
>   *
>   *  Based on documentation in the libsmbios package:
>   *  Copyright (C) 2005-2014 Dell Inc.
> @@ -18,9 +19,10 @@
> =20
>  struct notifier_block;
> =20
> -/* This structure will be modified by the firmware when we enter
> - * system management mode, hence the volatiles */
> -
> +/* If called through fallback SMI rather than WMI this structure will be
> + * modified by the firmware when we enter system management mode, hence =
the
> + * volatiles
> + */
>  struct calling_interface_buffer {
>  	u16 class;
>  	u16 select;
> @@ -28,6 +30,13 @@ struct calling_interface_buffer {
>  	volatile u32 output[4];
>  } __packed;
> =20
> +struct wmi_calling_interface_buffer {
> +	struct calling_interface_buffer smi;
> +	u32 argattrib;
> +	u32 blength;
> +	u8 data[32724];
> +} __packed;
> +
>  struct calling_interface_token {
>  	u16 tokenID;
>  	u16 location;
>=20

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart1760665.q7sSV6L6B2
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlnMnH8ACgkQi/DJPQPkQ1IFgwCgo49s8wo741Lhdd19P0tmXFRO
nSAAn0OYwNSrSatzfRZJNGjMt5rHfsgf
=T8pH
-----END PGP SIGNATURE-----

--nextPart1760665.q7sSV6L6B2--
