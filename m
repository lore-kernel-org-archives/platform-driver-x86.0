Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8E119CC14;
	Thu, 12 Feb 2026 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770878615; cv=none; b=HBNSsM9Vo+Er6ifhCO78zAdq7qBgKKs0vbcwfCqxwkjd+XZZ65UJC3ebq3wLLyV2/m+cvpNSh/K0KWCjJQ6FxLOWvCzTtSAMPI5eLAlphOwexeWhd7W/++bfHwbyg1x0797nlWM00VHHeSohtR6/KyGX3/tXfVyfHzUJdUyZ1Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770878615; c=relaxed/simple;
	bh=Ugxpe8U1lSVoXKI/6LKBnTRNxfYr4d3VJXnXr/uIgQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0+8nFCtxR9z/lVidSpKvmPVvESnOjc2BdrEjiJD51lZOqA9c3r38pt9Um60W2Ub8gRxlKTh/tdfNox+6+0RMUYvI8wkTxSj+ePTEeBVQTWfu7Xoli2p0OM3GsSUwBDYyA3XVXXSuUrnvob9hNdSG+4ObbNfoAXliDdZSjrSSp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=bAZC2r1g; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="bAZC2r1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770878611; x=1771483411; i=w_armin@gmx.de;
	bh=Ugxpe8U1lSVoXKI/6LKBnTRNxfYr4d3VJXnXr/uIgQI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bAZC2r1gYfU1BwKrwEdNS4uzxms0yF4Uf8Ay6CtAgIUaFYqeagmGfWG4Fa2vo726
	 woPneGZ8sZvcrxQC2nIpx5ALviAavchRYQhFZJQNHenzk7OzBHLH2QVa4KzFzuLSE
	 dx7RreCIltpZTCFOvn/JZkMNL5fb9c2T0PqXkhIcDNVVtJQra5asvCn4BTrvJZkIb
	 dbWrmEZsV768MOwaB+pMHbCFjv5O+6kvQFDbCr+dUG0DN4deBPBGsI4g6YzCvWSv+
	 uCzxJ1FQz57Fi4+2usmzAe2lOz6IGybtXzRydgfZoD6yMR6CpTSImbe0KQOKqg1W9
	 DtM74sRSAdkZajHEvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.242.224]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRCOE-1wBEYh1MKi-00YX3q; Thu, 12
 Feb 2026 07:43:31 +0100
Message-ID: <57b9ac8d-2771-4c34-94f4-2f777afa7b22@gmx.de>
Date: Thu, 12 Feb 2026 07:43:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86: uniwill-laptop: Rename FN lock and
 super key lock attrs
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210232946.302936-1-W_Armin@gmx.de>
 <20260210232946.302936-2-W_Armin@gmx.de>
 <b9abe4fc-198f-45c6-9b7b-732d3c53983f@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b9abe4fc-198f-45c6-9b7b-732d3c53983f@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HPl1FIKadanmAFZmCEvo4gU8V/MTejh3Imgq87b3MJzRbaz6XdG
 aDnN54YQal1J1KTvH/6GfxEq7HGAsCWNvbQMCZESP9scb9toEHxHbvSYILXyU/PuiWoFoB4
 E93Xqvx25cgMMfDT4IlJ7vYqvvdY+2tXWC/i7vuACYDpx8Xqe39+6gIAaoFgFAm6NtAy/Qm
 ypEahdHwPprG7OvVjix/g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y5sUiZNlU8o=;tI1JxXLHQcSqnqqOqn7UnmSEDOv
 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
 jkAkLKC4cTjxGiJEiAIx

Am 11.02.26 um 01:16 schrieb Werner Sembach:

