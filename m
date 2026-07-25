Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EB72C11E4;
	Sat, 25 Jul 2026 20:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785010143; cv=none; b=FB5Uf7i4cvSPgmxg40g0R75UDYkfak/8A1HRKDTyUyh6boTUxDlVzrqd8NXb6e7LBU3yghvXo1iz2kLvRUg/DfEr40kG7kYeobNXGG7yw/+d+IjxTuq0VaJnVm/rkoBupuDuaCLkhahAdzSwD+Qs6J8WsgAyDtvodtKj5TfasZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785010143; c=relaxed/simple;
	bh=1xXUr66hDRCc3hAVT7EWRkvFuWVMUuRVOwJH7TeInMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ba68SKHz862QcTj14s5JXpI8IFZ/rOr8nvujbWNp2AWCCOtK6IoabgW3sybehAx/JTOKhWOsSHtAMTe3V3Jb7N1hxgadcALXMzzmgKiiqGtlijhPmRs1xbbc9nL53DwDqjEnJjPvfsW2L3dbGgP/6wFvl5vBCu8RqSKy9k1ckVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hrmrriXl; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hrmrriXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1785010139; x=1785614939; i=w_armin@gmx.de;
	bh=mJDl5nX2fNTddNwHnhwgr0PQSVpY9OfHsIDDg9sjwfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hrmrriXlFb/SvOTggscyYznd4Y4PTfn0uaFEAHNv23B5uQTYf119KMiTZuuzd9VS
	 +pDFRTzunfuA50dVBWzBax+JBunfxYiC0Xlc++e1B+mgB1mzcwIujmOu21oEC/wI8
	 wEHtJARO/0vczR3GCt0l/zEXuLuAR5Gbps0TP9BTr4lNcRMgRQU2CSjijV9cGKGU3
	 nbT5YhZaKBNgPpiENq9WQcQ3minqL+BB6le4iF0sJtTN9eV9pOjN5E8OX+ZODx9zs
	 wpqi3F4uGHMcQCsqQ8JHDQbIfqxlX2tz5voJWSL4QI48H1Ltv6gho0DcyCijEVH0y
	 zCW5oBPurCueuVvldg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1poA-1wpvbG3TNQ-00Gm6B; Sat, 25
 Jul 2026 22:08:59 +0200
Message-ID: <f85caf65-8f59-45b2-a8d8-e3555135c797@gmx.de>
Date: Sat, 25 Jul 2026 22:08:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, wse@tuxedocomputers.com,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260720132611.374073-1-W_Armin@gmx.de>
 <20260720132611.374073-3-W_Armin@gmx.de>
 <c1a7a430-642b-462b-1452-14eb54b4e891@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <c1a7a430-642b-462b-1452-14eb54b4e891@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qpP6Iri/c3xo0epGcwHQ+gibyyJuyJuvUHNt14LwIX/ZCulK/t5
 kJnukQRod+/pDJ9blu4Q8QUh/1cXN5vPpUo1haGAo+hRWOx0b8M3ypkuYNzME2A633O25nd
 7MktTXaUJfXQDiSFegNLGDUxYpX1I4GSv2rfzCNJN/8fIiE0XNurI9TXDYsb6Nce9SQAWSq
 UDut8drd2FJ5gTAbwLprw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q1erjkuCHRg=;mgmcWhpGcWaz8asEfoIaRQWfq6q
 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
 uPG47v7cYyrtwRTg3tXsXurDrTr4xs+UQw==

