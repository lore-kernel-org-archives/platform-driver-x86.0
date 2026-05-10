Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789853093B2
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 18:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778438934; cv=none; b=eqJxsob9xOkwrtTFSw+vexM7cA5m7Pao6O2QnbDaWhPyUlgj9RBlwSy0PFTfO2YZIFa8FNU1GliTXQxxjFzW87ezN0ZVmVIkSgp6aKxY6T80aF9ivqy+GVpRYvQSuR0VptT6XqF+dl6EsHReG3Pcr8cR62ss0T5+qlaUexROL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778438934; c=relaxed/simple;
	bh=BKPtr6128+DfWljXBRBeVrN3KSwf+FP0bduLE2yqEms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CMvfgPlzJwNWjg/Yda+Cmt8oB4Q1/oXrpiX3rx0r+VWnyOt1b/Hyl9NM2QpRXGieFWhSWoiCX9A9gsdd+v6uQjufjJtPaj+bqrtB9NyerSMGQSk9TLEBtc6q+uwV+02qq6oWDk9q1q6qtrIxt2vlzu+vXcWLgg3jtlnO+MhFzJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=pass smtp.mailfrom=vdwaa.nl; dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b=dkgdpR6G; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QDwsAY1n; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b="dkgdpR6G";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QDwsAY1n"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 421027A0087;
	Sun, 10 May 2026 14:48:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 10 May 2026 14:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778438930;
	 x=1778525330; bh=0QwKPPEqW1kT9S2N1m845eB52KNIuCp+av8fQ1rP44o=; b=
	dkgdpR6GbBh0l588woReNmMYz9L809srkEHwnOAVXpQK6Dqu6+xp+3k7MYKkwtDe
	5yMepYbsIEs+oCy6LV8vQYemi4/MNDRVTO/iWGgHlKSJNeP+VXrlSSJWTFRE6y+9
	EFOM9m+nKpr82OGJWO4BNawdf43AjG9u0tBCdwY8V4ide8rIo9ix8MDTOrDhMJGy
	ZFnEDzxZn2aoCzVa3qFJHBg8FHjXRBNvQEReZdP9u+92sfB8vQuOwaW45vBEQMb5
	yiuBwOWXn/VmGIlNymbIENtqC2OtRtZ/C/XJFzRSW6u34qOOZu2RMwZkDOWP6FKi
	LQ2ytGnKlblnQPgkY7fSbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778438930; x=
	1778525330; bh=0QwKPPEqW1kT9S2N1m845eB52KNIuCp+av8fQ1rP44o=; b=Q
	DwsAY1ngyyRPE5y6c0ejnS+huMKEJWOyBpGMO3FPi+pZJwSSxvg1reSGgWV6tr00
	4KIY4rm3IdhK2e8dAnZXiMgm5XRDBDMCMWKY++khtjUa19q429XHXBpB0OMtUxx6
	kDyNPyg1bfT2uiM9v5wrncygdwiWNPluM0eVmOZgLXk8h5QxTCrwcaJhzBRGt8lP
	JnZFYBOLUWCkAcaGy6NyUvt6+K0jpBiLImvSBT7FFBEmv0PdHXVzKWZy5py137CJ
	u2lrGHziNqaJEbU1IQsZm/r6YgGiPYrravKfzccJbfSXzjnvQAMncNBzpONcqp2d
	0dXPA21aWlG8TJAyS1aow==
X-ME-Sender: <xms:EdMAatHEnCaHoTyIdGBoh31zyd-fhd51VQnjYHatSKj7EBKGCCZPBA>
    <xme:EdMAaj294H0eovxbwf8B6Mzyep88LwaoEYVnH-z5i53rjoWV7FnYDwKChD0go6Pyg
    fXgEWaHyLIHpRM6TYSKBp0Bj-s2sXGY8300hJp4y76FCR70RFfbVQEw>