> Hi,
>
> Am 11.02.26 um 00:29 schrieb Armin Wolf:
>> It turns out that both sysfs attributes actually directly control
>> the FN lock status/super key enable status, rather than the
>> triggering of the associated events. This behavior was first observed
>> on a Tuxedo notebook and was belived to be a hardware quirk.
>> However, it seems that i simply misunderstood the manual of the
>> OEM software for Intel NUC devices. The correct behavior is:
>>
>> - fn_lock_toggle_enable enables/disables FN lock mode
>> - super_key_toggle_enable enables/disables the super key
>>
>> Rename both sysfs attributes to avoid confusing users.
>>
>> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 .../ABI/testing/sysfs-driver-uniwill-laptop=C2=A0=C2=A0 | 10 ++-=
-
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c=C2=A0=C2=A0 | 46 +++=
++++++----------
>> =C2=A0 2 files changed, 27 insertions(+), 29 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop=20
>> b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> index eaeb659793d2..2df70792968f 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -1,4 +1,4 @@
>> -What: /sys/bus/platform/devices/INOU0000:XX/fn_lock_toggle_enable
>> +What:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /sys/bus/platform/devi=
ces/INOU0000:XX/fn_lock
>> =C2=A0 Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 November 2025
>> =C2=A0 KernelVersion:=C2=A0=C2=A0=C2=A0 6.19
>> =C2=A0 Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>> @@ -8,15 +8,15 @@ Description:
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading t=
his file returns the current enable status of=20
>> the FN lock functionality.
>> =C2=A0 -What: /sys/bus/platform/devices/INOU0000:XX/super_key_toggle_en=
able
>> +What: /sys/bus/platform/devices/INOU0000:XX/super_key_enable
>> =C2=A0 Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 November 2025
>> =C2=A0 KernelVersion:=C2=A0=C2=A0=C2=A0 6.19
>> =C2=A0 Contact:=C2=A0=C2=A0=C2=A0 Armin Wolf <W_Armin@gmx.de>
>> =C2=A0 Description:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Allows userspace applications to enable/disable the=
=20
>> super key functionality
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 of the integrated keyboard by writing "1"/"0" into=
=20
>> this file.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allows userspace applicatio=
ns to enable/disable the super=20
>> key of the integrated
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keyboard by writing "1"/"0"=
 into this file.
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file re=
turns the current enable status of the=20
>> super key functionality.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reading this file returns t=
he current enable status of the=20
>> super key.
>> =C2=A0 =C2=A0 What: /sys/bus/platform/devices/INOU0000:XX/touchpad_togg=
le_enable
>> =C2=A0 Date:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 November 2025
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 3c9af441d133..856d5e38e045 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -314,8 +314,8 @@
>> =C2=A0 #define LED_CHANNELS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3
>> =C2=A0 #define LED_MAX_BRIGHTNESS=C2=A0=C2=A0=C2=A0 200
>> =C2=A0 -#define UNIWILL_FEATURE_FN_LOCK_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)
>> -#define UNIWILL_FEATURE_SUPER_KEY_TOGGLE=C2=A0=C2=A0=C2=A0 BIT(1)
>> +#define UNIWILL_FEATURE_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> +#define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(1)
>> =C2=A0 #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(2)
>> =C2=A0 #define UNIWILL_FEATURE_LIGHTBAR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(3)
>> =C2=A0 #define UNIWILL_FEATURE_BATTERY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(4)
>
> Maybe also rename UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and=20
> UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE
>
> Best regards,
>
> Werner
>
Good idea, i also found out that i forgot to update the admin-guide for un=
iwill laptops. I will
send a v2 addressing both issues.

Thanks,
Armin Wolf

>> @@ -600,8 +600,8 @@ static const struct regmap_config=20
>> uniwill_ec_config =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .use_single_write =3D true,
>> =C2=A0 };
>> =C2=A0 -static ssize_t fn_lock_toggle_enable_store(struct device *dev,=
=20
>> struct device_attribute *attr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char=
 *buf, size_t count)
>> +static ssize_t fn_lock_store(struct device *dev, struct=20
>> device_attribute *attr, const char *buf,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t count)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> @@ -624,8 +624,7 @@ static ssize_t fn_lock_toggle_enable_store(struct=
=20
>> device *dev, struct device_att
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> =C2=A0 }
>> =C2=A0 -static ssize_t fn_lock_toggle_enable_show(struct device *dev,=
=20
>> struct device_attribute *attr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *buf)
>> +static ssize_t fn_lock_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> @@ -638,10 +637,10 @@ static ssize_t=20
>> fn_lock_toggle_enable_show(struct device *dev, struct device_attr
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", !!(value =
& FN_LOCK_STATUS));
>> =C2=A0 }
>> =C2=A0 -static DEVICE_ATTR_RW(fn_lock_toggle_enable);
>> +static DEVICE_ATTR_RW(fn_lock);
>> =C2=A0 -static ssize_t super_key_toggle_enable_store(struct device *dev=
,=20
>> struct device_attribute *attr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 const char *buf, size_t count)
>> +static ssize_t super_key_enable_store(struct device *dev, struct=20
>> device_attribute *attr,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *buf,=
 size_t count)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> @@ -673,8 +672,7 @@ static ssize_t=20
