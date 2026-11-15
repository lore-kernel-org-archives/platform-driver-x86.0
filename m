Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794759158;
	b=oVcZ4BYlErZCKbTcKkF214FmcnzTMAyyZZZT77cSYGaBxApSsAeH7piG+sT9XFN46pFR
	 WwKj1ZKQQSGZNqcOqf3seGhvyPAnCWSEpTp/zCQSJ8R/Mxv+dO1Qg3fXHHt7P0DftC9fh
	 2BlnSKi/ptx7R1UCTEvN+SF1nhLplclhxZNHThs5vPaVRjQdJYy+sFamy3nf5gSOnhqx0
	 5Un0YrbM5JbzCVy0Xf/Rp6SKyAdfCMaacgR+Pz9t219x3iSZ/lHZvg8AA2srXaXQ2A5WM
	 5HijLuvW0yH7r46lHbLFRPriYIhlGRA2pbxE51oViscfZL/r3VhuN27mU2eFrwTG00g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794759158;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=ok83iiDW67MKhZ8bvkDPl04quINEoMmgbrIZezFlqec=;
	b=xIxhvvgD1X8qkcV9/mi6j6lPAxwrIxQbUDx/Wh5KY2LNma5uLLaQrTjlqxme+C9/gVmw
	 SMMa/wS6jhdgLStjtYC3ycuUVJTbQon2qNybSw1ZEzUCEt5mEcSijlXSua1xCzmg4sot8
	 X1AQfqxnbQ1XyIy0fqD+V/qbnzICQOkT/ZqwP49IkMFcbub2AW9F+15vZHQtEI20zQ7V5
	 GOEZKGyngrGzqRLvbO/ZT8vaZ4awjoCkeQW60U5m975n3YUeSRWynpQSOQG8LrfxJU6wP
	 fgBgsBWrDOG17+4rDoG90689wbenJ0rbj3x/g7l2jc5M9LbrIDmCGrjhY9c8VRIZ1ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=uHujrWYq;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7210C606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 16:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7210C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=uHujrWYq
DKIM2-Signature:  i=1; m=1; t=1794759155;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:jnOmfH0pUMfkVkhFwwcj0bBnLTOF
   dtIcJCbci0JlBdxPT9Vx3DnzKQqtZU1fggkq1aM+nND3pzWoZaJvv90KMVbco+gmsJOU177I+15
   hzQC0lJv7BmAzq1d6NwgsBcx0bZrXfUft2wg5CBcUdzPZgHsEfi7AHzYaJzGoZUqYvExABercLX
   WwIvgeqArrnaf3UxJ8yk1sO8hRuwyL+xb9U4GWw8x8jHRofa+kzwyYARmAvZLQKSW6sWZXdk2YH
   +FqFeXX9fwkIH3tBQuHgPmokT+YgWuv9WsfjnrEkKhxjgOALzzbuxV804bfBR56/lrSvyYz9tzW
   VMpn0Ul5mVgPIA==;
Message-Instance:  m=1;
 h=sha256:
   7ODtwxzJgBRXCU/mzeOv4dpbmebWz9Jw3CFvd8wbv0g=:
   JBcNuI57suf3gtQyku9VbTnFkRS5JzkaPyd6FFZBpKM=,
  sha512:
   FBw/TPH3vxKoZXF1p69D+ELWKaw99geNsFlPFxTM9/FbCXMi6voSmaboiSkDe1K1WmeTrQuWhzWtf6rjT0pUIA==:
   03UoxGzUl4uQemsBRYdyMZeUDl/I/CBsWlaUg0FiCg0DNm0b18+YGK7eiDKOahIQZsOAhg6FweHmFp7YT6hReg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794759138; x=1795363938; i=w_armin@gmx.de;
	bh=ok83iiDW67MKhZ8bvkDPl04quINEoMmgbrIZezFlqec=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uHujrWYqMGYt1O7Nm/XQG+WFarpl+tdZczrAbpt/QOEV/h37z0Rw9S2ozewBKW85
	 0QsUanHLo3z7PMWGnBi+ienhAAcJZWK+NdhrfU4gU41ljN0T28jJyVHiVay+h1tfR
	 MsuUCRpdlIvHGs3yA6fL1Jm+0cafWbZoPWb3pNoLqZNPWpVeYx6RlOYM0LF8qQ+G1
	 SirN7pBm61UmKiIRzWT6CDDJ36n52ogqZumiO7jrlR7hr1CMCh2+PUQuH90U0gTy3
	 PUa86xF+gi165CCBFLyXSXC3ebT1bw2V5gv0fS/JqxADwPQVaSmEU/LDmHgyPJtmL
	 bZhsqMLSnc4NENCWVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1wmfFq1sz2-00aU5e; Sun, 15
 Nov 2026 17:12:18 +0100
