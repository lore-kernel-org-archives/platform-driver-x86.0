Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554347;
	b=OeOdzMxYeLlNFmt7jh2MWRVSFmFioWZOAMyMRhW+Yk2i6kZaQJOfELDdbkODW43HZzyX
	 Ak8Os42KOlzjNCRmF7N2HW5ENg+RSugAJLlmdTqYsuV+Yhmu05OJFW2LEVF7H/Eux7PRB
	 nelrDjoTN91Bs3kiqbVBhzI/BKClPrCiYOJYmgkpdUhQId4+I9s8RRV37vwDXkUPLWNdm
	 FU+DVDx+cmXUzgC5tWLbh3LstvBTR4KXR7DEPnuZSlyLL9C6JdSZ7tNKtwBpaDSSKNo7L
	 me17zuUipnJXs4sYe/Kzde8ynRKlYbENOe0c/6kQYo673MfPBVkKJdaRbhbl8rXEpdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554347;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=U/1OCrDASF10TWYhlMbn5+5eiXHv0UTqFC2xlwUH19A=;
	b=j3SWMOrhr1fuUPta2CAF6BfjCu1o4lZtPIjqbK39TGfiB7BW8Z2e3kler3e+ZTH07dfW
	 Oz86RMPbVP3pcbUxb1I7YyPDvRFVyZhU5SZbbZ/bYRnUJiXNeIZDdDWOUBqviDhnj/VmX
	 qj3A1+rsZueeSxKAKODk3QfbhG1TJy9YM6QCZg0ZUyLHJyh9ftOJOn+tlcW0Yujojptc9
	 +zHOINzq3lqiRiwA+2H1VKDKnIpZgcLRER5dIYifszDdrYBejHa+5g45ZIGcsQJU4yo6O
	 UB1A/BJAV9j5bpEUUX2qHOeJ8+tbo79O63V4RiisKfvtiOm+kztdhTpZGhl8KqyQasw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HqVBmWJ1;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB38606A324;
	Sun,  1 Nov 2026 17:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB38606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=HqVBmWJ1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793554344; x=1794159144; i=w_armin@gmx.de;
	bh=U/1OCrDASF10TWYhlMbn5+5eiXHv0UTqFC2xlwUH19A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HqVBmWJ1NCzeNIMBUD8jVx9fzkAYOsTaB7nG5pFq5QDInlasmxybhaqrTvnJCEog
	 lbuD1L0SO6spGWPxbm8r11oODAd72xHjBK8u4WC9D6eeqDbcGwza5yAoWnBVFJs6M
	 hwPQ3kJtH4LFMG5E/0cZDQNgqqDbVS5KZgv0R9FV9OhdK84YHtVfAHpWPglOZU2vL
	 0H4Q5xtA2f9TCcjK6RPPENIoF0cvuz9GfHmp5M39FP/k4lgkwp8kIsVprmjZ6vvmF
	 J4/XvWW/IAjmCllqk8f1qrScVwZU2HGovT2m5Zwt1mZWKLoSEE9n6enUHwXcf52TI
	 wQSrRCUKu261aTMl3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1xJOY43uUp-006NPt; Sun, 01
 Nov 2026 18:32:24 +0100
Message-ID: <0f1fab72-bf10-4074-b832-77ab1b583b78@gmx.de>
Date: Sun, 1 Nov 2026 18:32:22 +0100
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
Subject: Re: [PATCH v2] platform/x86: add Xiaomi WMI key driver
To: Lucy Wong <lucywong2778@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601151404.93049-1-lucywong2778@gmail.com>
 <20261022185619.40188-1-lucywong2778@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261022185619.40188-1-lucywong2778@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4XWQ9HY5NPm5xdY6VKFnmrgr391UvJIeySeCRm2uAX5prkVOXaf
 VcU6Zp1506c6Q1TGVcNt2B/FdOzsJvb4KW6lzpU8he5Tz8qgTOaP9AvkKvArjshsAD++sV8
 wX20HMNkVSertHDALyYMt2OaW6UN5RWLrg45c64EFbLrZ/v2MD/qJwy+wEhgrF581ff2aOM
 CVV2ExjnzCxeG88pg1dVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jWp2amPNlZk=;R8CbSW0Tu+fdVsvjAZ0viQnSVuU
 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
 bcSIShwle6je6opwwgQ==

