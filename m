Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=120.232.169.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794886087;
	b=CSTVyZH59C57buxtUi5YcdELY0GvtD4D6ZuBCBfXdtka4t2tRRhlyDM29zKk5BOcP1Dg
	 4YfekFKbQpkuodB9al4IK5xW4t7713fS+O1898AcmQ7y5aWN1DwAGHF5pud2AOmJAEiw9
	 HuKyxdR4c7sLqWFROOD51x7t144Y/QyQ5jmFLwLYMQzh+n1Hjrd+mq8FQSMfWRNR23ti/
	 KDC3+tAR0UU1jgNT22PSMyQ8Oua+9gKae88XRd6smHCilZ6O4uYvsolPtY+5YYj7vEwuY
	 0rIZSDP6Hf+kGbpEElmz7sleJ5rwLXsrhgxymfEoFlecJee0kZR8jIxWWZT2faiFbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794886087;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM:X-RM-SPAM-FLAG:
	 Received:X-RM-TRANSID:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=rFhIyzmOP7RDcncPCj9pgTGy6qRn55zCgfTjFBol9wc=;
	b=vyB2QtyPBIqysLRskvpwAmUBEWCOHaaRG+Q6e5j4Igle8JjhVoOxoeT42rLAalDMfJep
	 JEfU6vpaSFz/Aw0uGI6tsedEiqyKlRTyx6FqbdqqV9SuTeaLBQpciDVz/s87uApVgtFdv
	 i33FPbN8ezly/MUqMX07oWSPvRVBUbvDOpCrv9D6DvO3Ohhv+JwcKy0DRzQBjaXhq6qIG
	 BlBWeRUUkXg6xuI5tzuQI0m7DEWoME65+WdLftUZUagTg1yVs3rqxjdTBI4Ho1kROqayF
	 821Q4JBogMEYvTSNcSr9WyLbOcSX/cpVc9K9ts5MIsPxL8v06MUvHmmlGPyJ3VAV1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=139.com;
	spf=pass smtp.mailfrom=139.com;
	dkim=pass header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=duDhBXe3;
	arc=none smtp.remote-ip=120.232.169.111
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE40606A323;
	Tue, 17 Nov 2026 03:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE40606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=duDhBXe3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=duDhBXe3mhPI8z51cXotpm5PH4QKBklY3ih+EgsdzPH3nm/A1NUOlbfe/cUUPMKS0zU2bZrpdpJSR
	 TZxabTjZ11JAaW8QjhOlEpy5nAQgM26uqq1vvNzCdqaRm1f3td4qls9GadrmrfmCKPR3KYv8uEPpIA
	 2leogIMJxlAzznM8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [10.103.151.114] (unknown[36.110.60.243])
	by rmsmtp-lg-appmail-18-12021 (RichMail) with SMTP id 2ef56afbc9b7b81-07c22;
	Tue, 17 Nov 2026 11:27:54 +0800 (CST)
