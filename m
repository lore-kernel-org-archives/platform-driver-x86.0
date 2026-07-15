Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BA237E5D1;
	Wed, 15 Jul 2026 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784159982; cv=none; b=EFHbUYeZeqyk5OCCQZrD9UFm0T19soaF3mXwbSHFob3Pacu16tIlkteEDWtmx+HuDkkHGGLZjkz903RD/7dnDyKHJ5BXw4qCX2U8egGPvNt04Szz7RKVg8QSFCymLubBw5Hp+IG611We/IcG8hf6n3zuA63iGGlAX5LWEoc0wEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784159982; c=relaxed/simple;
	bh=OjncUt3OjezC0LcACFG2oyDfmkSNp7CwD82H7ravl1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzLVZecahHDahWZSoqo/WszVkDlaljtaMsfpspFuA4tAvEr9N31PMDui/eruSjfnFCHTOgaOmmcTJ4dUwQ1jQF/LafG62WD8RzdF5u07JC5KDa3fjPEDNVIb/UXzvnWzMDGKgDWOK7uDGqD2SFuAuHcl1e3as+4GqrXInnnkHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Hg18RkDC; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Hg18RkDC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784159973; x=1784764773; i=w_armin@gmx.de;
	bh=OjncUt3OjezC0LcACFG2oyDfmkSNp7CwD82H7ravl1E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hg18RkDCrIpBerOZCOMdq0zqhoJZERkQLa4HjTLuCTQSdCfZi0X3f2NI08yneeSl
	 b+Lj4ezsVNy/EnhxgQU+nQT1LSvhvHgm+JmB1Vt1X8SZdHpoENx77UNE58UkN9El8
	 UtE9FxarOSwJXtzF4NScaZb3WII/741FbYi3UpvrfoSaTRRjenx0ZH82d/+9fxmXH
	 BRvJe2cp7/0ZATeeckYHsZjMel8Efazj0+KwCV7BKrKGfD35jgzqeTd3nE9ILf5TU
	 apTxlZYgvXglVIr9Hu3Xwj4e19rSEu/gdb5b0qdU9ZrzAQZpiIv++ekIgwVrcrad0
	 jHDwV0sp2Xd2+wQsNA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79uI-1x5GED0GFQ-00tWvl; Thu, 16
 Jul 2026 01:59:33 +0200
Message-ID: <b80c9699-b7f1-4a31-b8ea-bdbad1d8d10f@gmx.de>
Date: Thu, 16 Jul 2026 01:59:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: uniwill-laptop: Remove single color
 keyboard detection
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-3-W_Armin@gmx.de>
 <7efb476a-673e-46e3-9845-dcedca76c63a@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <7efb476a-673e-46e3-9845-dcedca76c63a@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bfTgZxuAxHoLbVPuZmyFz+n/ROr0AFrEc0BLPWQRWr3oY5jhTwL
 /hd+oMj+PF/IsFAsuIvsVGPeMrbNP7kQ6+wRHM536g0khaEdTJz5kTMENp+uJ8+BCKGiZJI
 3Pna8uE/MvBL5U11HVGNrNgjIbJb3bFO8oHFOGSu6MsuCjmgFuCouNV9wRPjKTvTRXySokd
 yEquNtQitmJl2bj9Y32jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BGucu9Y7LUc=;bUABN+7v6Ygno+pefmC71ukkfm8
 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
 K5EPv/ooVAIQXDkPTRbV0+aznM0+E+grnw==

Am 15.07.26 um 17:16 schrieb Werner Sembach:

>
> Am 11.07.26 um 00:35 schrieb Armin Wolf:
>> It turns out that the code for detecting single color keyboards
>> might not work correctly on future models. Remove it and use the
>> device descriptor instead.
> Technically: It already doesn't work reliable on old devices, that's=20
> why the device list inside the init function was required. This patch=20
> is basically to move this to the device_descriptor struct that is=20
> already present.

Good catch, i will reword this.