Am 22.10.26 um 20:56 schrieb Lucy Wong:

> Certain Xiaomi laptops expose extra function keys through a single WMI
> event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
> xiaomi-wmi driver where each key has its own GUID, here all keys share
> one GUID and the event buffer encodes both an event type and a keycode:
>
>    buffer[1] =3D event type
>      0x02: press/release keys (5 keys with abstract icons)
>      0x03: firmware-handled toggles (touchpad, Fn lock)
>    buffer[2] =3D keycode within that type
>
> The keys with abstract icons are mapped to programmable macro keys for
> userspace to bind. The touchpad and Fn lock toggles, as well as the
> keyboard backlight level events, are handled by the firmware and are
> ignored.
>
> Link: https://lore.kernel.org/platform-driver-x86/20260601151404.93049-1=
-lucywong2778@gmail.com/
> Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
> ---
> Changes in v2:
> - Convert to .notify_new and set .min_event_size
> - Ignore firmware-handled backlight and toggle events, which removes the
>    toggle deduplication state
> - Add the missing select INPUT_SPARSEKMAP
> - Name the event codes and align the defines
> - Add the dev_printk.h include
> ---
>   MAINTAINERS                            |   6 ++
>   drivers/platform/x86/Kconfig           |  12 +++
>   drivers/platform/x86/Makefile          |   1 +
>   drivers/platform/x86/xiaomi-wmi-keys.c | 123 +++++++++++++++++++++++++
>   4 files changed, 142 insertions(+)
>   create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 839e39825455..7969b82c8315 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29124,6 +29124,12 @@ F:	fs/xfs/
>   F:	include/uapi/linux/dqblk_xfs.h
>   F:	include/uapi/linux/fsmap.h
>  =20
> +XIAOMI WMI KEYS DRIVER
> +M:	Lucy Wong <lucywong2778@gmail.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/xiaomi-wmi-keys.c
> +
>   XILINX AMS DRIVER
>   M:	Salih Erim <salih.erim@amd.com>
>   M:	Conall O'Griofa <conall.ogriofa@amd.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b54b5212b204..1e7128f88adf 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -90,6 +90,18 @@ config XIAOMI_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called xiaomi-wmi.
>  =20
> +config XIAOMI_WMI_KEYS
> +	tristate "Xiaomi WMI key events driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y here if you want to support WMI-based hotkey events on certain
> +	  Xiaomi laptops.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called xiaomi-wmi-keys.
> +
>   config REDMI_WMI
>   	tristate "Redmibook WMI key driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 872ac3842391..d852bb0bf61b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+=3D huawei-wmi.o
>   obj-$(CONFIG_MXM_WMI)			+=3D mxm-wmi.o
>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
> +obj-$(CONFIG_XIAOMI_WMI_KEYS)		+=3D xiaomi-wmi-keys.o
>   obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
>   obj-$(CONFIG_BITLAND_MIFS_WMI)		+=3D bitland-mifs-wmi.o
> diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/x=
86/xiaomi-wmi-keys.c
> new file mode 100644
> index 000000000000..a01ef01e501e
> --- /dev/null
> +++ b/drivers/platform/x86/xiaomi-wmi-keys.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xiaomi laptop WMI hotkey driver
> + *
> + * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/wmi.h>
> +
> +#define XIAOMI_WMI_EVENT_GUID	"B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
> +
> +#define XIAOMI_EVENT_TYPE_KEY	0x02

Please also document event type 0x03 and 0x01. Does your device contain em=
bedded BMOF data?
I would be interested in taking a look at it.

