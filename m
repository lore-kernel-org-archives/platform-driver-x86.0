Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903AF1FE45D;
	Fri, 27 Feb 2026 09:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184494; cv=none; b=f5Pu2Sl3o50zFibLLJRcx5pCPcLwJVgFfK9TZrEzfvfJGBd52wHA7Tk5vi+beQGjqOmx94PinNiAKinamoIdZY22p6wne0bcOVn97JcdesPBUok1R/ywwdEx4Gc0vXx5NCe2O+3KLexwNjIX3xCtSutAXppTZ+7gH/MHdPhvu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184494; c=relaxed/simple;
	bh=QYPPjXwlUy7VYoP3FCk4Y+37i6XRJY1LTlaKHn68tlg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XV0xLOEOgL9QV8d4PwhgzbJMNUqf7OWvfJgfG3s2Kk3zzQ8GM5q1ec2aROcCn7rNaq4YkP/z4bKEB3H73SyIRC74D9nzFllNdqYCtSkZ0mrNTycfyyHtv7XwIJ59gkAZ/am8WBjZ9nWt8euRj9nHr/ZNc+zbgeiR0WI7lvZMwW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tlj8f9jz; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tlj8f9jz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772184490; x=1772789290; i=w_armin@gmx.de;
	bh=ouenGP1CbI1qqRZ/A2kMOz5ouEYDvRitXShLuehEjM0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tlj8f9jzocEiJIJorTsL+GWtav6l7LRQC0gsykmlBEbbCroIwXOtNeQcxwax3D0i
	 E6bLCIyUZH+F2E8vqNBQAbIihO0uNKTXU4e2HYAeizg9fVL69rDwGaI48dQ5bjudS
	 GR7omIJczG5j3Eiqn0ZAyBkiJqZcV2SjuwDy3WtEGS12UlmHECAmCv/hqngYR/CrX
	 zlUc77H9Mm8j2QuzecHGx/lIOpzxBV4fd1vk7Wi9xzHgq9XRlDRp/PqgNRSLmCvRU
	 uG6/RKSPlJaK98n6arTnUiOB8Sm4sU3F5H9aQcih1U2q0f34d05BlQPhrI6BT+xnK
	 aUW0S5rAf4PCBvoAPA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ykW-1w1yQ826Cc-00FRDy; Fri, 27
 Feb 2026 10:28:10 +0100
Message-ID: <175fbf7c-e5ab-4574-978a-6d2912a57faf@gmx.de>
Date: Fri, 27 Feb 2026 10:28:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86/uniwill: uniwill-laptop: Rework hwmon
 feature defines
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226205302.123782-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xxFfPwb3I64czdRdGhS2iHoQZx8WwfYqpcmtUYKe8pD+TNxgLjY
 OjP8wvF4Fo3QyQ9XP6vUF84gctIQj+EqN8jxbggBscllSqsPbTykqQ9lzxOC24C1CyMX79R
 nTKPANBHFo/XKQuJn5seqns+jNymGxfLZakuygQJclqTejiq3yHER0ceZz1XmJrFu7ZVsJJ
 E4+LsNmYQBgh1fo/l04eg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4N69IpmQFlg=;5BcTPcaIcQYN6IFBwUP7s/T6iNZ
 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

Am 26.02.26 um 21:50 schrieb Werner Sembach:

> From: Armin Wolf <W_Armin@gmx.de>
>
> Split hwmon feature define in smaller parts to accommodate for diverse
> hardware. You can now specify the presence of a cpu and/or a gpu temp
> sensor separately and if one or 2 fans exists.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 68 ++++++++++++++++++---
>   1 file changed, 61 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 6341dca20b76a..7ab82cf16f388 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -319,8 +319,11 @@
>   #define UNIWILL_FEATURE_TOUCHPAD_TOGGLE		BIT(2)
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)
> -#define UNIWILL_FEATURE_HWMON			BIT(5)
> -#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
> +#define UNIWILL_FEATURE_CPU_TEMP		BIT(5)
> +#define UNIWILL_FEATURE_GPU_TEMP		BIT(6)
> +#define UNIWILL_FEATURE_PRIMARY_FAN		BIT(7)
> +#define UNIWILL_FEATURE_SECONDARY_FAN		BIT(8)
> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(9)
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -427,7 +430,7 @@ static const struct key_entry uniwill_keymap[] =3D {
>   	{ KE_END }
>   };
>  =20
> -static inline bool uniwill_device_supports(struct uniwill_data *data,
> +static inline bool uniwill_device_supports(const struct uniwill_data *d=
ata,
>   					   unsigned int features)
>   {
>   	return (data->features & features) =3D=3D features;
> @@ -937,6 +940,48 @@ static const struct attribute_group *uniwill_groups=
[] =3D {
>   	NULL
>   };
>  =20
> +static umode_t uniwill_is_visible(const void *drvdata, enum hwmon_senso=
r_types type, u32 attr,
> +				  int channel)
> +{
> +	const struct uniwill_data *data =3D drvdata;
> +	unsigned int feature;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (channel) {
> +		case 0:
> +			feature =3D UNIWILL_FEATURE_CPU_TEMP;
> +			break;
> +		case 1:
> +			feature =3D UNIWILL_FEATURE_GPU_TEMP;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	case hwmon_fan:
> +	case hwmon_pwm:
> +		switch (channel) {
> +		case 0:
> +			feature =3D UNIWILL_FEATURE_PRIMARY_FAN;
> +			break;
> +		case 1:
> +			feature =3D UNIWILL_FEATURE_SECONDARY_FAN;
> +			break;
> +		default:
> +			return 0;
> +		}
> +		break;
> +	default:
> +		return 0;
> +	}
> +
> +	if (uniwill_device_supports(data, feature))
> +		return 0440;

I think you forgot this one.

> +
> +	return 0;
> +}
> +
>   static int uniwill_read(struct device *dev, enum hwmon_sensor_types ty=
pe, u32 attr, int channel,
>   			long *val)
>   {
> @@ -1020,7 +1065,7 @@ static int uniwill_read_string(struct device *dev,=
 enum hwmon_sensor_types type,
>   }
>  =20
>   static const struct hwmon_ops uniwill_ops =3D {
> -	.visible =3D 0444,
> +	.is_visible =3D uniwill_is_visible,
>   	.read =3D uniwill_read,
>   	.read_string =3D uniwill_read_string,
>   };
> @@ -1048,7 +1093,10 @@ static int uniwill_hwmon_init(struct uniwill_data=
 *data)
>   {
>   	struct device *hdev;
>  =20
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_CPU_TEMP) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_GPU_TEMP) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_PRIMARY_FAN) &&
> +	    !uniwill_device_supports(data, UNIWILL_FEATURE_SECONDARY_FAN))
>   		return 0;
>  =20
>   	hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", d=
ata,
> @@ -1687,7 +1735,10 @@ static struct uniwill_device_descriptor lapac71h_=
descriptor __initdata =3D {
>   		    UNIWILL_FEATURE_SUPER_KEY |
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_BATTERY |
> -		    UNIWILL_FEATURE_HWMON,
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
>   };
>  =20
>   static struct uniwill_device_descriptor lapkc71f_descriptor __initdata=
 =3D {
> @@ -1696,7 +1747,10 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>   		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
>   		    UNIWILL_FEATURE_LIGHTBAR |
>   		    UNIWILL_FEATURE_BATTERY |
> -		    UNIWILL_FEATURE_HWMON,
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
>   };
>  =20
>   static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
