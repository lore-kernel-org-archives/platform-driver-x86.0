Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF753A6B78
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778663947; cv=none; b=ACCM3XEPEf7Kodghw2abY3dm1MOBLHa4O13gBdUCgqaAK8NdNmdgvGzH6f4JgVHIOepDO8nIYQfG6RgL+BjikbyLri+HPOOBBzqojCWVP34YXhOuNXziQwz++6Zg8243+IvJlk55T+3NbUcQWZ1+6Zc/IEUGZoMHIVewR1DWwak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778663947; c=relaxed/simple;
	bh=wug/KcyVGnJO5zx93Xock+FnM3aHsTQOpe8xiUPzyHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ssk4laY8P2tCSCk1V1FF5JV93sk76MlxRg1V2Z9rmBI1qhPxZqKcqskRSk7b9n1hFBXlFafY1CUWwKObcKtNzHpvSUsbB/pNhIXhpGL7QwsKc1wdjabmmt184VMXHf6SODzRniXOQ8MNVwANtWheEQMv2Lk4+kZAWLSnWvA9ENI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=awfHJlwJ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="awfHJlwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778663942; x=1779268742; i=w_armin@gmx.de;
	bh=wug/KcyVGnJO5zx93Xock+FnM3aHsTQOpe8xiUPzyHw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=awfHJlwJGdWNm6V/9BJ8P8+z6CNYPHkMBEoCG3hDkCQk6h7nd+eSdvbYJGeWt5Jt
	 Kp+NHkR7gW+HN7PSIE5W9jo6xoKOy6aDHvln7t09J3J6gnenA08GR8sHId1lsVF5o
	 CFOQgSOh5cBR2yZy+e1obeK94i8/g/cS8uPRTR60uLBjr4owqonXTxBjCJjeaBD7n
	 zCzmYj3uipD6dvKFjSPi1LlyMlhplzGrW7O9QI6EnIrogacfJQAqkkn7YV/9otByX
	 D06OfhNNawa8KU4ibQeOe1qG0y0QNj1+Lr3W/R10PH9PS9MYZwZ8w22AnUV0I+VOH
	 2EX9l9tzHGAjnb2gOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1wVvRm1Sue-00EKTH; Wed, 13
 May 2026 11:19:02 +0200
Message-ID: <dd1b5be8-530b-4dfc-ad80-ea5f298d9230@gmx.de>
Date: Wed, 13 May 2026 11:19:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: add Acer battery control driver
To: Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260125182314.735668-1-jelle@vdwaa.nl>
 <20260125182314.735668-2-jelle@vdwaa.nl>
 <ca22f9d8-7609-4023-956e-85687a5d5df6@gmx.de>
 <8bc77786-2126-4b68-b52a-b2c75a683223@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <8bc77786-2126-4b68-b52a-b2c75a683223@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RaYWpa/SV+u4VJpgI7lCer79bDLk9g6ObRiHcraGzM5e3X3ESqh
 5h6f37XfikwuPpkO9F3jvRAStH8W4G5qqEYxOVMoovQVIJzc7m0N5ZoQ6eV0CX7vA/QEtBu
 3DnbnVB9cjKxtQ5ZETcVJoJf6V2BAeoDCAyhaqz82ID+KpW/Y1CjGPcFRu5I1czHBHb7b6Q
 WKntGZkGb6YG1JzzVi/pQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:75SAkITfjj0=;qA9fXtZdYNQPwAAtG6nOHpDKTg6
 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
 5LqL6RhVwQ/oriod621e5cu3MMysLlwtTiBukgt