Message-ID: <0aefaccd-3c9c-4970-87f1-a329416204a6@gmx.de>
Date: Sun, 15 Nov 2026 17:12:15 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform: lenovo: add WMI hotkeys driver
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261113222755.1696567-3-dcemin@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261113222755.1696567-3-dcemin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ge90POFEeb1Doh0TgReNKQHw64FfQL1qYl0X5sSWhiRFFvuRJ77
 /Ul4UE+jXzdVMxAuZMIRUPlWhIdSi3hyxt0ZRSRyKaBbhSgKuFrUJ2FfvqaPXQMUSxl5CmT
 7KWrgoxULb7scr6x2A2VVGRT1tKpgeo2ahxQvACPP5tXM8OWIwyD9Iq02SgLUWvZ8bcA0nY
 v4VytDn5w9xiV9a8YjT4A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fT2PJlGlrKI=;54zKVSXOIGJUa6QI0ukE/pL7bRw
 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

Am 13.11.26 um 23:27 schrieb David Cemin:

> Lenovo consumer laptops deliver their vendor specific Fn keys (microphon=
e
> mute, airplane mode, performance mode, the Smart Key and Smart Connect
> keys) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead
> of keyboard usages. On x86, ideapad-laptop consumes these events, but it
> depends on i8042 and on the IdeaPad VPC ACPI device, neither of which
> exist on the ACPI based arm64 models. Add a small WMI driver that report=
s
> the same key codes through a sparse keymap, so desktops see the generic
> input events.
>
> The key map follows ideapad-laptop. One code seen on the Yoga 9 2-in-1
> 16 (arm64) is new: 0x48 for the Smart Connect key.
>
> Both drivers match the same GUID. The probe declines when the IdeaPad
> VPC device (VPC2004) is present, so machines handled by ideapad-laptop,
> including its Fn lock LED and DYTC performance mode handling, keep that
> driver.
>
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>   MAINTAINERS                           |   6 +
>   drivers/platform/lenovo/Kconfig       |  14 +++
>   drivers/platform/lenovo/Makefile      |   1 +
>   drivers/platform/lenovo/wmi-hotkeys.c | 151 ++++++++++++++++++++++++++
>   4 files changed, 172 insertions(+)
>   create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b0ad5a3debe..207684aeaf69 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15173,6 +15173,12 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.r=
st
>   F:	drivers/platform/lenovo/
>   F:	drivers/platform/x86/lenovo/*
>  =20
> +LENOVO WMI HOTKEYS DRIVER
> +M:	David Cemin <dcemin@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/lenovo/wmi-hotkeys.c
> +
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
>   L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/K=
config
> index 8222322ca671..ba4248d56e5f 100644
> --- a/drivers/platform/lenovo/Kconfig
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
>   	  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
>   	  Gaming, ThinkBook and so on.
>  =20
> +config LENOVO_WMI_HOTKEYS
> +	tristate "Lenovo WMI hotkeys driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y or M here to enable the vendor specific Fn keys (microphone
> +	  mute, airplane mode, performance mode, star key) on Lenovo laptops
> +	  that deliver them as WMI events and are not handled by the
> +	  ideapad-laptop driver, such as the ACPI based arm64 models.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-hotkeys.
> +
>   config LENOVO_WMI_CAMERA
>   	tristate "Lenovo WMI Camera Button driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/=
Makefile
> index 1cac115dd735..d3f5e3ac14c2 100644
> --- a/drivers/platform/lenovo/Makefile
> +++ b/drivers/platform/lenovo/Makefile
> @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-help=
ers.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)	+=3D wmi-hotkeys.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> diff --git a/drivers/platform/lenovo/wmi-hotkeys.c b/drivers/platform/le=
novo/wmi-hotkeys.c
> new file mode 100644
> index 000000000000..fc18867d8144
> --- /dev/null
> +++ b/drivers/platform/lenovo/wmi-hotkeys.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Lenovo WMI hotkey driver
> + *
> + * Lenovo consumer laptops deliver their vendor specific Fn keys (micro=
phone
> + * mute, airplane mode, performance mode, the star key and others) as W=
MI
> + * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of keybo=
ard
> + * usages.  On x86 ideapad-laptop consumes these events; that driver de=
pends
> + * on i8042 and the IdeaPad VPC device, neither of which exist on the a=
rm64
> + * platforms.  This driver consumes the same event and reports the keys=
 the
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
> +#define LENOVO_FN_KEYS_WMI_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
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

Hi,

please consider using KEY_PERFORMANCE instead.

> +	{ KE_KEY, 0x3e, { KEY_MICMUTE } },
> +	{ KE_KEY, 0x3f, { KEY_RFKILL } },
> +	/*
> +	 * Keyboard backlight level after Fn+Space, handled by the firmware:
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
> +static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const void=
 *context)
> +{
> +	struct lenovo_wmi_hotkeys *priv;
> +	int ret;
> +
> +	/*
> +	 * ideapad-laptop binds the same GUID and handles these events togethe=
r
> +	 * with the IdeaPad VPC device (Fn lock LED, DYTC performance mode
> +	 * cycling).  Leave those machines to it.
> +	 */
> +	if (acpi_dev_found("VPC2004")) {
> +		dev_dbg(&wdev->dev, "IdeaPad VPC present, deferring to ideapad-laptop=
\n");
> +		return -ENODEV;
> +	}

Please use a notifier chain to allow the ideapad-laptop driver to consume =
WMI events.
This avoids code duplication and ensures that the WMI event GUIDs are only=
 handled
by a single driver.

You can use drivers/platform/x86/uniwill/uniwill-wmi.c as a inspiration, e=
xcept that
in this case the sparse keymap resides in this driver.

> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;

Please use devm_kzalloc_obj() instead.

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
> +	ret =3D sparse_keymap_setup(priv->input, lenovo_wmi_hotkeys_keymap, NU=
LL);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D input_register_device(priv->input);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, priv);

