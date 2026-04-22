Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C6D3CFF50;
	Wed, 22 Apr 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856644; cv=none; b=qRVPyE64QelvKz60uA/bcpdddfKN4V7oXiTwKAvxLxHhdkmXHLpf4wwCorNnptiQTZR0LAUhHzdQD4rB4t2nF/Z2BEc6utuVUyV7VWraiXYwX/VAfwKJbkhPWVilR3Wei+hd08UyTDfeF7KXw1eS8irZ5RTV3IbrNC+re6tgYzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856644; c=relaxed/simple;
	bh=PKHPnL/9+LXr1HIjXpCHs9PICiMaJqoYeaitQSk5V4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k420lu4yknXQgUy6rXAp69TPzkOY9jUh/BW4hb/vxvvyPWiT8aonQri93y05CYFXfes/UUKkaEQwQx8hYb3HUPKNdvCKYUIOKNrPDtT3/PfSY1Yu3Ok03FiyecJzx2kXJdVdSaukL1EyYfbqc9WLog7/cKqDcJgwak5Yh+d2f8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tSjgjjV6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tSjgjjV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776856640; x=1777461440; i=w_armin@gmx.de;
	bh=W4Q9E+gEkm4BJywDgobcVoXDMtFmCLvocSyyxe9ow10=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tSjgjjV692wF4dHS+c5LLZEqlAV5OedMewdUjN6BGVURlZAmnhbfeVoQIN+7krOM
	 w9ktLJX9Dz7YBXnZk/D9YSb701K4+/14FPizDtyDuSeK4qtoHyaHF3ehsjK/czgW1
	 OihG9Y5QbXqT6Tl5SxEd2VSb9c5JWeNa1Ou6oyAkKvbHhFs+iMgMupQ4O3z4tqXsg
	 f/k3ZgKhVcdrQ5wxV3QalzsYYgvQ7bHrWdHTsiiu1vAXpBLjxaVF3QVx8NBgFkKYM
	 tLxehwDml9QR3sK5WhbyE++v0JjY84/r700WLDfqTibK2A0MVn4+46B1412rwi7Hp
	 eD3oR2LvzSWSx/n/xQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1vG5NB1DRh-00xzvr; Wed, 22
 Apr 2026 13:17:20 +0200
Message-ID: <d85481fe-513c-48db-b766-8f365bcbf66b@gmx.de>
Date: Wed, 22 Apr 2026 13:17:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: uniwill-laptop: Implement lightbar
 for XMG Fusion (L19)
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <20260421201103.142403-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260421201103.142403-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y/IvsWVLLBriMUdUL2W4sdRCvju9jL8aK5gopp5fE7Mt+TBEwG+
 pNSg1t3V5QzXEcBN1jgNk3KsLJB2RK76N1L5HChsLcHmAmjw5ruHxVRf91ae4bNPwTJa7L8
 s1NvLHSkqrDIRA1gaYI++GPGSI8wNAZewejanjtZPUownKLMDIpowAMLZiKER56z8iZZP7I
 2btKKZRQozbcEeaICmm1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OwQo+zYt0bE=;zjY/kDCKVIi/1Tagoc+eZW+Z2jo
 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

