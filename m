Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C6F1EBA0C;
	Thu,  9 Jan 2025 22:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460716; cv=none; b=N47MavDRt+tXPZe9CewpDKyOtkgwyydyv1TErLAGBEnwP4uqWlA+r2f4JrUv9g4pDtB2hm4jJJH5i5uRkpF9J1o6aM0v3kF3VvA6frIv9ZJmMFt8QnKP23LGa+aF9MEo6lIlVneZkq2SgbCT48/6VXoST8xfmRgAG65/8UHi4tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460716; c=relaxed/simple;
	bh=9eY91VZ9IXYO76Tgi8ov0Xzoyh53mP+PRZWkQ6QloS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=man26tYFYvStZtpsAY/rp0BUYl7a7hZYpONNp5JK3WXFJYP/5wZ9z20zqVWpIyJAxujmwqg6M7mx3M48pU00hzksG3Y1cKD8XXN4xI9XVMvf722Fg+L0POdff18w1qsyRoTzZPH1cVKezs1xU3zrWjgPxJ7UTAiQawE9sylNxcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=s163pGMA; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="s163pGMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736460711; x=1737065511; i=w_armin@gmx.de;
	bh=oshPIlk7vR4t8RKe4PCUpt4QqRdWdJlCvE/bEVnArNg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=s163pGMAXwec8AaPHZKF6EqSD7MxdbX+mvg0XZ2kyIx6WE0IPZ/+NcK/6ChI7aJr
	 CBwcxkk4L4klKvpVwWWtKN72dDFcma10QeCvbRN1eNcZtraOElBr0Mq8S1cx9Qo69
	 aB4LbM36ImShDLa2Tk/VAIzAkg1LjHZkToIWb92japAYS14qVkYiQhEN+QKtQcZIF
	 Qz4ziqDP5GHO97BKyk+5VD6AI0ZT1PpsCe8ELqDzO3rcopu0UCi0T7l5jaP0AN0xG
	 oO1cC7fc6Yeh2z/gkdhY0ZoBFl90Qs5Nf2twlPMAnP86B3H26tunBl1CO8BDB1ddG
	 nC9+L3O3V9UCIVY6Zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mel3n-1syKQc0vEz-00oKoP; Thu, 09
 Jan 2025 23:11:51 +0100
Message-ID: <32a788aa-ddf0-4ae1-a51f-0c15de2056c9@gmx.de>
Date: Thu, 9 Jan 2025 23:11:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: Add Lenovo GameZone WMI Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-3-derekjohn.clark@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250102004854.14874-3-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vlTaAlLoqrhc17Vz8UKpbwpnspOMdZbPL/ZCSZMFvDMBsXFXeMQ
 elqBgHnMYOI5ipFyWcUOTGiVYRTKaEwJgPuCOaES+CZQa5DQikBdMnj8u3AS7IMxTosJOmg
 Z5BIjT2LbztEWzcVM/lu+ByCii3P/tMqMNGCrUnXPyzyIfYnq/WPP4q7Cv7eT4Q0v3cTSQT
 KcVA2A4Ja3QEyBogUcd1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MNE0xY3d8WI=;cbdYUYYvX0U6+J4DBEVc0CDa8Lp
 bU/RkXeVvUFYECtObFxF/f/kWbfl2iQ4mbg/yjQ9/aDvPLTQ5X997lTYfRXlLDwHcHAS4vbH6
 0hLUE9cMLDwi+/NtuzOEKP8iabZG6fgrTu2yy+nF6gzN159D802v9cQblxVREAvzJJwsyxl1t
 yn5iayBN7a4m8uEpWiUds6jzuvNT4cw6c1QiRDZHX2gzGSzsyCqXbusJ0jqLlqSeNVI1hi+xn
 Ew4bIw5+n3VjogQWzQgip6qnh4dmQbKqce5bmHZO6xhtfR7NDiIwWaKna4E7+5KmxcTEw24vV
 8BFJkr6i0vJ2K6WuzpdCnH2YfKtUXPNqvyIeIwEHecM9SC413drgdAbsNehNuF7ACWWKBxY37
 8FxbjpMJiDuAAFQKSHYB9ebQ2FNnph61bchFtrDdfPyQfDmeE+DNltysWydk+N0Q6mgAL/I00
 lxbgfuGUsTbU5KbbqJ2gO6N7i3+WvG3F5xvxbu3G5knR91i+lR2DlUbm/5tXWvEJ9iSzOnDol
 QbUDMMMTVsu37j6mN/Tf7LAf+XPLVXYr8pIfVLHaVnH/mlmeagPxIcQjWEs5Dknc7uSddm21l
 eQ/umwUlQFoTcMgsP04SkVYuJcNbBtiWsjV+HUiyq1dh/Wzn7iK1Ygo0/FQjN6a1w2bMo145X
 ME2L3EZqCwUCDQ1PogPhlAeKeVdRSeeHu6+VXVlmR9H9koAlFC5aRYj/BwIB1S/LhjcKr5NcN
 McS+Gd75/a7T7hTJKjMRYJ8t4SGYgeZkReH13X9N1VduMowFMLCQgMn75EapwdrVodP78SQZb
 Grxr/Lk1jdT0vzMIC6JTEWEsaAQwkt37Jwj8VLyyXvWYZ1bVqAcsMn7/qUM0TUEmLKFE49Aa5
 vNK56OTXA3HNBgDh6AsMD6vQ+RZi527wSYgzWuuSRcfhSDywZo2Lga6vWU3J13F0AAC4Cu5Ot
 E1WTy7/rP4NoZ6zB8KSE9FgUFKC86x2pE+BW35CHjrZchXiGB4SZzSsn7TLPjaS99Hh/V9reH
 Yzn4Y/O5YlTIbVrLOLWK03JFlLxEpTZaKEQgvg9IuBCgzG4NUdkTQLAxlvrZg11JoQYCWK7fc
 zdOtwQgrmZAageQgOhdOIwMIMkrYif