Please set drvdata before registering the input device, otherwise a WMI ev=
ent
arriving between input_register_device() and dev_set_drvdata() will cause
a kernel panic by dereferencing NULL.

> +
> +	return 0;
> +}
> +
> +static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, union ac=
pi_object *data)
> +{
> +	struct lenovo_wmi_hotkeys *priv =3D dev_get_drvdata(&wdev->dev);
> +	u32 code;
> +
> +	if (!data || data->type !=3D ACPI_TYPE_INTEGER) {
> +		dev_dbg(&wdev->dev, "event data is not an integer\n");
> +		return;
> +	}
> +
> +	code =3D data->integer.value;
> +	dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
> +
> +	if (!sparse_keymap_report_event(priv->input, code, 1, true))
> +		dev_info_ratelimited(&wdev->dev, "unknown hotkey event 0x%x\n", code)=
;
> +}
> +
> +static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] =3D {
> +	{ LENOVO_FN_KEYS_WMI_GUID, NULL },

What about the GUIDs for handling the Esc keys?

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

Please use .notify_new instead. This will also allow you to get rid of
any ACPI-related code in this driver. What is the WMI data type of the eve=
nt payload?

Thanks,
Armin Wolf

> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(lenovo_wmi_hotkeys_driver);
> +
> +MODULE_DESCRIPTION("Lenovo WMI hotkey driver");
> +MODULE_LICENSE("GPL");