Am 21.04.26 um 22:01 schrieb Werner Sembach:
> The XMG Fusion (L19) also has a lightbar but with a different max
> brightness value of 36 instead of 200.
>=20
> This patch adds a new feature flag for the driver to correctly handle th=
is
> case and applies it to the mentioned device.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 +++++++++++++------
>   1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7d1fdbacc6871..62d56cc67e2e8 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -318,7 +318,6 @@
>   #define FAN_TABLE_LENGTH	16
>  =20
>   #define LED_CHANNELS		3
> -#define LED_MAX_BRIGHTNESS	200
>  =20
>   #define UNIWILL_FEATURE_FN_LOCK			BIT(0)
>   #define UNIWILL_FEATURE_SUPER_KEY		BIT(1)
> @@ -344,6 +343,7 @@ struct uniwill_data {
>   	acpi_handle handle;
>   	struct regmap *regmap;
>   	unsigned int features;
> +	u8 lightbar_max_brightness;
>   	struct acpi_battery_hook hook;
>   	struct mutex battery_lock;	/* Protects the list of currently register=
ed batteries */
>   	union {
> @@ -376,6 +376,7 @@ struct uniwill_battery_entry {
>  =20
>   struct uniwill_device_descriptor {
>   	unsigned int features;
> +	u8 lightbar_max_brightness;
>   	/* Executed during driver probing */
>   	int (*probe)(struct uniwill_data *data);
>   };
> @@ -1340,7 +1341,7 @@ static int uniwill_led_brightness_set(struct led_c=
lassdev *led_cdev, enum led_br
>  =20
>   	for (int i =3D 0; i < LED_CHANNELS; i++) {
>   		/* Prevent the brightness values from overflowing */
> -		value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brightn=
ess);
> +		value =3D min(data->lightbar_max_brightness, data->led_mc_subled_info=
[i].brightness);
>   		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
>   		if (ret < 0)
>   			return ret;
> @@ -1376,12 +1377,14 @@ static int uniwill_led_init(struct uniwill_data =
*data)
>   		LED_COLOR_ID_GREEN,
>   		LED_COLOR_ID_BLUE,
>   	};
> -	unsigned int value;
> +	unsigned int value, max_brightness;
>   	int ret;
>  =20
>   	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>   		return 0;
>  =20
> +	max_brightness =3D data->lightbar_max_brightness;

Please drop the max_brightness variable and assign=20
led_cdev.max_brightness and led_cdev.brightness directly.

> +
>   	ret =3D devm_mutex_init(data->dev, &data->led_lock);
>   	if (ret < 0)
>   		return ret;
> @@ -1409,14 +1412,14 @@ static int uniwill_led_init(struct uniwill_data =
*data)
>   		return ret;
>  =20
>   	data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
> -	data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
> +	data->led_mc_cdev.led_cdev.max_brightness =3D max_brightness;
>   	data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>   	data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
>  =20
>   	if (value & LIGHTBAR_S0_OFF)
>   		data->led_mc_cdev.led_cdev.brightness =3D 0;
>   	else
> -		data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
> +		data->led_mc_cdev.led_cdev.brightness =3D max_brightness;
>  =20
>   	for (int i =3D 0; i < LED_CHANNELS; i++) {
>   		data->led_mc_subled_info[i].color_index =3D color_indices[i];
> @@ -1429,7 +1432,7 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
>   		 * Make sure that the initial intensity value is not greater than
>   		 * the maximum brightness.
>   		 */
> -		value =3D min(LED_MAX_BRIGHTNESS, value);
> +		value =3D min(max_brightness, value);
>   		ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i],=
 value);
>   		if (ret < 0)
>   			return ret;
> @@ -1882,6 +1885,7 @@ static int uniwill_probe(struct platform_device *p=
dev)
>   		return ret;
>  =20
>   	data->features =3D device_descriptor.features;
> +	data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brigh=
tness;
>  =20
>   	/*
>   	 * Some devices might need to perform some device-specific initializa=
tion steps
> @@ -2130,11 +2134,13 @@ static struct platform_driver uniwill_driver =3D=
 {
>  =20
>   static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor _=
_initdata =3D {
>   	.features =3D UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>   		    UNIWILL_FEATURE_CPU_TEMP |
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN,
> +	.lightbar_max_brightness =3D 36,
>   };
>  =20
>   static struct uniwill_device_descriptor lapac71h_descriptor __initdata=
 =3D {
> @@ -2158,6 +2164,7 @@ static struct uniwill_device_descriptor lapkc71f_d=
escriptor __initdata =3D {
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN,
> +	.lightbar_max_brightness =3D 200,

Please also set lightbar_max_brightness to 200 during module=20
initialization when the "force" parameter is set.

I suggest you rebase this series on top of the "platform/x86:=20
uniwill-laptop: Charging-related improvements" series to avoid merge=20
conflicts.

Thanks,
Armin Wolf

>   };
>  =20
>   /*

