Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91885193;
	Sat, 11 Jan 2025 00:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736554258; cv=none; b=s3Knmal5KsSu+MLso0dOJfXTn64YcjLmr/4sCYH/WT+4BkMqwrO/7Fw6lHgYrCqmQ/BQ2gYK2aRTLZrgWZLDpTe9KfHzo0GVLI1omza5rjKVJzUCEGrgxKvCmx8ldkRhuFcMRinj04lfuele4Ye4XOKM8DNG6UIRxVS79tTh05E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736554258; c=relaxed/simple;
	bh=bxr4s7NS+htpjkCADRvSXtIep0V/pthLOhGaGu25GUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SU6z5LCnzxZZ3B3132a02SOONuyWzDuJCggqIt87D//5gjanHpaHLzjqg4ZTwJx9T4dNjJxrtsXghUa09jLobjFOQ98xrdVBfoCMVIgIepNjeDaGpcWZWchkXichvGsj+60HyaDEeRLr450sr7L+JE/qzsCSKIzALaW0OXFg9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=P1cOHRV1; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="P1cOHRV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736554230; x=1737159030; i=w_armin@gmx.de;
	bh=MQ849oGVfIvRUnD0vhkGWCHhAM9WBDTqhrJyQTrrWFc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=P1cOHRV1WT41JC31+tVk2DW0Zi9GUnY7WvV7bByCGzdST6mmrtl58fXG6pbqznXJ
	 3XwFpgXRam70I/ktHEomyMW41vvY6XRn/AP1bM+HdTESS0JDK+X94/otZPde3gEVN
	 vl/EAu0zPvkHrnW/R745WGKqA2G7p/WHtC3NmPoFFbJtL7U8tNtrWNzO8NhNQUQso
	 N79ASJ1R666IBUrqkCvIyuF9J7loJOfZR3CcM+tClGR8Tzwb1JbTcJiTf0ip42WJM
	 5tPBhOqumUxnO7J2juK4QiOPX0zhF3Yt2PZz8jzgAMT4ZXsCQcbtsybR4WrKwTfWG
	 eOtsxi7CEhEmSJcFYw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvsJ5-1tG6YE2LlX-015xQL; Sat, 11
 Jan 2025 01:10:29 +0100
Message-ID: <403ebdd5-1659-467e-b883-1369360ce973@gmx.de>
Date: Sat, 11 Jan 2025 01:10:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
 <20250102004854.14874-5-derekjohn.clark@gmail.com>
 <333019ec-524d-4933-aa6e-459cd1f7b10f@gmx.de>
 <CAFqHKTnM6Bs6AdPFisRZ1d3yFx_eFZap4Y-42=kSth9VSoAU0A@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTnM6Bs6AdPFisRZ1d3yFx_eFZap4Y-42=kSth9VSoAU0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DturEe0NkEJ4UM3NmHo74b5+1fvjTrSUJQ/KVIwXEvqeQwNd+o9
 18n1fjzNusnPnBLQib9s363/wvMgS+eLCSxXMjyaWQeUOOB958vTT4vicKR/Zn6tg2kZv9l
 Y6mJe1rURVZGsGxvXzUwcNDdfj5V8jL9OGBXAgbqV/PCly7mhm6J1/EWOyk3zHe3zadA4Qp
 lbTndb7fDWQcsmrUTAkDg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fSuLkQWTdNc=;URT4QvhQR6gHeiMccSuAAJ92JgY
 FBn0s81Ozg8gzaBXmjNj9fo8HGoVnilankWACKRSlxU2UXX9Yt4cQscJYJeJ7tE1Cr/IAz6Ph
 lkFsDuoiQ/F9XMzcEtJFjDgCwPhxy3EPK1W1E4McLoO4XK8mBPCAfQ6uSX0mECWcdGMzpcEZm
 v61+28sARN33pSLoq4pXFHQrz+hF0dHXvzgwaoqYFS3PvNPjH2dK1VdNZCx5Jbj5BSMng7FIg
 DJzhcTXFaecD+F9RS3H+PIP86au/xKFqg6oCYaFDYLiNTIBVftzgUXtNnc97vx0T6cZUh8MWZ
 tTkRjGFtaAtDBGRnQUCjddP9f4SbXnJAdhuCFhZ0j9q732MpEyF7FgAr2dnMMpNCaUUWluQpA
 qG9Kf9gGEFhmSjGod8/7zC3qJjpyM+0gWjPEK2KJ1BtyszwHW5sWPPux8sBhqJOccBeQL5dei
 E7TMOF1IZzQPj6Dh/9IVq4xmj3EYdJ3wc0eEdXsPZQzaNjBdXh4E9u2NG7THPR1u0BbvlQe4f
 JNtlfbMr7J0zlDrqlPLqePJAJoPyPykZJOV6i2izrkMlro3sEGocTqswkX2qjaZwKf88nxKeo
 /SQEcctPGsoj+Q73wyFlf96qqoimOFozWAzFx8xqzUMnGpkhkwCyq2ksX/oWRoG2yD4ZiqKwT
 s1az1VQjQeMS47uZE+X+c1evkvFTfp2iLBAomYfYiD201nEMDpV5Zj7+JVfVVArrb3KBbzKBF
 YUGs+YurgMeZj1Y9ap2TjTjvCTj3gOEIvkmfeZidhMWuLKza0n/ofkTVNlAyRcdKpWryhM7xk
 I4kNjWguLtSTTZsADbV4KRl2WxBr2/TxG0a7CCVE5kYilqY3S4kJNqwZlt9Qr5TN8v5jq6SYD
 posvJ8zHQGQOVFOlOHcZq49P2YhYD0WAIneEEIsCMrEsGYUX4fhS9u+LnxnawZZX1U9l3C2V6
 vzzCzXS4Wu9f7IK+blecOFUf4IpQmZ+TaluOtJ6KILSsARkncsuVwSvC+/2HkLI/G14d9JAnZ
 BQS3H4D9j/94MgZM1pUrnVWdhbfL1Ui648Xp1cq90c3/Oii/+IZnfSUjuBUfvs9cWnhcE95NJ
 gGQw1LhitHSHhujAshgWMyY397CnO5

