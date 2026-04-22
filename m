Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BD3C7E1B;
	Wed, 22 Apr 2026 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776857396; cv=none; b=lEf/XsvLhE/9kWzMUEn5VNB7Mau448X4ftQB1wkeSzAj28zEFskfv1lJcjZH34mNllBvVOE1XpIBA7AKbNISELZfKcMSbtIqRAJsepUz3OAUU+zxLwvmz6u9BvB7A3MRPZrc8HmNsz4CWdcMOsBlzTtmfIskEgISbiOIsun8TKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776857396; c=relaxed/simple;
	bh=aa5C2HnXYVaCYsdIKcZFFflk2NTG9k/5j3sdcztlY4s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KvoBcE0kFi8hylSb3yzE/c1ZQcipsp/xjwW1XSelJoWdOCWZ0uX/oSDSuBbKaGdVNrNzA54eQXluF5Keo6Ar2JR8ZtC5g2vQfi/VpkpWPNfmfwTPjG1Vd4zmaEVeHWnrRQOeO52ZqpanxuAAPb34bg+y5KI4m8aZ6jMijBs+dMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fT08F45T; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fT08F45T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776857385; x=1777462185; i=w_armin@gmx.de;
	bh=aa5C2HnXYVaCYsdIKcZFFflk2NTG9k/5j3sdcztlY4s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fT08F45TbVXYetLXUX13UUlK810apKgGAdWObVOa0uw7fbMb4jyt75tvFF600cZl
	 rt/dhCGS4v4LRNspIuf0hPuUlvpOpi0J0KRuIJibX2BYB4U0n45QEjUTmMJmV3FM0
	 rY/HVyBEBlbvz7XG0A/i1Hc9zc9wIbyRnoH3rcDDncqupRJVwn9zucW30Zn37Jg99
	 bP7B2YSeKdOBOctsp63EKY+M4CJGO07ylGifw2bUgaSbUOiVhUeNjHBvh+WJQZRRT
	 W2afL4R7qUmA+QbTAW2FihfC5JsEK9OStwjn/wOyROQ05G3m+7bjpCkAZ90Ohq3b+
	 aSjYzJ4HUwC7AyKIZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFKKX-1w98uf3qlV-002lrV; Wed, 22
 Apr 2026 13:29:44 +0200
Message-ID: <df847a42-bdca-4a86-a8b0-641876264bbb@gmx.de>
Date: Wed, 22 Apr 2026 13:29:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: uniwill-laptop: Implement lightbar
 for XMG Fusion (L19)
From: Armin Wolf <W_Armin@gmx.de>
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <20260421201103.142403-3-wse@tuxedocomputers.com>
 <d85481fe-513c-48db-b766-8f365bcbf66b@gmx.de>
Content-Language: en-US
In-Reply-To: <d85481fe-513c-48db-b766-8f365bcbf66b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rmcy98ReymUS2hJXGZIlNkOeeFsMGqcGzcavtwXNjARwrk9CEnd
 5MO5Ef1IH+yOyQKyndeGlXWJTY77WYRinXh2cLw0X2SrdGsrrjVbw7pO2y0v4+fpFxrHq9d
 z202w+2CvF24Kf6Fef2qytb9iMB3hfknLjkZEJ9fx61M/HDY7JtPSvlDR8BY9XrO/0HtjYv
 7sV7DA/W9dixJ4F4BxatA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BGD1Az5vPqI=;s4Jn5RMAjZGUc8CD+tNW+IBIgvC
 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

