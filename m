Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CAB223707;
	Sun, 26 Jan 2025 15:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903850; cv=none; b=aTsKyqFZ5cMhM1F3XmRkx4ImShADly3Puhp0uv2vARZoH6iux0UTMe3rRJ8rtR4Ucpwrvqy5MQ3G5cmCaGP4IC3GMDOGbTULuOGqmhufyCDRChA+q3fBpiLRCgQ+YXsyXyf6XEb/PMNRHDwOjkgUuShpIk3P1jxTJIJHH7+S+JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903850; c=relaxed/simple;
	bh=ccMa+7sE1MpLH5NrNUzrLg658cEwRMR0zGbvRfznwSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCz0nC+pXpTJRijF0B/4vBQZqNsCbgM8tn8FZ92tzH8n52gb+cU+A5qjQmZGEQ5ElgTWmvyfENQF6r9qB5VGRKrMJXd0BNT8hdb4QKMuhUAYjaxfYbHI5L8/tIvUpMUksQDde8EmmnJUXqWnjawGDHNi7YSZNGiwymk1ltgky28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=img7IkmI; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="img7IkmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737903824; x=1738508624; i=w_armin@gmx.de;
	bh=+Fi9dRRBmLEyAIKkbEpUfC1pGO38Oz91/8JY5XAzPtU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=img7IkmILaI7aG1hUkjTiv2KQFgA7gKlSICTNBtGD9JMrA9c+Z6kzgZE8GgTzluf
	 F3gm/ma7JKWvO+HwtcAB8ISmzaCC0l0wevemM5JJP26fY25PFG+ia1j9LTVU+wdVd
	 XOTFG4wzD77dlKB8Ghzx3qgxmbv+8r0veJgeK4H5wI+AoPqqAIfGJUZ0hDtt74ES2
	 E3M4gSdsh1d/W7JJIbpMmwGDqfuHBIgtmZV2JSAo1Nirq6N5kcNYpLRXRdb59SDYN
	 v3I8xESkcMOLVbqw0Hrv4czcZ1ZEO31rUyHSFWWBpIgb/yu1E4LSyZJAEhK+a8o5o
	 FcZ10S4KvGRJcg/BJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.246.83]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1tElxX1P67-00vuGe; Sun, 26
 Jan 2025 16:03:44 +0100
Message-ID: <6e6ceb6b-767d-4c13-9bcf-1c4a27941e2b@gmx.de>
Date: Sun, 26 Jan 2025 16:03:40 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: lenovo-super-hotkey-wmi.c: Support for
 mic and audio mute LEDs