>
>>
>> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 32 +++++++--------=
=2D-----
>> =C2=A0 1 file changed, 11 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index d27f316800f6..4591ee299a90 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -255,6 +255,7 @@
>> =C2=A0 #define FAN_CURVE_LENGTH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 5
>> =C2=A0 =C2=A0 #define EC_ADDR_KBD_STATUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0x078C
>> +/* Unreliable */
>> =C2=A0 #define KBD_WHITE_ONLY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> =C2=A0 #define KBD_POWER_OFF=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
>> =C2=A0 #define KBD_TURBO_LEVEL_MASK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 GENMASK(3, 2)
>> @@ -400,7 +401,7 @@ struct uniwill_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 lightbar_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev_mc led_mc_cdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mc_subled led_mc_subled_info[LED_=
CHANNELS];
>> -=C2=A0=C2=A0=C2=A0 bool single_color_kbd;
>> +=C2=A0=C2=A0=C2=A0 bool kbd_led_single_color;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int last_kbd_status;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>> @@ -426,6 +427,7 @@ struct uniwill_battery_entry {
>> =C2=A0 =C2=A0 struct uniwill_device_descriptor {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>> +=C2=A0=C2=A0=C2=A0 bool kbd_led_single_color;
>
> Why do this as a bool instead of a UNIWILL_FEATURE_* define? We=20
> already have mutually exclusive UNIWILL_FEATURE_* defines for the=20
> charging modes.
>
> Best regards
>
> Werner

I decided against that because both feature defines would effectively cont=
rol the same hardware registers.
Instead i decided to have a common code path for the whole keyboard backli=
ght feature and use a flag for
the RGB support instead.

This also integrates better with the existing code IMHO.

Thanks,
Armin Wolf

>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 kbd_led_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u8 lightbar_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Executed during driver probing */
>> @@ -1629,7 +1631,7 @@ static int uniwill_notify_kbd_led(struct=20
>> uniwill_data *data, int brightness)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_classdev *led_cdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>> +=C2=A0=C2=A0=C2=A0 if (data->kbd_led_single_color)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev =3D &da=
ta->kbd_led_cdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led_cdev =3D &da=
ta->kbd_led_mc_cdev.led_cdev;
>> @@ -1858,24 +1860,7 @@ static int uniwill_kbd_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 switch (data->project_id) {
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TRX1:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TUX1:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TQX1:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TRX1:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TQXX:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXAXXX:
>> -=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXPXXX:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =3D =
true;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> -=C2=A0=C2=A0=C2=A0 default:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =3D =
regval & KBD_WHITE_ONLY;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>> +=C2=A0=C2=A0=C2=A0 if (data->kbd_led_single_color)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return uniwill_w=
hite_kbd_led_init(data);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return uniwill_rgb_kbd_led_init(d=
ata);
>> @@ -2351,6 +2336,7 @@ static int uniwill_probe(struct platform_device=
=20
>> *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->features =3D device_descrip=
tor.features;
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_single_color =3D=20
>> device_descriptor.kbd_led_single_color;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_max_brightness =3D=20
>> device_descriptor.kbd_led_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->lightbar_max_brightness =3D=20
>> device_descriptor.lightbar_max_brightness;
>> =C2=A0 @@ -2580,7 +2566,7 @@ static int uniwill_resume_kbd_led(struct=
=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>> +=C2=A0=C2=A0=C2=A0 if (data->kbd_led_single_color)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return regmap_write_bits(data->re=
gmap, EC_ADDR_TRIGGER,=20
>> RGB_APPLY_COLOR, RGB_APPLY_COLOR);
>> @@ -2687,6 +2673,7 @@ static struct uniwill_device_descriptor=20
>> machenike_l16p_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_AC_AUTO_BOOT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_USB_POWERSHARE,
>> +=C2=A0=C2=A0=C2=A0 .kbd_led_single_color =3D false,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_max_brightness =3D 4,
>> =C2=A0 };
>> =C2=A0 @@ -2869,6 +2856,7 @@ static struct uniwill_device_descriptor=20
>> x4sp4nal_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_AC_AUTO_BOOT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_USB_POWERSHARE,
>> +=C2=A0=C2=A0=C2=A0 .kbd_led_single_color =3D true,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .kbd_led_max_brightness =3D 2,
>> =C2=A0 };
>> =C2=A0 @@ -3363,6 +3351,8 @@ static int __init uniwill_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (force) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assume that t=
he device supports all features except the=20
>> charge limit */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descripto=
r.features =3D UINT_MAX &=20
>> ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models only have a =
(white) single color keyboard=20
>> backlight */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descriptor.kbd_led_s=
ingle_color =3D false;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models o=
nly support 3 brightness levels */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_descripto=
r.kbd_led_max_brightness =3D 4;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Some models o=
nly support 36 brightness levels per color=20
>> component */
>
