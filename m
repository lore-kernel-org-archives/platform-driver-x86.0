From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 3/5] dell-wmi: enable receiving WMI events on Dell
 Vostro V131
Date: Fri, 19 Feb 2016 17:24:57 -0800
Message-ID: <20160220012457.GC23707@dvhart-mobl5.amr.corp.intel.com>
References: <20160121090401.GR7192@pali>
 <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:36098 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1424612AbcBTBZD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 19 Feb 2016 20:25:03 -0500
Content-Disposition: inline
In-Reply-To: <1455634230-1487-4-git-send-email-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Feb 16, 2016 at 03:50:28PM +0100, Micha=C5=82 K=C4=99pie=C5=84 =
wrote:
> On some laptop models (e.g. Dell Vostro V131), WMI events are not
> generated until a specific SMBIOS request is issued to register an ev=
ent
> listener [1].  As there seems to be no ACPI method or SMBIOS request =
to
> determine without possible side effects whether a given machine needs=
 to
> issue this SMBIOS request in order to receive WMI events, DMI matchin=
g
> is used to whitelist the models which need it.
>=20
> [1] https://lists.us.dell.com/pipermail/libsmbios-devel/2015-July/000=
612.html
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/Kconfig    |    1 +
>  drivers/platform/x86/dell-wmi.c |   49 +++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index 3e4d9c3..5ceb53a 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -122,6 +122,7 @@ config DELL_WMI
>  	depends on ACPI_WMI
>  	depends on INPUT
>  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> +	depends on DELL_SMBIOS
>  	select INPUT_SPARSEKMAP
>  	---help---
>  	  Say Y here if you want to support WMI-based hotkeys on Dell lapto=
ps.
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 368e193..ca8233a 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -37,6 +37,7 @@
>  #include <linux/string.h>
>  #include <linux/dmi.h>
>  #include <acpi/video.h>
> +#include "dell-smbios.h"
> =20
>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>  MODULE_AUTHOR("Pali Roh=C3=A1r <pali.rohar@gmail.com>");
> @@ -47,10 +48,29 @@ MODULE_LICENSE("GPL");
>  #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
> =20
>  static u32 dell_wmi_interface_version;
> +static bool wmi_requires_smbios_request;
> =20
>  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
>  MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
> =20
> +static int __init dmi_matched(const struct dmi_system_id *dmi)
> +{
> +	wmi_requires_smbios_request =3D 1;
> +	return 1;
> +}
> +
> +static const struct dmi_system_id dell_wmi_smbios_list[] __initconst=
 =3D {
> +	{
> +		.callback =3D dmi_matched,
> +		.ident =3D "Dell Vostro V131",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
> +		},
> +	},
> +	{ }
> +};
> +
>  /*
>   * Certain keys are flagged as KE_IGNORE. All of these are either
>   * notifications (rather than requests for change) or are also sent
> @@ -513,6 +533,7 @@ static int __init dell_wmi_init(void)
>  {
>  	int err;
>  	acpi_status status;
> +	struct calling_interface_buffer *buffer;

Please place the longest line first, and move int err to the last decla=
ration.
When changing declarations of local variables, please use "Reverse Chri=
stmas
Tree" order (longest line to shortest line) wherever possible.

> =20
>  	if (!wmi_has_guid(DELL_EVENT_GUID) ||
>  	    !wmi_has_guid(DELL_DESCRIPTOR_GUID)) {
> @@ -538,12 +559,40 @@ static int __init dell_wmi_init(void)
>  		return -ENODEV;
>  	}
> =20
> +	dmi_check_system(dell_wmi_smbios_list);
> +
> +	if (wmi_requires_smbios_request) {
> +		buffer =3D dell_smbios_get_buffer();
> +		buffer->input[0] =3D 0x10000;
> +		buffer->input[1] =3D 0x51534554;
> +		buffer->input[3] =3D 0x1;
> +		dell_smbios_send_request(17, 3);
> +		err =3D buffer->output[0];
> +		dell_smbios_release_buffer();
> +		if (err) {
> +			pr_err("Failed to enable WMI (error %d)\n", err);
> +			wmi_remove_notify_handler(DELL_EVENT_GUID);
> +			dell_wmi_input_destroy();
> +			return dell_smbios_error(err);
> +		}
> +	}
> +
>  	return 0;
>  }
>  module_init(dell_wmi_init);
> =20
>  static void __exit dell_wmi_exit(void)
>  {
> +	struct calling_interface_buffer *buffer;
> +
> +	if (wmi_requires_smbios_request) {
> +		buffer =3D dell_smbios_get_buffer();
> +		buffer->input[0] =3D 0x10000;
> +		buffer->input[1] =3D 0x51534554;
> +		dell_smbios_send_request(17, 3);
> +		dell_smbios_release_buffer();
> +	}
> +

Pali's point about documenting the hardcoded values and eliminating the=
 code
duplication with a function (inline) is a good one.

Otherwise, this series looks good to me. Looking forward to merging v4.

--=20
Darren Hart
Intel Open Source Technology Center