To: Jackie Dong <xy-jackie@139.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 dongeg1@lenovo.com, Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250122090942.6431-1-xy-jackie@139.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250122090942.6431-1-xy-jackie@139.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sbg+SB86NO4uaHJ/BUV4Ufy3fKN4dDN62tskwNkzBDHtYXCGHaR
 JoVZBs65YBloyAERZjWjjZLgvFBk28zey+mOJwzeuqIY6uvLH/Pfzn7hD65UtYVsN+ZesMN
 2naTEBqXBLbTJdCTZ156jnHflRCAb7Mq1DRfFQqKBv+hSX3AyvaQQKTmcLdlVCueD9R1VvE
 QV6nN3VzLuc1GT2b4lmTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CQliXnUktFE=;ZjXaOsoer2Fo496/HktuKNAF6L9
 GAlE0slE6Xj/9R5m45tA0PySns78fWEwUxPpORTXofwape3cyHBgIoIy5lobiB70vNppQASVr
 fbfVw1Y2HmeaDR4n2fmhvuQIjYr3tpWnb0lbC7WcZNy2rpdR4tUYm+H+mwubEN8QSmxHWztZ4
 S6fkb33Lgtn0aYNqlD27+C1xUtMUVskpTpvWJ+bkVQ2AY0w86IPGYi6wAmxzHMnT8mTYD75xK
 pwjkQRpFSWi53lR6IXPiPhSeIC/3hW0BKmPl1BIL2icS0Ti95nJ7gC04clvGeWCMDvjTiyCzI
 sUgd/iYXLVjp1Z3KnXtEZHlGxO3bej6PSmjg6kdBANG1en0cyheXztSI88P/orpH4maY3tQhT
 M4eeHdWh+5VQuDeSiY3sJ283ivJjOXYkv2vXhtcrIBXUQ4PyzfdQFqdSdWhbYRk/eZREJUQE1
 KXRL+kcCEzdkug731W6m/HIboSJgxEbSESH9bRITuP4VK3X4UPKYnEZTlpaXQYwNvKJwubf55
 iwZuEAUm/YeH83RzlfiaXtle+XQkLRd0/dj5Pylc9zRm/E89ahwqKW30dITWoYDmYLaSBP3Fi
 UKPVjsdmMCBbp8Hs3195WyLzRC4xFHMH9oFTZ5GbVvh6V4hwXtjvxiK7LPi4wBVT8K60b8Bw4
 oDhFgbNIAdO84IoQImGOQIAt4OGHb4DZFR4HKzpddBI0vaqD3p3VYueGjpae7zdN+B4HKWUCC
 A4k+lw8zk8enJaunL0AXRKKVZShIgNmzhaH4liK9G004cEYqR9aQ6GMloUQrtTHkcHvcW3sry
 IAJjdUDQYJJ8xqlCuoiPHbvvJiW0dLOvkFUxu0btFc9IPkzBzlx4LWUNOTORAktEXtM27Wjg1
 4IVnwyuq51UA7CUlj71tkkMmkMGJOz930nXcdYMnKk/kV9j8tobQJUOkXGiMH3/yZC/RyLs7A
 b8tqs4HTkrg4XUjY/7ia7hwaSyO6GkEvIWngKViY3oW8Kf5dYHEZ1beMhfv4Hs3iMrfcj8Ajk
 bwWLv2lf2i4UAlC0kbA6zPNrpVhI3mM5U6pDxLWBX+KtoFqhTXALOk7xufsS7378Mjdylc4ze
 7By20c9ox/e1AQLd1mrt4ein4IlUff0UOmqXB+P1x4S5gPodCJe7xXx+wPloyXFdIxRN8spFl
 Isn5RFrl9G99rPs1WuIToZ0Y/OWCibhDdwUkcmsaaJQ==

Am 22.01.25 um 10:09 schrieb Jackie Dong:

> Implement Lenovo utility data WMI calls needed to make LEDs
> work on Ideapads that support this GUID.
> This enables the mic and audio LEDs to be updated correctly.
>
> Tested on below samples.
> ThinkBook 13X Gen4 IMH
> ThinkBook 14 G6 ABP
> ThinkBook 16p Gen4-21J8
> ThinkBook 16p Gen8-IRL
> ThinkBook 16p G7+ ASP
>
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v2:
>   - Update code layout and formatting as recommended in review
>   - Improved error handling in ideapad_wmi_led_init
>   - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
>     ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.
>
>   drivers/platform/x86/Kconfig                  |   7 +
>   drivers/platform/x86/Makefile                 |   1 +
>   .../platform/x86/lenovo-super-hotkey-wmi.c    | 236 ++++++++++++++++++
>   3 files changed, 244 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..bd85ed58104b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
>   	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>   	  rfkill switch, hotkey, fan control and backlight control.
>
> +config LENOVO_HOTKEY_WMI
> +	tristate "Lenovo Super Hotkey Utility WMI extras driver"
> +	depends on ACPI_WMI
> +	depends on IDEAPAD_LAPTOP
> +	help
> +	  This driver provides WMI support for Lenovo customized hotkeys funct=
ion
> +	  of Lenovo NoteBooks which are for Consumer and SMB customers, such a=
s
> +	  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.

Please change the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI to =
match the
name of the driver.

Also, why does this driver depend on IDEAPAD_LAPTOP?

