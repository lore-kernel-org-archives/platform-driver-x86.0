Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906D5349B0A;
	Tue,  3 Mar 2026 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772570454; cv=none; b=d8XxTIOWOeuDMQkwE8AxUSuAPWm0fudjyy4xp2O4kc3sQxiiR/TvGie7javaZ11y3Ml507FumgjFg6uhueQ3W+oinx2WiMwgm9FUNbVhvTXF16UkvS2nNpvXmmKDDQTv4pN5+G88FpvMuvxH3yYoao2n4JktCpvBxPoCnPd95qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772570454; c=relaxed/simple;
	bh=oma2ZJOqHTZaNu7ZSZhi2poUpS6Y4169wvZ7zLkHWwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=be/fnc/HcTvmN0pRcp58Om9pTIoKp0pLVFUJM16G/xzVhS9R3RkXE+7yN7vnTJApdeJjRBOIYEogCMPIqI/4+HK0PL7FriUdhM1vh8gS2QLAXz6pN41fSBPHjiPvuMCZcqmclB/vSTR5WPfhW8jFeH6Gf3rJRS4GJ5+8QF3PXBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FzYIJrLt; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FzYIJrLt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772570446; x=1773175246; i=w_armin@gmx.de;
	bh=oma2ZJOqHTZaNu7ZSZhi2poUpS6Y4169wvZ7zLkHWwc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FzYIJrLt/IKctT6vFNTOJoLrkgI4medWKmUBovlGLXFsDWdHHCKGdg7U7S+UDQM8
	 ItHo88HwLeOVyQjQNLHtdFxDmg5k21EvH1KiGQfl5isTeRWasL3v4XfSKhZvexT1V
	 2+hIVNnUHdcY3dt2zaoHMRlj/FNKvLX7j4qmoWga/HH0rpS11gJ7dVh2YjPe6uiXI
	 XB7bQAbqa6QB3uM+q0f/VYHsPqi3eTlCWUriMlB5VPXq9S83poR9Cj7uKao+4QzYD
	 8Xe4NFJfHrmaVltPFx8Bss/IRZho5R5wcgrVOzoVpGBPRjl2LiaoQaFsSDdP8b4Y6
	 tOkz2qRZdDeTpRedTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5VD8-1vdIoR2hxK-00ut4H; Tue, 03
 Mar 2026 21:40:45 +0100
Message-ID: <465788ad-e885-495d-8403-2f6ee52952e4@gmx.de>
Date: Tue, 3 Mar 2026 21:40:39 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] platform/x86/uniwill: Implement USB-C power
 priority setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260227200906.514928-1-wse@tuxedocomputers.com>
 <20260227200906.514928-3-wse@tuxedocomputers.com>
 <1f498e55-c365-4fb5-b06f-e0413774a453@gmx.de>
 <2f7842c1-492c-4331-b789-7f6d0c71f792@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2f7842c1-492c-4331-b789-7f6d0c71f792@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:A0sPZvS4NtvwjSH9EGd4Aad37bKA9gnI4S/l4FZ2PVDmuohrd+5
 2+iSns8YA/Zw7zLAP9pdehlIgM/VdYV7D8z6pU1yOhtyPCzeZYe3zYsmxgQXrslSQmc0JB4
 U2RdJAhS42VrT/W4lTyDJri77Ay8s+WYsuNdleOu7tko9p41PiV3HkgMfHUvEF31Pax17IP
 YHfgRu//yU9taI6VqsuLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qofsqXiTEdg=;yd9WFbPEV/IysnCHNQgqG8ovfY9
 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

Am 02.03.26 um 19:22 schrieb Werner Sembach:

