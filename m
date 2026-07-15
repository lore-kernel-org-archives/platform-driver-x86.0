Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993233D522F;
	Wed, 15 Jul 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784159779; cv=none; b=YjJjvGucLQFxyafapbAIUptxrGPl//wyS8OVRDNMVdvH7JUD0tnQeI2DTgkMYjrBOHaQazBvR+fWT8KvA4UxZGk2ziCu+8G0zRY/IDYPfbr5c+fxmvG6jr41sd7DP2rsraJBX9hukHj4Zi4noelSzpgt1Hp/bgZ6h3ejrrKZYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784159779; c=relaxed/simple;
	bh=3toxddh8NeaIuJ/Evwv1uBWnUeBsxYkVFxQ+nFtTVyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uIl0NuIcSy67PPOd9WYgGm1wFZ3AHlOzE+3CoyNeQ3vlPCEJ27qmDdMCY9Kl8hMXZP0W3LRppq8tbTa2CnAJqA/MhXpZ23qPQhTV67ToguYBSWlMgGCVvLw/MwXKm4mTFI3fT16OsUueWILcci6yOtZJKBQ4EAYvg90tAZg3qmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=q3ueMRtU; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="q3ueMRtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784159763; x=1784764563; i=w_armin@gmx.de;
	bh=3toxddh8NeaIuJ/Evwv1uBWnUeBsxYkVFxQ+nFtTVyg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=q3ueMRtUZT9zqgjmWvy/W0DtfQfWPHqGdl/aPRZiJioWG13LjQz7k00buMaBGLNX
	 +qUy0/SNWztbVwU9iRCO6sEaS5DI0gEVx0QPrnxCiiXX62TpiXyNfvXWDNKQHMFnK
	 IiuZuYuwudA4QARnCDQ0OPos5QdKotulRYqfAx3mYIKOTtJ7osWc+PtbC6a/9E9IC
	 /tJuOxfOxRLDmyRLz9fvstChifnssJnYRMbfyvcDdmXrqFkfJsQ+KDBSjLNAB/iR1
	 pv9aN+PJQYqCp6gkw4O/I2lfpqL3urv2TLPJ71eWOgkk+2gnvG/GI5aqWjrjmLZsz
	 0ryxna0C8OUDMt1Baw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1xTh1b2ueb-00eagI; Thu, 16
 Jul 2026 01:56:02 +0200
Message-ID: <ef821e59-3100-459a-87aa-b6f47cee0d06@gmx.de>
Date: Thu, 16 Jul 2026 01:56:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform/x86: uniwill-laptop: Split
 uniwill_kbd_led_init()
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710223544.49602-1-W_Armin@gmx.de>
 <20260710223544.49602-2-W_Armin@gmx.de>
 <71c069d2-ad9f-499f-93b4-93c2140b5454@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <71c069d2-ad9f-499f-93b4-93c2140b5454@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Kw5j2YLfGb22o3SkUhaC/GPzBfx1f5vH6J9LxzZJlJrHUprj+X+
 66Lve1tL9nXU5RLzUvA6g1sWKor0+m1ZjBHvzstedHS4mukovWrt+cRrQBR3ubJgyaV57w1
 XlAu4NOg/kC64nGq+YX4VwXJm4/hoYzSLdvedH16LlK3m1fS2Qz6Iw2pWLOpXBKZpeYqdto
 zApFKNI8Ime20iOgcvcTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ADszH1RGKQE=;ClW9i+DKU2a7jNaphhSNg1o/oZN
 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

Am 15.07.26 um 17:12 schrieb Werner Sembach:

>
> Am 11.07.26 um 00:35 schrieb Armin Wolf:
>> The function uniwill_kbd_led_init() is quite large and doing multiple
>> things at once:
>> - general hardware initialisation
>> - single color keyboard backlight registration
>> - RGB keyboard backlight registration
>>
>> Move the last two things into separate functions to increase the
>> maintainability of uniwill_kbd_led_init().
>>
>> Suggested-by: Werner Sembach <wse@tuxedocomputers.com>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>> =C2=A0 drivers/platform/x86/uniwill/uniwill-acpi.c | 123 +++++++++++---=
=2D-----
>> =C2=A0 1 file changed, 70 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c=20
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 310445583832..d27f316800f6 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -1733,7 +1733,24 @@ static enum led_brightness=20
>> uniwill_kbd_led_mc_brightness_get(struct led_classdev
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return uniwill_kbd_led_read_brightness(d=
ata);
>> =C2=A0 }
>> =C2=A0 -static int uniwill_kbd_led_init(struct uniwill_data *data)
>> +static int uniwill_white_kbd_led_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct led_init_data init_data =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .default_label =3D "white:"=
 LED_FUNCTION_KBD_BACKLIGHT,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devicename =3D DRIVER_NAME=
