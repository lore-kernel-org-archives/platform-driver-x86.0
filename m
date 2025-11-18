Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387F432C95C;
	Tue, 18 Nov 2025 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464125; cv=none; b=r3gJ1yCvi2h7ddWMq2nrT8eoN2AR8F5cT4P0c3RV38CEusLSLdE2olo/6v7PvwTBabBS6VQsLMaJOVG0pqh38/6tLsQIchnBgWQXzZJutpilo2r8Es+rPwZFS1Hxib+zhyXDdDMGG5kZzwR4NVyTbD9FAU6VIYoK5nXV2dsPiEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464125; c=relaxed/simple;
	bh=Uz/END3rnsVSx6za0ixmsunhFnZtW3ELW0kCioQzOWg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RF7iUtGbDj7QnBvRG1Vp9Yfx6mlPKjfGfHpx7gFcV/8vZhKOTm9XhvO4+G7LlpqCw0LsEXD4BUtpjU6em5chYuRRRYmxjqHQMWjTEAxwNgDn5RdmAkp1X2MozGG5DhOnO+TN7PzLqWryN3jYBvVqte72cj/mVG6XJmsGl90m96c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=N2jULlgg; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="N2jULlgg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763464101; x=1764068901; i=w_armin@gmx.de;
	bh=+2ok1Ma+hA9ROIpny5fpG79ZR5gzM05TIJ0av3f3ark=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=N2jULlgg0knLdoMHa7emaEg6ffFaym3fe8iw3o2yLwV062nVp0j8qCY/vPbzMnEc
	 a7peaLyLKHdFIqGJDJCU2+LKhOw+0oY9k6GPRMR1kdI+Am8vfGnpyXQ0P3rxcth/X
	 xQCFEbXNQH1KC1cqOve1htdlmgMAtgJ+AcmERcmPWRiKiNFg74ToAzNGgb//ikimU
	 wThmCP8G+zZlcbYYRsBLEO17Az/JKD1t1jfxKu8r4nTrvcsXHAf5riYP/Gw/zWpDd
	 hzhdXZbKiuzaO90e/ILuLP8O1FP8W4poIS2BXpuAAjlfb5x0euJuV45cJ3YB8YJvz
	 EW+XEgrc+hRzjFNjNw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3siA-1wL0tR0TQW-00tpkR; Tue, 18
 Nov 2025 12:08:21 +0100
Message-ID: <fc1b75ce-113d-4de1-ac98-7616b17f915c@gmx.de>
Date: Tue, 18 Nov 2025 12:08:18 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] platform/x86/uniwill: Handle more WMI events required
 for TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251117132530.32460-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kzZvQbcSI0Odz8WcCzXmznW41vDyPf/2xOW6JbWz7ALcxCMDFVd
 pmeGSJOAh6JlgPJQR0dNWd7vy3rFpkm/89jKI0wFfnIl4nq1DbBmJIqmBVujYSwi5b2L4xQ
 7eE9sorWBABKmqamsPGBkSS8rT2m9f24uQYflIX11O6/MRn+5BlnhZhv/CBWGSJOlw3BL0l
 FW4cBA+EtQhT8ieRH1Wyw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:khGPN/Iamww=;EZf5rIr0q6C2v3kjDlkW8jujmJE
 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

Am 17.11.25 um 14:23 schrieb Werner Sembach:

> Handle some more WMI events that are triggered on TUXEDO devices.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 19 ++++++++++++++++++-
>   drivers/platform/x86/uniwill/uniwill-wmi.h  |  2 ++
>   2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 29bb3709bfcc8..0cb86a701b2e1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -371,9 +371,11 @@ static const struct key_entry uniwill_keymap[] =3D =
{
>  =20
>   	/* Reported in manual mode when toggling the airplane mode status */
>   	{ KE_KEY,       UNIWILL_OSD_RFKILL,                     { KEY_RFKILL =
}},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOON,                    { KEY_UNKNOWN =
}},
> +	{ KE_IGNORE,    UNIWILL_OSD_RADIOOFF,                   { KEY_UNKNOWN =
}},
>  =20
>   	/* Reported when user wants to cycle the platform profile */
> -	{ KE_IGNORE,    UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_UNKNOWN =
}},
> +	{ KE_KEY,       UNIWILL_OSD_PERFORMANCE_MODE_TOGGLE,    { KEY_F14 }},

I am currently working a patch adding platform profile support, so this ev=
ent would
be handled inside the kernel on models with platform profile support.

>  =20
>   	/* Reported when the user wants to adjust the brightness of the keybo=
ard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMDOWN,               { KEY_KBDILLU=
MDOWN }},
> @@ -382,11 +384,19 @@ static const struct key_entry uniwill_keymap[] =3D=
 {
>   	/* Reported when the user wants to toggle the microphone mute status =
*/
>   	{ KE_KEY,       UNIWILL_OSD_MIC_MUTE,                   { KEY_MICMUTE=
 }},
>  =20
> +	/* Reported when the user wants to toggle the mute status */
> +	{ KE_IGNORE,    UNIWILL_OSD_MUTE,                       { KEY_MUTE }},

Why is this event being ignored?

> +
>   	/* Reported when the user locks/unlocks the Fn key */
>   	{ KE_IGNORE,    UNIWILL_OSD_FN_LOCK,                    { KEY_FN_ESC =
}},
>  =20
>   	/* Reported when the user wants to toggle the brightness of the keybo=
ard */
>   	{ KE_KEY,       UNIWILL_OSD_KBDILLUMTOGGLE,             { KEY_KBDILLU=
MTOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL0,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL1,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL2,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL3,              { KEY_KBDILLUM=
TOGGLE }},
> +	{ KE_KEY,       UNIWILL_OSD_KB_LED_LEVEL4,              { KEY_KBDILLUM=
TOGGLE }},
>  =20
>   	/* FIXME: find out the exact meaning of those events */
>   	{ KE_IGNORE,    UNIWILL_OSD_BAT_CHARGE_FULL_24_H,       { KEY_UNKNOWN=
 }},
> @@ -395,6 +405,9 @@ static const struct key_entry uniwill_keymap[] =3D {
>   	/* Reported when the user wants to toggle the benchmark mode status *=
/
>   	{ KE_IGNORE,    UNIWILL_OSD_BENCHMARK_MODE_TOGGLE,      { KEY_UNKNOWN=
 }},
>  =20
> +	/* Reported when the user wants to toggle the webcam */
> +	{ KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN =
}},

Same as above.

> +
>   	{ KE_END }
>   };
>  =20
> @@ -1247,6 +1260,10 @@ static int uniwill_notifier_call(struct notifier_=
block *nb, unsigned long action
>   		}
>   		mutex_unlock(&data->battery_lock);
>  =20
> +		return NOTIFY_OK;
> +	case UNIWILL_OSD_DC_ADAPTER_CHANGED:
> +		// noop for the time being

Wrong comment style, please use /* */.

Thanks,
Armin Wolf

> +
>   		return NOTIFY_OK;
>   	default:
>   		mutex_lock(&data->input_lock);
> diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h b/drivers/platfo=
rm/x86/uniwill/uniwill-wmi.h
> index 2bf69f2d80381..48783b2e9ffb9 100644
> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
> @@ -113,6 +113,8 @@
>  =20
>   #define UNIWILL_OSD_BENCHMARK_MODE_TOGGLE	0xC0
>  =20
> +#define UNIWILL_OSD_WEBCAM_TOGGLE		0xCF
> +
>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED	0xF0
>  =20
>   struct device;
