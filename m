Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066E533F38A;
	Wed, 10 Jun 2026 17:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781113240; cv=none; b=EphWk1M7KbcQ3EPP9nFT/avIhz3vk4ZQWXCiEybxDKFtIFZ0jV15s2uGnfG5SaxyR5HqvMIAoymfEhqmWlasACaypSSnHJtFKbctXdzT6pVDL9+WBvG87xDfwmN+jk8YvIJlb4/OKOsz56EO9NkOhTB6TL0fZ076IjStEwXzbII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781113240; c=relaxed/simple;
	bh=HG+QERkvcXsU+VFy6O+EHstBKhHA6aBBGxXuUGurV3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSOua8O/bMizgUPSw0tMW1d8NGa9cpTDeUC7Dlu9unMCEESJPp0ZYBomypJGN+MDD6jD2TFSme3qvbpaKGoKzAtchbVHtZJgXBTJ1AOLCxDIbYt2riWMFQKe+xVwIl9i8fy9gTmliLGhO813brHEubQApKU3Wta3lfsEbVgHCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Eg8fqPfg; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Eg8fqPfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781113228; x=1781718028; i=w_armin@gmx.de;
	bh=Rln3/vNuhP+42Mm5sGVZBwL6UyD4Wn+fEZZw+TOXhZE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Eg8fqPfgW0/O0/ReM548yqFaot5sjMZoRb6UPnnxWFbE2sUGpATYST2AdsgD5h/v
	 HJxukworAXQzaDBLN+b7/LhUukl8NGpQhfOxkoeOYXgl2DhHyqDvNzHOcboZmQgFN
	 A47CirbxrvymI2zOtBZpJjo8wl3NuYzLd1hHqhbGI2dlSaQUCOL5z6+L2JaYsrgu5
	 ziGIQfrQPpezEGoJfpTg5UXV9ToLXGQGvKQLxzidcqrD0XbejwjK3QMl1yHa9d2Z+
	 +dAr9QppaPwS6N+kQ0pScJ5izub0BeHNwzzzgET4rroOXyTSWx7lE+Frf2o8aUHqS
	 DZG4MvYc9d8Jo9gKug==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTzay-1wgkrm0Fk2-00UQXp; Wed, 10
 Jun 2026 19:40:28 +0200
Message-ID: <67d80b21-f71b-4014-a594-f491687615c4@gmx.de>
Date: Wed, 10 Jun 2026 19:40:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: add Xiaomi WMI key driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Lucy Wong <lucywong2778@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260601152703.94539-1-lucywong2778@gmail.com>
 <20260601152703.94539-2-lucywong2778@gmail.com>
 <ddc819dc-4c5a-ba62-bced-3222e2e60bb7@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ddc819dc-4c5a-ba62-bced-3222e2e60bb7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N04t70skxNfCTdwn+0VgYzIbZt4Qu0SeTMq9vA3IunSHDgngZsG
 HkzKG9jEx8tDcr2SFGEimwMFO4QWVyEb0hsuQNR41+rUIy93hUitxMe76As4VIONn+B6xLs
 2lqriejP6uCQFo2DKqAvJd0GsMiUCARj2CAqTwqRpGfWCanglRowjN/QU/xIa4iZpq/anBI
 3gBOfbbQoQH78MQYJFJ5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TttsJOFajtE=;4BlXO7ryoHNNp5VEYYy6vQnsLIh
 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

