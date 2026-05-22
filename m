Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CBF33A6F2
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779486631; cv=none; b=MgaPJnJxFpZlbmuXP/2G38MoUpBAqTirjnXkjSO4lhZTgifrlbAxzFMqDuZA4yFO+X/rh+OQgbJKnfWFwjva1RSictgN7Y0tKvfnKT1ptDZEguoC+URBbSQg3KT16nOVtLtt0p/hK2UYH3mN8ia5eiMbE4sHhRcmEx0jsUl/vsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779486631; c=relaxed/simple;
	bh=gwpQBx7vEAUVNmRaiM80ts0KeHtt+Lgw8+aMMGov2OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WBulqfjGGMFxP+Big94EtB/SJ4EQxTeFMkzvn+pHK2mhfGDgeUciNAxt0/g+zsJXN8F8qkehtxnDS606fLXKhXv/NYkFJxrPMP9OoHOMOExYV4Dx9hUSg/hZCMD4U5PQ3obGqcfbwvyGPWmEHE3ByjCllZ+m5x/yNAtahDVtozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=oL97ykhL; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="oL97ykhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1779486620; x=1780091420; i=w_armin@gmx.de;
	bh=gwpQBx7vEAUVNmRaiM80ts0KeHtt+Lgw8+aMMGov2OQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=oL97ykhLw6JrZxOoZ1GRx/jBDOtEA//qC5or1Llq2Oe042Td8bww2iWLZW7DkVQj
	 +SrUaMDP91TCmOmyyqS4atD5JUPf84/SaJaMHqr5rgEEezM/Goj8O1r8WxmV3ZQYE
	 dHt20ngy+ENNegPg3b+spW+45jSo/M0NwG0ejjFn6OZWJvUnMcadm9wEoW0XVu0vt
	 3iWWxIOKbbNk/qxBhdRQk8zswylc/0KAwwSR+vXCLwt4mWOJRbqcrSQQgFGHhsdFK
	 YA7EMLaKsD5cgkVlGOMfNphX3xJKQW+R80o51dSQ1qerNJIVQSir7Lbr0pFy+mFr+
	 6EHUXH8hcO/5Sl9XFg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZTqg-1woAWI2OH8-00Uicx; Fri, 22
 May 2026 23:50:20 +0200
Message-ID: <965a9647-74d4-4c06-8eed-464cda7ef26f@gmx.de>
Date: Fri, 22 May 2026 23:50:19 +0200
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
 <dd1b5be8-530b-4dfc-ad80-ea5f298d9230@gmx.de>
 <3b26055c-6148-4a5d-ae94-82647e4584a1@vdwaa.nl>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <3b26055c-6148-4a5d-ae94-82647e4584a1@vdwaa.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AWN7omoJ48D6wqSsjxkKn0oZMEovDg4l8V/1q9q8TbCN/Q181Mv
 alW5gDWRitVE9pVr4Vs6doo7VqiaAEMLK6I/6+8QwGpd9AVsgQgAZ5onnB/FNhK8STfaZ9h
 c5mlDNDOfn8xl1dLPPlg2iYr0/7zlWOGF8Pn2sol3AAJtQO+lJF04HtH5x/eTmMBO4SgtJY
 +NtLBRgHnPArowhNyVKTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:idt0TnCV8/s=;NZnQzXjCpkc/sPObkzM8RolzDLi
 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
 uUgboJxaH6yPLdp3WBlgMr9Mwgb4Ls

Am 15.05.26 um 11:45 schrieb Jelle van der Waa:

> On 5/13/26 11:19, Armin Wolf wrote:
>> Am 10.05.26 um 20:48 schrieb Jelle van der Waa:
>>> On 1/31/26 00:24, Armin Wolf wrote:
>>>> Am 25.01.26 um 19:23 schrieb Jelle van der Waa:
>>>>
>>>>> Some Acer laptops can configure battery related features through Ace=
r
>>>>> Care Center on Windows. This driver uses the power supply=20
>>>>> extension to
>>>>> set a battery charge limit and exposes the battery
>>>>> temperature.
>>>>>
>>>>> This driver is based on the existing acer-wmi-battery project on=20
>>>>> GitHub
>>>>> and was tested on an Acer Aspire A315-510P.
>>>>>
>>>>> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>>>>>
>>>>> ---
>>>>> v2:
>>>>> - Alphabetically sort linux headers
>>>>> - Include headers for types / _packed
>>>>> - Use cleanup.h instead of goto + label
>>>>> - Add missing prefix for set_battery_health_control
>>>>> - General code formatting fixes
>>>>> - Remove HWMON dependency in Kconfig
>>>>> - Use wmidev_evaluate_method()
>>>>> - Accept oversized ACPI buffers
>>>>> - Use DRIVER_NAME for battery extension name
>>>>> - Set no_singleton =3D true
>>>>> - Implement DMI matching to support laptops with only battery
>>>>> =C2=A0=C2=A0 temperature support.
>>>>> ---
>>>>> =C2=A0 drivers/platform/x86/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +
>>>>> =C2=A0 drivers/platform/x86/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
>>>>> =C2=A0 drivers/platform/x86/acer-wmi-battery.c | 355=20
>>>>> ++++++++++++++++++++ ++++
>>>>> =C2=A0 3 files changed, 367 insertions(+)
>>>>> =C2=A0 create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>>>>>
>>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/=20
>>>>> Kconfig
>>>>> index 4cb7d97a9fcc..88c11a698fb9 100644
>>>>> --- a/drivers/platform/x86/Kconfig
>>>>> +++ b/drivers/platform/x86/Kconfig
>>>>> @@ -170,6 +170,17 @@ config ACER_WMI
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you have an ACPI-WMI c=
ompatible Acer/ Wistron laptop,=20
>>>>> say Y or M
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 here.
>>>>> +config ACER_WMI_BATTERY
>>>>> +=C2=A0=C2=A0=C2=A0 tristate "Acer WMI Battery"
>>>>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_WMI
>>>>> +=C2=A0=C2=A0=C2=A0 depends on ACPI_BATTERY
>>>>
>>>> Please also depend on DMI so that dmi_check_system() will always be=
=20
>>>> available
>>>> when building this driver.
>>>>
>>>>> +=C2=A0=C2=A0=C2=A0 help
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This is a driver for Acer laptops wi=
th battery health=20
>>>>> control. It
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adds charge limit control and batter=
y temperature reporting.
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you have an ACPI-WMI Battery comp=
atible Acer laptop, say=20
>>>>> Y or M
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 here.
>>>>> +
>>>>> =C2=A0 source "drivers/platform/x86/amd/Kconfig"
>>>>> =C2=A0 config ADV_SWBUTTON
>>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/=
=20
>>>>> Makefile
>>>>> index d25762f7114f..9cf28baff3ae 100644
>>>>> --- a/drivers/platform/x86/Makefile
>>>>> +++ b/drivers/platform/x86/Makefile
>>>>> @@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +=3D gigabyte-wmi.o
>>>>> =C2=A0 obj-$(CONFIG_ACERHDF)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D acerhdf.o
>>>>> =C2=A0 obj-$(CONFIG_ACER_WIRELESS)=C2=A0=C2=A0=C2=A0 +=3D acer-wirel=
ess.o
>>>>> =C2=A0 obj-$(CONFIG_ACER_WMI)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +=3D acer-wmi.o
>>>>> +obj-$(CONFIG_ACER_WMI_BATTERY)=C2=A0=C2=A0=C2=A0 +=3D acer-wmi-batt=
ery.o
>>>>> =C2=A0 # AMD
>>>>> =C2=A0 obj-y=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D amd/
>>>>> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/=20
>>>>> platform/x86/acer-wmi-battery.c
>>>>> new file mode 100644
>>>>> index 000000000000..abb45cfcc6fe
>>>>> --- /dev/null
>>>>> +++ b/drivers/platform/x86/acer-wmi-battery.c
>>>>> @@ -0,0 +1,355 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + * acer-wmi-battery.c: Acer battery health control driver
>>>>> + *
>>>>> + * This is a driver for the WMI battery health control interface=20
>>>>> found
>>>>> + * on some Acer laptops.=C2=A0 This interface allows to enable/disa=
ble a
>>>>> + * battery charge limit ("health mode") and exposes the battery=20
>>>>> temperature.
>>>>> + *
>>>>> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-=20
>>>>> wmi- battery/
>>>>> + *
>>>>> + * Copyright (C) 2022-2025=C2=A0 Frederik Harwath <frederik@harwath=
.name>
>>>>> + */
>>>>> +
>>>>> +#include <linux/acpi.h>
>>>>> +#include <linux/cleanup.h>
>>>>> +#include <linux/compiler_attributes.h>
>>>>> +#include <linux/dmi.h>
>>>>> +#include <linux/init.h>
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/limits.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/power_supply.h>
>>>>> +#include <linux/types.h>
>>>>> +#include <linux/unaligned.h>
>>>>> +#include <linux/version.h>
>>>>> +#include <linux/wmi.h>
>>>>> +
>>>>> +#include <acpi/battery.h>
>>>>> +
>>>>> +#define DRIVER_NAME=C2=A0=C2=A0=C2=A0 "acer-wmi-battery"
>>>>> +
>>>>> +#define ACER_BATTERY_GUID "79772EC5-04B1-4BFD-843C-61E7F77B6CC9"
>>>>> +
>>>>> +/*
>>>>> + * The Acer OEM software seems to always use this battery index,
>>>>> + * so we emulate this behaviour to not confuse the underlying=20
>>>>> firmware.
>>>>> + *
>>>>> + * However this also means that we only fully support devices with =
a
>>>>> + * single battery for now.
>>>>> + */
>>>>> +#define ACER_BATTERY_INDEX=C2=A0=C2=A0=C2=A0 0x1
>>>>> +
>>>>> +struct get_battery_health_control_status_input {
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uBatteryNo;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionQuery;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uReserved[2];
>>>>> +} __packed;
>>>>> +
>>>>> +struct get_battery_health_control_status_output {
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionList;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uReturn[2];
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionStatus[5];
>>>>> +} __packed;
>>>>> +
>>>>> +struct set_battery_health_control_input {
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uBatteryNo;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionMask;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uFunctionStatus;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uReservedIn[5];
>>>>> +} __packed;
>>>>> +
>>>>> +struct set_battery_health_control_output {
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uReturn;
>>>>> +=C2=A0=C2=A0=C2=A0 u8 uReservedOut;
>>>>> +} __packed;
>>>>> +
>>>>> +enum battery_mode {
>>>>> +=C2=A0=C2=A0=C2=A0 HEALTH_MODE =3D 1,
>>>>> +=C2=A0=C2=A0=C2=A0 CALIBRATION_MODE =3D 2,
>>>>> +};
>>>>> +
>>>>> +struct acer_wmi_battery_data {
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>>>>> +=C2=A0=C2=A0=C2=A0 struct wmi_device *wdev;
>>>>> +=C2=A0=C2=A0=C2=A0 const struct power_supply_ext *battery_ext;
>>>>> +=C2=A0=C2=A0=C2=A0 struct {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool health_mode : 1;
>>>>> +=C2=A0=C2=A0=C2=A0 } features;
>>>>> +};
>>>>> +
>>>>> +static int acer_wmi_battery_get_information(struct=20
>>>>> acer_wmi_battery_data *data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
32 index, u32 battery, u32 *result)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 u32 args[2] =3D { index, battery };
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BU=
FFER, NULL };
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { sizeof(args), arg=
s };
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 19=
, &input,=20
>>>>> &output);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj __free(kfree) =3D output.=
pointer;
>>>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < sizeof(u32)) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&data->wdev->dev=
, "WMI battery information call=20
>>>>> returned buffer of unexpected length %u\n",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
obj->buffer.length);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 *result =3D get_unaligned_le32(obj->buffer.point=
er);
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +}
>>>>> +
>>>>> +static int acer_wmi_battery_get_health_control_status(struct=20
>>>>> acer_wmi_battery_data *data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool *health_mode)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Acer Care Center seems to always call th=
e WMI method
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * with fixed parameters. This yields infor=
mation about
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the availability and state of both healt=
h and
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * calibration mode. The modes probably app=
ly to
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * all batteries of the system.
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>> +=C2=A0=C2=A0=C2=A0 struct get_battery_health_control_status_input a=
rgs =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uBatteryNo =3D ACER_BAT=
TERY_INDEX,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionQuery =3D 0x1,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uReserved =3D { 0x0, 0x=
0 }
>>>>> +=C2=A0=C2=A0=C2=A0 };
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { (acpi_size) sizeo=
f(args), &args };
>>>>> +=C2=A0=C2=A0=C2=A0 struct get_battery_health_control_status_output =
*status_output;
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BU=
FFER, NULL };
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 20=
, &input,=20
>>>>> &output);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj __free(kfree) =3D output.=
pointer;
>>>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < 8) {
>>>>
>>>> Better use sizeof(*status_output) here.
>>>>
>>>>> + dev_err(&data->wdev->dev, "WMI battery status call returned a=20
>>>>> buffer of unexpected length %d\n",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
obj->buffer.length);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 status_output =3D (struct=20
>>>>> get_battery_health_control_status_output *)obj->buffer.pointer;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (health_mode) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (status_output->uFunc=
tionList & HEALTH_MODE)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
*health_mode =3D status_output->uFunctionStatus[0] > 0;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
ret =3D -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +}
>>>>> +
>>>>> +static int acer_wmi_battery_set_battery_health_control(struct=20
>>>>> acer_wmi_battery_data *data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 function, bool function_stat=
us)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct set_battery_health_control_input args =3D=
 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uBatteryNo =3D ACER_BAT=