Am 10.05.26 um 20:48 schrieb Jelle van der Waa:
> On 1/31/26 00:24, Armin Wolf wrote:
>> Am 25.01.26 um 19:23 schrieb Jelle van der Waa:
>>
>>> Some Acer laptops can configure battery related features through Acer
>>> Care Center on Windows. This driver uses the power supply extension to
>>> set a battery charge limit and exposes the battery
>>> temperature.
>>>
>>> This driver is based on the existing acer-wmi-battery project on GitHu=
b
>>> and was tested on an Acer Aspire A315-510P.
>>>
>>> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>>>
>>> ---
>>> v2:
>>> - Alphabetically sort linux headers
>>> - Include headers for types / _packed
>>> - Use cleanup.h instead of goto + label
>>> - Add missing prefix for set_battery_health_control
>>> - General code formatting fixes
>>> - Remove HWMON dependency in Kconfig
>>> - Use wmidev_evaluate_method()
>>> - Accept oversized ACPI buffers
>>> - Use DRIVER_NAME for battery extension name
>>> - Set no_singleton =3D true
>>> - Implement DMI matching to support laptops with only battery
>>> =C2=A0=C2=A0 temperature support.
>>> ---
>>> =C2=A0 drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
>>> =C2=A0 drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/platform/x86/acer-wmi-battery.c | 355 +++++++++++++++++=
+++++++
>>> =C2=A0 3 files changed, 367 insertions(+)
>>> =C2=A0 create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index 4cb7d97a9fcc..88c11a698fb9 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -170,6 +170,17 @@ config ACER_WMI
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you have an ACPI-WMI com=
patible Acer/ Wistron laptop, say=20
>>> Y or M
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 here.
>>> +config ACER_WMI_BATTERY
>>> +=C2=A0=C2=A0=C2=A0 tristate "Acer WMI Battery"
>>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_WMI
>>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_BATTERY
>>
>> Please also depend on DMI so that dmi_check_system() will always be=20
>> available
>> when building this driver.
>>
>>> +=C2=A0=C2=A0=C2=A0 help
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a driver for Acer laptops with=
 battery health control. It
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adds charge limit control and battery =
temperature reporting.
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you have an ACPI-WMI Battery compat=
ible Acer laptop, say Y=20
>>> or M
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 here.
>>> +
>>> =C2=A0 source "drivers/platform/x86/amd/Kconfig"
>>> =C2=A0 config ADV_SWBUTTON
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/=20
>>> Makefile
>>> index d25762f7114f..9cf28baff3ae 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +=3D gigabyte-wmi.o
>>> =C2=A0 obj-$(CONFIG_ACERHDF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 +=3D acerhdf.o
>>> =C2=A0 obj-$(CONFIG_ACER_WIRELESS)=C2=A0=C2=A0=C2=A0 +=3D acer-wireles=
s.o
>>> =C2=A0 obj-$(CONFIG_ACER_WMI)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D acer-wmi.o
>>> +obj-$(CONFIG_ACER_WMI_BATTERY)=C2=A0=C2=A0=C2=A0 +=3D acer-wmi-batter=
y.o
>>> =C2=A0 # AMD
>>> =C2=A0 obj-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D amd/
>>> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/=20
>>> platform/x86/acer-wmi-battery.c
>>> new file mode 100644
>>> index 000000000000..abb45cfcc6fe
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/acer-wmi-battery.c
>>> @@ -0,0 +1,355 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * acer-wmi-battery.c: Acer battery health control driver
>>> + *
>>> + * This is a driver for the WMI battery health control interface foun=
d
>>> + * on some Acer laptops.=C2=A0 This interface allows to enable/disabl=
e a
>>> + * battery charge limit ("health mode") and exposes the battery=20
>>> temperature.
>>> + *
>>> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi-=
=20
>>> battery/
>>> + *
>>> + * Copyright (C) 2022-2025=C2=A0 Frederik Harwath <frederik@harwath.n=
ame>
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/compiler_attributes.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/init.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/limits.h>
>>> +#include <linux/module.h>
>>> +#include <linux/power_supply.h>
>>> +#include <linux/types.h>
>>> +#include <linux/unaligned.h>
>>> +#include <linux/version.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +#include <acpi/battery.h>
>>> +
>>> +#define DRIVER_NAME=C2=A0=C2=A0=C2=A0 "acer-wmi-battery"
>>> +
>>> +#define ACER_BATTERY_GUID "79772EC5-04B1-4BFD-843C-61E7F77B6CC9"
>>> +
>>> +/*
>>> + * The Acer OEM software seems to always use this battery index,
>>> + * so we emulate this behaviour to not confuse the underlying firmwar=
e.
>>> + *
>>> + * However this also means that we only fully support devices with a
>>> + * single battery for now.
>>> + */
>>> +#define ACER_BATTERY_INDEX=C2=A0=C2=A0=C2=A0 0x1
>>> +
>>> +struct get_battery_health_control_status_input {
>>> +=C2=A0=C2=A0=C2=A0 u8 uBatteryNo;
>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionQuery;
>>> +=C2=A0=C2=A0=C2=A0 u8 uReserved[2];
>>> +} __packed;
>>> +
>>> +struct get_battery_health_control_status_output {
>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionList;
>>> +=C2=A0=C2=A0=C2=A0 u8 uReturn[2];
>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionStatus[5];
>>> +} __packed;
>>> +
>>> +struct set_battery_health_control_input {
>>> +=C2=A0=C2=A0=C2=A0 u8 uBatteryNo;
>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionMask;
>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionStatus;
>>> +=C2=A0=C2=A0=C2=A0 u8 uReservedIn[5];
>>> +} __packed;
>>> +
>>> +struct set_battery_health_control_output {
>>> +=C2=A0=C2=A0=C2=A0 u8 uReturn;
>>> +=C2=A0=C2=A0=C2=A0 u8 uReservedOut;
>>> +} __packed;
>>> +
>>> +enum battery_mode {
>>> +=C2=A0=C2=A0=C2=A0 HEALTH_MODE =3D 1,
>>> +=C2=A0=C2=A0=C2=A0 CALIBRATION_MODE =3D 2,
>>> +};
>>> +
>>> +struct acer_wmi_battery_data {
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>>> +=C2=A0=C2=A0=C2=A0 struct wmi_device *wdev;
>>> +=C2=A0=C2=A0=C2=A0 const struct power_supply_ext *battery_ext;
>>> +=C2=A0=C2=A0=C2=A0 struct {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool health_mode : 1;
>>> +=C2=A0=C2=A0=C2=A0 } features;
>>> +};
>>> +
>>> +static int acer_wmi_battery_get_information(struct=20
>>> acer_wmi_battery_data *data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 =
index, u32 battery, u32 *result)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 u32 args[2] =3D { index, battery };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { sizeof(args), args =
};
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 19, =
&input, &output);
>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj __free(kfree) =3D output.po=
inter;
>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < sizeof(u32)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&data->wdev->dev, =
"WMI battery information call=20
>>> returned buffer of unexpected length %u\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ob=
j->buffer.length);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 *result =3D get_unaligned_le32(obj->buffer.pointer=
);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +static int acer_wmi_battery_get_health_control_status(struct=20
>>> acer_wmi_battery_data *data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool *health_mode)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Acer Care Center seems to always call the =
WMI method
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * with fixed parameters. This yields informa=
tion about
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the availability and state of both health =
and
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * calibration mode. The modes probably apply=
 to
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * all batteries of the system.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0 struct get_battery_health_control_status_input arg=
s =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uBatteryNo =3D ACER_BATTE=
RY_INDEX,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionQuery =3D 0x1,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uReserved =3D { 0x0, 0x0 =
}
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { (acpi_size) sizeof(=
args), &args };
>>> +=C2=A0=C2=A0=C2=A0 struct get_battery_health_control_status_output *s=
tatus_output;
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 20, =
&input, &output);
>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj __free(kfree) =3D output.po=
inter;
>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < 8) {
>>
>> Better use sizeof(*status_output) here.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&data->wdev->dev, =
"WMI battery status call returned=20
>>> a buffer of unexpected length %d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ob=
j->buffer.length);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 status_output =3D (struct get_battery_health_contr=
ol_status_output=20
>>> *)obj->buffer.pointer;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (health_mode) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (status_output->uFuncti=
onList & HEALTH_MODE)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *h=
ealth_mode =3D status_output->uFunctionStatus[0] > 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +static int acer_wmi_battery_set_battery_health_control(struct=20
>>> acer_wmi_battery_data *data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 function, bool function_status)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct set_battery_health_control_input args =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uBatteryNo =3D ACER_BATTE=
RY_INDEX,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionMask =3D functio=
n,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionStatus =3D funct=
ion_status ? 1 : 0,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uReservedIn =3D { 0x0, 0x=
0, 0x0, 0x0, 0x0 }
>>> +=C2=A0=C2=A0=C2=A0 };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { (acpi_size) sizeof(=
args), &args };
>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFF=
ER, NULL };
>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 21, =
&input, &output);
>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 obj =3D output.pointer;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < 4) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&data->wdev->dev, =
"WMI battery status set operation=20
>>> returned a buffer of unexpected length %d\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ob=
j->buffer.length);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +static int acer_battery_ext_property_get(struct power_supply *psy,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct power_sup=
ply_ext *ext,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ext_data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power_supply_prop=
erty psp,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union power_supply_pro=
pval *val)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct acer_wmi_battery_data *data =3D ext_data;
>>> +=C2=A0=C2=A0=C2=A0 bool health_mode;
>>> +=C2=A0=C2=A0=C2=A0 u32 value;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D acer_wmi_battery_g=
et_health_control_status(data,=20
>>> &health_mode);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D health_mod=
e
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_TEMP:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D acer_wmi_battery_g=
et_information(data, 0x8,=20
>>> ACER_BATTERY_INDEX, &value);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (value > U16_MAX)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ERANGE;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D value - 27=
31;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> +=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +static int acer_battery_ext_property_set(struct power_supply *psy,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct power_sup=
ply_ext *ext,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ext_data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power_supply_prop=
erty psp,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const union power_supp=
ly_propval *val)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct acer_wmi_battery_data *data =3D ext_data;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return acer_wmi_battery_se=
t_battery_health_control(data,=20
>>> HEALTH_MODE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE=
);
>>> +=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> +static int acer_battery_ext_property_is_writeable(struct=20
>>> power_supply *psy,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const struct power_supply_ext *ext,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 void *ext_data,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 enum power_supply_property psp)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> +=C2=A0=C2=A0=C2=A0 default:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +}
>>> +
>>> +static const struct dmi_system_id=20
>>> acer_wmi_battery_health_mode_table[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DM=
I_MATCH(DMI_SYS_VENDOR, "Acer"),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DM=
I_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 },
>>> +=C2=A0=C2=A0=C2=A0 {}
>>> +};
>>
>> I suggest that you perform the DMI check during module initialization.=
=20
>> This way
>> the DMI table can be marked as __initconst and does not consume any=20
>> memory after
>> anymore after module initialization is complete.
>>
>> The result of the DMI check could then be stored inside a global=20
>> variable.
>>
>> Other than that, the driver seems fine to me.
>=20
> Thanks for the review comments, due to some personal circumstances it=20
> has taken me while to spin up v3.
>=20
> I've been digging into the WMI dump data looking if I could figure out=
=20
> if there was a way to check if health checks are available but only=20
> stumbled on another battery related WMI method.
>=20
> Method 0x16: GetBatteryFunctionData
> - Input: uFunctionMask (uint8), uReservedIn (uint8 array)
> - Output: uReturnCode (uint8 array), uBACStartTime (uint8 array),=20
> uBACStopTime (uint8 array), uBACStatus (uint8), uReservedOut (uint8 arra=
y)
> Method 0x17: SetBatteryFunctionData
> - Input: uFunctionMask (uint8), uBACSwitch (uint8), uReservedIn (uint8=
=20
> array)
>=20
> But I was wondering why in probe or init, the driver couldn't call=20
> "acer_wmi_battery_get_health_control_status". Then we wouldn't need to=
=20
> add a WMI whitelist for every device that supports this.
>=20
> If I recall correctly you own an Acer laptop which supports the battery=
=20
> temperature but lacks health control? Seeing how many WMI methods are=20
> exposed on my device I suppose it is also exposed for you, but it should=
=20
> hopefully error out?

Calling an non-existing WMI method is undefined behavior and could in=20
the worst cast cause the ACPI firmware to crash. Because of this we have=
=20
to use a DMI whitelist for now :(

I am working on a in-kernel BMOF parser, but i am currently occupied by=20
other work.

Thanks,
Armin Wolf

>=20
> Thanks,
>=20
> Jelle van der Waa