X-ME-Received: <xmr:EdMAavMdBxLzOnFF_rWS4UI1oS6ytsb4JbXdRUaTfNUdFVq0wO8tX13NKQHe5a0irZf1yDtevLpGRcprLmYy60Vi1LjSrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduudeikeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvghllhgv
    uchvrghnucguvghrucghrggruceojhgvlhhlvgesvhgufigrrgdrnhhlqeenucggtffrrg
    htthgvrhhnpefgfffhgfetgedufeelfeegiedvjefhteeffefhheejgfejteettdeggffg
    gfffgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgvlhhlvgesvhgufigrrgdrnhhlpdhn
    sggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifpggrrh
    hmihhnsehgmhigrdguvgdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhikheshhgrrhifrghthhdrnh
    grmhgv
X-ME-Proxy: <xmx:EdMAai5s8GsSVNTpidHp1-gWHOgtpqyR3nlNQwtvo89lKETM4WJstA>
    <xmx:EdMAap2rMOskiFAFFYZ35MckhdQurX6RFjy_nIsU9awEeGs2lI5Kog>
    <xmx:EdMAajxhFTDdU1ZMk48c1Mhsjo5gQzegXm3WdXX-rINEh5NkDo9LJw>
    <xmx:EdMAajupiaLJeUhPQSEchlI5DCduHw3IiMDsOaxyKbOYQsZJvSlVUA>
    <xmx:EtMAanEq9geULkIU3Ugr6Za_7ajuyza-Fp1AvVoCpRmdHR0YhsTup-kW>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 10 May 2026 14:48:48 -0400 (EDT)
Message-ID: <8bc77786-2126-4b68-b52a-b2c75a683223@vdwaa.nl>
Date: Sun, 10 May 2026 20:48:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86: add Acer battery control driver
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260125182314.735668-1-jelle@vdwaa.nl>
 <20260125182314.735668-2-jelle@vdwaa.nl>
 <ca22f9d8-7609-4023-956e-85687a5d5df6@gmx.de>
Content-Language: en-US
From: Jelle van der Waa <jelle@vdwaa.nl>
Autocrypt: addr=jelle@vdwaa.nl;
 keydata= xsBNBE6QLAIBCAC3O6LmF+GKvOh7IV00TG+EKAQHAwjESnHGJOW58lKK7eAYn62ZM1uy0+6h
 yCMu5PD7+ND6U1gcgTTHYwNK8AaJt7yY4FRssgdcJk59uJBwROZtllotClJ893CuB6Wgr68b
 07gIRbENYrB8rEoGfpUG//8/ep7sY8PS03jnFb4ll6mPlUE2oQVdYOlXgF4f9qkkIi4SQeE2
 MTuERaOrDuUNDlroJ7Yfx3J/rL5Qjn578/TKCAxg0pns6VIA/P9spRGmLhT4zP+OxZXeSZme
 IxcwFdJJXHr4oGaZvqe1yHlMmKR98rrIfPWhkw2Ls/XIZIxf6prT0XyczbzBnC2y1JyNABEB
 AAHNIkplbGxlIHZhbiBkZXIgV2FhIDxqZWxsZUB2ZHdhYS5ubD7CwHsEEwECACUCGwMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheABQJUX8WhAhkBAAoJEMBghjN8UHc+mFwH/jjN+Qob4O36
 YiieajRwVLGuYdUDt9Z655oQYU8V4qbWf2tjUtqTYXrxLnaY6xQoYouRz9yFbh9dIKZb67ir
 7AeVgCOtWVesGxAlGH6EY5JBZcsN0v0ScsivqQAv/Mv+4HK+XM57YlyRagD8tkprYskioWHg
 OwQfXAO6nlm4BJHWO9bHJUMgiGs7I190IKQG7iLBnJuGjsOFuy5KTLpnv+w7twmz0H+pkUPe
 jVHfJlJWdN4v1PigpgpjOR6ZepSIggMk7dHsa6GNLUOzi61yYVFe60+EGXhwyJIqSt56a4oR
 jMUcXaOugGr+JwC8Eq7Pg2+aFk+8fbe0oUzZJucHGnDOwE0ETpAsAgEIAK4Usb7B00WRxCZG
 HtM973F7V4OhOKv4kZKduxtu71bVUZsTuzn4h+m8guJ51uY/I2icUrN9gJG5aEzRqPuQi2L7
 KmZUjs3pscZWgUgiT8UZFDR6RuQ4k3CcWobsRCjYZdSblSZ8ccrLJE7xSbwKMXjAh2PEiaQT
 lS6wQbn6mHv4y3H9QVHs7+jXbmfHCxnVcwLqRmpuegSmezDaL5TlSc102voiXinhrWEZUvAB
 KDh6VuJ/60Y6zelCXVsEjRaApz90iXY1nifLhkHM8B2wG7Pum3V3X0Y0QTVD+z3EL1iq5mFu
 epKp//IOeeJN5iwHcRSJGy2s1oOzjRDyPv6v1AUAEQEAAcLAXwQYAQIACQUCTpAsAgIbDAAK
 CRDAYIYzfFB3PvDuB/0dI13hSYHW27c2Rq8BaGbIhXYYETtPD5B25/P1JJ5OQZkPmVq+vSHw
 uzUaDZHy3ZcwE+xFXzlkwXGdWos07JUGo74zV3HfeZxVEPv0HB9ACqQVU/JKjLZNj2SfhgzL
 4F+O4Zgdsf0YaZG09F5PbMvbhoCZLfAaKWz/4fLEfhrDJLhrphUyPDXosn0UxPkDv0iiixn4
 V+bEZ5/wd8dRWi58R/iND+gRGsBREm5SpzdhnsarwoX6YdsQ449379enDNUN7jV4C3Gkon2s
 VwI2ZZbS10cY8rFSAV/CJA2E9daRoz40DI0tgXgLBAVhy7y5HWZJsDZexU0HFKJfkDi7RUPj
