Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31551FE45D;
	Fri, 27 Feb 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184441; cv=none; b=shnSJYFeJvk7yWhTuMNhWoLBV8v33zY/5fp2FGxkaQKCXM4BuLfO1/RrZmlbWklYd5gUXs3pmtgyxdyWqylhci+JwIPgoibHz3g/9O8JrZhRovNTF2gi2eN9MZbbjr2C5e5wSfuCJXq9LAB/X7soJTeCy38eEMVR/opbNCz5oxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184441; c=relaxed/simple;
	bh=GK7pGSr5j3ej5ii3yXM2FE0cWAm3OscH3CYGpcMj7NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBA6Tl3WOqGqObuio4cE8hRuYOUKUPDUaUGFBlpI2P3/bMPvejhpo7HudbbfU8mdwxPVlGwnAiRy1/JtXZHGcngbQKQ7SQJS9njT3LuP1LutgNeV1jhwglNkSB46BnOIeGAe8Hxbyv4/fsw29P5VFIqHMt/44l4XrKX9pB7OVOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qKCT8gvL; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qKCT8gvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772184437; x=1772789237; i=w_armin@gmx.de;
	bh=GK7pGSr5j3ej5ii3yXM2FE0cWAm3OscH3CYGpcMj7NM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qKCT8gvLv1iYSlZyTYXWnxXbsCRva81keWh8kJVfArqp7BIU0KMje646DlpkfApl
	 aoYBkQGOl6XPU02a25PQwmhHNNnEbSnXn0EYxK2BCgcHHju9UoeP9blhrUBxl1XQ8
	 c8TcOxOBIlAUqkwkL2Bc+gyS9YvWHHtaFkZpVFLy4Ks4O0SnX7NsN66hFHcSVsk1u
	 OIG/eL+2DLfRtVdTyfG3eLCoPI5jy8TwlWxzClN/7v9cUvzfKfctz5ioIRsEBB5jl
	 NaW31zIWAmSTeps34TY1N5503a5A/SKXh8pxjR8kfztyo0q5BkrjaXFJTD3+lPu83
	 1xKmVMNopV8ryNgNPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIdiZ-1vsJc13FGn-006qVD; Fri, 27
 Feb 2026 10:27:16 +0100
Message-ID: <d83daeac-0655-4c14-b6b7-75a7b3ed0f05@gmx.de>
Date: Fri, 27 Feb 2026 10:27:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/uniwill: Implement USB-C power priority
 setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-2-wse@tuxedocomputers.com>
 <fb265a61-df38-472e-b155-c19f4dea2049@gmx.de>
 <42df9fcf-2037-41a0-aac7-f255e9e46c82@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <42df9fcf-2037-41a0-aac7-f255e9e46c82@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xd21o2L/fz/7WbmEB/aNy0CwM77oIxX3MEjLj2gDKejPLcG5Bjs
 nBAE16zqJkgjDI1G/K3gscwn6gFDUgEbu2sJrQW8FndnZgm3eLgf8o4Z/qW52yMhcUYTBdy
 qe7B24D7jpsBfFqAftYeRZCiVAvRcXuj6Jtu0E2NAML3O0azEwx4sl1jE9CSg3h2vpv4vyD
 cCMErUddhRCdzL4M2gjcg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DdRF884BVMk=;1s88egzc0V9Gv9dC4Ot4wdF92X2
 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

Am 26.02.26 um 16:55 schrieb Werner Sembach:

>
> Am 26.02.26 um 02:11 schrieb Armin Wolf:
>> Am 26.02.26 um 01:31 schrieb Werner Sembach:
>>
>>> On some devices Uniwill offers the option to set the USB-C port to
>>> prioritise charging or performance. This patch exposes this setting=20
>>> to the
>>> userspace via sysfs for all TUXEDO devices supporting it.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 99=20
>>> +++++++++++++++++++--
>>> =C2=A0 1 file changed, 94 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 7ab82cf16f388..4d9657a3b8c10 100644
>>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> @@ -266,8 +266,8 @@
>>> =C2=A0 #define BATTERY_CHARGE_FULL_OVER_24H=C2=A0=C2=A0=C2=A0 BIT(3)
>>> =C2=A0 #define BATTERY_ERM_STATUS_REACHED=C2=A0=C2=A0=C2=A0 BIT(4)
>>> =C2=A0 -#define EC_ADDR_CHARGE_PRIO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x07CC
>>> -#define CHARGING_PERFORMANCE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(7)
>>> +#define EC_ADDR_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 0x07CC
>>> +#define USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(7)
>>> =C2=A0 =C2=A0 /* Same bits as EC_ADDR_LIGHTBAR_AC_CTRL except LIGHTBAR=
_S3_OFF */
>>> =C2=A0 #define EC_ADDR_LIGHTBAR_BAT_CTRL=C2=A0=C2=A0=C2=A0 0x07E2
>>> @@ -324,6 +324,7 @@
>>> =C2=A0 #define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(7)
>>> =C2=A0 #define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(8)
>>> =C2=A0 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 B=
IT(9)
>>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(10=
)
>>> =C2=A0 =C2=A0 struct uniwill_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>> @@ -343,6 +344,7 @@ struct uniwill_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex input_lock;=C2=A0=C2=A0=C2=
=A0 /* Protects input sequence during=20
>>> notify */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct input_dev *input_device;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block nb;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int last_usb_c_power_priority;
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 struct uniwill_battery_entry {
>>> @@ -527,6 +529,7 @@ static bool uniwill_writeable_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -565,6 +568,7 @@ static bool uniwill_readable_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -587,6 +591,7 @@ static bool uniwill_volatile_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -883,6 +888,86 @@ static int uniwill_nvidia_ctgp_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +enum usb_c_power_priority_options {
>>> +=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_OPTIONS_CHARGING =3D 0,
>>> +=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
>>> +};
>>> +
>>> +static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 [USB_C_POWER_PRIORITY_OPTIONS_CHARGING]=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "charging",
>>> +=C2=A0=C2=A0=C2=A0 [USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]=C2=A0=
=C2=A0=C2=A0 =3D "performance",
>>> +};
>>> +
>>> +static const u8 USB_C_POWER_PRIORITY_OPTIONS_VALUE[] =3D {
>>> +=C2=A0=C2=A0=C2=A0 [USB_C_POWER_PRIORITY_OPTIONS_CHARGING]=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0,
>>> +=C2=A0=C2=A0=C2=A0 [USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE]=C2=A0=
=C2=A0=C2=A0 =3D=20
>>> USB_C_POWER_PRIORITY,
>>> +};
>>> +
>>> +static ssize_t usb_c_power_priority_store(struct device *dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_at=
tribute *attr,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf,=
 size_t count)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D sysfs_match_string(USB_C_POWER_PRIORITY_OP=
TIONS_TEXT, buf);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>
>> Please put a blank line here.
> ack
>>
>>> +=C2=A0=C2=A0=C2=A0 value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[ret];
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap,=20
>>> EC_ADDR_USB_C_POWER_PRIORITY,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY, value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>
>> I think you need a mutex here, so concurrent writes to the charging=20
>> priority
>> sysfs attribute are serialized. This mutex would then also protect=20
>> concurrent
>> access to data->last_usb_c_power_priority by the event handler.
> ack
>>
>>> +=C2=A0=C2=A0=C2=A0 data->last_usb_c_power_priority =3D value;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return count;
>>> +}
>>> +
>>> +static ssize_t usb_c_power_priority_show(struct device *dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribut=
e *attr,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *buf)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_drvdata(dev)=
;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> +=C2=A0=C2=A0=C2=A0 ssize_t count =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_PO=
WER_PRIORITY,=20
>>> &value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +=C2=A0=C2=A0=C2=A0 value &=3D USB_C_POWER_PRIORITY;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i <=20
>>> ARRAY_SIZE(USB_C_POWER_PRIORITY_OPTIONS_VALUE); ++i) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (USB_C_POWER_PRIORITY_O=
PTIONS_VALUE[i] =3D=3D value)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
unt +=3D sysfs_emit_at(buf, count, "[%s] ",
>>> + USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
unt +=3D sysfs_emit_at(buf, count, "%s ",
>>> + USB_C_POWER_PRIORITY_OPTIONS_TEXT[i]);
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 if (count)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buf[count - 1] =3D '\n';
>>
>> Please just emit=20
>> USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTIONS_PERFORM=
ANCE]=20
>> directly
>> when the bit is set, and=20
>> USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTIONS_CHARGIN=
G]=20
>> otherwise.
>> This for loop provides no real value.
>
> It does give context on which values are available. It it is otherwise=
=20
> not easily deduceable without referring to the documentation.
>
> Also=C2=A0USB_C_POWER_PRIORITY_OPTIONS_VALUE[USB_C_POWER_PRIORITY_OPTION=
S_PERFORMANCE]=20
> is BIT(7) which is a kinda random number when expressed as an integer.
>
Sorry, i meant USB_C_POWER_PRIORITY_OPTIONS_TEXT[].

I do not think that using the "option1 [option2]" syntax provides any real=
 benefit here. The users need to read the documentation
anyway in order to even find this attribute, and the set of available opti=
ons is always the same.

Please drop this.

>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return count;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(usb_c_power_priority);
>>> +
>>> +static int usb_c_power_priority_restore(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap, EC_ADDR_O=
EM_4,=20
>>> USB_C_POWER_PRIORITY,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->last_usb_c_power_priority);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return ret;
>>
>> Please check the feature flag here before performing the register=20
>> access. You should also
>> omit "ret" and instead return the result directly.
> ack
>>
>> Maybe you also need to add the appropriate suspend/resume functions=20
>> for this?
> tuxedo-drivers doesn't have it for this, so it's probably not necessary

Please add the appropriate suspend/resume functions anyway, just in case t=
he user has
connected the charger while the system was suspended.

Thanks,
Armin Wolf

>>
>>> +}
>>> +
>>> =C2=A0 static struct attribute *uniwill_attrs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Keyboard-related */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock.attr,
>>> @@ -893,6 +978,7 @@ static struct attribute *uniwill_attrs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_breathing_in_suspend.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Power-management-related */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_ctgp_offset.attr,
>>> +=C2=A0=C2=A0=C2=A0 &dev_attr_usb_c_power_priority.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>> =C2=A0 };
>>> =C2=A0 @@ -927,6 +1013,11 @@ static umode_t=20
>>> uniwill_attr_is_visible(struct kobject *kobj, struct attribute *a
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return attr->mode;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_usb_c_power_prior=
ity.attr) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_support=
s(data,=20
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn attr->mode;
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 @@ -1417,9 +1508,7 @@ static int uniwill_notifier_call(struct=
=20
>>> notifier_block *nb, unsigned long action
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return N=
OTIFY_OK;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* noop for the time being=
, will change once charging priority
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * gets implemented.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usb_c_power_priority_resto=
re(data);
>>
>> Please use notifier_from_errno() here.
> ack
>>
>> Thanks,
>> Armin Wolf
>>
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return N=
OTIFY_OK;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_FN_LOCK:
>