Am 02.01.25 um 01:47 schrieb Derek J. Clark:

> Adds lenovo-wmi-gamezone.c which provides a driver for the Lenovo
> GameZone WMI interface that comes on Lenovo "Gaming Series" hardware.
> Provides ACPI platform profiles over WMI.
>
> v2:
> - Use devm_kzalloc to ensure driver can be instanced, remove global
>    reference.
> - Ensure reverse Christmas tree for all variable declarations.
> - Remove extra whitespace.
> - Use guard(mutex) in all mutex instances, global mutex.
> - Use pr_fmt instead of adding the driver name to each pr_err.
> - Remove noisy pr_info usage.
> - Rename gamezone_wmi to lenovo_wmi_gz_priv and gz_wmi to priv.
> - Remove GZ_WMI symbol exporting.
>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>   MAINTAINERS                                |   7 +
>   drivers/platform/x86/Kconfig               |  11 ++
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/lenovo-wmi-gamezone.c | 203 +++++++++++++++++++++
>   drivers/platform/x86/lenovo-wmi.h          | 105 +++++++++++
>   5 files changed, 327 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>   create mode 100644 drivers/platform/x86/lenovo-wmi.h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index baf0eeb9a355..8f8a6aec6b92 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13034,6 +13034,13 @@ S:	Maintained
>   W:	http://legousb.sourceforge.net/
>   F:	drivers/usb/misc/legousbtower.c
>
> +LENOVO WMI drivers
> +M:	Derek J. Clark <derekjohn.clark@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/lenovo-wmi-gamezone.c
> +F:	drivers/platform/x86/lenovo-wmi.h
> +
>   LETSKETCH HID TABLET DRIVER
>   M:	Hans de Goede <hdegoede@redhat.com>
>   L:	linux-input@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..9a6ac7fdec9f 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -459,6 +459,17 @@ config IBM_RTL
>   	 state =3D 0 (BIOS SMIs on)
>   	 state =3D 1 (BIOS SMIs off)
>
> +config LENOVO_WMI_GAMEZONE
> +	tristate "Lenovo GameZone WMI Driver"
> +	depends on ACPI_WMI
> +	select ACPI_PLATFORM_PROFILE
> +	help
> +	  Say Y here if you have a WMI aware Lenovo Legion device and would li=
ke to use the
> +	  platform-profile firmware interface.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo_wmi_gamezone.