X-RM-TRANSID:2ef56afbc9b7b81-07c22
Message-ID: <3edf04da92dfa33b2f7e9abf78447dd12fd7c228.camel@139.com>
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
From: Jackie Dong <xy-jackie@139.com>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 ikepanhc@gmail.com,  platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org,  ldemarchi@nvidia.com
Date: Tue, 17 Nov 2026 11:27:53 +0800
In-Reply-To: <20261113222755.1696567-3-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261113222755.1696567-3-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, 2026-11-13 at 14:27 -0800, David Cemin wrote:
> Lenovo consumer laptops deliver their vendor specific Fn keys
> (microphone
> mute, airplane mode, performance mode, the Smart Key and Smart
> Connect
> keys) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294
> instead
> of keyboard usages. On x86, ideapad-laptop consumes these events, but
> it
> depends on i8042 and on the IdeaPad VPC ACPI device, neither of which
> exist on the ACPI based arm64 models. Add a small WMI driver that
> reports
> the same key codes through a sparse keymap, so desktops see the
> generic
> input events.
>=20
> The key map follows ideapad-laptop. One code seen on the Yoga 9 2-in-
> 1
> 16 (arm64) is new: 0x48 for the Smart Connect key.
>=20
> Both drivers match the same GUID. The probe declines when the IdeaPad
> VPC device (VPC2004) is present, so machines handled by ideapad-
> laptop,
> including its Fn lock LED and DYTC performance mode handling, keep
> that
> driver.
>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> =C2=A0drivers/platform/lenovo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 14 +++
> =C2=A0drivers/platform/lenovo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 1 +
> =C2=A0drivers/platform/lenovo/wmi-hotkeys.c | 151
> ++++++++++++++++++++++++++
> =C2=A04 files changed, 172 insertions(+)
> =C2=A0create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b0ad5a3debe..207684aeaf69 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15173,6 +15173,12 @@ F:	Documentation/wmi/devices/lenovo-
> wmi-other.rst
> =C2=A0F:	drivers/platform/lenovo/
> =C2=A0F:	drivers/platform/x86/lenovo/*
> =C2=A0
> +LENOVO WMI HOTKEYS DRIVER
> +M:	David Cemin <dcemin@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/lenovo/wmi-hotkeys.c
> +
> =C2=A0LENOVO WMI HOTKEY UTILITIES DRIVER
> =C2=A0M:	Jackie Dong <xy-jackie@139.com>
> =C2=A0L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/lenovo/Kconfig
> b/drivers/platform/lenovo/Kconfig
> index 8222322ca671..ba4248d56e5f 100644
> --- a/drivers/platform/lenovo/Kconfig
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
> =C2=A0	=C2=A0 such as LED control for audio/mic mute event for Ideapad,
> YOGA, XiaoXin,
> =C2=A0	=C2=A0 Gaming, ThinkBook and so on.
> =C2=A0
> +config LENOVO_WMI_HOTKEYS
> +	tristate "Lenovo WMI hotkeys driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	=C2=A0 Say Y or M here to enable the vendor specific Fn keys
> (microphone
> +	=C2=A0 mute, airplane mode, performance mode, star key) on Lenovo
> laptops
> +	=C2=A0 that deliver them as WMI events and are not handled by the
> +	=C2=A0 ideapad-laptop driver, such as the ACPI based arm64
> models.
> +
> +	=C2=A0 To compile this driver as a module, choose M here: the
> module will
> +	=C2=A0 be called lenovo-wmi-hotkeys.
> +
> =C2=A0config LENOVO_WMI_CAMERA
> =C2=A0	tristate "Lenovo WMI Camera Button driver"
> =C2=A0	depends on ACPI_WMI
> diff --git a/drivers/platform/lenovo/Makefile
> b/drivers/platform/lenovo/Makefile
> index 1cac115dd735..d3f5e3ac14c2 100644
> --- a/drivers/platform/lenovo/Makefile
> +++ b/drivers/platform/lenovo/Makefile
> @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D
> wmi-helpers.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-
> hotkey-utilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)	+=3D wmi-hotkeys.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
> =C2=A0lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> diff --git a/drivers/platform/lenovo/wmi-hotkeys.c
> b/drivers/platform/lenovo/wmi-hotkeys.c
> new file mode 100644
> index 000000000000..fc18867d8144
> --- /dev/null
> +++ b/drivers/platform/lenovo/wmi-hotkeys.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Lenovo WMI hotkey driver
> + *
> + * Lenovo consumer laptops deliver their vendor specific Fn keys
> (microphone
> + * mute, airplane mode, performance mode, the star key and others)
> as WMI
> + * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of
> keyboard
> + * usages.=C2=A0 On x86 ideapad-laptop consumes these events; that drive=
r
> depends
> + * on i8042 and the IdeaPad VPC device, neither of which exist on
> the arm64
> + * platforms.=C2=A0 This driver consumes the same event and reports the
> keys the
> + * same way, so desktops see the usual generic key codes.
> + *
> + * The key codes follow the mapping used by ideapad-laptop.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_FN_KEYS_WMI_GUID	"8FC0DE0C-B4E4-43FD-B0F3-
> 8871711C1294"
> +
> +static const struct key_entry lenovo_wmi_hotkeys_keymap[] =3D {
> +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +	{ KE_KEY, 0x01, { KEY_FAVORITES } },
> +	/* Fn lock toggled on / off, firmware handles the LED */
> +	{ KE_IGNORE, 0x02 },
> +	{ KE_IGNORE, 0x03 },
> +	{ KE_KEY, 0x04, { KEY_SELECTIVE_SCREENSHOT } },
> +	/* Lenovo Support */
> +	{ KE_KEY, 0x07, { KEY_HELP } },
> +	{ KE_KEY, 0x0a, { KEY_REFRESH_RATE_TOGGLE } },
> +	{ KE_KEY, 0x0e, { KEY_PICKUP_PHONE } },
> +	{ KE_KEY, 0x0f, { KEY_HANGUP_PHONE } },
> +	{ KE_KEY, 0x10, { KEY_REFRESH_RATE_TOGGLE } },
> +	/* Sound profile switch */
> +	{ KE_KEY, 0x12, { KEY_PROG2 } },
> +	/* Dark mode toggle */
> +	{ KE_KEY, 0x13, { KEY_PROG1 } },
> +	/* Lenovo Support */
> +	{ KE_KEY, 0x27, { KEY_HELP } },
> +	/* Lenovo Virtual Background application */
> +	{ KE_KEY, 0x28, { KEY_PROG3 } },
> +	{ KE_KEY, 0x29, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY, 0x2a, { KEY_ROOT_MENU } },
> +	/* Shift + PrtSc */
> +	{ KE_KEY, 0x2d, { KEY_SELECTIVE_SCREENSHOT } },
> +	/* Performance mode, Fn+Q */
> +	{ KE_KEY, 0x3d, { KEY_PROG4 } },
> +	{ KE_KEY, 0x3e, { KEY_MICMUTE } },
> +	{ KE_KEY, 0x3f, { KEY_RFKILL } },
> +	/*
> +	 * Keyboard backlight level after Fn+Space, handled by the
> firmware:
> +	 * 0x40 off, 0x41 low, 0x42 high, 0x43 also seen
> +	 */
> +	{ KE_IGNORE, 0x40 },
> +	{ KE_IGNORE, 0x41 },
> +	{ KE_IGNORE, 0x42 },
> +	{ KE_IGNORE, 0x43 },
> +	/* Star, user assignable key */
> +	{ KE_KEY, 0x44, { KEY_PROG1 } },
> +	/* Eye care */
> +	{ KE_KEY, 0x45, { KEY_PROG3 } },
> +	/* Smart Connect, phone to PC link */
> +	{ KE_KEY, 0x48, { KEY_PROG2 } },
> +	{ KE_END },
> +};
> +
> +struct lenovo_wmi_hotkeys {
> +	struct input_dev *input;
> +};
> +
> +static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const
> void *context)
> +{
> +	struct lenovo_wmi_hotkeys *priv;
> +	int ret;
> +
> +	/*
> +	 * ideapad-laptop binds the same GUID and handles these
> events together
> +	 * with the IdeaPad VPC device (Fn lock LED, DYTC
> performance mode
> +	 * cycling).=C2=A0 Leave those machines to it.
> +	 */
> +	if (acpi_dev_found("VPC2004")) {
> +		dev_dbg(&wdev->dev, "IdeaPad VPC present, deferring
> to ideapad-laptop\n");
> +		return -ENODEV;
> +	}
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->input =3D devm_input_allocate_device(&wdev->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +
> +	priv->input->name =3D "Lenovo WMI hotkeys";
> +	priv->input->phys =3D "wmi/input0";
> +	priv->input->id.bustype =3D BUS_HOST;
> +	priv->input->dev.parent =3D &wdev->dev;
> +
> +	ret =3D sparse_keymap_setup(priv->input,
> lenovo_wmi_hotkeys_keymap, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D input_register_device(priv->input);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, union
> acpi_object *data)
> +{
> +	struct lenovo_wmi_hotkeys *priv =3D dev_get_drvdata(&wdev-
> >dev);
> +	u32 code;
> +
> +	if (!data || data->type !=3D ACPI_TYPE_INTEGER) {
> +		dev_dbg(&wdev->dev, "event data is not an
> integer\n");
> +		return;
> +	}
> +
> +	code =3D data->integer.value;
> +	dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
> +
> +	if (!sparse_keymap_report_event(priv->input, code, 1, true))
> +		dev_info_ratelimited(&wdev->dev, "unknown hotkey
> event 0x%x\n", code);
> +}
> +
> +static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] =3D {
> +	{ LENOVO_FN_KEYS_WMI_GUID, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_hotkeys_id_table);
> +
> +static struct wmi_driver lenovo_wmi_hotkeys_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-wmi-hotkeys",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lenovo_wmi_hotkeys_id_table,
> +	.probe =3D lenovo_wmi_hotkeys_probe,
> +	.notify =3D lenovo_wmi_hotkeys_notify,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(lenovo_wmi_hotkeys_driver);
> +
> +MODULE_DESCRIPTION("Lenovo WMI hotkey driver");
> +MODULE_LICENSE("GPL");
Hi David,
This wmi-hotkeys.c is for suspecific Fn keys(microphone mute, airplane
mode, performance mode, the star key and others) with WMI and wmi-
hotkey-utilities.c is the same target. Now the two file names are=20
similar and easy to confuse for developers and maintainer.=C2=A0
Would you merge them into one file?=20
If yes, developers can support Lenovo product other hotkeys and new
functions by wmi in one file in future.
Jackie Dong