Am 22.04.26 um 13:17 schrieb Armin Wolf:
> Am 21.04.26 um 22:01 schrieb Werner Sembach:
>> The XMG Fusion (L19) also has a lightbar but with a different max
>> brightness value of 36 instead of 200.
>>
>> This patch adds a new feature flag for the driver to correctly handle=
=20
>> this
>> case and applies it to the mentioned device.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 19 +++++++++++++--=
=2D---
>> =C2=A0 1 file changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/=20
>> platform/x86/uniwill/uniwill-acpi.c
>> index 7d1fdbacc6871..62d56cc67e2e8 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -318,7 +318,6 @@
>> =C2=A0 #define FAN_TABLE_LENGTH=C2=A0=C2=A0=C2=A0 16
>> =C2=A0 #define LED_CHANNELS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3
>> -#define LED_MAX_BRIGHTNESS=C2=A0=C2=A0=C2=A0 200
>> =C2=A0 #define UNIWILL_FEATURE_FN_LOCK=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
>> =C2=A0 #define UNIWILL_FEATURE_SUPER_KEY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 BIT(1)
>> @@ -344,6 +343,7 @@ struct uniwill_data {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_handle handle;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>> +=C2=A0=C2=A0=C2=A0 u8 lightbar_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct acpi_battery_hook hook;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct mutex battery_lock;=C2=A0=C2=A0=
=C2=A0 /* Protects the list of currently=20
>> registered batteries */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 union {
>> @@ -376,6 +376,7 @@ struct uniwill_battery_entry {
>> =C2=A0 struct uniwill_device_descriptor {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int features;
>> +=C2=A0=C2=A0=C2=A0 u8 lightbar_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Executed during driver probing */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int (*probe)(struct uniwill_data *data);
>> =C2=A0 };
>> @@ -1340,7 +1341,7 @@ static int uniwill_led_brightness_set(struct=20
>> led_classdev *led_cdev, enum led_br
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++)=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Prevent the b=
rightness values from overflowing */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX_BRIGH=
TNESS, data-=20
>> >led_mc_subled_info[i].brightness);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(data->lightba=
r_max_brightness, data-=20
>> >led_mc_subled_info[i].brightness);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_w=
rite(data->regmap,=20
>> uniwill_led_channel_to_ac_reg[i], value);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> @@ -1376,12 +1377,14 @@ static int uniwill_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_GRE=
EN,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_BLU=
E,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> -=C2=A0=C2=A0=C2=A0 unsigned int value;
>> +=C2=A0=C2=A0=C2=A0 unsigned int value, max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data, UNIWI=
LL_FEATURE_LIGHTBAR))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +=C2=A0=C2=A0=C2=A0 max_brightness =3D data->lightbar_max_brightness;
>=20
> Please drop the max_brightness variable and assign=20
> led_cdev.max_brightness and led_cdev.brightness directly.
>=20
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data=
->led_lock);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> @@ -1409,14 +1412,14 @@ static int uniwill_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.color =3D LED=
_COLOR_ID_MULTI;
>> -=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.max_brightness =3D LED_M=
AX_BRIGHTNESS;
>> +=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.max_brightness =3D max_b=
rightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.flags =3D LED=
_REJECT_NAME_CONFLICT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.brightness_se=
t_blocking =3D=20
>> uniwill_led_brightness_set;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (value & LIGHTBAR_S0_OFF)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cde=
v.led_cdev.brightness =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.=
brightness =3D LED_MAX_BRIGHTNESS;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_cdev.led_cdev.=
brightness =3D max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < LED_CHANNELS; i++)=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->led_mc_sub=
led_info[i].color_index =3D color_indices[i];
>> @@ -1429,7 +1432,7 @@ static int uniwill_led_init(struct uniwill_data=
=20
>> *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make sur=
e that the initial intensity value is not greater=20
>> than
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the maxi=
mum brightness.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(LED_MAX_BRIGH=
TNESS, value);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 value =3D min(max_brightnes=
s, value);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_w=
rite(data->regmap,=20
>> uniwill_led_channel_to_ac_reg[i], value);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return ret;
>> @@ -1882,6 +1885,7 @@ static int uniwill_probe(struct platform_device=
=20
>> *pdev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->features =3D device_descriptor.fea=
tures;
>> +=C2=A0=C2=A0=C2=A0 data->lightbar_max_brightness =3D=20
>> device_descriptor.lightbar_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Some devices might need to perfo=
rm some device-specific=20
>> initialization steps
>> @@ -2130,11 +2134,13 @@ static struct platform_driver uniwill_driver =
=3D {
>> =C2=A0 static struct uniwill_device_descriptor lapqc71a_lapqc71b_descri=
ptor=20
>> __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .features =3D UNIWILL_FEATURE_SUPER_KEY =
|
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UNI=
WILL_FEATURE_LIGHTBAR |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_CPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SECONDARY_FAN,
>> +=C2=A0=C2=A0=C2=A0 .lightbar_max_brightness =3D 36,
>> =C2=A0 };
>> =C2=A0 static struct uniwill_device_descriptor lapac71h_descriptor=20
>> __initdata =3D {
>> @@ -2158,6 +2164,7 @@ static struct uniwill_device_descriptor=20
>> lapkc71f_descriptor __initdata =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_GPU_TEMP |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_PRIMARY_FAN |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 UNIWILL_FEATURE_SECONDARY_FAN,
>> +=C2=A0=C2=A0=C2=A0 .lightbar_max_brightness =3D 200,
>=20
> Please also set lightbar_max_brightness to 200 during module=20
> initialization when the "force" parameter is set.
>=20
> I suggest you rebase this series on top of the "platform/x86: uniwill-=
=20
> laptop: Charging-related improvements" series to avoid merge conflicts.

Forget about the rebase part, the series is already based on this series x=
d.

Thanks,
Armin Wolf

>=20
> Thanks,
> Armin Wolf
>=20
>> =C2=A0 };
>> =C2=A0 /*
>=20
>=20

