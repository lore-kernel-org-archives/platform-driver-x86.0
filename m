Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793554886;
	b=tKMpjPnp2WO6v9NrPCNODfTcQ6hAsN87YWLSjEupWuMswuBVEIllbldKn0+v6Fdo8Lpl
	 ynTQkL1G2+WEvhgOMFmnaYZE0364t/rkfMsEkyyBEbSqnRBi7mC0EFKCKLb6QAOYJ22uC
	 R39y/qwtxcj0QsXybnA0wO6C4mdDWzIhbzYjqu9ltyZ3MNyHAzAtFSk0BmrZa1bHORj4+
	 p7sA1Lno741fPaVqWWCcyoWtkI60BJhzxhhwsiCqjx6M7CaB4FYuBHQ1IL53T2IgOKPdz
	 x+Mgl1YiWlPuVq+pfk6Qmm5gaqsZp095cdK4I37ChYqTvQ3qoILhWI+Z/KHNxfLMrsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793554886;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=X+eJRDW3Qb7D56IDR0CnmuDadnen3eGBdoaVut7GKeE=;
	b=D6N6grHDUPFv+9hmHrtz9JyB20o2dYb8bXvQrYREaIXAOUMMCGhNWETEBAKCc6po86Z/
	 c7S55r7fkIWDNw6PiYd+yywgYIKGw98NSPbO5qV4sJbBI/laNF/979X5i9jeFm1BVqg76
	 YasWTgEgGbcUD0xBk8s5w9406y7PE4O1I2jh5mMshSuTU9G8aLHuUQhCMWYh7oV5qsujC
	 bhAZWEuTIYaUUiMxeTi4EICgWtO9DwgQuD/d04FV3wiTvE6ocAtQZFnWm5RShFm0mGmQs
	 feZpccrMMkbzJQdIYFclQ1cuiANMh1cxanDQhCA+ae8R9plIujr8CgeeCSPh9UpC3KA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Lf6wgJ9N;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F941606A324;
	Sun,  1 Nov 2026 17:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F941606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=Lf6wgJ9N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1793554870; x=1794159670; i=w_armin@gmx.de;
	bh=X+eJRDW3Qb7D56IDR0CnmuDadnen3eGBdoaVut7GKeE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Lf6wgJ9NjbRvnuufzGIk3JsGvtpU6BwwgDK04I4EJGN0Yt8RuT3Hy3SWRf6lKDow
	 ZhLX4mZBLdmGQyD4FIfm2eXQBUJ2hqjr0+tt5XdnD8fZK+9j6itznFf6nF7pBqZgD
	 nejSwnrkdk2t5WK6qyjRjwks0i9xgytPr5xWPSRZ8wF4AgU+I69+GEMvuH2b29KFx
	 hmvN41itGu1R2C/qOiW2iNTc/YCApfW69AaXZOMVwgU+gbe83nA6XLHjPEcKXFPMe
	 pPObu5+ahh60vs8fWKeQdXvjyBftEjC+aHnC2Yuv3MKayUihauS/5AipYsfaRN596
	 QMbLBx8jtB5FEBHlCQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3HU-1xLJQE23Y0-004SMX; Sun, 01
 Nov 2026 18:41:10 +0100
Message-ID: <c8cb27ab-e5de-4a86-ad09-6610905e74b8@gmx.de>
Date: Sun, 1 Nov 2026 18:41:09 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
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
X-Provags-ID: V03:K1:uWN2OeWzhQbDJEbRZnhr0e3BJGxdZx3kFcRCimAz1VD4I7u+Wdc
 gP9c/qnvhuv2wqU2MB0of84jsMNzEexvRDnGoe24hcZUzt4UQDb7ftosIaS+CtI9fwwQnn1
 mBghm6Z7LbJ6/ytDUKqRnYMzauQZzlRi83txf2Y14kPyitgkZrF/PxUsJKJjCIhra1xgsha
 +jsYJ4fdO6qjcwH5Xnw3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YKKlJWleIjg=;YpdercKqX0QVv57mPF31s8nwArj
 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
 VdmQX

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

Hi, sorry for taking so long to respond.

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

Does the OEM control center for Windows support battery charging modes? If=
 yes
then you should also select UNIWILL_FEATURE_BATTERY_CHARGE_MODES.

Other than that the patch looks fine to me, but i would be very happy if y=
ou
could rebase it on the current for-next branch.

Thanks,
Armin Wolf

> +	.kbd_led_single_color =3D false,
> +	.kbd_led_max_brightness =3D 4,
> +};
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