> +
>   config LENOVO_YMC
>   	tristate "Lenovo Yoga Tablet Mode Control"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index e1b142947067..2d172128a6e4 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>   # IBM Thinkpad and Lenovo
>   obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_HOTKEY_WMI)	+=3D lenovo-super-hotkey-wmi.o
>   obj-$(CONFIG_LENOVO_YMC)	+=3D lenovo-ymc.o
>   obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
> diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c b/drivers/pl=
atform/x86/lenovo-super-hotkey-wmi.c
> new file mode 100644
> index 000000000000..d1611f935e30
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
> + *
> + *  Copyright (C) 2025	Lenovo
> + */
> +
> +#include <linux/leds.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +/* Lenovo Super Hotkey WMI GUIDs */
> +#define LUD_WMI_METHOD_GUID	"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
> +#define LUPKE_WMI_EVENT_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> +
> +/* Lenovo Utility Data WMI method_id */
> +#define WMI_LUD_GET_SUPPORT 1
> +#define WMI_LUD_SET_FEATURE 2
> +
> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
> +
> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
> +
> +/* Input parameters to mute/unmute audio LED and Mic LED */
> +struct wmi_led_args {
> +	u8 id;
> +	u8 subid;
> +	u16 value;
> +};
> +
> +/* Values of input parameters to SetFeature of audio LED and Mic LED */
> +enum hotkey_set_feature {
> +	MIC_MUTE_LED_ON =3D 1,
> +	MIC_MUTE_LED_OFF,
> +	AUDIO_MUTE_LED_ON =3D 4,
> +	AUDIO_MUTE_LED_OFF,
> +};
> +
> +#define IDEAPAD_ACPI_LED_MAX 2
> +
> +enum ideapad_wmi_event_type {
> +	IDEAPAD_WMI_EVENT_FN_KEYS =3D 1,
> +	IDEAPAD_WMI_EVENT_LUD_KEYS,
> +};
> +
> +struct ideapad_wmi_private {

Please rename everything in this driver which contains the name "ideapad"
to instead contain the name of this driver.

> +	enum ideapad_wmi_event_type event;
> +	struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
> +};
> +
> +static struct wmi_device *led_wdev;

Please use container_of() to get a reference to your private data struct.

Toachieve that i suggest you rework your private data struct like this:
struct lenovo_hotkey_private { enum mute_led_type type; struct
wmi_device *wdev; struct led_classdev cdev; }; You can then allocate a
private data struct for each LED device and use container_of(led_cdev, str=
uct lenovo_hotkey_private, cdev) to get a reference to the
associated struct from each LED classdev pointer. Then you can access
the WMI device and the LED type without having to use global variables.

> +
> +enum mute_led_type {
> +	MIC_MUTE,
> +	AUDIO_MUTE,
> +};
> +
> +static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct=
 led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +
> +{
> +	struct wmi_led_args led_arg =3D {0, 0, 0};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		led_arg.id =3D brightness =3D=3D LED_ON ? MIC_MUTE_LED_ON : MIC_MUTE_=
LED_OFF;
> +		break;
> +	case AUDIO_MUTE:
> +		led_arg.id =3D brightness =3D=3D LED_ON ? AUDIO_MUTE_LED_ON : AUDIO_M=
UTE_LED_OFF;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length =3D sizeof(struct wmi_led_args);

sizeof(struct wmi_led_args) -> sizeof(led_arg)

> +	input.pointer =3D &led_arg;
> +	status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE, &i=
nput, NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
> +					 enum led_brightness brightness)
> +
> +{
> +	return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
> +				       enum led_brightness brightness)
> +{
> +	return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
> +}
> +
> +static int ideapad_wmi_led_init(enum mute_led_type led_type, struct dev=
ice *dev)
> +{
> +	struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(dev);
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input;
> +	union acpi_object *obj;
> +	int led_version, err =3D 0;
> +	unsigned int wmiarg;
> +	acpi_status status;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		wmiarg =3D WMI_LUD_GET_MICMUTE_LED_VER;
> +		break;
> +	case AUDIO_MUTE:
> +		wmiarg =3D WMI_LUD_GET_AUDIOMUTE_LED_VER;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	input.length =3D sizeof(wmiarg);
> +	input.pointer =3D &wmiarg;
> +	status =3D wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &i=
nput, &output);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj =3D output.pointer;
> +	led_version =3D obj->integer.value;

Please check if the resulting ACPI object is:

- not NULL
- actually an integer

I also suggest that you copy the integer inside a local variable and free =
the ACPI object
as soon as possible to avoid leaking it later.

