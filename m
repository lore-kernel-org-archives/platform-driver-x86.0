Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64DF2E414;
	Fri,  3 Jul 2026 17:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101594; cv=none; b=cO/o60c+kYTXde6rcTh1YzzkSGNO7qetcnTHBr6ooeqGTg5DKOXzydHlHIcMNKDe28rcMPjmJ2R187T7B5zatpNPjf58BuGnEXt1YE0dGXpsFHOZXnCVfsqtkvF4UEga9EDskOSyGFA6HCLZWajqAwz4zR1GHqQ19vLqEiBB/Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101594; c=relaxed/simple;
	bh=EvvBP7VU8uhT9/e0AO0ckqrx+kTBm2IQTxJyu02sukk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkSnzDoJBkIJ6uFQw3W1eXTACIImsoYmG1k60YkSTc32fNqRewROOyuYYIpzBXI0jHvPqOgGdRegt4iBSD8F5q3rDmJylhWfIDer0fZ6YkgGTD20jcMbOYmez23q3j4VGBgcVQ8Nhv0wXpY9YLiGFkLM1zFB2bJOEN8qnkvU57I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bpzPTXFX; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bpzPTXFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783101571; x=1783706371; i=w_armin@gmx.de;
	bh=XIZUOJBBZTyCxK4j5LOZdqWrGjeoQKuH5wpJGGaSVtQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bpzPTXFX4c6vwlHECoOyov5RIRGH3T4OBpTMWaGo1W34Kj480MrJQGG32lkr7kN+
	 dGZE4GBf0+AtKR7tVBbV6V/wIjoXbrR7ya0yka9LWeUCZkphejoa35Ew/4q5ZeFPW
	 K7R3LHu2Wx/NaQSYTWrlmynN8JWSSesfOFJO8jOHaY+XWQbcvWFmbj4PSm0X3J4zQ
	 h/fY14yLQtohE/D+iQWtcM4qKL+XBLpjpEESg6jzMP6u7Ur0HGPdOQCyJUUbNC7+S
	 T9g69ohTuUhTIX6Fwe6RwQPivC9wU5mivXAaWcdcGJg510nPdVttrCBzG/BCf4s9o
	 4X0riryxqBj4quZr5w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysVs-1x0wFt1K6M-0186Ao; Fri, 03
 Jul 2026 19:59:31 +0200
Message-ID: <3066402f-c26d-45bd-8144-ab9fc3e82e7b@gmx.de>
Date: Fri, 3 Jul 2026 19:59:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] platform/x86: lg-laptop: Add support for native ACPI
 events
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: matan@svgalib.org, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260622193914.116999-1-W_Armin@gmx.de>
 <20260622193914.116999-3-W_Armin@gmx.de>
 <4a2d4268-f771-0286-81d2-d38a708b7025@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <4a2d4268-f771-0286-81d2-d38a708b7025@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uQJxgXmv+l5cdlNaudBax8EuapcpkQ2TQ4MjbF7T7YHNINHLgqX
 2Yb2OffCPcA/n4gm5x2yrrWiatuVORNOCYDLPoBIyWZ7ocuhVDjpc4iDlu4qxGe4EZ8b2MK
 G3+MK+Cys6dCaVU/gCLgEcZ1BAAGssyS5CaPpWJIvdFAnmfGr28iFBUOs+B5uY2xHMmfvFP
 OBPryB6glO4V5TY6+nyiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cKxOB8oO5YY=;fidDzb9TSWdA5NIoV7oIeTr8MTY
 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
 Hu0zSp29hPorUnyJ8wUEntBNE3dGnsFDVqCxiee