>
> Am 01.03.26 um 14:05 schrieb Armin Wolf:
>> Am 27.02.26 um 21:07 schrieb Werner Sembach:
>>
>>> On some devices Uniwill offers the option to set the USB-C port to
>>> prioritise charging or performance. This patch exposes this setting=20
>>> to the
>>> userspace via sysfs for all TUXEDO devices supporting it.
>>>
>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> ---
>>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 147=20
>>> +++++++++++++++++++-
>>> =C2=A0 1 file changed, 140 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>>> index 048b265bff374..f92c24d64160b 100644
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
>>> @@ -324,6 +324,12 @@
>>> =C2=A0 #define UNIWILL_FEATURE_PRIMARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 BIT(7)
>>> =C2=A0 #define UNIWILL_FEATURE_SECONDARY_FAN=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(8)
>>> =C2=A0 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=C2=A0=C2=A0=C2=A0 B=
IT(9)
>>> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY=C2=A0=C2=A0=C2=A0 BIT(10=
)
>>> +
>>> +enum usb_c_power_priority_options {
>>> +=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_OPTIONS_CHARGING =3D 0,
>>> +=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY_OPTIONS_PERFORMANCE,
>>> +};
>>> =C2=A0 =C2=A0 struct uniwill_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev;
>>> @@ -343,6 +349,8 @@ struct uniwill_data {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex input_lock;=C2=A0=C2=A0=C2=
=A0 /* Protects input sequence during=20
>>> notify */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct input_dev *input_device;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct notifier_block nb;
>>> +=C2=A0=C2=A0=C2=A0 struct mutex usb_c_power_priority_lock; /* Protect=
s dependent=20
>>> bit write and state safe */
>>> +=C2=A0=C2=A0=C2=A0 enum usb_c_power_priority_options=20
>>> last_usb_c_power_priority_option;
>>> =C2=A0 };
>>> =C2=A0 =C2=A0 struct uniwill_battery_entry {
>>> @@ -527,6 +535,7 @@ static bool uniwill_writeable_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -565,6 +574,7 @@ static bool uniwill_readable_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_CTGP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_TPP_OFFSET:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CTGP_DB_DB_OFFSET:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -587,6 +597,7 @@ static bool uniwill_volatile_reg(struct device=20
>>> *dev, unsigned int reg)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_TRIGGER:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_SWITCH_STATUS:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case EC_ADDR_CHARGE_CTRL:
>>> +=C2=A0=C2=A0=C2=A0 case EC_ADDR_USB_C_POWER_PRIORITY:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return true;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return false;
>>> @@ -883,6 +894,106 @@ static int uniwill_nvidia_ctgp_init(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> =C2=A0 }
>>> =C2=A0 +static const char * const USB_C_POWER_PRIORITY_OPTIONS_TEXT[] =
=3D {
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
>>> +=C2=A0=C2=A0=C2=A0 enum usb_c_power_priority_options option;
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 option =3D sysfs_match_string(USB_C_POWER_PRIORITY=
_OPTIONS_TEXT,=20
>>> buf);
>>> +=C2=A0=C2=A0=C2=A0 if (option < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return option;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 value =3D USB_C_POWER_PRIORITY_OPTIONS_VALUE[optio=
n];
>>> +
>>> +=C2=A0=C2=A0=C2=A0 guard(mutex)(&data->usb_c_power_priority_lock);
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_update_bits(data->regmap,=20
>>> EC_ADDR_USB_C_POWER_PRIORITY,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY, value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 data->last_usb_c_power_priority_option =3D option;
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
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value, i;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_PO=
WER_PRIORITY,=20
>>> &value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 value &=3D USB_C_POWER_PRIORITY;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_=
OPTIONS_VALUE);=20
>>> ++i)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (USB_C_POWER_PRIORITY_O=
PTIONS_VALUE[i] =3D=3D value)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn sysfs_emit(buf, "%s\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIO=
RITY_OPTIONS_TEXT[i]);
>>> +
>>
>> Please drop this for-loop and use a if-statement instead:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0if (value & USB_C_POWER_PRIORITY)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%s\n=
",=20
>> USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_POWER_PRIORITY_OPTIONS_PERFORMA=
NCE]);
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0return sysfs_emit(buf, "%s\n",=20
>> USB_C_POWER_PRIORITY_OPTIONS_TEXT[USB_C_POWER_PRIORITY_OPTIONS_CHARGING=
]);
>>
>> Also, i think USB_C_POWER_PRIORITY_OPTIONS_VALUE[] is unnecessary.=20
>> Using an if-statement would yield more readable
>> code than using for-loops in this case.
>
> I can see where the for loop is unnecessary, but=20
> dropping=C2=A0USB_C_POWER_PRIORITY_OPTIONS_VALUE kinda obfuscates that=
=20
> there are 2 profiles, i like the clear association with the enum and=20
> stuff. the compile will be optimizing it out anyway.
>
Fine, then you can keep it as it is. In this case you might also keep the =
second for-loop.

