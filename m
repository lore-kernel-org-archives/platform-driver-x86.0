Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CEE449EA0;
	Tue,  1 Sep 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293562; cv=none; b=CANRDM8qb5/j22v9ADKPJRoAuTCos8s90gS0Xv15T3HBg1K5ffdPqVKSlddU3S8ZutJz/7rJjtsg7xPaISqrGj2PXneOJ43X1nC5hEWZySiVjmGtZJ0rL2Vf1/DIDc4AAMfSZ10ipP50Qsj1hIFXGLVgMtSUGBi5DvRQp7FSGck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293562; c=relaxed/simple;
	bh=WGDcIqC9YZCwTXMxV/CMqm6lqiN6CY6N8EEPLtkfROM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=McDt5ed5B8xVccJyU/XURkVGlR2vAw+o40zbyiARvRRP473G6ldc7vhf9rMBFYpTcWIfuur0Fvp3QU8caXB7IA3iJjrc1TZs+l1EZqCqP2XvBVhtuHlKqLyQsrA0HoaTuatm/8v8tsvFF/NsUBF+rSyzjQ/uB8dCjteO+NDRmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ss19GUoE; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ss19GUoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788293554; x=1788898354; i=w_armin@gmx.de;
	bh=0X748LLf/aqouQeTg5VwxKQ9/4CaDc1Y9yOgvzvycig=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ss19GUoEGUfcjfKvsIegSn3+0Qtif0H2JoRfUzxdPGKMmtP4MXNFQG9W6smT4vII
	 xaePsUhXatmFRp7d3SNjFnh3OUV1VKWBH7wW2hoo8Dk/sznQSl0syu+TdR3sc8oZK
	 MSKtZLYa4RARfQJ9oc2PeKC6yMGczKdw2M3in2fx5dfHHVlRTHpI7+mb7Fsu1LDMd
	 ipI+akpZa5AlSI2pHuwWXl3Mj/G0yA81oP9ZO9bAVueUmHV673IK5XVDZYWoekB9V
	 DetYuUnuvhwZargkH8sFQIW79UQagiHhMMtdOBqtDzbeFaHjuLH6FHMgJF3OFtPqh
	 AKL/C8OrtHBH3t5P0w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1My36N-1wfyY92iY3-00quam; Tue, 01
 Sep 2026 22:12:34 +0200
Message-ID: <f6a8e582-3d93-4102-b87e-e4cffb61e470@gmx.de>
Date: Tue, 1 Sep 2026 22:12:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-wmi-aio: Convert to use the bus-based
 WMI API
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802124530.7116-1-W_Armin@gmx.de>
Content-Language: en-US
In-Reply-To: <20260802124530.7116-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TAKZ/zAr7EwBtAAe25R98eA9wINh4G6mqnqtpHvy9EybF2jStyq
 bS9817UE/9YMQ7AZtlcAdrdMQoaqY9OZxBLpRAtaAXhRZde0QNC0goo1YtMLqFDE8AT0JUe
 2ClkOuP2+lKRDO22USB9W5BDmxEyaG2IIMTcxvwS1iFgARsES4AExnqZSePIuHCUtwYc7+3
 Y/Ya3d2ikvLxCO61t6TDA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ExiLM9CAfLk=;Kp0/aINBPHQflOZAjs+NkOEOz2l
 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

Am 02.08.26 um 14:45 schrieb Armin Wolf:

> It turns out that some devices like the Dell Inspiron One 2310
> contain multiple WMI event devices with a matching GUID of
> 284A0E6B-380E-472A-921F-E52786257FB4, each handling a separate
> hotkey (volume up, volume down, ...). The dell-wmi-aio driver
> however still uses the legacy GUID-based WMI API and can thus
> only see the first of those WMI event devices, preventing the
> remaining buttons from working.
>
> Fix this by converting the driver to use the modern bus-based
> WMI API. This also includes replacing the usage of
> union acpi_object with struct wmi_buffer.
>
> Tested using the ACPI-WMI ASL code from the Dell Inspiron One 2310
> together with some changes to allow injecting events.

Any thoughts on this?

