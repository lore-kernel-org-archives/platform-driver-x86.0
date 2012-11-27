From: joeyli <jlee@suse.com>
Subject: Re: [PATCH 6/6] Add MSI Wind WMI support
Date: Tue, 27 Nov 2012 16:14:24 +0800
Message-ID: <1354004064.21227.867.camel@linux-s257.site>
References: <1353796141-1470-1-git-send-email-maxtram95@gmail.com>
	 <1353796141-1470-7-git-send-email-maxtram95@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:49097 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753099Ab2K0IPW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 03:15:22 -0500
In-Reply-To: <1353796141-1470-7-git-send-email-maxtram95@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, jlee@novell.com, mjg@redhat.com

Hi Maxim,=20

=E6=96=BC =E6=97=A5=EF=BC=8C2012-11-25 =E6=96=BC 00:29 +0200=EF=BC=8CMa=
xim Mikityanskiy =E6=8F=90=E5=88=B0=EF=BC=9A
> Create a driver to support WMI found on MSI Wind laptops. This driver
> allows us to receive some additional keycodes for keys that are not
> handled without this driver.
>=20
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

I simply review this patch and looks there have many code the same with
msi-wmi.c. Does there have any reason didn't direct patch msi-wmi but
need generate a new driver?


Thanks a lot!
Joey Lee

> ---
>  drivers/platform/x86/Kconfig        |  13 +++
>  drivers/platform/x86/Makefile       |   1 +
>  drivers/platform/x86/msi-wind-wmi.c | 169 ++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 183 insertions(+)
>  create mode 100644 drivers/platform/x86/msi-wind-wmi.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kcon=
fig
> index c86bae8..46f269e5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -561,6 +561,19 @@ config MSI_WMI
>  	 To compile this driver as a module, choose M here: the module will
>  	 be called msi-wmi.
> =20
> +config MSI_WIND_WMI
> +	tristate "MSI Wind WMI Driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	---help---
> +	 Say Y here if you want to support WMI-based hotkeys on MSI Wind
> +	 laptops. MSI Wind WMI differs from WMI found on other MSI laptops,=
 so