,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devname_mandatory =3D true=
,
>> +=C2=A0=C2=A0=C2=A0 };
>> +
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.max_brightness =3D data->kbd_led=
_max_brightness;
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.color =3D LED_COLOR_ID_WHITE;
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.flags =3D LED_BRIGHT_HW_CHANGED =
|=20
>> LED_REJECT_NAME_CONFLICT;
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brightness_set_blocking =3D=20
>> uniwill_kbd_led_brightness_set;
>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brightness_get =3D uniwill_kbd_l=
ed_brightness_get;
>> +
>> +=C2=A0=C2=A0=C2=A0 return devm_led_classdev_register_ext(data->dev,=20
>> &data->kbd_led_cdev, &init_data);
>> +}
>> +
>> +static int uniwill_rgb_kbd_led_init(struct uniwill_data *data)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int color_indices[KBD_LED_CHANN=
ELS] =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_RED=
,
>> @@ -1741,6 +1758,7 @@ static int uniwill_kbd_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_BLU=
E,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct led_init_data init_data =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .default_label =3D "multico=
lor:" LED_FUNCTION_KBD_BACKLIGHT,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devicename =3D =
DRIVER_NAME,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devname_mandato=
ry =3D true,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> @@ -1749,57 +1767,6 @@ static int uniwill_kbd_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int regval;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2=
, &regval);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 if (!(regval & CHINA_MODE)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits(dat=
a->regmap, EC_ADDR_BIOS_OEM_2,=20
>> ENABLE_CHINA_MODE);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATU=
S, &regval);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 regval |=3D KBD_APPLY;
>> -=C2=A0=C2=A0=C2=A0 regval &=3D ~KBD_POWER_OFF;
>> -=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STAT=
US, regval);
>> -=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -
>> -=C2=A0=C2=A0=C2=A0 switch (data->project_id) {
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
>> -=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init_data.default_label =3D=
 "white:" LED_FUNCTION_KBD_BACKLIGHT;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.max_brig=
htness =3D=20
>> data->kbd_led_max_brightness;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.color =
=3D LED_COLOR_ID_WHITE;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.flags =
=3D LED_BRIGHT_HW_CHANGED |=20
>> LED_REJECT_NAME_CONFLICT;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brightne=
ss_set_blocking =3D=20
>> uniwill_kbd_led_brightness_set;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brightne=
ss_get =3D=20
>> uniwill_kbd_led_brightness_get;
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_led_classdev_re=
gister_ext(data->dev,=20
>> &data->kbd_led_cdev, &init_data);
>> -=C2=A0=C2=A0=C2=A0 }
>> -
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < KBD_LED_CHANNELS; =
i++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc=
_subled_info[i].color_index =3D=20
>> color_indices[i];
>> =C2=A0 @@ -1851,7 +1818,6 @@ static int uniwill_kbd_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> =C2=A0 -=C2=A0=C2=A0=C2=A0 init_data.default_label =3D "multicolor:"=20
>> LED_FUNCTION_KBD_BACKLIGHT;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.max_brigh=
tness =3D=20
>> data->kbd_led_max_brightness;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.color =3D=
 LED_COLOR_ID_MULTI;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.flags =3D=
 LED_BRIGHT_HW_CHANGED |=20
>> LED_REJECT_NAME_CONFLICT;
>> @@ -1864,6 +1830,57 @@ static int uniwill_kbd_led_init(struct=20
>> uniwill_data *data)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>> =C2=A0 }
>> =C2=A0 +static int uniwill_kbd_led_init(struct uniwill_data *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2=
, &regval);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (!(regval & CHINA_MODE)) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits(dat=
a->regmap, EC_ADDR_BIOS_OEM_2,=20
>> ENABLE_CHINA_MODE);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn ret;
>> +=C2=A0=C2=A0=C2=A0 }
>
> I forgot again what this china mode bit is doing?
>
> But overall:
>
> Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>

The China mode bit _apparently_ is necessary for proper keyboard backlight=
 control on some models,
the original control center set it unconditionally if the associated suppo=
rt bit is set.

Thanks,
Armin Wolf

>
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_STATU=
S, &regval);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 regval |=3D KBD_APPLY;
>> +=C2=A0=C2=A0=C2=A0 regval &=3D ~KBD_POWER_OFF;
>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_KBD_STAT=
US, regval);
>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 switch (data->project_id) {
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TRX1:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TUX1:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TQX1:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TRX1:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TQXX:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXAXXX:
>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXPXXX:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =3D =
true;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 default:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =3D =
regval & KBD_WHITE_ONLY;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return uniwill_white_kbd_le=
d_init(data);
>> +
>> +=C2=A0=C2=A0=C2=A0 return uniwill_rgb_kbd_led_init(data);
>> +}
>> +
>> =C2=A0 static unsigned int uniwill_sanitize_battery_threshold(unsigned =
int=20
>> value)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* 0 means "charging threshold not activ=
e" */
>
