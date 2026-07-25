Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3121CFEF;
	Sat, 25 Jul 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784990839; cv=none; b=oIaSxzDeh8bFpQ9w51P6zQL2r5HbwjT3ik8u2F/PshiziMgGg+/HyGCtsHoaoXYSrLVe3yYUcO1/ib3xC9HMs0NcwS/bW0YvW5yLXuVE5f9KPVuYMvmr7RHI3V0AQ73N2K+SVUjD54KowHVx+hAqhOA8P1/BHJOqt1wmXAi+2Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784990839; c=relaxed/simple;
	bh=i2O9LrcyYZ7jnGTsPaX0Nwl/jIvSac4TepT4VrfX+s8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4+jXTK6Qxo9J4QaTNp3kpWtIt1URunggQsbpmUhecIS7Y9YgzYGxYNeC4XbCB3QrAuAMwYhVm+iepU0XwhYLP6QbgmoKSBUSZ8uowIbuQihVPZWzIzsgzCTfy0Y6VlFaxzxkKRLqfsEuZ7LOQoxbYT/jZgn1r5HdPsg9io26gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=stfbWTO0; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="stfbWTO0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1784990834; x=1785595634; i=w_armin@gmx.de;
	bh=kx+pft3+UGTIL6jpfHcqF/tq9ONIDHVwx8S5samj/Gs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=stfbWTO0kzDj/ZU5Emv8bCCdpMNTPhLB0ji4bXl84ZHBQ7p1+kXFO1Ofe9G62Umf
	 TlSttCDXq75ZtWbMzyMyT96FYNItNUkhGyOL6yiDUY1ECwjHsmctzXRLtlHI7thxy
	 bsCTZGFdbZi2VGobaGgsnyM6TvLI+YltnEutxa0fjMDzXeUWuQE7PiGAGWhLhL9u8
	 5zFpq1KBCWvWBob0BigQpteTyPwQ0RnIqtM3VGSJeFE0gdi3BRA/sdAx99ZeMKKBh
	 tTO0gnBFvYewYrKsyF575X0Yu/W8jVePnA4A9Q7LjBAWshCZfoRaeiOqQAC8M/aq3
	 3vt1dRoO7/CANDlq7w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1wuWTb1UZl-00CxSX; Sat, 25
 Jul 2026 16:47:14 +0200
Message-ID: <fe17d886-8c0c-4323-88d0-d43ba475b27b@gmx.de>
Date: Sat, 25 Jul 2026 16:47:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: uniwill-laptop: Enable kb backlight and
 lightbar for TUXEDO
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260724230056.708736-1-wse@tuxedocomputers.com>
 <20260724230056.708736-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260724230056.708736-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IB9hnTxbvAZ80MNX3HR4JXMZ41veM3K+Z+AeQPhCLr4DK7JbUiX
 HchgyANCm6H1HM0pj1RbE7KYC0E2RKUnEFEVfqlO8nAjB4DOTvnBdlJXRhTyEP3yLh6DGTo
 F10TVS/nj0HyvkqQ7YbfzeUMqzNnrdNPhGt22gKgcHuQuGUzrFSBqpPdDc2f6SaDKZXSEHi
 SBXD3/4Cq8ttE0lZwmZEQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Nn7ZSLInYCo=;kOPuphvx5BPxbOBC8v2jp0rvc8+
 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
 FU4Ds6Vle8fME66vUfbyXgqCZmtkzehNqg==

Am 25.07.26 um 01:00 schrieb Werner Sembach:

> Enable EC controlled keyboard backlight across the board for TUXEDO
> devices.
>
> This has split up the device descriptors even more, so the "featureset"
> naming scheme was dropped in favor of a "generalized board_name" naming
> scheme.
>
> Also Stellaris and Polaris Gen3 are now identified by product_sku to spl=
it
> them up.
>
> Also some TUXEDO devices with lightbar still had the support missing. Th=
is
> patch completes the list in this point.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 309 +++++++++++++++-----
>   1 file changed, 233 insertions(+), 76 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index d9a33be4f4a37..e81ccfa39039e 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -645,6 +645,7 @@ static bool uniwill_readable_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_BIOS_OEM:
>   	case EC_ADDR_PWM_1:
>   	case EC_ADDR_PWM_2:
> +	case EC_ADDR_SUPPORT_1:
>   	case EC_ADDR_SUPPORT_2:
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
> @@ -684,6 +685,7 @@ static bool uniwill_volatile_reg(struct device *dev,=
 unsigned int reg)