Am 08.06.26 um 12:09 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 1 Jun 2026, Lucy Wong wrote:
>
>> Certain Xiaomi laptops expose extra function keys through a single WMI
>> event GUID (B74AF83F-8B2F-4069-ACAC-36D176F62FC0). Unlike the existing
>> xiaomi-wmi driver where each key has its own GUID, here all keys share
>> one GUID and the event buffer encodes both an event type and a keycode:
>>
>>    buffer[1] =3D event type
>>      0x02: press/release keys (5 keys with abstract icons)
>>      0x03: firmware-handled toggles (touchpad, Fn lock)
>>    buffer[2] =3D keycode within that type
>>
>> The keys with abstract icons are mapped to programmable macro keys for
>> userspace to bind. The touchpad and Fn lock keys are handled by the EC
>> and are reported for notification purposes only.
>>
>> Signed-off-by: Lucy Wong <lucywong2778@gmail.com>
>> ---
>>   MAINTAINERS                            |   6 ++
>>   drivers/platform/x86/Kconfig           |  11 ++
>>   drivers/platform/x86/Makefile          |   1 +
>>   drivers/platform/x86/xiaomi-wmi-keys.c | 139 ++++++++++++++++++++++++=
+
>>   4 files changed, 157 insertions(+)
>>   create mode 100644 drivers/platform/x86/xiaomi-wmi-keys.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 839e39825455..7969b82c8315 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -29124,6 +29124,12 @@ F:	fs/xfs/
>>   F:	include/uapi/linux/dqblk_xfs.h
>>   F:	include/uapi/linux/fsmap.h
>>  =20
>> +XIAOMI WMI KEYS DRIVER
>> +M:	Lucy Wong <lucywong2778@gmail.com>
>> +L:	platform-driver-x86@vger.kernel.org
>> +S:	Maintained
>> +F:	drivers/platform/x86/xiaomi-wmi-keys.c
>> +
>>   XILINX AMS DRIVER
>>   M:	Salih Erim <salih.erim@amd.com>
>>   M:	Conall O'Griofa <conall.ogriofa@amd.com>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index b54b5212b204..541b0a255daa 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -90,6 +90,17 @@ config XIAOMI_WMI
>>   	  To compile this driver as a module, choose M here: the module will
>>   	  be called xiaomi-wmi.
>>  =20
>> +config XIAOMI_WMI_KEYS
>> +	tristate "Xiaomi WMI key events driver"
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	help
>> +	  Say Y here if you want to support WMI-based hotkey events on certai=
n
>> +	  Xiaomi laptops.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called xiaomi-wmi-keys.
>> +
>>   config REDMI_WMI
>>   	tristate "Redmibook WMI key driver"
>>   	depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makef=
ile
>> index 872ac3842391..d852bb0bf61b 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -12,6 +12,7 @@ obj-$(CONFIG_HUAWEI_WMI)		+=3D huawei-wmi.o
>>   obj-$(CONFIG_MXM_WMI)			+=3D mxm-wmi.o
>>   obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-ec-backlight.o
>>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
>> +obj-$(CONFIG_XIAOMI_WMI_KEYS)		+=3D xiaomi-wmi-keys.o
>>   obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
>>   obj-$(CONFIG_BITLAND_MIFS_WMI)		+=3D bitland-mifs-wmi.o
>> diff --git a/drivers/platform/x86/xiaomi-wmi-keys.c b/drivers/platform/=
x86/xiaomi-wmi-keys.c
>> new file mode 100644
>> index 000000000000..524ede0e64eb
>> --- /dev/null
>> +++ b/drivers/platform/x86/xiaomi-wmi-keys.c
>> @@ -0,0 +1,139 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Xiaomi laptop WMI hotkey driver
>> + *
>> + * Copyright (C) 2026 Lucy Wong <lucywong2778@gmail.com>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/jiffies.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#define XIAOMI_WMI_EVENT_GUID "B74AF83F-8B2F-4069-ACAC-36D176F62FC0"
>> +
>> +#define XIAOMI_TYPE_BACKLIGHT 0x01 /* keyboard backlight level (EC han=
dled) */
>> +#define XIAOMI_TYPE_KEY  0x02 /* press/release keys */
>> +#define XIAOMI_TYPE_TOGGLE 0x03 /* firmware toggle keys (notify only) =
*/
> Please align values within a "group".
>
>> +
>> +#define XIAOMI_KEY_PRESS_MIN 0x01
>> +#define XIAOMI_KEY_PRESS_MAX 0x05
>> +#define XIAOMI_KEY_RELEASE_OFF 0x05
> Ditto.
>
>> +
>> +#define XIAOMI_TOGGLE_DEDUP_MS 50
>> +
>> +struct xiaomi_wmi {
>> +	struct input_dev *input_dev;
>> +	unsigned long last_toggle;
>> +	u8 last_toggle_code;
>> +};
>> +
>> +static const struct key_entry xiaomi_wmi_keymap[] =3D {
>> +	/* type 0x02: programmable keys with abstract icons */
>> +	{ KE_KEY, 0x0201, { KEY_MACRO1 } },
>> +	{ KE_KEY, 0x0202, { KEY_MACRO2 } },
>> +	{ KE_KEY, 0x0203, { KEY_MACRO3 } },
>> +	{ KE_KEY, 0x0204, { KEY_MACRO4 } },
>> +	{ KE_KEY, 0x0205, { KEY_MACRO5 } },
>> +	/* type 0x03: firmware-handled toggles, reported for OSD only */
>> +	{ KE_KEY, 0x0300, { KEY_F21 } }, /* touchpad toggle */
> There is KEY_TOUCHPAD_TOGGLE.

If the touchpad is already being toggled by the firmware itself, when neit=
her
key code should be send to userspace. In this case the event should simply=
 be ignored.

Thanks,
Armin Wolf

>
>> +	{ KE_KEY, 0x0301, { KEY_FN_ESC } }, /* Fn lock */
> I'm not sure if KEY_FN_ESC is right key for it.
>
> And if these are handled by FW, shouldn't you use KEY_IGNORE?
>
> Since you've space, align the upper comment to the one below for better
> readability.
>
>> +	{ KE_END, 0 },
>> +};
>> +
>> +static int xiaomi_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
>> +{
>> +	struct xiaomi_wmi *data;
>> +	int ret;
>> +
>> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
>> +	if (!data)
>> +		return -ENOMEM;
>> +	dev_set_drvdata(&wdev->dev, data);
>> +
>> +	data->input_dev =3D devm_input_allocate_device(&wdev->dev);
>> +	if (!data->input_dev)
>> +		return -ENOMEM;
>> +
>> +	data->input_dev->name =3D "Xiaomi WMI keys";
>> +	data->input_dev->phys =3D "wmi/input0";
>> +	data->input_dev->id.bustype =3D BUS_HOST;
>> +
>> +	ret =3D sparse_keymap_setup(data->input_dev, xiaomi_wmi_keymap, NULL)=
;
> Please add select INPUT_SPARSEKMAP.
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	return input_register_device(data->input_dev);
>> +}
>> +
>> +static void xiaomi_wmi_notify(struct wmi_device *wdev, union acpi_obje=
ct *obj)
>> +{
>> +	struct xiaomi_wmi *data =3D dev_get_drvdata(&wdev->dev);
>> +	u8 type, code;
>> +
>> +	if (obj->type !=3D ACPI_TYPE_BUFFER || obj->buffer.length < 3)
>> +		return;
>> +
>> +	type =3D obj->buffer.pointer[1];
>> +	code =3D obj->buffer.pointer[2];
>> +
>> +	switch (type) {
>> +	case XIAOMI_TYPE_KEY:
>> +		if (code >=3D XIAOMI_KEY_PRESS_MIN &&
>> +		    code <=3D XIAOMI_KEY_PRESS_MAX) {
>> +			sparse_keymap_report_event(data->input_dev,
>> +						   0x0200 | code, 1, false);
> Please name literals.
>
>> +		} else if (code > XIAOMI_KEY_PRESS_MAX &&
>> +						code <=3D XIAOMI_KEY_PRESS_MAX +
>> +							XIAOMI_KEY_RELEASE_OFF) {
> Please align properly.
>
> I think the defines are not optional as you seem to have two blocks of
> codes, both with n length, one doing press and the other release but you=
r
> defines are not based one the code blocks being of same length.
>
>> +			code -=3D XIAOMI_KEY_RELEASE_OFF;
>> +			sparse_keymap_report_event(data->input_dev,
>> +						   0x0200 | code, 0, false);
>> +		}
>> +		break;
>> +
>> +	case XIAOMI_TYPE_TOGGLE:
>> +		/* deduplicate: each press emits two identical events */
>> +		if (data->last_toggle_code =3D=3D code &&
>> +		    time_before(jiffies, data->last_toggle +
> Is ->last_toggle initialized to a sensible value?
> (found by sashiko.dev)
>
>> +				msecs_to_jiffies(XIAOMI_TOGGLE_DEDUP_MS)))
>> +			return;
>> +		data->last_toggle_code =3D code;
>> +		data->last_toggle =3D jiffies;
> Locking needed?
>
> Is it guaranteed that the duplicates are always in-order, that is, not t=
wo
> different toggles can get interleaved?
>
>> +		sparse_keymap_report_event(data->input_dev,
>> +					   0x0300 | code, 1, true);
>> +		break;
>> +
>> +	case XIAOMI_TYPE_BACKLIGHT:
>> +		/* keyboard backlight handled by EC, nothing to do */
>> +		break;
>> +
>> +	default:
>> +		dev_dbg(&wdev->dev, "unknown event type 0x%02x\n", type);
> Add include.
>
>> +		break;
>> +	}
>> +}
>> +
>> +static const struct wmi_device_id xiaomi_wmi_id_table[] =3D {
>> +	{ .guid_string =3D XIAOMI_WMI_EVENT_GUID },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, xiaomi_wmi_id_table);
>> +
>> +static struct wmi_driver xiaomi_wmi_driver =3D {
>> +	.driver =3D {
>> +		.name =3D "xiaomi-wmi-keys",
>> +	},
>> +	.id_table =3D xiaomi_wmi_id_table,
>> +	.probe =3D xiaomi_wmi_probe,
>> +	.notify =3D xiaomi_wmi_notify,
> We're transitioning wmi core, so please convert to .notify_new.
>
> You may also consider using .min_event_size.

Correct, take a look at Documentation/wmi/driver-development-guide.rst for=
 details.

Thanks,
Armin Wolf

>
>> +	.no_singleton =3D true,
>> +};
>> +module_wmi_driver(xiaomi_wmi_driver);
>> +
>> +MODULE_AUTHOR("Lucy Wong <lucywong2778@gmail.com>");
>> +MODULE_DESCRIPTION("Xiaomi laptop WMI hotkey driver");
>> +MODULE_LICENSE("GPL");
>>