>> super_key_toggle_enable_store(struct device *dev, struct device_a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return count;
>> =C2=A0 }
>> =C2=A0 -static ssize_t super_key_toggle_enable_show(struct device *dev,=
=20
>> struct device_attribute *attr,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char=
 *buf)
>> +static ssize_t super_key_enable_show(struct device *dev, struct=20
>> device_attribute *attr, char *buf)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> @@ -687,7 +685,7 @@ static ssize_t=20
>> super_key_toggle_enable_show(struct device *dev, struct device_at
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return sysfs_emit(buf, "%d\n", !(value &=
 SUPER_KEY_LOCK_STATUS));
>> =C2=A0 }
>> =C2=A0 -static DEVICE_ATTR_RW(super_key_toggle_enable);
>> +static DEVICE_ATTR_RW(super_key_enable);
>> =C2=A0 =C2=A0 static ssize_t touchpad_toggle_enable_store(struct device=
 *dev,=20
>> struct device_attribute *attr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const char *buf, size_t count)
>> @@ -881,8 +879,8 @@ static int uniwill_nvidia_ctgp_init(struct=20
>> uniwill_data *data)
>> =C2=A0 =C2=A0 static struct attribute *uniwill_attrs[] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Keyboard-related */
>> -=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock_toggle_enable.attr,
>> -=C2=A0=C2=A0=C2=A0 &dev_attr_super_key_toggle_enable.attr,
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_fn_lock.attr,
>> +=C2=A0=C2=A0=C2=A0 &dev_attr_super_key_enable.attr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_touchpad_toggle_enable.attr,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Lightbar-related */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &dev_attr_rainbow_animation.attr,
>> @@ -897,13 +895,13 @@ static umode_t uniwill_attr_is_visible(struct=20
>> kobject *kobj, struct attribute *a
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev =3D kobj_to_dev(kobj)=
;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct uniwill_data *data =3D dev_get_dr=
vdata(dev);
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_fn_lock_toggle_ena=
ble.attr) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data,=20
>> UNIWILL_FEATURE_FN_LOCK_TOGGLE))
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_fn_lock.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data, UNIWILL_FEATURE_FN_LOCK))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return attr->mode;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_super_key_toggle_e=
nable.attr) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data,=20
>> UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>> +=C2=A0=C2=A0=C2=A0 if (attr =3D=3D &dev_attr_super_key_enable.attr) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (uniwill_device_supports=
(data, UNIWILL_FEATURE_SUPER_KEY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return attr->mode;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 @@ -1505,7 +1503,7 @@ static void uniwill_shutdown(struct=20
>> platform_device *pdev)
>> =C2=A0 =C2=A0 static int uniwill_suspend_keyboard(struct uniwill_data *=
data)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATURE_=
SUPER_KEY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> @@ -1565,7 +1563,7 @@ static int uniwill_resume_keyboard(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int value;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWILL_FEATURE_=
SUPER_KEY))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap,=
 EC_ADDR_SWITCH_STATUS, &value);
>> @@ -1643,16 +1641,16 @@ static struct platform_driver uniwill_driver =
=3D {
>> =C2=A0 };
>> =C2=A0 =C2=A0 static struct uniwill_device_descriptor lapac71h_descript=
or=20
>> __initdata =3D {
>> -=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_SUPER_KEY_TOGGLE |
>> +=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_SUPER_KEY |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_BATTERY |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_HWMON,
>> =C2=A0 };
>> =C2=A0 =C2=A0 static struct uniwill_device_descriptor lapkc71f_descript=
or=20
>> __initdata =3D {
>> -=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_SUPER_KEY_TOGGLE |
>> +=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_FN_LOCK |
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_SUPER_KEY |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_LIGHTBAR |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_BATTERY |