Am 21.07.26 um 10:44 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 20 Jul 2026, Armin Wolf wrote:
>
>> Having a ad-hoc device whitelist inside uniwill_kbd_led_init()
>> to work around unreliable KBD_WHITE_ONLY values conflicts with
>> the idea of the device descriptor infrastructure.
>>
>> Remove the ad-hoc device whitelist and use the device descriptor
>> infrastructure instead.
>>
>> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++-------------=
-
>>   1 file changed, 11 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/plat=
form/x86/uniwill/uniwill-acpi.c
>> index d27f316800f6..7a2eeaec4c96 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -255,6 +255,7 @@
>>   #define FAN_CURVE_LENGTH		5
>>  =20
>>   #define EC_ADDR_KBD_STATUS		0x078C
>> +/* Unreliable on some models, use the device descriptor instead. */
>>   #define KBD_WHITE_ONLY			BIT(0)
>>   #define KBD_POWER_OFF			BIT(1)
>>   #define KBD_TURBO_LEVEL_MASK		GENMASK(3, 2)
>> @@ -400,7 +401,7 @@ struct uniwill_data {
>>   	u8 lightbar_max_brightness;
>>   	struct led_classdev_mc led_mc_cdev;
>>   	struct mc_subled led_mc_subled_info[LED_CHANNELS];
>> -	bool single_color_kbd;
>> +	bool kbd_led_single_color;
>>   	u8 kbd_led_max_brightness;
>>   	unsigned int last_kbd_status;
>>   	union {
>> @@ -426,6 +427,7 @@ struct uniwill_battery_entry {
>>  =20
>>   struct uniwill_device_descriptor {
>>   	unsigned int features;
>> +	bool kbd_led_single_color;
>>   	u8 kbd_led_max_brightness;
>>   	u8 lightbar_max_brightness;
>>   	/* Executed during driver probing */
>> @@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct uniwill_=
data *data, int brightness)
>>   	struct led_classdev *led_cdev;
>>   	int ret;
>>  =20
>> -	if (data->single_color_kbd)
>> +	if (data->kbd_led_single_color)
>>   		led_cdev =3D &data->kbd_led_cdev;
>>   	else
>>   		led_cdev =3D &data->kbd_led_mc_cdev.led_cdev;
>> @@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct uniwill_d=
ata *data)
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	switch (data->project_id) {
>> -	case PROJECT_ID_PF:
>> -	case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>> -	case PROJECT_ID_PH4TRX1:
>> -	case PROJECT_ID_PH4TUX1:
>> -	case PROJECT_ID_PH4TQX1:
>> -	case PROJECT_ID_PH6TRX1:
>> -	case PROJECT_ID_PH6TQXX:
>> -	case PROJECT_ID_PHXAXXX:
>> -	case PROJECT_ID_PHXPXXX:
>> -		data->single_color_kbd =3D true;
>> -		break;
>> -	default:
>> -		data->single_color_kbd =3D regval & KBD_WHITE_ONLY;
>> -		break;
>> -	}
>> -
>> -	if (data->single_color_kbd)
>> +	if (data->kbd_led_single_color)
>>   		return uniwill_white_kbd_led_init(data);
>>  =20
>>   	return uniwill_rgb_kbd_led_init(data);
>> @@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device *=
pdev)
>>   		return ret;
>>  =20
>>   	data->features =3D device_descriptor.features;
>> +	data->kbd_led_single_color =3D device_descriptor.kbd_led_single_color=
;
>>   	data->kbd_led_max_brightness =3D device_descriptor.kbd_led_max_brigh=
tness;
>>   	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_bri=
ghtness;
>>  =20
>> @@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct uniwill_=
data *data)
>>   	if (ret < 0)
>>   		return ret;
>>  =20
>> -	if (data->single_color_kbd)
>> +	if (data->kbd_led_single_color)
>>   		return 0;
>>  =20
>>   	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, RGB_APPLY_CO=
LOR, RGB_APPLY_COLOR);
>> @@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor machenike=
_l16p_descriptor __initdata =3D {
>>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>> +	.kbd_led_single_color =3D false,
>>   	.kbd_led_max_brightness =3D 4,
>>   };
>>  =20
>> @@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor x4sp4nal_=
descriptor __initdata =3D {
>>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
>>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>> +	.kbd_led_single_color =3D true,
>>   	.kbd_led_max_brightness =3D 2,
>>   };
>>  =20
>> @@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
>>   	if (force) {
>>   		/* Assume that the device supports all features except the charge l=
imit */
>>   		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_=
CHARGE_LIMIT;
>> +		/* Some models only have a (white) single color keyboard backlight *=
/
>> +		device_descriptor.kbd_led_single_color =3D false;
>>   		/* Some models only support 3 brightness levels */
>>   		device_descriptor.kbd_led_max_brightness =3D 4;
>>   		/* Some models only support 36 brightness levels per color componen=
t */
>>
> Hi Armin,
>
> I've applied this series now to the review-ilpo-next branch.
>  =20
> You may want to check if you still need/want to store project_id (sashik=
o
> mentioned it's no longer used). If you want it gone, just send another
> patch.

Thanks, i will continue to utilize this field in the future.

Armin Wolf