>>
>>> +=C2=A0=C2=A0=C2=A0 /* Since all possible values are valid, this shoul=
d be=20
>>> unreachable. */
>>> +=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +}
>>> +
>>> +static DEVICE_ATTR_RW(usb_c_power_priority);
>>> +
>>> +static int usb_c_power_priority_restore(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 value =3D=20
>>> USB_C_POWER_PRIORITY_OPTIONS_VALUE[data->last_usb_c_power_priority_opt=
ion];
>>
>> You need to take the appropriate mutex here.
> ack
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return regmap_update_bits(data->regmap,=20
>>> EC_ADDR_USB_C_POWER_PRIORITY,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 USB_C_POWER_PRIORITY, value);
>>> +}
>>> +
>>> +static int usb_c_power_priority_init(struct uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 unsigned int value, i;
>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev,=20
>>> &data->usb_c_power_priority_lock);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_USB_C_PO=
WER_PRIORITY,=20
>>> &value);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 value &=3D USB_C_POWER_PRIORITY;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(USB_C_POWER_PRIORITY_=
OPTIONS_VALUE);=20
>>> ++i)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (USB_C_POWER_PRIORITY_O=
PTIONS_VALUE[i] =3D=3D value) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 da=
ta->last_usb_c_power_priority_option =3D i;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> Please drop this for-loop and use an if-statement instead.
> ok
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /* Since all possible values are valid, this shoul=
d be=20
>>> unreachable. */
>>> +=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>> +}
>>> +
>>> =C2=A0 static struct attribute *uniwill_attrs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Keyboard-related */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock.attr,
>>> @@ -893,6 +1004,7 @@ static struct attribute *uniwill_attrs[] =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_breathing_in_suspend.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Power-management-related */
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_ctgp_offset.attr,
>>> +=C2=A0=C2=A0=C2=A0 &dev_attr_usb_c_power_priority.attr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL
>>> =C2=A0 };
>>> =C2=A0 @@ -927,6 +1039,11 @@ static umode_t=20
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
>>> =C2=A0 @@ -1417,11 +1534,10 @@ static int uniwill_notifier_call(struct=
=20
>>> notifier_block *nb, unsigned long action
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return N=
OTIFY_OK;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_DC_ADAPTER_CHANGED:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* noop for the time being=
, will change once charging priority
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * gets implemented.
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_suppor=
ts(data,=20
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn NOTIFY_DONE;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>>> notifier_from_errno(usb_c_power_priority_restore(data));
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case UNIWILL_OSD_FN_LOCK:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_de=
vice_supports(data, UNIWILL_FEATURE_FN_LOCK))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return NOTIFY_DONE;
>>> @@ -1515,10 +1631,15 @@ static int uniwill_probe(struct=20
>>> platform_device *pdev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(=
regmap);
>>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->regmap =3D regmap;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(&pdev->dev, &da=
ta->super_key_lock);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0 +=C2=A0=C2=A0=C2=A0 ret =3D usb_c_power_priority_init(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D uniwill_ec_init(data);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> @@ -1681,6 +1802,14 @@ static int uniwill_resume_nvidia_ctgp(struct=20
>>> uniwill_data *data)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CTGP_DB_DB_ENABLE | CT=
GP_DB_CTGP_ENABLE);
>>> =C2=A0 }
>>> =C2=A0 +static int uniwill_resume_usb_c_power_priority(struct=20
>>> uniwill_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>> UNIWILL_FEATURE_USB_C_POWER_PRIORITY))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>
>> I think it would make sense to move the feature check into=20
>> usb_c_power_priority_restore().
>> This way usb_c_power_priority_restore() can be called by both the=20
>> notifier and the resume
>> code directly.
>
> How would i then distinct between returning NOTIFY_DONE and NOTIFY_OK?=
=20
> notifier_from_errno only returns=C2=A0NOTIFY_OK.
>
Good point, you might keep the existing code then.

Thanks,
Armin wolf

>>
>> It would also be very nice if you can include a short changelog with=20
>> your next patch series.
>
> ack
>
> Best Regerds,
>
> Werner
>
>>
>> Thanks,
>> Armin Wolf
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return usb_c_power_priority_restore(data);
>>> +}
>>> +
>>> =C2=A0 static int uniwill_resume(struct device *dev)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_d=
rvdata(dev);
>>> @@ -1704,7 +1833,11 @@ static int uniwill_resume(struct device *dev)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0 -=C2=A0=C2=A0=C2=A0 return uniwill_resume_nvidia_ctgp(data);
>>> +=C2=A0=C2=A0=C2=A0 ret =3D uniwill_resume_nvidia_ctgp(data);
>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return uniwill_resume_usb_c_power_priority(data);
>>> =C2=A0 }
>>> =C2=A0 =C2=A0 static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_=
suspend,=20
>>> uniwill_resume);
>