In-Reply-To: <ca22f9d8-7609-4023-956e-85687a5d5df6@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/31/26 00:24, Armin Wolf wrote:
> Am 25.01.26 um 19:23 schrieb Jelle van der Waa:
> 
>> Some Acer laptops can configure battery related features through Acer
>> Care Center on Windows. This driver uses the power supply extension to
>> set a battery charge limit and exposes the battery
>> temperature.
>>
>> This driver is based on the existing acer-wmi-battery project on GitHub
>> and was tested on an Acer Aspire A315-510P.
>>
>> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>>
>> ---
>> v2:
>> - Alphabetically sort linux headers
>> - Include headers for types / _packed
>> - Use cleanup.h instead of goto + label
>> - Add missing prefix for set_battery_health_control
>> - General code formatting fixes
>> - Remove HWMON dependency in Kconfig
>> - Use wmidev_evaluate_method()
>> - Accept oversized ACPI buffers
>> - Use DRIVER_NAME for battery extension name
>> - Set no_singleton = true
>> - Implement DMI matching to support laptops with only battery
>>    temperature support.
>> ---
>>   drivers/platform/x86/Kconfig            |  11 +
>>   drivers/platform/x86/Makefile           |   1 +
>>   drivers/platform/x86/acer-wmi-battery.c | 355 ++++++++++++++++++++++++
>>   3 files changed, 367 insertions(+)
>>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 4cb7d97a9fcc..88c11a698fb9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -170,6 +170,17 @@ config ACER_WMI
>>         If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y 
>> or M
>>         here.
>> +config ACER_WMI_BATTERY
>> +    tristate "Acer WMI Battery"
>> +    depends on ACPI_WMI
>> +    depends on ACPI_BATTERY
> 
> Please also depend on DMI so that dmi_check_system() will always be 
> available
> when building this driver.
> 
>> +    help
>> +      This is a driver for Acer laptops with battery health control. It
>> +      adds charge limit control and battery temperature reporting.
>> +
>> +      If you have an ACPI-WMI Battery compatible Acer laptop, say Y or M
>> +      here.
>> +
>>   source "drivers/platform/x86/amd/Kconfig"
>>   config ADV_SWBUTTON
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/ 
>> Makefile
>> index d25762f7114f..9cf28baff3ae 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -19,6 +19,7 @@ obj-$(CONFIG_GIGABYTE_WMI)        += gigabyte-wmi.o
>>   obj-$(CONFIG_ACERHDF)        += acerhdf.o
>>   obj-$(CONFIG_ACER_WIRELESS)    += acer-wireless.o
>>   obj-$(CONFIG_ACER_WMI)        += acer-wmi.o
>> +obj-$(CONFIG_ACER_WMI_BATTERY)    += acer-wmi-battery.o
>>   # AMD
>>   obj-y                += amd/
>> diff --git a/drivers/platform/x86/acer-wmi-battery.c b/drivers/ 
>> platform/x86/acer-wmi-battery.c
>> new file mode 100644
>> index 000000000000..abb45cfcc6fe
>> --- /dev/null
>> +++ b/drivers/platform/x86/acer-wmi-battery.c
>> @@ -0,0 +1,355 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * acer-wmi-battery.c: Acer battery health control driver
>> + *
>> + * This is a driver for the WMI battery health control interface found
>> + * on some Acer laptops.  This interface allows to enable/disable a
>> + * battery charge limit ("health mode") and exposes the battery 
>> temperature.
>> + *
>> + * Based on acer-wmi-battery https://github.com/frederik-h/acer-wmi- 
>> battery/
>> + *
>> + * Copyright (C) 2022-2025  Frederik Harwath <frederik@harwath.name>
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/cleanup.h>
>> +#include <linux/compiler_attributes.h>
>> +#include <linux/dmi.h>
>> +#include <linux/init.h>
>> +#include <linux/kernel.h>
>> +#include <linux/limits.h>
>> +#include <linux/module.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/types.h>
>> +#include <linux/unaligned.h>
>> +#include <linux/version.h>
>> +#include <linux/wmi.h>
>> +
>> +#include <acpi/battery.h>
>> +
>> +#define DRIVER_NAME    "acer-wmi-battery"
>> +
>> +#define ACER_BATTERY_GUID "79772EC5-04B1-4BFD-843C-61E7F77B6CC9"
>> +
>> +/*
>> + * The Acer OEM software seems to always use this battery index,
>> + * so we emulate this behaviour to not confuse the underlying firmware.
>> + *
>> + * However this also means that we only fully support devices with a
>> + * single battery for now.
>> + */
>> +#define ACER_BATTERY_INDEX    0x1
>> +
>> +struct get_battery_health_control_status_input {
>> +    u8 uBatteryNo;
>> +    u8 uFunctionQuery;
>> +    u8 uReserved[2];
>> +} __packed;
>> +
>> +struct get_battery_health_control_status_output {
>> +    u8 uFunctionList;
>> +    u8 uReturn[2];
>> +    u8 uFunctionStatus[5];
>> +} __packed;
>> +
>> +struct set_battery_health_control_input {
>> +    u8 uBatteryNo;
>> +    u8 uFunctionMask;
>> +    u8 uFunctionStatus;
>> +    u8 uReservedIn[5];
>> +} __packed;
>> +
>> +struct set_battery_health_control_output {
>> +    u8 uReturn;
>> +    u8 uReservedOut;
>> +} __packed;
>> +
>> +enum battery_mode {
>> +    HEALTH_MODE = 1,
>> +    CALIBRATION_MODE = 2,
>> +};
>> +
>> +struct acer_wmi_battery_data {
>> +    struct acpi_battery_hook hook;
>> +    struct wmi_device *wdev;
>> +    const struct power_supply_ext *battery_ext;
>> +    struct {
>> +        bool health_mode : 1;
>> +    } features;
>> +};
>> +
>> +static int acer_wmi_battery_get_information(struct 
>> acer_wmi_battery_data *data,
>> +                        u32 index, u32 battery, u32 *result)
>> +{
>> +    u32 args[2] = { index, battery };
>> +    struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +    struct acpi_buffer input = { sizeof(args), args };
>> +    int ret;
>> +
>> +    ret = wmidev_evaluate_method(data->wdev, 0, 19, &input, &output);
>> +    if (ACPI_FAILURE(ret))
>> +        return -EIO;
>> +
>> +    union acpi_object *obj __free(kfree) = output.pointer;
>> +    if (!obj)
>> +        return -EIO;
>> +
>> +    if (obj->type != ACPI_TYPE_BUFFER)
>> +        ret = -EIO;
>> +
>> +    if (obj->buffer.length < sizeof(u32)) {
>> +        dev_err(&data->wdev->dev, "WMI battery information call 
>> returned buffer of unexpected length %u\n",
>> +            obj->buffer.length);
>> +        ret = -EINVAL;
>> +    }
>> +
>> +    *result = get_unaligned_le32(obj->buffer.pointer);
>> +
>> +    return ret;
>> +}
>> +
>> +static int acer_wmi_battery_get_health_control_status(struct 
>> acer_wmi_battery_data *data,
>> +                              bool *health_mode)
>> +{
>> +    /*
>> +     * Acer Care Center seems to always call the WMI method
>> +     * with fixed parameters. This yields information about
>> +     * the availability and state of both health and
>> +     * calibration mode. The modes probably apply to
>> +     * all batteries of the system.
>> +     */
>> +    struct get_battery_health_control_status_input args = {
>> +        .uBatteryNo = ACER_BATTERY_INDEX,
>> +        .uFunctionQuery = 0x1,
>> +        .uReserved = { 0x0, 0x0 }
>> +    };
>> +    struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
>> +    struct get_battery_health_control_status_output *status_output;
>> +    struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +    int ret;
>> +
>> +    ret = wmidev_evaluate_method(data->wdev, 0, 20, &input, &output);
>> +    if (ACPI_FAILURE(ret))
>> +        return -EIO;
>> +
>> +    union acpi_object *obj __free(kfree) = output.pointer;
>> +    if (!obj)
>> +        return -EIO;
>> +
>> +    if (obj->type != ACPI_TYPE_BUFFER)
>> +        ret = -EIO;
>> +
>> +    if (obj->buffer.length < 8) {
> 
> Better use sizeof(*status_output) here.
> 
>> +        dev_err(&data->wdev->dev, "WMI battery status call returned a 
>> buffer of unexpected length %d\n",
>> +            obj->buffer.length);
>> +        ret = -EINVAL;
>> +    }
>> +
>> +    status_output = (struct get_battery_health_control_status_output 
>> *)obj->buffer.pointer;
>> +
>> +    if (health_mode) {
>> +        if (status_output->uFunctionList & HEALTH_MODE)
>> +            *health_mode = status_output->uFunctionStatus[0] > 0;
>> +        else
>> +            ret = -EINVAL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int acer_wmi_battery_set_battery_health_control(struct 
>> acer_wmi_battery_data *data,
>> +                               u8 function, bool function_status)
>> +{
>> +    struct set_battery_health_control_input args = {
>> +        .uBatteryNo = ACER_BATTERY_INDEX,
>> +        .uFunctionMask = function,
>> +        .uFunctionStatus = function_status ? 1 : 0,
>> +        .uReservedIn = { 0x0, 0x0, 0x0, 0x0, 0x0 }
>> +    };
>> +    struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
>> +    struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +    union acpi_object *obj;
>> +    int ret;
>> +
>> +    ret = wmidev_evaluate_method(data->wdev, 0, 21, &input, &output);
>> +    if (ACPI_FAILURE(ret))
>> +        return -EIO;
>> +
>> +    obj = output.pointer;
>> +
>> +    if (!obj)
>> +        return -EIO;
>> +
>> +    if (obj->type != ACPI_TYPE_BUFFER)
>> +        ret = -EIO;
>> +
>> +    if (obj->buffer.length < 4) {
>> +        dev_err(&data->wdev->dev, "WMI battery status set operation 
>> returned a buffer of unexpected length %d\n",
>> +            obj->buffer.length);
>> +        ret = -EINVAL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static int acer_battery_ext_property_get(struct power_supply *psy,
>> +                     const struct power_supply_ext *ext,
>> +                     void *ext_data,
>> +                     enum power_supply_property psp,
>> +                     union power_supply_propval *val)
>> +{
>> +    struct acer_wmi_battery_data *data = ext_data;
>> +    bool health_mode;
>> +    u32 value;
>> +    int ret;
>> +
>> +    switch (psp) {
>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +        ret = acer_wmi_battery_get_health_control_status(data, 
>> &health_mode);
>> +        if (ret)
>> +            return ret;
>> +
>> +        val->intval = health_mode
>> +                  ? POWER_SUPPLY_CHARGE_TYPE_LONGLIFE
>> +                  : POWER_SUPPLY_CHARGE_TYPE_STANDARD;
>> +        break;
>> +    case POWER_SUPPLY_PROP_TEMP:
>> +        ret = acer_wmi_battery_get_information(data, 0x8, 
>> ACER_BATTERY_INDEX, &value);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (value > U16_MAX)
>> +            return -ERANGE;
>> +
>> +        val->intval = value - 2731;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int acer_battery_ext_property_set(struct power_supply *psy,
>> +                     const struct power_supply_ext *ext,
>> +                     void *ext_data,
>> +                     enum power_supply_property psp,
>> +                     const union power_supply_propval *val)
>> +{
>> +    struct acer_wmi_battery_data *data = ext_data;
>> +
>> +    switch (psp) {
>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +        return acer_wmi_battery_set_battery_health_control(data, 
>> HEALTH_MODE,
>> +                val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE);
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +}
>> +
>> +static int acer_battery_ext_property_is_writeable(struct power_supply 
>> *psy,
>> +                          const struct power_supply_ext *ext,
>> +                          void *ext_data,
>> +                          enum power_supply_property psp)
>> +{
>> +    switch (psp) {
>> +    case POWER_SUPPLY_PROP_CHARGE_TYPES:
>> +        return true;
>> +    default:
>> +        return false;
>> +    }
>> +}
>> +
>> +static const struct dmi_system_id 
>> acer_wmi_battery_health_mode_table[] = {
>> +    {
>> +        .matches = {
>> +            DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
>> +            DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-510P")
>> +        }
>> +    },
>> +    {}
>> +};
> 
> I suggest that you perform the DMI check during module initialization. 
> This way
> the DMI table can be marked as __initconst and does not consume any 
> memory after
> anymore after module initialization is complete.
> 
> The result of the DMI check could then be stored inside a global variable.
> 
> Other than that, the driver seems fine to me.

Thanks for the review comments, due to some personal circumstances it 
has taken me while to spin up v3.

I've been digging into the WMI dump data looking if I could figure out 
if there was a way to check if health checks are available but only 
stumbled on another battery related WMI method.

Method 0x16: GetBatteryFunctionData
- Input: uFunctionMask (uint8), uReservedIn (uint8 array)
- Output: uReturnCode (uint8 array), uBACStartTime (uint8 array), 
uBACStopTime (uint8 array), uBACStatus (uint8), uReservedOut (uint8 array)
Method 0x17: SetBatteryFunctionData
- Input: uFunctionMask (uint8), uBACSwitch (uint8), uReservedIn (uint8 
array)

But I was wondering why in probe or init, the driver couldn't call 
"acer_wmi_battery_get_health_control_status". Then we wouldn't need to 
add a WMI whitelist for every device that supports this.

If I recall correctly you own an Acer laptop which supports the battery 
temperature but lacks health control? Seeing how many WMI methods are 
exposed on my device I suppose it is also exposed for you, but it should 
hopefully error out?

Thanks,

Jelle van der Waa