Am 10.01.25 um 23:33 schrieb Derek John Clark:

> On Thu, Jan 9, 2025 at 3:00=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> wrote=
:
>> Am 02.01.25 um 01:47 schrieb Derek J. Clark:
>>
>>> Adds lenovo-wmi-other.c which provides a driver for the Lenovo
>>> "Other Mode" WMI interface that comes on some Lenovo "Gaming
>>> Series" hardware. Provides a firmware-attributes class which
>>> enables the use of tunable knobs for SPL, SPPT, and FPPT.
>>>
>>> v2:
>>> - Use devm_kzalloc to ensure driver can be instanced, remove global
>>>     reference.
>>> - Ensure reverse Christmas tree for all variable declarations.
>>> - Remove extra whitespace.
>>> - Use guard(mutex) in all mutex instances, global mutex.
>>> - Use pr_fmt instead of adding the driver name to each pr_err.
>>> - Remove noisy pr_info usage.
>>> - Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
>>> - Use list to get the lenovo_wmi_om_priv instance in some macro
>>>     called functions as the data provided by the macros that use it
>>>     doesn't pass a member of the struct for use in container_of.
>>> - Do not rely on GameZone interface to grab the current fan mode.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    MAINTAINERS                             |   1 +
>>>    drivers/platform/x86/Kconfig            |  12 +
>>>    drivers/platform/x86/Makefile           |   1 +
>>>    drivers/platform/x86/lenovo-wmi-other.c | 385 +++++++++++++++++++++=
+++
>>>    drivers/platform/x86/lenovo-wmi.h       | 116 +++++++
>>>    5 files changed, 515 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c9374c395905..318e1e517eed 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13040,6 +13040,7 @@ L:    platform-driver-x86@vger.kernel.org
>>>    S:  Maintained
>>>    F:  drivers/platform/x86/lenovo-wmi-capdata01.c
>>>    F:  drivers/platform/x86/lenovo-wmi-gamezone.c
>>> +F:   drivers/platform/x86/lenovo-wmi-other.c
>>>    F:  drivers/platform/x86/lenovo-wmi.h
>>>
>>>    LETSKETCH HID TABLET DRIVER
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconf=
ig
>>> index a2c1ab47ad9e..e2285ab987c5 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -481,6 +481,18 @@ config LENOVO_WMI_DATA01
>>>          To compile this driver as a module, choose M here: the module=
 will