Could it be that the resulting kernel module is actually named lenovo-wmi-=
gamezone?.
If yes then please adjust the config description.

> +
>   config IDEAPAD_LAPTOP
>   	tristate "Lenovo IdeaPad Laptop Extras"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index e1b142947067..7cb29a480ed2 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
>   obj-$(CONFIG_YOGABOOK)		+=3D lenovo-yogabook.o
>   obj-$(CONFIG_YT2_1380)		+=3D lenovo-yoga-tab2-pro-1380-fastcharger.o
>   obj-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D lenovo-wmi-camera.o
> +obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D lenovo-wmi-gamezone.o
>
>   # Intel
>   obj-y				+=3D intel/
> diff --git a/drivers/platform/x86/lenovo-wmi-gamezone.c b/drivers/platfo=
rm/x86/lenovo-wmi-gamezone.c
> new file mode 100644
> index 000000000000..da5e2bc41f39
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi-gamezone.c
> @@ -0,0 +1,203 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo GameZone WMI interface driver. The GameZone WMI interface pro=
vides
> + * platform profile and fan curve settings for devices that fall under =
the
> + * "Gaming Series" of Lenovo Legion devices.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + */
> +
> +#include <linux/platform_profile.h>
> +#include "lenovo-wmi.h"

Please add the necessary includes here and do not rely on the header file =
to pull them in.

> +
> +#define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
> +
> +/* Method IDs */
> +#define WMI_METHOD_ID_SMARTFAN_SUPP 43 /* IsSupportSmartFan */
> +#define WMI_METHOD_ID_SMARTFAN_SET 44 /* SetSmartFanMode */
> +#define WMI_METHOD_ID_SMARTFAN_GET 45 /* GetSmartFanMode */
> +
> +static DEFINE_MUTEX(call_mutex);
> +
> +static const struct wmi_device_id lenovo_wmi_gamezone_id_table[] =3D {
> +	{ LENOVO_GAMEZONE_GUID, NULL }, /* LENOVO_GAMEZONE_DATA */
> +	{}
> +};

Please move those device IDs closer to the driver struct which uses them.

> +
> +struct lenovo_wmi_gz_priv {
> +	struct wmi_device *wdev;
> +	enum platform_profile_option current_profile;
> +	struct platform_profile_handler pprof;
> +	bool platform_profile_support;
> +};
> +
> +/* Platform Profile Methods */
> +static int lenovo_wmi_gamezone_platform_profile_supported(
> +	struct platform_profile_handler *pprof, int *supported)

Please use ./scripts/checkpatch --strict to catch any coding style violati=
ons like this one.

> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +
> +	priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);

Is there a reason why you are not passing priv as an argument? If no then =
please pass priv
as an argument so you can avoid having to use container_of().

> +
> +	guard(mutex)(&call_mutex);

Is there a technical reason why you have to use a mutex for WMI method acc=
ess? If no then please remove
this mutex.

> +	return lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SUPP, 0, supported);
> +}
> +
> +static int
> +lenovo_wmi_gamezone_profile_get(struct platform_profile_handler *pprof,
> +				enum platform_profile_option *profile)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +	int sel_prof;
> +	int err;
> +
> +	priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);
> +
> +	guard(mutex)(&call_mutex);
> +	err =3D lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_GET, 0, &sel_prof);
> +	if (err) {
> +		pr_err("Error getting fan profile from WMI interface: %d\n",
> +		       err);

Please just return here without printing anything, userspace does not bene=
fit from such
an error message which only states the obvious.

> +		return err;
> +	}
> +
> +	switch (sel_prof) {
> +	case SMARTFAN_MODE_QUIET:
> +		*profile =3D PLATFORM_PROFILE_QUIET;
> +		break;
> +	case SMARTFAN_MODE_BALANCED:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case SMARTFAN_MODE_PERFORMANCE:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	case SMARTFAN_MODE_CUSTOM:
> +		*profile =3D PLATFORM_PROFILE_CUSTOM;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	priv->current_profile =3D *profile;

Please remove this unused variable from priv.

> +
> +	return 0;
> +}
> +
> +static int
> +lenovo_wmi_gamezone_profile_set(struct platform_profile_handler *pprof,
> +				enum platform_profile_option profile)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +	int sel_prof;
> +	int err;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_QUIET:
> +		sel_prof =3D SMARTFAN_MODE_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		sel_prof =3D SMARTFAN_MODE_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		sel_prof =3D SMARTFAN_MODE_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_CUSTOM:
> +		sel_prof =3D SMARTFAN_MODE_CUSTOM;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	priv =3D container_of(pprof, struct lenovo_wmi_gz_priv, pprof);