>   	case EC_ADDR_BIOS_OEM:
>   	case EC_ADDR_PWM_1:
>   	case EC_ADDR_PWM_2:
> +	case EC_ADDR_SUPPORT_1:
>   	case EC_ADDR_SUPPORT_2:
>   	case EC_ADDR_TRIGGER:
>   	case EC_ADDR_SWITCH_STATUS:
> @@ -2696,35 +2698,47 @@ static struct uniwill_device_descriptor lapkc71f=
_descriptor __initdata =3D {
>   	.lightbar_max_brightness =3D 200,
>   };
>  =20
> -/*
> - * The featuresets below reflect somewhat chronological changes:
> - * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmw=
are.
> - * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC =
firmware.
> - * Some devices might divert from this timeline.
> - */
> +static struct uniwill_device_descriptor pfxnuxx_pfxluxx_phxprxx_descrip=
tor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 2,
> +};
>  =20
> -static struct uniwill_device_descriptor tux_featureset_1_descriptor __i=
nitdata =3D {
> +static struct uniwill_device_descriptor gkxmrxx_gkxnpxx_gkxnrxx_descrip=
tor __initdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>   		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_1_nvidia_descrip=
tor __initdata =3D {
> +static struct uniwill_device_descriptor gmxmpxx_descriptor __initdata =
=3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>   		    UNIWILL_FEATURE_CPU_TEMP |
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
>   		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +	.lightbar_max_brightness =3D 36,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_2_nvidia_descrip=
tor __initdata =3D {
> +static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx=
_descriptor __initdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2733,10 +2747,109 @@ static struct uniwill_device_descriptor tux_fea=
tureset_2_nvidia_descriptor __ini
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
>   		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 2,
> +};
> +
> +static struct uniwill_device_descriptor gmxmgxx_gmxngxx_gmxxgxx_descrip=
tor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_pol_descriptor =
__initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_ste_descriptor =
__initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
>   		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +	.lightbar_max_brightness =3D 36,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_3_nvidia_descrip=
tor __initdata =3D {
> +static int gmxrgxx_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_1, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & LIGHTBAR) {
> +		data->features |=3D UNIWILL_FEATURE_LIGHTBAR;
> +		data->lightbar_max_brightness =3D 36;
> +	}
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & RGB_KEYBOARD) {
> +		data->features |=3D UNIWILL_FEATURE_KEYBOARD_BACKLIGHT;
> +		data->kbd_led_single_color =3D false;
> +		data->kbd_led_max_brightness =3D 4;
> +	}
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor gmxrgxx_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +	.probe =3D gmxrgxx_probe,
> +};
> +
> +static struct uniwill_device_descriptor gmxagxx_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +	.lightbar_max_brightness =3D 36,
> +};
> +
> +static struct uniwill_device_descriptor gmxxgxx_gmxpxxx_descriptor __in=
itdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2747,7 +2860,7 @@ static struct uniwill_device_descriptor tux_featur=
eset_3_nvidia_descriptor __ini
>   		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_4_descriptor __i=
nitdata =3D {
> +static struct uniwill_device_descriptor gxxhrxx_gxxmrxx_xxxx4nxx_descri=
ptor __initdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2755,10 +2868,29 @@ static struct uniwill_device_descriptor tux_feat=
ureset_4_descriptor __initdata =3D
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
>   		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> -		    UNIWILL_FEATURE_USB_POWERSHARE,
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 4,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_4_nvidia_descrip=
tor __initdata =3D {
> +static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
> +
> +static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx5=
7xx_descriptor __initdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
> @@ -2771,7 +2903,7 @@ static struct uniwill_device_descriptor tux_featur=
eset_4_nvidia_descriptor __ini
>   		    UNIWILL_FEATURE_USB_POWERSHARE,
>   };
>  =20
> -static int phxtxx1_probe(struct uniwill_data *data)
> +static int phxtuxx_phxtrxx_probe(struct uniwill_data *data)
>   {
>   	unsigned int value;
>   	int ret;
> @@ -2786,17 +2918,20 @@ static int phxtxx1_probe(struct uniwill_data *da=
ta)
>   	return 0;
>   };
>  =20
> -static struct uniwill_device_descriptor phxtxx1_descriptor __initdata =
=3D {
> +static struct uniwill_device_descriptor phxtuxx_phxtrxx_descriptor __in=
itdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>   		    UNIWILL_FEATURE_CPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> -	.probe =3D phxtxx1_probe,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 2,
> +	.probe =3D phxtuxx_phxtrxx_probe,
>   };
>  =20
> -static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
> +static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
>   {
>   	unsigned int value;
>   	int ret;
> @@ -2812,22 +2947,28 @@ static int phxarx1_phxaqf1_probe(struct uniwill_=
data *data)
>   	return 0;
>   };
>  =20
> -static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __in=
itdata =3D {
> +static struct uniwill_device_descriptor phxarxx_phxaqxx_descriptor __in=
itdata =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
>   		    UNIWILL_FEATURE_CPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> -	.probe =3D phxarx1_phxaqf1_probe,
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 2,
> +	.probe =3D phxarxx_phxaqxx_probe,
>   };
>  =20
> -static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata =
=3D {
> +static struct uniwill_device_descriptor pfxpuxx_descriptor __initdata =
=3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_CPU_TEMP |
> -		    UNIWILL_FEATURE_PRIMARY_FAN,
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
> +	.kbd_led_single_color =3D true,
> +	.kbd_led_max_brightness =3D 2,
>   };
>  =20
>   static struct uniwill_device_descriptor x4sp4nal_descriptor __initdata=
 =3D {
> @@ -2922,7 +3063,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>   		},
> -		.driver_data =3D &phxtxx1_descriptor,
> +		.driver_data =3D &phxtuxx_phxtrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -2930,7 +3071,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -2938,7 +3079,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> -		.driver_data =3D &phxarx1_phxaqf1_descriptor,
> +		.driver_data =3D &phxarxx_phxaqxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -2946,7 +3087,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -2954,7 +3095,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &pfxnuxx_pfxluxx_phxprxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Bo=
ok Pro Gen 8",
> @@ -2962,7 +3103,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -2970,7 +3111,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &phxtqxx_phxagxx_phxaqxx_phxpgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -2978,7 +3119,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_descriptor,
> +		.driver_data =3D &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
> @@ -2986,7 +3127,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_descriptor,
> +		.driver_data =3D &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -2994,7 +3135,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_descriptor,
> +		.driver_data =3D &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -3002,7 +3143,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_descriptor,
> +		.driver_data =3D &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -3010,7 +3151,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_descriptor,
> +		.driver_data =3D &gxxhrxx_gxxmrxx_xxxx4nxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -3018,7 +3159,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -3026,7 +3167,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -3034,7 +3175,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -3042,7 +3183,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -3050,7 +3191,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -3058,7 +3199,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -3066,7 +3207,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -3074,7 +3215,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -3082,7 +3223,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -3090,7 +3231,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -3098,7 +3239,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -3106,7 +3247,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -3114,7 +3255,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gkxmrxx_gkxnpxx_gkxnrxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -3122,7 +3263,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gmxmpxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -3130,7 +3271,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> -		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
> +		.driver_data =3D &gmxmpxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -3138,7 +3279,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -3146,23 +3287,39 @@ static const struct dmi_system_id uniwill_dmi_ta=
ble[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15/17 Gen3 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XA03"),
> +		},
> +		.driver_data =3D &gmxzgxx_gmxtgxx_pol_descriptor,
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15/17 Gen3 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "POLARIS1XI03"),
> +		},
> +		.driver_data =3D &gmxzgxx_gmxtgxx_pol_descriptor,
>   	},
>   	{
> -		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> +		.ident =3D "TUXEDO Stellaris 15/17 Gen3 AMD",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XA03"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &gmxzgxx_gmxtgxx_ste_descriptor,
>   	},
>   	{
> -		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> +		.ident =3D "TUXEDO Stellaris 15/17 Gen3 Intel",
>   		.matches =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> -			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "STELLARIS1XI03"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &gmxzgxx_gmxtgxx_ste_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -3170,7 +3327,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &gmxrgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -3178,7 +3335,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &gmxagxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -3186,7 +3343,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
> +		.driver_data =3D &gmxmgxx_gmxngxx_gmxxgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -3194,7 +3351,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &gmxxgxx_gmxpxxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -3202,7 +3359,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
> +		.driver_data =3D &gmxxgxx_gmxpxxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -3210,7 +3367,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxhgxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -3218,7 +3375,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -3226,7 +3383,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -3234,7 +3391,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -3242,7 +3399,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -3250,7 +3407,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -3258,7 +3415,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -3266,7 +3423,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &tux_featureset_4_nvidia_descriptor,
> +		.driver_data =3D &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
> @@ -3274,7 +3431,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>   		},
> -		.driver_data =3D &pf5pu1g_descriptor,
> +		.driver_data =3D &pfxpuxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -3282,7 +3439,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &pfxnuxx_pfxluxx_phxprxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -3290,7 +3447,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &pfxnuxx_pfxluxx_phxprxx_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -3298,7 +3455,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &pfxnuxx_pfxluxx_phxprxx_descriptor,
>   	},
>   	{ }
>   };