> Link: https://linux-hardware.org/?probe=3De86d77e44d
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/dell/dell-wmi-aio.c | 198 +++++++++--------------
>   1 file changed, 78 insertions(+), 120 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/dell-wmi-aio.c b/drivers/platform=
/x86/dell/dell-wmi-aio.c
> index 54096495719b..8849ad93480b 100644
> --- a/drivers/platform/x86/dell/dell-wmi-aio.c
> +++ b/drivers/platform/x86/dell/dell-wmi-aio.c
> @@ -5,14 +5,20 @@
>  =20
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  =20
> +#include <linux/cleanup.h>
> +#include <linux/compiler_attributes.h>
> +#include <linux/device.h>
> +#include <linux/device/driver.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/overflow.h>
>   #include <linux/init.h>
>   #include <linux/types.h>
>   #include <linux/input.h>
>   #include <linux/input/sparse-keymap.h>
> -#include <linux/acpi.h>
>   #include <linux/string.h>
> +#include <linux/wmi.h>
>  =20
>   MODULE_DESCRIPTION("WMI hotkeys driver for Dell All-In-One series");
>   MODULE_LICENSE("GPL");
> @@ -20,22 +26,19 @@ MODULE_LICENSE("GPL");
>   #define EVENT_GUID1 "284A0E6B-380E-472A-921F-E52786257FB4"
>   #define EVENT_GUID2 "02314822-307C-4F66-BF0E-48AEAEB26CC8"
>  =20
> +struct dell_wmi_aio_data {
> +	struct input_dev *input_device;
> +	/* Protects the input sequence */
> +	struct mutex input_lock;
> +};
> +
>   struct dell_wmi_event {
> -	u16	length;
> +	__le16	length;
>   	/* 0x000: A hot key pressed or an event occurred
>   	 * 0x00F: A sequence of hot keys are pressed */
> -	u16	type;
> -	u16	event[];
> -};
> -
> -static const char *dell_wmi_aio_guids[] =3D {
> -	EVENT_GUID1,
> -	EVENT_GUID2,
> -	NULL
> -};
> -
> -MODULE_ALIAS("wmi:"EVENT_GUID1);
> -MODULE_ALIAS("wmi:"EVENT_GUID2);
> +	__le16	type;
> +	__le16	event[];
> +} __packed;
>  =20
>   static const struct key_entry dell_wmi_aio_keymap[] =3D {
>   	{ KE_KEY, 0xc0, { KEY_VOLUMEUP } },
> @@ -50,137 +53,92 @@ static const struct key_entry dell_wmi_aio_keymap[]=
 =3D {
>   	{ KE_END, 0 }
>   };
>  =20
> -static struct input_dev *dell_wmi_aio_input_dev;
> -
>   /*
>    * The new WMI event data format will follow the dell_wmi_event struct=
ure
>    * So, we will check if the buffer matches the format
>    */
> -static bool dell_wmi_aio_event_check(u8 *buffer, int length)
> +static bool dell_wmi_aio_event_check(const struct wmi_buffer *buffer)
>   {
> -	struct dell_wmi_event *event =3D (struct dell_wmi_event *)buffer;
> +	struct dell_wmi_event *event;
> +	u16 length, type;
>  =20
> -	if (event =3D=3D NULL || length < 6)
> +	if (buffer->length < struct_size(event, event, 1))
>   		return false;
>  =20
> -	if ((event->type =3D=3D 0 || event->type =3D=3D 0xf) &&
> -			event->length >=3D 2)
> +	event =3D buffer->data;
> +	length =3D le16_to_cpu(event->length);
> +	type =3D le16_to_cpu(event->type);
> +	if ((type =3D=3D 0 || type =3D=3D 0xf) && length >=3D 2)
>   		return true;
>  =20
>   	return false;
>   }
>  =20
> -static void dell_wmi_aio_notify(union acpi_object *obj, void *context)
> +static void dell_wmi_aio_notify(struct wmi_device *wdev, const struct w=
mi_buffer *data)
>   {
> -	struct dell_wmi_event *event;
> -
> -	if (obj) {
> -		unsigned int scancode =3D 0;
> -
> -		switch (obj->type) {
> -		case ACPI_TYPE_INTEGER:
> -			/* Most All-In-One correctly return integer scancode */
> -			scancode =3D obj->integer.value;
> -			sparse_keymap_report_event(dell_wmi_aio_input_dev,
> -				scancode, 1, true);
> -			break;
> -		case ACPI_TYPE_BUFFER:
> -			if (dell_wmi_aio_event_check(obj->buffer.pointer,
> -						obj->buffer.length)) {
> -				event =3D (struct dell_wmi_event *)
> -					obj->buffer.pointer;
> -				scancode =3D event->event[0];
> -			} else {
> -				/* Broken machines return the scancode in a
> -				   buffer */
> -				if (obj->buffer.pointer &&
> -						obj->buffer.length > 0)
> -					scancode =3D obj->buffer.pointer[0];
> -			}
> -			if (scancode)
> -				sparse_keymap_report_event(
> -					dell_wmi_aio_input_dev,
> -					scancode, 1, true);
> -			break;
> -		}
> -	}
> -}
> -
> -static int __init dell_wmi_aio_input_setup(void)
> -{
> -	int err;
> -
> -	dell_wmi_aio_input_dev =3D input_allocate_device();
> -
> -	if (!dell_wmi_aio_input_dev)
> -		return -ENOMEM;
> -
> -	dell_wmi_aio_input_dev->name =3D "Dell AIO WMI hotkeys";
> -	dell_wmi_aio_input_dev->phys =3D "wmi/input0";
> -	dell_wmi_aio_input_dev->id.bustype =3D BUS_HOST;
> -
> -	err =3D sparse_keymap_setup(dell_wmi_aio_input_dev,
> -			dell_wmi_aio_keymap, NULL);
> -	if (err) {
> -		pr_err("Unable to setup input device keymap\n");
> -		goto err_free_dev;
> -	}
> -	err =3D input_register_device(dell_wmi_aio_input_dev);
> -	if (err) {
> -		pr_info("Unable to register input device\n");
> -		goto err_free_dev;
> +	struct dell_wmi_aio_data *drvdata =3D dev_get_drvdata(&wdev->dev);
> +	const struct dell_wmi_event *new_event;
> +	unsigned int scancode;
> +	const u8 *old_event;
> +
> +	if (dell_wmi_aio_event_check(data)) {
> +		new_event =3D data->data;
> +		scancode =3D le16_to_cpu(new_event->event[0]);
> +	} else {
> +		old_event =3D data->data;
> +		scancode =3D old_event[0];
>   	}
> -	return 0;
> -
> -err_free_dev:
> -	input_free_device(dell_wmi_aio_input_dev);
> -	return err;
> -}
> -
> -static const char *dell_wmi_aio_find(void)
> -{
> -	int i;
>  =20
> -	for (i =3D 0; dell_wmi_aio_guids[i] !=3D NULL; i++)
> -		if (wmi_has_guid(dell_wmi_aio_guids[i]))
> -			return dell_wmi_aio_guids[i];
> +	guard(mutex)(&drvdata->input_lock);
>  =20
> -	return NULL;
> +	sparse_keymap_report_event(drvdata->input_device, scancode, 1, true);
>   }
>  =20
> -static int __init dell_wmi_aio_init(void)
> +static int dell_wmi_aio_probe(struct wmi_device *wdev, const void *cont=
ext)
>   {
> -	int err;
> -	const char *guid;
> +	struct dell_wmi_aio_data *data;
> +	int ret;
>  =20
> -	guid =3D dell_wmi_aio_find();
> -	if (!guid) {
> -		pr_warn("No known WMI GUID found\n");
> -		return -ENXIO;
> -	}
> +	data =3D devm_kzalloc(&wdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
>  =20
> -	err =3D dell_wmi_aio_input_setup();
> -	if (err)
> -		return err;
> +	dev_set_drvdata(&wdev->dev, data);
> +	ret =3D devm_mutex_init(&wdev->dev, &data->input_lock);
> +	if (ret < 0)
> +		return ret;
>  =20
> -	err =3D wmi_install_notify_handler(guid, dell_wmi_aio_notify, NULL);
> -	if (err) {
> -		pr_err("Unable to register notify handler - %d\n", err);
> -		input_unregister_device(dell_wmi_aio_input_dev);
> -		return err;
> -	}
> +	data->input_device =3D devm_input_allocate_device(&wdev->dev);
> +	if (!data->input_device)
> +		return -ENOMEM;
>  =20
> -	return 0;
> -}
> +	data->input_device->name =3D "Dell AIO WMI hotkeys";
> +	data->input_device->phys =3D "wmi/input0";
> +	data->input_device->id.bustype =3D BUS_HOST;
>  =20
> -static void __exit dell_wmi_aio_exit(void)
> -{
> -	const char *guid;
> +	ret =3D sparse_keymap_setup(data->input_device, dell_wmi_aio_keymap, N=
ULL);
> +	if (ret < 0)
> +		return ret;
>  =20
> -	guid =3D dell_wmi_aio_find();
> -	wmi_remove_notify_handler(guid);
> -	input_unregister_device(dell_wmi_aio_input_dev);
> +	return input_register_device(data->input_device);
>   }
>  =20
> -module_init(dell_wmi_aio_init);
> -module_exit(dell_wmi_aio_exit);
> +static const struct wmi_device_id dell_wmi_aio_id_table[] =3D {
> +	{ EVENT_GUID1, NULL },
> +	{ EVENT_GUID2, NULL },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, dell_wmi_aio_id_table);
> +
> +static struct wmi_driver dell_wmi_aio_driver =3D {
> +	.driver =3D {
> +		.name =3D "dell-wmi-aio",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D dell_wmi_aio_id_table,
> +	.probe =3D dell_wmi_aio_probe,
> +	.notify_new =3D dell_wmi_aio_notify,
> +	.min_event_size =3D sizeof(u8),
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(dell_wmi_aio_driver);