Please assign priv during declaration.

> +
> +	guard(mutex)(&call_mutex);
> +	err =3D lenovo_wmidev_evaluate_method_1(
> +		priv->wdev, 0x0, WMI_METHOD_ID_SMARTFAN_SET, sel_prof, NULL);
> +	if (err) {
> +		pr_err("Error setting fan profile on WMI interface: %u\n", err);

Again, this error message only states the obvious, please remove it.

> +		return err;
> +	}
> +
> +	priv->current_profile =3D profile;
> +	return 0;
> +}
> +
> +/* Driver Setup */
> +static int platform_profile_setup(struct lenovo_wmi_gz_priv *priv)
> +{
> +	int supported;
> +	int err;
> +
> +	err =3D lenovo_wmi_gamezone_platform_profile_supported(&priv->pprof,
> +							     &supported);
> +	if (err) {
> +		pr_err("Error checking platform profile support: %d\n", err);
> +		return err;

Please use dev_err() here.

> +	}
> +
> +	priv->platform_profile_support =3D supported;

The value of platform_profile_support is not used anywhere, please remove =
it.

> +
> +	if (!supported)
> +		return -EOPNOTSUPP;

IMHO returning -ENODEV would make more sense here.

> +
> +	priv->pprof.name =3D "lenovo-wmi-gamezone";
> +	priv->pprof.profile_get =3D lenovo_wmi_gamezone_profile_get;
> +	priv->pprof.profile_set =3D lenovo_wmi_gamezone_profile_set;
> +
> +	set_bit(PLATFORM_PROFILE_QUIET, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, priv->pprof.choices);
> +	set_bit(PLATFORM_PROFILE_CUSTOM, priv->pprof.choices);
> +
> +	err =3D lenovo_wmi_gamezone_profile_get(&priv->pprof,
> +					      &priv->current_profile);
> +	if (err) {
> +		pr_err("Error getting current platform profile: %d\n", err);
> +		return err;
> +	}

Is there a technical reason for reading the current platform profile durin=
g device
initialization(? If no then please remove this call.

> +
> +	guard(mutex)(&call_mutex);
> +	err =3D platform_profile_register(&priv->pprof);

Using devm_platform_profile_register() would make sense here. This functio=
n was added very recently
so you have to base your patch series onto the for-next branch.

> +	if (err) {
> +		pr_err("Error registering platform profile: %d\n", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lenovo_wmi_gamezone_probe(struct wmi_device *wdev,
> +				     const void *context)
> +{
> +	struct lenovo_wmi_gz_priv *priv;
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->wdev =3D wdev;

Since you are using dev_get_drvdata(), you also need to use dev_set_drvdat=
a() here, otherwise
dev_get_drvdata() will return no valid value.

> +	return platform_profile_setup(priv);
> +}
> +
> +static void lenovo_wmi_gamezone_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_wmi_gz_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	guard(mutex)(&call_mutex);
> +	platform_profile_remove(&priv->pprof);
> +}
> +
> +static struct wmi_driver lenovo_wmi_gamezone_driver =3D {
> +	.driver =3D { .name =3D "lenovo_wmi_gamezone" },

Please set ".probe_type =3D PROBE_PREFER_ASYNCHRONOUS" here.

Also does the selected fan profile remain the same after suspending or hib=
ernating?
If no then please add the necessary PM callbacks to save/restore the fan p=
rofile
before suspend/after resume if necessary.

> +	.id_table =3D lenovo_wmi_gamezone_id_table,
> +	.probe =3D lenovo_wmi_gamezone_probe,
> +	.remove =3D lenovo_wmi_gamezone_remove,

Please set ".no_singleton =3D true" here.

> +};
> +
> +module_wmi_driver(lenovo_wmi_gamezone_driver);
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_gamezone_id_table);
> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/le=
novo-wmi.h
> new file mode 100644
> index 000000000000..8a302c6c47cb
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-wmi.h
> @@ -0,0 +1,105 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Lenovo Legion WMI interface driver. The Lenovo Legion WMI interface =
is
> + * broken up into multiple GUID interfaces that require cross-reference=
s
> + * between GUID's for some functionality. The "Custom Mode" interface i=
s a
> + * legacy interface for managing and displaying CPU & GPU power and hwm=
on
> + * settings and readings. The "Other Mode" interface is a modern interf=
ace
> + * that replaces or extends the "Custom Mode" interface methods. The
> + * "GameZone" interface adds advanced features such as fan profiles and
> + * overclocking. The "Lighting" interface adds control of various statu=
s
> + * lights related to different hardware components. "Other Method" uses
> + * the data structs LENOVO_CAPABILITY_DATA_00, LENOVO_CAPABILITY_DATA_0=
1
> + * and LENOVO_CAPABILITY_DATA_02 structs for capability information.
> + *
> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
> + *
> + */
> +
> +#define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> +
> +#ifndef _LENOVO_WMI_H_
> +#define _LENOVO_WMI_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +/* Platform Profile Modes */
> +#define SMARTFAN_MODE_QUIET 0x01
> +#define SMARTFAN_MODE_BALANCED 0x02
> +#define SMARTFAN_MODE_PERFORMANCE 0x03
> +#define SMARTFAN_MODE_CUSTOM 0xFF
> +
> +struct wmi_method_args {
> +	u32 arg0;
> +	u32 arg1;
> +};
> +
> +/* General Use functions */
> +static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 in=
stance,
> +					 u32 method_id, struct acpi_buffer *in,
> +					 struct acpi_buffer *out)
> +{
> +	acpi_status status;
> +
> +	status =3D wmidev_evaluate_method(wdev, instance, method_id, in, out);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +};
> +
> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instanc=
e,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval);
> +
> +int lenovo_wmidev_evaluate_method_2(struct wmi_device *wdev, u8 instanc=
e,
> +				    u32 method_id, u32 arg0, u32 arg1,
> +				    u32 *retval)
> +{
> +	struct wmi_method_args args =3D { arg0, arg1 };
> +	struct acpi_buffer input =3D { (acpi_size)sizeof(args), &args };
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *ret_obj =3D NULL;
> +	int err;

Please order the variable declarations in reverse XMAS tree order.

> +
> +	err =3D lenovo_wmidev_evaluate_method(wdev, instance, method_id, &inpu=
t,
> +					    &output);
> +
> +	if (err) {
> +		pr_err("Attempt to get method value failed.\n");

Please remove any error messages in this part of the code, printing error =
messages should
ideally happen at the higher layers of the driver if necessary.

> +		return err;
> +	}
> +
> +	if (retval) {
> +		ret_obj =3D (union acpi_object *)output.pointer;
> +		if (!ret_obj) {
> +			pr_err("Failed to get valid ACPI object from WMI interface\n");
> +			return -EIO;

-ENODATA.

> +		}
> +		if (ret_obj->type !=3D ACPI_TYPE_INTEGER) {
> +			pr_err("WMI query returnd ACPI object with wrong type.\n");
> +			kfree(ret_obj);
> +			return -EIO;

-ENXIO.

> +		}
> +		*retval =3D (u32)ret_obj->integer.value;
> +	}
> +
> +	kfree(ret_obj);
> +
> +	return 0;
> +}
> +
> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instanc=
e,
> +				    u32 method_id, u32 arg0, u32 *retval);
> +
> +int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instanc=
e,
> +				    u32 method_id, u32 arg0, u32 *retval)
> +{
> +	return lenovo_wmidev_evaluate_method_2(wdev, instance, method_id, arg0=
,
> +					       0, retval);
> +}
> +
> +#endif /* !_LENOVO_WMI_H_ */