Am 03.07.26 um 15:14 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 22 Jun 2026, Armin Wolf wrote:
>
>> LG devices support two interfaces for receiving events:
>> - the WMI-based interface currently being used by the driver
>> - a ACPI-based interface similar to the WMI-based interface
>>
>> Older devices use the WMI-based interface by default and need
>> to be manually switched into ACPI mode. Newer devices however
>> only support the ACPI-based interface, preventing the current
>> driver from receiving events on them.
>>
>> Fix this by always using the native ACPI-based interface for
>> receiving events.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/Kconfig     |   1 -
>>   drivers/platform/x86/lg-laptop.c | 301 ++++++++++++++++++++----------=
-
>>   2 files changed, 199 insertions(+), 103 deletions(-)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
>> index b54b5212b204..957034f39e4e 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -802,7 +802,6 @@ config LG_LAPTOP
>>   	tristate "LG Laptop Extras"
>>   	depends on ACPI
>>   	depends on ACPI_BATTERY
>> -	depends on ACPI_WMI
>>   	depends on INPUT
>>   	select INPUT_SPARSEKMAP
>>   	select NEW_LEDS
>> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg=
-laptop.c
>> index a2db9657027e..ead0c3cc74a8 100644
>> --- a/drivers/platform/x86/lg-laptop.c
>> +++ b/drivers/platform/x86/lg-laptop.c
>> @@ -57,13 +57,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firm=
ware debug messages");
>>   #define LG_ADDRESS_SPACE_DEBUG_MSG_START_ADR	0x3E8
>>   #define LG_ADDRESS_SPACE_DEBUG_MSG_END_ADR	0x5E8
>>  =20
>> -#define WMI_EVENT_GUID0	"E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
>> -#define WMI_EVENT_GUID1	"023B133E-49D1-4E10-B313-698220140DC2"
>> -#define WMI_EVENT_GUID2	"37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6"
>> -#define WMI_EVENT_GUID3	"911BAD44-7DF8-4FBB-9319-BABA1C4B293B"
>> -#define WMI_METHOD_WMAB "C3A72B38-D3EF-42D3-8CBB-D5A57049F66D"
>> -#define WMI_METHOD_WMBB "2B4F501A-BD3C-4394-8DCF-00A7D2BC8210"
>> -#define WMI_EVENT_GUID  WMI_EVENT_GUID0
>> +#define LG_NOTIFY_TABLET_MODE_OFF	0x50
>> +#define LG_NOTIFY_TABLET_MODE_ON	0x51
>> +#define LG_NOTIFY_HOTKEY		0x80
>> +#define LG_NOTIFY_THERMAL		0x81
>> +#define LG_NOTIFY_MISC			0x82
>> +
>> +#define LG_OREP_READ_EC			0
>> +#define LG_OREP_WRITE_EC		1
>> +#define LG_OREP_DEBUG			2
>> +#define LG_OREP_UPDATE_SYSTEM_STATE	3
>> +#define LG_OREP_INTERCEPT_WMI_EVENTS	4
>> +#define LG_OREP_WAKE_ON_LAN		6
>>  =20
>>   #define SB_GGOV_METHOD  "\\_SB.GGOV"
>>   #define GOV_TLED        0x2020008
>> @@ -83,21 +88,7 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmw=
are debug messages");
>>  =20
>>   #define PLATFORM_NAME   "lg-laptop"
>>  =20
>> -MODULE_ALIAS("wmi:" WMI_EVENT_GUID0);
>> -MODULE_ALIAS("wmi:" WMI_EVENT_GUID1);
>> -MODULE_ALIAS("wmi:" WMI_EVENT_GUID2);
>> -MODULE_ALIAS("wmi:" WMI_EVENT_GUID3);
>> -MODULE_ALIAS("wmi:" WMI_METHOD_WMAB);
>> -MODULE_ALIAS("wmi:" WMI_METHOD_WMBB);
>> -
>>   static struct platform_device *pf_device;
>> -static struct input_dev *wmi_input_dev;
>> -
>> -static u32 inited;
>> -#define INIT_INPUT_WMI_0        0x01
>> -#define INIT_INPUT_WMI_2        0x02
>> -#define INIT_INPUT_ACPI         0x04
>> -#define INIT_SPARSE_KEYMAP      0x80
>>  =20
>>   static int battery_limit_use_wmbb;
>>   static bool kbd_backlight_available;
>> @@ -115,6 +106,36 @@ static const struct key_entry wmi_keymap[] =3D {
>>   	{KE_END, 0}
>>   };
>>  =20
>> +static int lg_laptop_execute_orep(acpi_handle handle, u64 command, u64=
 value,
>> +				  unsigned long long *result)
>> +{
>> +	union acpi_object objs[] =3D {
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D command,
>> +			},
>> +		},
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D value,
>> +			},
>> +		}
>> +	};
>> +	struct acpi_object_list args =3D {
>> +		.count =3D ARRAY_SIZE(objs),
>> +		.pointer =3D objs,
>> +	};
>> +	acpi_status status;
>> +
>> +	status =3D acpi_evaluate_integer(handle, "OREP", &args, result);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	return 0;
>> +}
>> +
>>   static int ggov(u32 arg0)
>>   {
>>   	union acpi_object args[1];
>> @@ -212,70 +233,6 @@ static union acpi_object *lg_wmbb(struct device *d=
ev, u32 method_id, u32 arg1, u
>>   	return (union acpi_object *)buffer.pointer;
>>   }
>>  =20
>> -static void wmi_notify(union acpi_object *obj, void *context)
>> -{
>> -	long data =3D (long)context;
>> -	unsigned int brightness;
>> -
>> -	pr_debug("event guid %li\n", data);
>> -	if (!obj)
>> -		return;
>> -
>> -	if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
>> -		int eventcode =3D obj->integer.value;
>> -		struct key_entry *key;
>> -
>> -		if (eventcode =3D=3D 0x10000000) {
>> -			if (kbd_backlight_available) {
>> -				brightness =3D get_kbd_backlight_level(kbd_backlight.dev->parent);
>> -				led_classdev_notify_brightness_hw_changed(&kbd_backlight,
>> -									  brightness);
>> -			}
>> -		} else {
>> -			key =3D sparse_keymap_entry_from_scancode(
>> -				wmi_input_dev, eventcode);
>> -			if (key && key->type =3D=3D KE_KEY)
>> -				sparse_keymap_report_entry(wmi_input_dev,
>> -							   key, 1, true);
>> -		}
>> -	}
>> -
>> -	pr_debug("Type: %i    Eventcode: 0x%llx\n", obj->type,
>> -		 obj->integer.value);
>> -}
>> -
>> -static void wmi_input_setup(void)
>> -{
>> -	acpi_status status;
>> -
>> -	wmi_input_dev =3D input_allocate_device();
>> -	if (wmi_input_dev) {
>> -		wmi_input_dev->name =3D "LG WMI hotkeys";
>> -		wmi_input_dev->phys =3D "wmi/input0";
>> -		wmi_input_dev->id.bustype =3D BUS_HOST;
>> -
>> -		if (sparse_keymap_setup(wmi_input_dev, wmi_keymap, NULL) ||
>> -		    input_register_device(wmi_input_dev)) {
>> -			pr_info("Cannot initialize input device");
>> -			input_free_device(wmi_input_dev);
>> -			return;
>> -		}
>> -
>> -		inited |=3D INIT_SPARSE_KEYMAP;
>> -		status =3D wmi_install_notify_handler(WMI_EVENT_GUID0, wmi_notify,
>> -						    (void *)0);
>> -		if (ACPI_SUCCESS(status))
>> -			inited |=3D INIT_INPUT_WMI_0;
>> -
>> -		status =3D wmi_install_notify_handler(WMI_EVENT_GUID2, wmi_notify,
>> -						    (void *)2);
>> -		if (ACPI_SUCCESS(status))
>> -			inited |=3D INIT_INPUT_WMI_2;
>> -	} else {
>> -		pr_info("Cannot allocate input device");
>> -	}
>> -}
>> -
>>   static ssize_t fan_mode_store(struct device *dev,
>>   			      struct device_attribute *attr,
>>   			      const char *buffer, size_t count)
>> @@ -634,26 +591,164 @@ static enum led_brightness kbd_backlight_get(str=
uct led_classdev *cdev)
>>  =20
>>   static LED_DEVICE(kbd_backlight, 255, LED_BRIGHT_HW_CHANGED);
>>  =20
>> -static void wmi_input_destroy(void)
>> +static struct platform_driver pf_driver =3D {
>> +	.driver =3D {
>> +		   .name =3D PLATFORM_NAME,
>> +	}
>> +};
>> +
>> +static int lg_laptop_get_event_data(acpi_handle handle, u32 value, u32=
 *data)