>>>          be called lenovo_wmi_capdata01.
>>>
>>> +config LENOVO_WMI_TUNING
>>> +     tristate "Lenovo Other Method WMI Driver"
>>> +     depends on LENOVO_WMI_DATA01
>> I think we should use "select LENOVO_WMI_DATA01" here. Ideally CONFIG_L=
ENOVO_WMI_DATA01
>> will automatically be enabled/disabled if users enable/disable CONFIG_L=
ENOVO_WMI_TUNING.
>>
> Makes sense with the other change. Will do.
>
>>> +     select FW_ATTR_CLASS
>>> +     help
>>> +       Say Y here if you have a WMI aware Lenovo Legion device and wo=
uld like to use the
>>> +       firmware_attributes API to control various tunable settings ty=
pically exposed by
>>> +       Lenovo software in Windows.
>>> +
>>> +       To compile this driver as a module, choose M here: the module =
will
>>> +       be called lenovo_wmi_other.
>> Check the module name again.
>>
>>> +
>>>    config IDEAPAD_LAPTOP
>>>        tristate "Lenovo IdeaPad Laptop Extras"
>>>        depends on ACPI
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Make=
file
>>> index 6c96cc3f3855..3e059b3c3647 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -70,6 +70,7 @@ obj-$(CONFIG_YT2_1380)              +=3D lenovo-yoga=
-tab2-pro-1380-fastcharger.o
>>>    obj-$(CONFIG_LENOVO_WMI_CAMERA)     +=3D lenovo-wmi-camera.o
>>>    obj-$(CONFIG_LENOVO_WMI_GAMEZONE)   +=3D lenovo-wmi-gamezone.o
>>>    obj-$(CONFIG_LENOVO_WMI_DATA01)     +=3D lenovo-wmi-capdata01.o
>>> +obj-$(CONFIG_LENOVO_WMI_TUNING)      +=3D lenovo-wmi-other.o
>>>
>>>    # Intel
>>>    obj-y                               +=3D intel/
>>> diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platfor=
m/x86/lenovo-wmi-other.c
>>> new file mode 100644
>>> index 000000000000..2392faa74973
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-other.c
>>> @@ -0,0 +1,385 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Lenovo Other Method WMI interface driver. This driver uses the fw_=
attributes
>>> + * class to expose the various WMI functions provided by the "Other M=
ethod" WMI
>>> + * interface. This enables CPU and GPU power limit as well as various=
 other