TERY_INDEX,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionMask =3D funct=
ion,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uFunctionStatus =3D fun=
ction_status ? 1 : 0,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uReservedIn =3D { 0x0, =
0x0, 0x0, 0x0, 0x0 }
>>>>> +=C2=A0=C2=A0=C2=A0 };
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer input =3D { (acpi_size) sizeo=
f(args), &args };
>>>>> +=C2=A0=C2=A0=C2=A0 struct acpi_buffer output =3D { ACPI_ALLOCATE_BU=
FFER, NULL };
>>>>> +=C2=A0=C2=A0=C2=A0 union acpi_object *obj;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D wmidev_evaluate_method(data->wdev, 0, 21=
, &input,=20
>>>>> &output);
>>>>> +=C2=A0=C2=A0=C2=A0 if (ACPI_FAILURE(ret))
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 obj =3D output.pointer;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (!obj)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->type !=3D ACPI_TYPE_BUFFER)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EIO;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 if (obj->buffer.length < 4) {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&data->wdev->dev=
, "WMI battery status set=20
>>>>> operation returned a buffer of unexpected length %d\n",
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
obj->buffer.length);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>>>> +}
>>>>> +
>>>>> +static int acer_battery_ext_property_get(struct power_supply *psy,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct power_=
supply_ext *ext,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ext_data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power_supply_p=
roperty psp,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union power_supply_=
propval *val)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct acer_wmi_battery_data *data =3D ext_data;
>>>>> +=C2=A0=C2=A0=C2=A0 bool health_mode;
>>>>> +=C2=A0=C2=A0=C2=A0 u32 value;
>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D acer_wmi_battery=
_get_health_control_status(data,=20
>>>>> &health_mode);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D health_m=
ode
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_TEMP:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D acer_wmi_battery=
_get_information(data, 0x8,=20
>>>>> ACER_BATTERY_INDEX, &value);
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return ret;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (value > U16_MAX)
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
return -ERANGE;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D value - =
2731;
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>>>> +}
>>>>> +
>>>>> +static int acer_battery_ext_property_set(struct power_supply *psy,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct power_=
supply_ext *ext,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *ext_data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum power_supply_p=
roperty psp,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const union power_s=
upply_propval *val)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 struct acer_wmi_battery_data *data =3D ext_data;
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return acer_wmi_battery_=
set_battery_health_control(data,=20
>>>>> HEALTH_MODE,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 val->intval =3D=3D POWER_SUPPLY_CHARGE_TYPE_LONGL=
IFE);
>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +}
>>>>> +
>>>>> +static int acer_battery_ext_property_is_writeable(struct=20
>>>>> power_supply *psy,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 const struct power_supply_ext *ext,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 void *ext_data,
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 enum power_supply_property psp)
>>>>> +{
>>>>> +=C2=A0=C2=A0=C2=A0 switch (psp) {
>>>>> +=C2=A0=C2=A0=C2=A0 case POWER_SUPPLY_PROP_CHARGE_TYPES:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>> +}
>>>>> +
>>>>> +static const struct dmi_system_id=20
>>>>> acer_wmi_battery_health_mode_table[] =3D {
>>>>> +=C2=A0=C2=A0=C2=A0 {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .matches =3D {
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> +=C2=A0=C2=A0=C2=A0 },
>>>>> +=C2=A0=C2=A0=C2=A0 {}
>>>>> +};
>>>>
>>>> I suggest that you perform the DMI check during module=20
>>>> initialization. This way
>>>> the DMI table can be marked as __initconst and does not consume any=
=20
>>>> memory after
>>>> anymore after module initialization is complete.
>>>>
>>>> The result of the DMI check could then be stored inside a global=20
>>>> variable.
>>>>
>>>> Other than that, the driver seems fine to me.
>>>
>>> Thanks for the review comments, due to some personal circumstances=20
>>> it has taken me while to spin up v3.
>>>
>>> I've been digging into the WMI dump data looking if I could figure=20
>>> out if there was a way to check if health checks are available but=20
>>> only stumbled on another battery related WMI method.
>>>
>>> Method 0x16: GetBatteryFunctionData
>>> - Input: uFunctionMask (uint8), uReservedIn (uint8 array)
>>> - Output: uReturnCode (uint8 array), uBACStartTime (uint8 array),=20
>>> uBACStopTime (uint8 array), uBACStatus (uint8), uReservedOut (uint8=20
>>> array)
>>> Method 0x17: SetBatteryFunctionData
>>> - Input: uFunctionMask (uint8), uBACSwitch (uint8), uReservedIn=20
>>> (uint8 array)
>>>
>>> But I was wondering why in probe or init, the driver couldn't call=20
>>> "acer_wmi_battery_get_health_control_status". Then we wouldn't need=20
>>> to add a WMI whitelist for every device that supports this.
>>>
>>> If I recall correctly you own an Acer laptop which supports the=20
>>> battery temperature but lacks health control? Seeing how many WMI=20
>>> methods are exposed on my device I suppose it is also exposed for=20
>>> you, but it should hopefully error out?
>>
>> Calling an non-existing WMI method is undefined behavior and could in=
=20
>> the worst cast cause the ACPI firmware to crash. Because of this we=20
>> have to use a DMI whitelist for now :(
>
> Thanks for the answer, then I'll rework the driver to use the module=20
> __init for DMI as you suggested.
>
> I suppose it is fine to already add the other tested models by the=20
> community? [1].
> And should I add an module load option to force health mode so users=20
> can test if their hardware is compatible?

Sure.

Thanks,
Armin Wolf

>
>> I am working on a in-kernel BMOF parser, but i am currently occupied=20
>> by other work.
> No worries.
>
> [1] https://github.com/frederik-h/acer-wmi-battery/blob/main/MODELS.md
>