>>   {
>> -	if (inited & INIT_INPUT_WMI_2)
>> -		wmi_remove_notify_handler(WMI_EVENT_GUID2);
>> +	union acpi_object objs[] =3D {
>> +		{
>> +			.integer =3D {
>> +				.type =3D ACPI_TYPE_INTEGER,
>> +				.value =3D value,
>> +			},
>> +		}
>> +	};
>> +	struct acpi_object_list args =3D {
>> +		.count =3D ARRAY_SIZE(objs),
> Add the include.

ok

>> +		.pointer =3D objs,
>> +	};
>> +	unsigned long long result;
>> +	acpi_status status;
>> +
>> +	status =3D acpi_evaluate_integer(handle, "_WED", &args, &result);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>>  =20
>> -	if (inited & INIT_INPUT_WMI_0)
>> -		wmi_remove_notify_handler(WMI_EVENT_GUID0);
>> +	if (result > U32_MAX)
> Add include.

ok

>> +		return -EPROTO;
>>  =20
>> -	if (inited & INIT_SPARSE_KEYMAP)
>> -		input_unregister_device(wmi_input_dev);
>> +	*data =3D result;
>>  =20
>> -	inited &=3D ~(INIT_INPUT_WMI_0 | INIT_INPUT_WMI_2 | INIT_SPARSE_KEYMA=
P);
>> +	return 0;
>>   }
>>  =20
>> -static struct platform_driver pf_driver =3D {
>> -	.driver =3D {
>> -		   .name =3D PLATFORM_NAME,
>> +static void lg_laptop_handle_input_event(struct input_dev *input_dev, =
u32 value, u32 data)
>> +{
>> +	unsigned int kbd_brightness;
>> +
>> +	switch (value) {
>> +	case LG_NOTIFY_HOTKEY:
>> +		sparse_keymap_report_event(input_dev, data, 1, true);
>> +		break;
>> +	case LG_NOTIFY_THERMAL:
>> +		/* Currently not supported */
>> +		break;
>> +	case LG_NOTIFY_MISC:
>> +		switch (data) {
>> +		case 0x10000000:
>> +			if (!kbd_backlight_available)
>> +				break;
>> +
>> +			kbd_brightness =3D get_kbd_backlight_level(kbd_backlight.dev->paren=
t);
>> +			led_classdev_notify_brightness_hw_changed(&kbd_backlight, kbd_brigh=
tness);
>> +			break;
>> +		default:
>> +			sparse_keymap_report_event(input_dev, data, 1, true);
>> +		}
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static void lg_laptop_notify_handler(acpi_handle handle, u32 value, vo=
id *context)
>> +{
>> +	struct input_dev *input_dev =3D context;
>> +	u32 data;
>> +	int ret;
>> +
>> +	switch (value) {
>> +	case LG_NOTIFY_TABLET_MODE_OFF:
>> +	case LG_NOTIFY_TABLET_MODE_ON:
>> +		/* Already handled by intel-hid */
>> +		return;
>> +	case LG_NOTIFY_HOTKEY:
>> +	case LG_NOTIFY_THERMAL:
>> +	case LG_NOTIFY_MISC:
>> +		ret =3D lg_laptop_get_event_data(handle, value, &data);
>> +		if (ret < 0) {
>> +			dev_notice(input_dev->dev.parent, "Failed to get event data: %d\n",=
 ret);
>> +			return;
>> +		}
>> +
>> +		dev_dbg(input_dev->dev.parent, "Received event %u (%u)\n", value, da=
ta);
>> +
>> +		lg_laptop_handle_input_event(input_dev, value, data);
>> +		return;
>> +	default:
>> +		dev_notice(input_dev->dev.parent, "Received unknown event %u\n", val=
ue);
>>   	}
>>   };
>>  =20
>> +static void lg_laptop_remove_notify_handler(void *context)
>> +{
>> +	acpi_handle handle =3D context;
>> +
>> +	acpi_remove_notify_handler(handle, ACPI_ALL_NOTIFY, lg_laptop_notify_=
handler);
>> +}
>> +
>> +static void lg_laptop_reenable_wmi_events(void *context)
>> +{
>> +	acpi_handle handle =3D context;
>> +	unsigned long long dummy;
>> +
>> +	lg_laptop_execute_orep(handle, LG_OREP_INTERCEPT_WMI_EVENTS, 0, &dumm=
y);
>> +}
>> +
>> +static int lg_laptop_input_init(struct device *dev, acpi_handle handle=
)
>> +{
>> +	struct input_dev *input_dev;
>> +	unsigned long long result;
>> +	acpi_status status;
>> +	int ret;
>> +
>> +	if (!acpi_has_method(handle, "_WED"))
>> +		return 0;
>> +
>> +	input_dev =3D devm_input_allocate_device(dev);
>> +	if (!input_dev)
>> +		return -ENOMEM;
>> +
>> +	input_dev->name =3D "LG WMI hotkeys";
>> +	input_dev->phys =3D "wmi/input0";
>> +	input_dev->id.bustype =3D BUS_HOST;
>> +	ret =3D sparse_keymap_setup(input_dev, wmi_keymap, NULL);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret =3D input_register_device(input_dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	status =3D acpi_install_notify_handler(handle, ACPI_ALL_NOTIFY, lg_la=
ptop_notify_handler,
>> +					     input_dev);
>> +	if (ACPI_FAILURE(status))
>> +		return -EIO;
>> +
>> +	ret =3D devm_add_action_or_reset(dev, lg_laptop_remove_notify_handler=
, handle);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (acpi_has_method(handle, "OREP")) {
>> +		ret =3D lg_laptop_execute_orep(handle, LG_OREP_INTERCEPT_WMI_EVENTS,=
 1, &result);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		if (result)
> This still looks to be part of the error handling so please remove the
> blank line before it.

Personally i would prefer to keep the blank line because i think it looks =
cleaner having
one after a "simple" if statement.

>> +			return -EIO;
>> +
>> +		ret =3D devm_add_action_or_reset(dev, lg_laptop_reenable_wmi_events,=
 handle);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static acpi_status lg_laptop_address_space_write(struct device *dev, =
acpi_physical_address address,
>>   						 size_t size, u64 value)
>>   {
>> @@ -865,10 +960,6 @@ static int acpi_probe(struct platform_device *pdev=
)
>>   	if (year >=3D 2019)
>>   		battery_limit_use_wmbb =3D 1;
>>  =20
>> -	ret =3D sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group=
);
>> -	if (ret)
>> -		goto out_platform_device;
>> -
>>   	/* LEDs are optional */
>>   	ret =3D devm_led_classdev_register(&pdev->dev, &kbd_backlight);
>>   	if (ret < 0)
>> @@ -878,7 +969,14 @@ static int acpi_probe(struct platform_device *pdev=
)
>>  =20
>>   	devm_led_classdev_register(&pdev->dev, &tpad_led);
>>  =20
>> -	wmi_input_setup();
>> +	ret =3D lg_laptop_input_init(&pdev->dev, device->handle);
>> +	if (ret < 0)
>> +		goto out_platform_device;
>> +
>> +	ret =3D sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group=
);
>> +	if (ret)
>> +		goto out_platform_device;
> Not directly related to the patch, but can't .dev_groups be used?

Theoretically yes, but this is something i leave to the driver maintainer.=
 I only
handle this because i already handled the original issue on bugzilla.

Thanks,
Armin Wolf

>>   	battery_hook_register(&battery_hook);
>>  =20
>>   	return 0;
>> @@ -895,7 +993,6 @@ static void acpi_remove(struct platform_device *pde=
v)
>>   	sysfs_remove_group(&pf_device->dev.kobj, &dev_attribute_group);
>>  =20
>>   	battery_hook_unregister(&battery_hook);
>> -	wmi_input_destroy();
>>   	platform_device_unregister(pf_device);
>>   	pf_device =3D NULL;
>>   	platform_driver_unregister(&pf_driver);
>>