>>> + * attributes for devices that fall under the "Gaming Series" of Leno=
vo laptop
>>> + * devices. Each attribute exposed by the "Other Method"" interface h=
as a
>>> + * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the dri=
ver to
>>> + * probe details about the attribute such as set/get support, step, m=
in, max,
>>> + * and default value. Each attibute has multiple pages, one for each =
of the
>>> + * fan profiles managed by the GameZone interface, so it must be prob=
ed prior
>>> + * to returning the current_value.
>>> + *
>>> + * These attributes typically don't fit anywhere else in the sysfs an=
d are set
>>> + * in Windows using one of Lenovo's multiple user applications.
>>> + *
>>> + * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/list.h>
>>> +#include "lenovo-wmi.h"
>>> +#include "firmware_attributes_class.h"
>>> +
>>> +#define FW_ATTR_FOLDER "lenovo-wmi-other"
>>> +#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3=
B"
>>> +
>>> +/* Device IDs */
>>> +#define WMI_DEVICE_ID_CPU 0x01
>>> +
>>> +/* WMI_DEVICE_ID_CPU feature IDs */
>>> +#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
>>> +#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
>>> +#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
>>> +#define WMI_FEATURE_ID_CPU_FPPT_BAD 0x03 /* Long Term Power Limit */
>>> +
>>> +/* Method IDs */
>>> +#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
>>> +#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
>>> +
>>> +static DEFINE_MUTEX(call_mutex);
>> Is this mutex really necessary? If not then remove it please.
>>
> Same as other drivers, will remove.
>
>>> +static DEFINE_MUTEX(om_list_mutex);
>>> +static LIST_HEAD(om_wmi_list);
>>> +
>>> +struct lenovo_wmi_om_priv {
>>> +     struct wmi_device *wdev;
>>> +     struct device *fw_attr_dev;
>>> +     struct kset *fw_attr_kset;
>>> +     struct list_head list;
>>> +};
>>> +
>>> +static inline struct lenovo_wmi_om_priv *get_first_wmi_priv(void)
>>> +{
>>> +     guard(mutex)(&om_list_mutex);
>>> +     return list_first_entry_or_null(&om_wmi_list, struct lenovo_wmi_=
om_priv,
>>> +                                     list);
>>> +}
>>> +
>>> +static const struct wmi_device_id lenovo_wmi_other_id_table[] =3D {
>>> +     { LENOVO_OTHER_METHOD_GUID, NULL },
>>> +     {}
>>> +};
>> Please move the list of device ids closer to the driver struct.
>>
> Will do.
>
>>> +
>>> +/* Tunable Attributes */
>>> +struct tunable_attr_01 ppt_pl1_spl =3D { .device_id =3D WMI_DEVICE_ID=
_CPU,
>>> +                                    .feature_id =3D WMI_FEATURE_ID_CP=
U_SPL };
>>> +struct tunable_attr_01 ppt_pl2_sppt =3D { .device_id =3D WMI_DEVICE_I=
D_CPU,
>>> +                                     .feature_id =3D WMI_FEATURE_ID_C=
PU_SPPT };
>>> +struct tunable_attr_01 ppt_pl3_fppt =3D { .device_id =3D WMI_DEVICE_I=
D_CPU,
>>> +                                     .feature_id =3D WMI_FEATURE_ID_C=
PU_FPPT };
>>> +
>>> +struct capdata01_attr_group {
>>> +     const struct attribute_group *attr_group;
>>> +     struct tunable_attr_01 *tunable_attr;
>> Would it make sense to do something similar with each attribute, so tha=
t each attribute
>> can use container_of() to access lenovo_wmi_om_priv without having to u=
se a list lookup?
>>
>> This would of course mean that each attribute as to be allocated dynami=
cally.
>>
>> Heep in mind that we are currently working on a new API for registering=
 firmware-atrtibute class
>> devices which should fix this.
>>
> I'm not sure I understand what you mean exactly. I think what you're
> saying is, instead of an attr_group, allocate each attribute as a
> struct in priv?

Kind of. I envisioned something like this (pseudo code):

	struct firmware_attribute {
		struct kobj_attribute attr;
		struct lenovo_wmi_om_priv;
	}

This would allow you to use container_of() to access priv, but would force=
 you to allocate each attribute separately.
Maybe you can wait with the lenovo-wmi-other driver until the improved fir=
mware-attribute class device API has landed.
Meanwhile we can focus on the lenovo-wmi-gamezone driver.

>>> +};
>>> +
>>> +static const struct class *fw_attr_class;
>>> +
>>> +/**
>>> + * attr_capdata01_setup() - Get the data of the specified attribute
>>> + * from LENOVO_CAPABILITY_DATA_01 and store it.
>>> + * @tunable_attr: The attribute to be populated.
>>> + *
>>> + * Returns: Either 0 or an error.
>>> + */
>>> +static int attr_capdata01_setup(struct tunable_attr_01 *tunable_attr)
>>> +{
>>> +     struct capability_data_01 cap_data;
>>> +     int mode =3D SMARTFAN_MODE_CUSTOM;
>>> +     int err;
>>> +
>>> +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
>>> +                                           tunable_attr->feature_id,
>>> +                                           tunable_attr->device_id };
>> Please use FIELD_GET()/FIELD_PREP() here.
>>
> Can do.
>
>>> +
>>> +     err =3D lenovo_wmi_capdata01_get(attr_id, &cap_data);
>>> +     if (err) {
>>> +             pr_err("Failed to get capability data: %u\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     if (cap_data.supported < 1)
>>> +             return -EOPNOTSUPP;
>>> +
>>> +     tunable_attr->capdata =3D cap_data;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +/**
>>> + * attr_capdata01_show() - Get the value of the specified attribute p=
roperty
>>> + * from LENOVO_CAPABILITY_DATA_01.
>>> + * @kobj: Pointer to the driver object.
>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>> + * @buf: The buffer to write to.
>>> + * @tunable_attr: The attribute to be read.
>>> + * @prop: The property of this attribute to be read.
>>> + *
>>> + * This function is intended to be generic so it can be called from a=
ny "_show"
>>> + * attribute which works only with integers.
>>> + *
>>> + * If the WMI is success, then the sysfs attribute is notified.
>>> + *
>>> + * Returns: Either count, or an error.
>>> + */
>>> +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
>>> +                         char *buf, struct tunable_attr_01 *tunable_a=
ttr,
>>> +                         enum attribute_property prop)
>>> +{
>>> +     struct capability_data_01 cap_data;
>>> +     int retval;
>>> +
>>> +     cap_data =3D tunable_attr->capdata;
>>> +
>>> +     switch (prop) {
>>> +     case DEFAULT_VAL:
>>> +             retval =3D cap_data.default_value;
>>> +             break;
>>> +     case MAX_VAL:
>>> +             retval =3D cap_data.max_value;
>>> +             break;
>>> +     case MIN_VAL:
>>> +             retval =3D cap_data.min_value;
>>> +             break;
>>> +     case STEP_VAL:
>>> +             retval =3D cap_data.step;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +     return sysfs_emit(buf, "%u\n", retval);
>>> +}
>>> +
>>> +/* Simple attribute creation */
>>> +
>>> +/*
>>> + * att_current_value_store() - Set the current value of the given att=
ribute
>>> + * @kobj: Pointer to the driver object.
>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>> + * @buf: The buffer to read from, this is parsed to `int` type.
>>> + * @count: Required by sysfs attribute macros, pass in from the calle=
e attr.
>>> + * @tunable_attr: The attribute to be stored.
>>> + *
>>> + * This function is intended to be generic so it can be called from a=
ny
>>> + * attribute's "current_value_store" which works only with integers. =
The
>>> + * integer to be sent to the WMI method is range checked and an error=
 returned
>>> + * if out of range.
>>> + *
>>> + * If the value is valid and WMI is success, then the sysfs attribute=
 is
>>> + * notified.
>>> + *
>>> + * Returns: Either count, or an error.
>>> + */
>>> +ssize_t attr_current_value_store(struct kobject *kobj,
>>> +                              struct kobj_attribute *attr, const char=
 *buf,
>>> +                              size_t count,
>>> +                              struct tunable_attr_01 *tunable_attr)
>>> +{
>>> +     struct capability_data_01 cap_data;
>>> +     struct lenovo_wmi_om_priv *priv;
>>> +     int mode =3D SMARTFAN_MODE_CUSTOM;
>>> +     u32 value;
>>> +     int err;
>>> +
>>> +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
>>> +                                           tunable_attr->feature_id,
>>> +                                           tunable_attr->device_id };
>>> +
>>> +     err =3D kstrtouint(buf, 10, &value);
>>> +     if (err) {
>>> +             pr_err("Error converting value to int: %u\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     cap_data =3D tunable_attr->capdata;
>>> +
>>> +     if (value < cap_data.min_value || value > cap_data.max_value)
>>> +             return -EINVAL;
>>> +
>>> +     priv =3D get_first_wmi_priv();
>>> +     if (!priv)
>>> +             return -ENODEV;
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     err =3D lenovo_wmidev_evaluate_method_2(priv->wdev, 0x0,
>>> +                                           WMI_METHOD_ID_VALUE_SET,
>>> +                                           *(int *)&attr_id, value, N=
ULL);
>>> +
>>> +     if (err) {
>>> +             pr_err("Error setting attribute: %u\n", err);
>> This error message is unnecessary, please drop it.
>>
> Ack
>
>>> +             return err;
>>> +     }
>>> +
>>> +     tunable_attr->store_value =3D value;
>> Is this value used anywhere? If no then please drop it.
>>
> It isn't, will do.
>>> +
>>> +     sysfs_notify(kobj, NULL, attr->attr.name);
>> AFAIK this is unnecessary since userspace already expects the attribute=
 value to
>> change after an write access. This is only meant to be used should the =
value be
>> changed by for example the underlying hardware without user interventio=
n.
>>
> I can drop this too.
>
>>> +
>>> +     return count;
>>> +};
>>> +
>>> +/*
>>> + * attr_current_value_show() - Get the current value of the given att=
ribute
>>> + * @kobj: Pointer to the driver object.
>>> + * @kobj_attribute: Pointer to the attribute calling this function.
>>> + * @buf: The buffer to write to.
>>> + * @tunable_attr: The attribute to be read.
>>> + *
>>> + * This function is intended to be generic so it can be called from a=
ny "_show"
>>> + * attribute which works only with integers.
>>> + *
>>> + * If the WMI is success, then the sysfs attribute is notified.
>>> + *
>>> + * Returns: Either count, or an error.
>>> + */
>>> +ssize_t attr_current_value_show(struct kobject *kobj,
>>> +                             struct kobj_attribute *attr, char *buf,
>>> +                             struct tunable_attr_01 *tunable_attr)
>>> +{
>>> +     struct lenovo_wmi_om_priv *priv;
>>> +     int mode =3D SMARTFAN_MODE_CUSTOM;
>>> +     int retval;
>>> +     int err;
>>> +
>>> +     struct lenovo_wmi_attr_id attr_id =3D { mode << 8,
>>> +                                           tunable_attr->feature_id,
>>> +                                           tunable_attr->device_id };
>>> +
>>> +     priv =3D get_first_wmi_priv();
>>> +     if (!priv)
>>> +             return -ENODEV;
>>> +
>>> +     guard(mutex)(&call_mutex);
>>> +     err =3D lenovo_wmidev_evaluate_method_1(priv->wdev, 0x0,
>>> +                                           WMI_METHOD_ID_VALUE_GET,
>>> +                                           *(int *)&attr_id, &retval)=
;
>>> +
>>> +     if (err) {
>>> +             pr_err("Error getting attribute: %u\n", err);
>>> +             return err;
>>> +     }
>>> +
>>> +     return sysfs_emit(buf, "%u\n", retval);
>>> +}
>>> +
>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
>>> +                         "Set the CPU sustained power limit");
>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
>>> +                         "Set the CPU slow package power tracking lim=
it");
>>> +ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
>>> +                         "Set the CPU fast package power tracking lim=
it");
>>> +
>>> +static const struct capdata01_attr_group capdata01_attr_groups[] =3D =
{
>>> +     { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
>>> +     { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
>>> +     { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
>>> +     {},
>>> +};
>>> +
>>> +static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *priv)
>>> +{
>>> +     int err, i;
>>> +
>>> +     err =3D fw_attributes_class_get(&fw_attr_class);
>>> +     if (err) {
>>> +             pr_err("Failed to get firmware_attributes_class: %u\n", =
err);
>>> +             return err;
>>> +     }
>>> +
>>> +     priv->fw_attr_dev =3D device_create(fw_attr_class, NULL, MKDEV(0=
, 0),
>>> +                                       NULL, "%s", FW_ATTR_FOLDER);
>>> +     if (IS_ERR(priv->fw_attr_dev)) {
>>> +             err =3D PTR_ERR(priv->fw_attr_dev);
>>> +             pr_err("Failed to create firmware_attributes_class devic=
e: %u\n",
>>> +                    err);
>>> +             goto fail_class_get;
>>> +     }
>>> +
>>> +     priv->fw_attr_kset =3D kset_create_and_add("attributes", NULL,
>>> +                                              &priv->fw_attr_dev->kob=
j);
>>> +     if (!priv->fw_attr_kset) {
>>> +             err =3D -ENOMEM;
>>> +             pr_err("Failed to create firmware_attributes_class kset:=
 %u\n",
>>> +                    err);
>>> +             goto err_destroy_classdev;
>>> +     }
>>> +
>>> +     for (i =3D 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
>>> +             err =3D attr_capdata01_setup(
>>> +                     capdata01_attr_groups[i].tunable_attr);
>>> +             if (err) {
>>> +                     pr_err("Failed to populate capability data for %=
s: %u\n",
>>> +                            capdata01_attr_groups[i].attr_group->name=
, err);
>>> +                     continue;
>>> +             }
>>> +
>>> +             err =3D sysfs_create_group(&priv->fw_attr_kset->kobj,
>>> +                                      capdata01_attr_groups[i].attr_g=
roup);
>> AFAIK there exists sysfs_create_groups(). Together with the *_is_visibl=
e callbacks this
>> should simplify this part of your code a lot.
>>
> Part of this code is caching the capability data so it doesn't need to
> be called after probe. If I can get the cached list working in that
> driver I can drop storing it here and use _is_visible as a macro
> component.

OK.

>>> +             if (err) {
>>> +                     pr_err("Failed to create sysfs-group for %s: %u\=
n",
>>> +                            capdata01_attr_groups[i].attr_group->name=
, err);
>>> +                     goto err_remove_groups;
>>> +             }
>>> +     }
>>> +
>>> +     return 0;
>>> +
>>> +err_remove_groups:
>>> +     while (i-- > 0) {
>>> +             sysfs_remove_group(&priv->fw_attr_kset->kobj,
>>> +                                capdata01_attr_groups[i].attr_group);
>>> +     }
>>> +
>>> +     return err;
>> Please remove this return statement, since the other resources need to =
be cleaned up too.
> Agree. Ilpo noted these as well.
>
>> Also where do you clean up the kset?
> I'll add it here.
>
>>> +
>>> +err_destroy_classdev:
>>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
>> Please use device_unregister() instead.
>>
> Ack
>
>>> +
>>> +     return err;
>> ...
>>> +
>>> +fail_class_get:
>>> +     fw_attributes_class_put();
>>> +
>>> +     return err;
>>> +}
>>> +
>>> +static int lenovo_wmi_other_probe(struct wmi_device *wdev, const void=
 *context)
>>> +{
>>> +     struct lenovo_wmi_om_priv *priv;
>>> +
>>> +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +     if (!priv)
>>> +             return -ENOMEM;
>>> +
>>> +     priv->wdev =3D wdev;
>> Missing dev_set_drvdata().
>>
> Ack
>
>>> +
>>> +     guard(mutex)(&om_list_mutex);
>>> +     list_add_tail(&priv->list, &om_wmi_list);
>>> +
>>> +     return other_method_fw_attr_add(priv);
>>> +}
>>> +
>>> +static void lenovo_wmi_other_remove(struct wmi_device *wdev)
>>> +{
>>> +     struct lenovo_wmi_om_priv *priv =3D dev_get_drvdata(&wdev->dev);
>>> +
>>> +     guard(mutex)(&om_list_mutex);
>>> +     list_del(&priv->list);
>>> +     kset_unregister(priv->fw_attr_kset);
>>> +     device_destroy(fw_attr_class, MKDEV(0, 0));
>>> +     fw_attributes_class_put();
>>> +}
>>> +
>>> +static struct wmi_driver lenovo_wmi_other_driver =3D {
>>> +     .driver =3D { .name =3D "lenovo_wmi_other" },
>> .probe_type =3D PROBE_PREFER_ASYNCHRONOUS
>>
> Ack
>
>>> +     .id_table =3D lenovo_wmi_other_id_table,
>>> +     .probe =3D lenovo_wmi_other_probe,
>>> +     .remove =3D lenovo_wmi_other_remove,
>> .no_singleton =3D true
>>
> Ack
>
>> In this case please make sure that the name of the firmware-attributes =
class device is unique.
>> You can use an IDA (https://docs.kernel.org/core-api/idr.html) for this=
.
> Will do, thanks.
>
>>> +};
>>> +
>>> +module_wmi_driver(lenovo_wmi_other_driver);
>>> +
>>> +MODULE_IMPORT_NS("CAPDATA_WMI");
>>> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo Other Method WMI Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/=
lenovo-wmi.h
>>> index 53cea84a956b..1c8358551ba6 100644
>>> --- a/drivers/platform/x86/lenovo-wmi.h
>>> +++ b/drivers/platform/x86/lenovo-wmi.h
>>> @@ -42,6 +42,14 @@ struct lenovo_wmi_attr_id {
>>>        u32 device_id : 8; /* CPU/GPU/... */
>>>    } __packed;
>>>
>>> +enum attribute_property {
>>> +     DEFAULT_VAL,
>>> +     MAX_VAL,
>>> +     MIN_VAL,
>>> +     STEP_VAL,
>>> +     SUPPORTED,
>>> +};
>>> +
>>>    /* Data struct for LENOVO_CAPABILITY_DATA_01 */
>>>    struct capability_data_01 {
>>>        u32 id;
>>> @@ -52,6 +60,14 @@ struct capability_data_01 {
>>>        u32 max_value;
>>>    };
>>>
>>> +/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
>>> +struct tunable_attr_01 {
>>> +     struct capability_data_01 capdata;
>>> +     u32 device_id;
>>> +     u32 feature_id;
>>> +     u32 store_value;
>>> +};
>>> +
>>>    /* General Use functions */
>>>    static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u=
8 instance,
>>>                                         u32 method_id, struct acpi_buf=
fer *in,
>>> @@ -122,4 +138,104 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_d=
evice *wdev, u8 instance,
>>>    int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
>>>                             struct capability_data_01 *cap_data);
>>>
>>> +/* Other Method attribute functions */
>>> +ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribu=
te *attr,
>>> +                         char *buf, struct tunable_attr_01 *tunable_a=
ttr,
>>> +                         enum attribute_property prop);
>>> +
>>> +ssize_t attr_current_value_store(struct kobject *kobj,
>>> +                              struct kobj_attribute *attr, const char=
 *buf,
>>> +                              size_t count,
>>> +                              struct tunable_attr_01 *tunable_attr);
>>> +
>>> +ssize_t attr_current_value_show(struct kobject *kobj,
>>> +                             struct kobj_attribute *attr, char *buf,
>>> +                             struct tunable_attr_01 *tunable_attr);
>>> +
>>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *at=
tr,
>>> +                   char *buf);
>>> +
>>> +ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *at=
tr,
>>> +                   char *buf)
>>> +{
>>> +     return sysfs_emit(buf, "integer\n");
>>> +}
>>> +
>>> +/* Other Method attribute macros */
>>> +#define __LL_ATTR_RO(_func, _name)                                   =
 \
>>> +     {                                                             \
>>> +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444=
 }, \
>>> +             .show =3D _func##_##_name##_show,                       =
\
>>> +     }
>>> +
>>> +#define __LL_ATTR_RO_AS(_name, _show)                                =
 \
>>> +     {                                                             \
>>> +             .attr =3D { .name =3D __stringify(_name), .mode =3D 0444=
 }, \
>>> +             .show =3D _show,                                        =
\
>>> +     }
>>> +
>>> +#define __LL_ATTR_RW(_func, _name) \
>>> +     __ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_st=
ore)
>>> +
>>> +/* Shows a formatted static variable */
>>> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                =
         \
