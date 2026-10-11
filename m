Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A406A314D13;
	Sun, 11 Oct 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760222; cv=none; b=ui/2PUFQB3riyTH9gpUZm/DLfanVjeOy+HFf0UQEKypJoExD39x28cnZqxg5DB9sUhkqqNkwaVXAiV0qUkR3s9OEmkc8+qCz4CfFi5bD0qQKCY43jn5HVfmk3suRKZux19JuBE2+LhVRybjGGhtTy5nVlO8dSGCnQkuSaZTSS2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760222; c=relaxed/simple;
	bh=T2P7fZ0/IVgev33Fqco6Co/XwDgnZELtqZ8Q9ID5Hs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnKXuNPm14XJ3+HVENUN8pIQ0As7IA7/HVQrg9UWEeWJbX6UeVx413govNW/KuO4/kWjBqirbcvxvUBbWCY4hAek+z9Sb4hWBL9iGiNMP/xeHRonbQLyyV6jxAo7QP+TqPUJWe+gUMlPBv0oybQORgLSH8lzAvTcVYz9JeoquuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=hQxsJLM4; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="hQxsJLM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1791760201; x=1792365001; i=w_armin@gmx.de;
	bh=O2LvzTBSkK7Nk6ROGid/HFN39u2q0Cesb9UIqEAUUqo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hQxsJLM43R5EP76oeDgDeMWOD8GNibYJMamudRgoz/4wT6dNau2fOBLPCt9JIkPr
	 mYVfwqkiA+auBFHSkvSts7jcyrPJy2oOLfksMRrOQLrfZ8H45nMjWVOyomrQPtbo8
	 WHeHOalGIDn9yA662s17/uHm0WGX4R1nv+rH/rSfHzyTP39tPGHj6XUv7skUPjxJl
	 BLRyssIPvDrRylRW0zRJrpRjALkxkQFYhdBVLWqIm186leHtZkvuEtxN6EkYmeUS3
	 Iascfrd6RygaYpCz8tfrogkoMkrhr9H+CDACqPnI9LyOy0sqiyXw29ul4FXN1OnFg
	 H0MQhvqsHw09ylUqbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mf078-1wjinj1ueI-00efAC; Mon, 12
 Oct 2026 01:10:01 +0200
Message-ID: <8f67b6b6-ce55-46cc-a0ac-e54f4bdafb3e@gmx.de>
Date: Mon, 12 Oct 2026 01:10:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] uniwill: Add support for MECHREVO WUJIE Series 15 X
 Pro
To: Donjuanplatinum <donplat@barrensea.org>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261011081421.38128-1-donplat@barrensea.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261011081421.38128-1-donplat@barrensea.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cTYpB35wDnThGUfuHfnh8R6xBuy1puZlL+mTFcHysEjhiNsmiRe
 2QI4Vjj6AGiNwGjLjSn0JjCFS2Zn4E+ySV6bACWJFzoaPOgp8eJuUYs6OD2L2VPN6R3SEhu
 6PxDdkVxGPdTrNl6UuZwQLKIjE6KvLzJDgmGseL1Dgz7kImuYXdapBhXyX+Zb4u+PHIg/Nn
 6NL+/PpMExZgautgPzcVA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F0W8R9V1UaM=;CNIsrHfgb+0YiHVpCuCAmePqMTu
 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
 ZIUdqKaw==

Am 11.10.26 um 10:14 schrieb Donjuanplatinum:

> Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
> Series-X5SP4NAG).
>
> I have tested the Uniwill features on my laptop: the RGB keyboard
> backlight works correctly and supports a maximum brightness level of 4.
> The secondary fan only starts when the system load and performance
> level increase. AC auto boot and USB powershare also work correctly.
> The Super key and CPU temperature reporting work correctly, with
> temperatures reported in millidegrees Celsius.
>
> This machine does not have an NVIDIA GPU; it uses an AMD GPU.
>
> * drivers/platform/x86/uniwill/uniwill-acpi.c: Add
> series_x5sp4nag_descriptor and DMI matching.

Hi,

please remove this pointless block of text.

>
> Signed-off-by: Yifei Yao <donplat@barrensea.org>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 7a2eeaec4c96..d0fde42c46d7 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2712,6 +2712,19 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>   	.lightbar_max_brightness =3D 200,
>   };
>  =20
> +static struct uniwill_device_descriptor series_x5sp4nag_descriptor __in=
itdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
> +		    UNIWILL_FEATURE_AC_AUTO_BOOT |
> +		    UNIWILL_FEATURE_USB_POWERSHARE,
> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};

Can you check if UNIWILL_FEATURE_BATTERY_CHARGE_MODES also works on your d=
evice?
Please note that the embedded controller will still report to charge the b=
attery
to 100%, so this is not a reliable indicator. Do you know if the Windows O=
EM app
provides such a setting on this device?

Thanks,
Armin Wolf

> +
>   /*
>    * The featuresets below reflect somewhat chronological changes:
>    * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firm=
ware.
> @@ -2996,6 +3009,14 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   		},
>   		.driver_data =3D &tux_featureset_4_descriptor,
>   	},
> +	{
> +		.ident =3D "MECHREVO WUJIE Series 15 X Pro",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
> +		},
> +		.driver_data =3D &series_x5sp4nag_descriptor,
> +	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
>   		.matches =3D {