> +
> +#define XIAOMI_KEY_PRESS_FIRST	0x01
> +#define XIAOMI_KEY_COUNT	5
> +#define XIAOMI_KEY_RELEASE_FIRST	\
> +	(XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT)
> +
> +struct xiaomi_wmi_keys_event {
> +	u8 reserved;
> +	u8 type;
> +	u8 code;
> +};
> +
> +struct xiaomi_wmi_keys {
> +	struct input_dev *input_dev;
> +};
> +
> +static const struct key_entry xiaomi_wmi_keys_keymap[] =3D {
> +	/* programmable keys with abstract icons */
> +	{ KE_KEY, 0x01, { KEY_MACRO1 } },
> +	{ KE_KEY, 0x02, { KEY_MACRO2 } },
> +	{ KE_KEY, 0x03, { KEY_MACRO3 } },
> +	{ KE_KEY, 0x04, { KEY_MACRO4 } },
> +	{ KE_KEY, 0x05, { KEY_MACRO5 } },
> +	{ KE_END, 0 },
> +};
> +
> +static int xiaomi_wmi_keys_probe(struct wmi_device *wdev, const void *c=
ontext)
> +{
> +	struct xiaomi_wmi_keys *data;
> +	int ret;
> +
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	dev_set_drvdata(&wdev->dev, data);

You need a mutex to sync each invocation of sparse_keymap_report_event().

> +
> +	data->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_dev)
> +		return -ENOMEM;
> +
> +	data->input_dev->name =3D "Xiaomi WMI keys";
> +	data->input_dev->phys =3D "wmi/input0";
> +	data->input_dev->id.bustype =3D BUS_HOST;
> +
> +	ret =3D sparse_keymap_setup(data->input_dev, xiaomi_wmi_keys_keymap, N=
ULL);
> +	if (ret)
> +		return ret;
> +
> +	return input_register_device(data->input_dev);
> +}
> +
> +static void xiaomi_wmi_keys_notify(struct wmi_device *wdev,
> +				   const struct wmi_buffer *buffer)
> +{
> +	const struct xiaomi_wmi_keys_event *event =3D buffer->data;
> +	struct xiaomi_wmi_keys *data =3D dev_get_drvdata(&wdev->dev);

Reverse XMAS tree ordering please, move the above assignment to the top.

> +	unsigned int code;
> +	bool pressed;
> +
> +	/*
> +	 * Only the press/release keys are reported. Event types 0x01
> +	 * (backlight) and 0x03 (touchpad and Fn-lock toggles) are handled by
> +	 * the firmware and need no action from the driver.
> +	 */
> +	if (event->type !=3D XIAOMI_EVENT_TYPE_KEY) {
> +		dev_dbg(&wdev->dev, "ignoring event type 0x%02x\n", event->type);
> +		return;
> +	}
> +
> +	if (event->code >=3D XIAOMI_KEY_PRESS_FIRST &&
> +	    event->code < XIAOMI_KEY_PRESS_FIRST + XIAOMI_KEY_COUNT) {
> +		code =3D event->code;
> +		pressed =3D true;
> +	} else if (event->code >=3D XIAOMI_KEY_RELEASE_FIRST &&
> +		   event->code < XIAOMI_KEY_RELEASE_FIRST + XIAOMI_KEY_COUNT) {
> +		code =3D event->code - XIAOMI_KEY_COUNT;
> +		pressed =3D false;
> +	} else {
> +		dev_dbg(&wdev->dev, "ignoring key code 0x%02x\n", event->code);

Maybe use dev_notice() here to notify users that a unknown key index was r=
eceived.

> +		return;
> +	}
> +
> +	sparse_keymap_report_event(data->input_dev, code, pressed, false);
> +}
> +
> +static const struct wmi_device_id xiaomi_wmi_keys_id_table[] =3D {
> +	{ .guid_string =3D XIAOMI_WMI_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_keys_id_table);
> +
> +static struct wmi_driver xiaomi_wmi_keys_driver =3D {
> +	.driver =3D {
> +		.name =3D "xiaomi-wmi-keys",

Please add .probe_type =3D PROBE_PREFER_ASYNCHRONOUS here.

Other than that the driver looks promising.

Thanks,
Armin Wolf

> +	},
> +	.id_table =3D xiaomi_wmi_keys_id_table,
> +	.min_event_size =3D sizeof(struct xiaomi_wmi_keys_event),
> +	.probe =3D xiaomi_wmi_keys_probe,
> +	.notify_new =3D xiaomi_wmi_keys_notify,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(xiaomi_wmi_keys_driver);
> +
> +MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
> +MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
> +MODULE_LICENSE("GPL");