>>> +     static ssize_t _attrname##_##_prop##_show(                      =
      \
>>> +             struct kobject *kobj, struct kobj_attribute *attr, char =
*buf) \
>>> +     {                                                               =
      \
>>> +             return sysfs_emit(buf, _fmt, _val);                     =
      \
>>> +     }                                                               =
      \
>>> +     static struct kobj_attribute attr_##_attrname##_##_prop =3D     =
        \
>>> +             __LL_ATTR_RO(_attrname, _prop)
>>> +
>>> +/* Attribute current_value show/store */
>>> +#define __LL_TUNABLE_RW_CAP01(_attrname)                             =
         \
>>> +     static ssize_t _attrname##_current_value_store(                 =
      \
>>> +             struct kobject *kobj, struct kobj_attribute *attr,      =
      \
>>> +             const char *buf, size_t count)                          =
      \
>>> +     {                                                               =
      \
>>> +             return attr_current_value_store(kobj, attr, buf, count, =
      \
>>> +                                             &_attrname);            =
      \
>>> +     }                                                               =
      \
>>> +     static ssize_t _attrname##_current_value_show(                  =
      \
>>> +             struct kobject *kobj, struct kobj_attribute *attr, char =
*buf) \
>>> +     {                                                               =
      \
>>> +             return attr_current_value_show(kobj, attr, buf, &_attrna=
me);  \
>>> +     }                                                               =
      \