> +
> +	wpriv->cdev[led_type].max_brightness =3D LED_ON;
> +	wpriv->cdev[led_type].dev =3D dev;
> +	wpriv->cdev[led_type].flags =3D LED_CORE_SUSPENDRESUME;
> +
> +	switch (led_type) {
> +	case MIC_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::micmute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &ideapad_wmi_micmut=
e_led_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-micmute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	case AUDIO_MUTE:
> +		if (led_version !=3D WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
> +			err =3D -EIO;
> +			goto led_error;
> +		}
> +		wpriv->cdev[led_type].name =3D "platform::mute";
> +		wpriv->cdev[led_type].brightness_set_blocking =3D &ideapad_wmi_audiom=
ute_led_set;
> +		wpriv->cdev[led_type].default_trigger =3D "audio-mute";
> +
> +		err =3D devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
> +		if (err < 0)
> +			goto led_reg_failed;
> +
> +		break;
> +	default:
> +		err =3D -EINVAL;
> +		dev_err(dev, "Unknown LED type %d\n", led_type);
> +		goto led_error;
> +	}
> +
> +	kfree(obj);
> +	return 0;
> +
> +led_reg_failed:
> +	dev_err(dev, "Could not register mute LED %d : %d\n", led_type, err);
> +	led_classdev_unregister(&wpriv->cdev[led_type]);

Do not call led_classdev_unregister() here if the LED device could not be =
registered in the first place.

> +led_error:
> +	kfree(obj);
> +	return err;
> +}
> +
> +static void ideapad_wmi_leds_setup(struct device *dev)
> +{
> +	ideapad_wmi_led_init(MIC_MUTE, dev);
> +	ideapad_wmi_led_init(AUDIO_MUTE, dev);
> +}
> +
> +static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, const=
 void *context)
> +{
> +	struct ideapad_wmi_private *wpriv;
> +
> +	wpriv =3D devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
> +	if (!wpriv)
> +		return -ENOMEM;
> +
> +	*wpriv =3D *(const struct ideapad_wmi_private *)context;
> +
> +	dev_set_drvdata(&wdev->dev, wpriv);
> +
> +	if (wpriv->event =3D=3D IDEAPAD_WMI_EVENT_LUD_KEYS) {
> +		led_wdev =3D wdev;
> +		ideapad_wmi_leds_setup(&wdev->dev);
> +	}

What is the purpose of IDEAPAD_WMI_EVENT_FN_KEYS?

Please remove the whole IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KE=
YS
context handling code and instead only handle the LUD_WMI_METHOD_GUID in
this driver.

> +
> +	return 0;
> +}
> +
> +static const struct ideapad_wmi_private lsk_wmi_context_fn_keys =3D {
> +	.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
> +};
> +
> +static const struct ideapad_wmi_private lsk_wmi_context_lud_keys =3D {
> +	.event =3D IDEAPAD_WMI_EVENT_LUD_KEYS
> +};
> +
> +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] =
=3D {
> +	{ LUPKE_WMI_EVENT_GUID, &lsk_wmi_context_fn_keys }, /* FN keys */
> +	{ LUD_WMI_METHOD_GUID, &lsk_wmi_context_lud_keys }, /* Utility data */
> +	{ }

What is the reason for trying to bind to the LUPKE_WMI_EVENT_GUID?

AFAIK the ideapad-laptop driver already takes care of that.

> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
> +
> +static struct wmi_driver lenovo_super_hotkey_wmi_driver =3D {
> +	 .driver =3D {
> +		 .name =3D "lenovo_super_hotkey_wmi",

Please set .probe_type =3D PROBE_PREFER_ASYNCHRONOUS

> +	 },
> +	 .id_table =3D lenovo_super_hotkey_wmi_id_table,
> +	 .probe =3D lenovo_super_hotkey_wmi_probe,

Please set .no_singleton =3D true

Thanks,
Armin Wolf

> +};
> +
> +module_wmi_driver(lenovo_super_hotkey_wmi_driver);
> +
> +MODULE_INFO(depends, "wmi,ideapad-laptop");
> +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
> +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
> +MODULE_LICENSE("GPL");
