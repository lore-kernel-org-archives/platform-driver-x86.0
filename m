Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C1C2701D9;
	Thu,  9 Jul 2026 20:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783628642; cv=none; b=CnpY6/zIcIqTSeCHh9e3KqWhkQWKDwpMyFe3imEC6E3NJhhdvTcq2ikH1iSySNXSnCQVgGN1A/0YJAgOkTb27l3Wl9/wOikjHBY1R7ueSEFFwz0ZUD4eBvItONPiytscypNVrU/3ZSxIcQTWIgkrcUboAlSdicA780WdOV7xv/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783628642; c=relaxed/simple;
	bh=zGsl+9t4L//avOAKwJX3Ys+dq9orCeBPmHXWP4LP6nI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VEzc8g5MYRA5ldG+XAebV2Cvr7z5u1LT9UOb5n3mWIVpSprlwJDmR53GO8FEYPXjv3w5XUCSMClshHJ5WlpAS5u4WU72PKdlpZctK0x6mDuXbxGtUfbnZal04nAqnrjEJAdYRKJRkyKfXUnvGIYa7U2VZKC+Pq7tPwawSKPmZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=al8svvFX; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="al8svvFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783628609; x=1784233409; i=w_armin@gmx.de;
	bh=zGsl+9t4L//avOAKwJX3Ys+dq9orCeBPmHXWP4LP6nI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=al8svvFXVGBquwgJnbGctkw7roj4KUoRLOWql6mEyi37BY1JJsf4Cuje3/p8Dpk5
	 dpCSyD2CHHQDQHiBC3mlV4Wulc80vJGRr5CzfDIfLm/bFZv3x7QgflwpH9UzYsnSj
	 z99jfOZxoK7lxkfF/z1rL8r2RZhvMu9afvuMRB9P4w5fJ/yYpzdvDxNlaUs4/vkgr
	 Gq+27ufubcMWV2338RSZmox7qIMmYpE+Xe7IAJiHfA5T5CNPSW317IxUo3AcEcXk+
	 8JdYk4LdegKGwg00pzeIIPyLo9n6cG30AeTu0o1d8C0UE2/Z/lkfncfvhL1HRKQnD
	 0Jn+Q/fwZSEVRSnY6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3mt-1wcFyN3fel-00YuE7; Thu, 09
 Jul 2026 22:23:29 +0200
Message-ID: <14cdc0b9-0ea5-4179-96e5-3018946ec79f@gmx.de>
Date: Thu, 9 Jul 2026 22:23:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86: uniwill-laptop: Add keyboard backlight
 support
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <20260530170813.10166-2-W_Armin@gmx.de>
 <10e25d5c-7c50-45fd-a5a9-c06b087a89dd@tuxedocomputers.com>
 <aa39d060-5555-42bb-a4bb-d23e79f64d26@gmx.de>
 <1a91a9ff-8c81-4176-a6f2-fd2a6bc49820@tuxedocomputers.com>
 <a681b59d-1719-4a8e-9b75-e8317c899b27@gmx.de>
 <dba6b863-3336-42b9-af02-98cb6f77c815@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <dba6b863-3336-42b9-af02-98cb6f77c815@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m3EenOm7eaUTjx19rDEpLLnI5iHhdOu5lGlGojAfWDl6NEnpyon
 /GQ1MTUkeDUkhF/4WwBjHbDB8puUWcS49nVEqXuwtthodl0DCH+A7eRJ1XBlLmknZPVkFrr
 NpOLMAjwbgUDlzoOPJpUjnMuZOLxQPuUyDb4I8/FDB8ZxQLlm7/S+2PR5W7XZgw8PiQzXBG
 quV5WUCGJFYDxW3groLBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ikt/e6uPP8w=;qcokaSnley/YUr+OIcWrKBv21Ja
 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
 bVsBTkI8jUsk8+law8WJFWXgExi02c

Am 09.07.26 um 15:23 schrieb Werner Sembach:

> [...]
>>>>>> +
>>>>>> +static int uniwill_kbd_led_init(struct uniwill_data *data)
>>>>>> +{
>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int color_indices[KBD_LED_CHANNELS] =
=3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_RED,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_GREEN,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LED_COLOR_ID_BLUE,
>>>>>> +=C2=A0=C2=A0=C2=A0 };
>>>>>> +=C2=A0=C2=A0=C2=A0 struct led_init_data init_data =3D {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devicename =3D DRIVER_=
NAME,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .devname_mandatory =3D =
true,
>>>>>> +=C2=A0=C2=A0=C2=A0 };
>>>>>> +=C2=A0=C2=A0=C2=A0 bool intensity_all_zeros =3D true;
>>>>>> +=C2=A0=C2=A0=C2=A0 bool needs_trigger =3D false;
>>>>>> +=C2=A0=C2=A0=C2=A0 unsigned int regval;
>>>>>> +=C2=A0=C2=A0=C2=A0 int ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!uniwill_device_supports(data,=20
>>>>>> UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_SUPPO=
RT_2, &regval);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (!(regval & CHINA_MODE)) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_set_bits=
(data->regmap, EC_ADDR_BIOS_OEM_2,=20
>>>>>> ENABLE_CHINA_MODE);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(data->regmap, EC_ADDR_KBD_S=
TATUS, &regval);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 regval |=3D KBD_APPLY;
>>>>>> +=C2=A0=C2=A0=C2=A0 regval &=3D ~KBD_POWER_OFF;
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D regmap_write(data->regmap, EC_ADDR_KBD_=
STATUS, regval);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 switch (data->project_id) {
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TRX1:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TUX1:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH4TQX1:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TRX1:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PH6TQXX:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXAXXX:
>>>>>> +=C2=A0=C2=A0=C2=A0 case PROJECT_ID_PHXPXXX:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =
=3D true;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>> +=C2=A0=C2=A0=C2=A0 default:
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->single_color_kbd =
=3D regval & KBD_WHITE_ONLY;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (data->single_color_kbd) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init_data.default_label=
 =3D "white:"=20
>>>>>> LED_FUNCTION_KBD_BACKLIGHT;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.max_=
brightness =3D=20
>>>>>> data->kbd_led_max_brightness;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.colo=
r =3D LED_COLOR_ID_WHITE;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.flag=
s =3D LED_BRIGHT_HW_CHANGED |=20
>>>>>> LED_REJECT_NAME_CONFLICT;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brig=
htness_set_blocking =3D=20
>>>>>> uniwill_kbd_led_brightness_set;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_cdev.brig=
htness_get =3D=20
>>>>>> uniwill_kbd_led_brightness_get;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return devm_led_classde=
v_register_ext(data->dev,=20
>>>>>> &data->kbd_led_cdev, &init_data);
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < KBD_LED_CHANNELS; i++) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled=
_info[i].color_index =3D=20
>>>>>> color_indices[i];
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_read(dat=
a->regmap,=20
>>>>>> uniwill_kbd_led_channel_to_reg[i], &regval);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Make sure that =
the initial intensity value is not=20
>>>>>> greater than
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * the maximum int=
ensity.
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval > KBD_LED_MA=
X_INTENSITY) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 regval =3D KBD_LED_MAX_INTENSITY;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D regmap_write(data->regmap,=20
>>>>>> uniwill_kbd_led_channel_to_reg[i], regval);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 needs_trigger =3D true;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (regval)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 intensity_all_zeros =3D false;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled=
_info[i].intensity =3D regval;
>>>>>> + data->kbd_led_mc_subled_info[i].max_intensity =3D=20
>>>>>> KBD_LED_MAX_INTENSITY;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_subled=
_info[i].channel =3D i;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 /* See uniwill_kbd_led_mc_brightness_set() for =
an=20
>>>>>> explaination. */
>>>>>> +=C2=A0=C2=A0=C2=A0 if (intensity_all_zeros) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i < K=
BD_LED_CHANNELS; i++) {
>>>>>> + data->kbd_led_mc_subled_info[i].intensity =3D 1;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D regmap_write(data->regmap,=20
>>>>>> uniwill_kbd_led_channel_to_reg[i], 1);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needs_trigger =3D true;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 if (needs_trigger) {
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D regmap_write_bi=
ts(data->regmap, EC_ADDR_TRIGGER,=20
>>>>>> RGB_APPLY_COLOR,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RGB_APPLY_COLOR);
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return ret;
>>>>>> +=C2=A0=C2=A0=C2=A0 }
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 ret =3D devm_mutex_init(data->dev, &data->kbd_r=
gb_led_lock);
>>>>>> +=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 init_data.default_label =3D "multicolor:"=20
>>>>>> LED_FUNCTION_KBD_BACKLIGHT;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.max_brightness =
=3D=20
>>>>>> data->kbd_led_max_brightness;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.color =3D LED_CO=
LOR_ID_MULTI;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.flags =3D LED_BR=
IGHT_HW_CHANGED=20
>>>>>> | LED_REJECT_NAME_CONFLICT;
>>>>>> + data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking =3D=20
>>>>>> uniwill_kbd_led_mc_brightness_set;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.led_cdev.brightness_get =
=3D=20
>>>>>> uniwill_kbd_led_mc_brightness_get;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.subled_info =3D=20
>>>>>> data->kbd_led_mc_subled_info;
>>>>>> +=C2=A0=C2=A0=C2=A0 data->kbd_led_mc_cdev.num_colors =3D KBD_LED_CH=
ANNELS;
>>>>>> +
>>>>>> +=C2=A0=C2=A0=C2=A0 return devm_led_classdev_multicolor_register_ex=
t(data->dev,=20
>>>>>> &data->kbd_led_mc_cdev,
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &init_data);
>>>>>> +}
>>>>>> +
>>>>>
>>>>> Sorry I know I'm way to late with my comment, but I'm not at all a=
=20
>>>>> fan of how complex this whole function is:
>>>>>
>>>>> - When we have to set max brightness on a per device basis anyway,=
=20
>>>>> we can also set rgb or white only there and can skip this whole=20
>>>>> detection mechanism with the supported bits that are unreliable=20
>>>>> anyway
>>>>>
>>>>> - we have a 2nd "supported devices/features list" inside this=20
>>>>> function which is abstracting away from the actual supported=20
>>>>> feature list
>>>>>
>>>>> Should i try to spin up something much simpler, but that requires=20
>>>>> explicit setting in the device descriptor?
>>>>>
>>>>> Best regards
>>>>>
>>>>> Werner
>>>>>
>>>> Good point, but in this case i think having this small device list=20
>>>> is OK, because the original control center
>>>> does something similar.
>>> yeah the original cc and tuxedo-drivers has these small lists all=20
>>> over the place ... also don't like it there
>>>> If we encounter a device that does not work with this strategy then=
=20
>>>> we can indeed
>>>> move the code into the device descriptor.
>>>
>>> later we might not be able to get the information anymore which=20
>>> devices are rgb and which are white only when the supported devices=20
>>> lists grows, then we are stuck to reading the feature bits.
>>>
>>> best regards,
>>>
>>> Werner
>>>
>> Good point, in this case using the device descriptor for this feature=
=20
>> detection
>> might indeed be better in the long term.
>>
>> Do you want to send the patches or should i do it?
>
> I will not stop you if you have time to do it ^^
>
> you are probably quicker in working on your own code
>
> i would do a
>
> UNIWILL_FEATURE_KBL_WHITE_ONLY and a
>
> UNIWILL_FEATURE_KBL_ONE_ZONE_RGB (there are also Uniwill devices with=20
> per-key RGB, but that is controlled via a usb device)
>
> also required is a way to set max intensity via the device descriptor,=
=20
> most tuxedo devices have 200 as max value there and not 50
>
> best regards,
>
> Werner
>
Alright, i will send the necessary patches soon.

Thanks,
Armin Wolf

>>
>> Thanks,
>> Armin Wolf=20
> [...]
>