>>> +     static struct kobj_attribute attr_##_attrname##_current_value =
=3D       \
>>> +             __LL_ATTR_RW(_attrname, current_value)
>>> +
>>> +/* Attribute property show only */
>>> +#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)          =
         \
>>> +     static ssize_t _attrname##_##_prop##_show(                      =
      \
>>> +             struct kobject *kobj, struct kobj_attribute *attr, char =
*buf) \
>>> +     {                                                               =
      \
>>> +             return attr_capdata01_show(kobj, attr, buf, &_attrname, =
      \
>>> +                                        _prop_type);                 =
      \
>>> +     }                                                               =
      \
>>> +     static struct kobj_attribute attr_##_attrname##_##_prop =3D     =
        \
>>> +             __LL_ATTR_RO(_attrname, _prop)
>>> +
>>> +#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)   =
  \
>>> +     __LL_TUNABLE_RW_CAP01(_attrname);                              \
>>> +     __LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
>>> +     __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
>>> +     __LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
>>> +     __LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
>>> +     __LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
>>> +     static struct kobj_attribute attr_##_attrname##_type =3D        =
 \
>>> +             __LL_ATTR_RO_AS(type, int_type_show);                  \
>>> +     static struct attribute *_attrname##_attrs[] =3D {              =
 \
>>> +             &attr_##_attrname##_current_value.attr,                \
>>> +             &attr_##_attrname##_default_value.attr,                \
>>> +             &attr_##_attrname##_display_name.attr,                 \
>>> +             &attr_##_attrname##_max_value.attr,                    \
>>> +             &attr_##_attrname##_min_value.attr,                    \
>>> +             &attr_##_attrname##_scalar_increment.attr,             \
>>> +             &attr_##_attrname##_type.attr,                         \
>>> +             NULL,                                                  \
>>> +     };                                                             \
>>> +     static const struct attribute_group _attrname##_attr_group =3D {=
 \
>>> +             .name =3D _fsname, .attrs =3D _attrname##_attrs         =
   \
>>> +     }
>> Is there a reason why this needs to be put inside the header? If no the=
n please put this
>> inside the driver.
> To clarify, you mean the macros? I was under the impression they
> belonged in headers but I can move them. I will move some of the
> enums/structs as well which are referenced here and the driver only.

I mean both the macros and the show functions. They are only used inside l=
enovo-wmi-other, so there
is no reason to expose them inside the public header.

Thanks,
Armin Wolf

>
>> Thanks,
>> Armin Wolf
>>
>>> +
>>>    #endif /* !_LENOVO_WMI_H_ */