> +	 say Y here if you have MSI Wind, otherwise select "MSI WMI extras"=
=2E
> +
> +	 To compile this driver as a module, choose M here: the module will
> +	 be called msi-wind-wmi.
> +
>  config TOPSTAR_LAPTOP
>  	tristate "Topstar Laptop Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Mak=
efile
> index bf7e4f9..44389c0 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -30,6 +30,7 @@ obj-$(CONFIG_INTEL_MENLOW)	+=3D intel_menlow.o
>  obj-$(CONFIG_ACPI_WMI)		+=3D wmi.o
>  obj-$(CONFIG_MSI_WMI)		+=3D msi-wmi.o
>  obj-$(CONFIG_TOPSTAR_LAPTOP)	+=3D topstar-laptop.o
> +obj-$(CONFIG_MSI_WIND_WMI)	+=3D msi-wind-wmi.o
> =20
>  # toshiba_acpi must link after wmi to ensure that wmi devices are fo=
und
>  # before toshiba_acpi initializes
> diff --git a/drivers/platform/x86/msi-wind-wmi.c b/drivers/platform/x=
86/msi-wind-wmi.c
> new file mode 100644
> index 0000000..4f19434
> --- /dev/null
> +++ b/drivers/platform/x86/msi-wind-wmi.c
> @@ -0,0 +1,169 @@
> +/*
> + * MSI Wind WMI hotkeys
> + *
> + * Copyright (C) 2012 Maxim Mikityanskiy <maxtram95@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or mo=
dify
> + *  it under the terms of the GNU General Public License as publishe=
d by
> + *  the Free Software Foundation; either version 2 of the License, o=
r
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public Licens=
e
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-=
1307  USA
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/acpi.h>
> +
> +MODULE_AUTHOR("Maxim Mikityanskiy <maxtram95@gmail.com>");
> +MODULE_DESCRIPTION("MSI Wind laptop WMI hotkeys driver");
> +MODULE_LICENSE("GPL");
> +
> +#define WMI_EVENT_GUID "5B3CC38A-40D9-7245-8AE6-1145B751BE3F"
> +
> +MODULE_ALIAS("wmi:" WMI_EVENT_GUID);
> +
> +/* Fn+F3 touchpad toggle */
> +#define WIND_KEY_TOUCHPAD	0x08
> +/* Fn+F11 Bluetooth toggle */
> +#define WIND_KEY_BLUETOOTH	0x56
> +/* Fn+F6 webcam toggle */
> +#define WIND_KEY_CAMERA		0x57
> +/* Fn+F11 Wi-Fi toggle */
> +#define WIND_KEY_WLAN		0x5f
> +/* Fn+F10 turbo mode toggle */
> +#define WIND_KEY_TURBO		0x60
> +/* Fn+F10 ECO mode toggle */
> +#define WIND_KEY_ECO		0x69
> +
> +static struct key_entry wind_keymap[] =3D {
> +	/* These keys work without WMI. Ignore them to avoid double keycode=
s */
> +	{ KE_IGNORE, WIND_KEY_TOUCHPAD,		{ KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_IGNORE, WIND_KEY_BLUETOOTH,	{ KEY_BLUETOOTH } },
> +	{ KE_IGNORE, WIND_KEY_CAMERA,		{ KEY_CAMERA } },
> +	{ KE_IGNORE, WIND_KEY_WLAN,		{ KEY_WLAN } },
> +	/* These are keys that should be handled via WMI */
> +	{ KE_KEY,    WIND_KEY_TURBO,		{ KEY_PROG1 } },
> +	{ KE_KEY,    WIND_KEY_ECO,		{ KEY_PROG2 } },
> +	{ KE_END, 0 }
> +};
> +
> +static struct input_dev *wind_input_dev;
> +
> +static void wind_wmi_notify(u32 value, void *context)
> +{
> +	struct acpi_buffer response =3D {
> +		.length		=3D ACPI_ALLOCATE_BUFFER,
> +		.pointer	=3D NULL
> +	};
> +	acpi_status status =3D wmi_get_event_data(value, &response);
> +	union acpi_object *obj =3D response.pointer;
> +	int code;
> +
> +	if (status !=3D AE_OK) {
> +		pr_warn("Bad event status %#x\n", status);
> +		return;
> +	}
> +
> +	if (!obj || obj->type !=3D ACPI_TYPE_INTEGER) {
> +		pr_warn("Unknown event received\n");
> +		goto wind_wmi_notify_free;
> +	}
> +
> +	code =3D obj->integer.value;
> +	pr_debug("Event code: %#x\n", code);
> +
> +	if (code =3D=3D 0x00 || code =3D=3D 0x62 || code =3D=3D 0x63) {
> +		/* Unknown events - drop them for now */
> +		goto wind_wmi_notify_free;
> +	}
> +
> +	if (!sparse_keymap_report_event(wind_input_dev, code, 1, true))
> +		pr_warn("Unknown key %#x pressed\n", code);
> +
> +wind_wmi_notify_free:
> +	kfree(response.pointer);
> +}
> +
> +static int __init wind_input_setup(void)
> +{
> +	int err;
> +
> +	wind_input_dev =3D input_allocate_device();
> +	if (!wind_input_dev)
> +		return -ENOMEM;
> +
> +	wind_input_dev->name =3D "MSI WMI hotkeys";
> +	wind_input_dev->phys =3D "wmi/input0";
> +	wind_input_dev->id.bustype =3D BUS_HOST;
> +
> +	err =3D sparse_keymap_setup(wind_input_dev, wind_keymap, NULL);
> +	if (err)
> +		goto wind_input_setup_free_dev;
> +
> +	err =3D input_register_device(wind_input_dev);
> +	if (err)
> +		goto wind_input_setup_free_keymap;
> +
> +	return 0;
> +
> +wind_input_setup_free_keymap:
> +	sparse_keymap_free(wind_input_dev);
> +wind_input_setup_free_dev:
> +	input_free_device(wind_input_dev);
> +	return err;
> +}
> +
> +static int __init wind_wmi_init(void)
> +{
> +	int err;
> +
> +	if (!wmi_has_guid(WMI_EVENT_GUID)) {
> +		pr_err("No MSI Wind WMI found\n");
> +		return -ENODEV;
> +	}
> +
> +	err =3D wind_input_setup();
> +	if (err) {
> +		pr_err("Unable to setup input device\n");
> +		return err;
> +	}
> +
> +	if (ACPI_FAILURE(wmi_install_notify_handler(WMI_EVENT_GUID,
> +		wind_wmi_notify, NULL))) {
> +		pr_err("Unable to install WMI notify handler\n");
> +		err =3D -EIO;
> +		goto wind_wmi_init_unregister_input;
> +	}
> +
> +	pr_debug("Event handler installed\n");
> +
> +	return 0;
> +
> +wind_wmi_init_unregister_input:
> +	input_unregister_device(wind_input_dev);
> +	sparse_keymap_free(wind_input_dev);
> +	input_free_device(wind_input_dev);
> +	return err;
> +}
> +
> +static void __exit wind_wmi_exit(void)
> +{
> +	wmi_remove_notify_handler(WMI_EVENT_GUID);
> +	input_unregister_device(wind_input_dev);
> +	sparse_keymap_free(wind_input_dev);
> +	input_free_device(wind_input_dev);
> +}
> +
> +module_init(wind_wmi_init);
> +module_exit(wind_wmi_exit);
