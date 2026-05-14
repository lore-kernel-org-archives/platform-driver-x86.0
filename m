Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE73AA1AE
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 May 2026 19:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788180; cv=none; b=uj8xQoX7TvLNc+NoWuStV7kyaRiZskYsA+fK2UHm1TaePe4tg7LejRzPG8aRKxDGv7Lx6lGjr5VeOs4zosNeuqtRhaKxrxfIdzVkufSUKbZoV9xB0LxcQBwA7MiGBIORBDYf4wAxqRICLWF7tJh7b627UpOzy+xPvGSA0KyGXAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788180; c=relaxed/simple;
	bh=9X3o6uZrfECYeJjo6qQbQiW4GWoqY0sfHMS3ph9wAN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=moWluHjVc/w/sHU9hq988jviJbE20K6pT7E6O84S6g4uTfIAOwqo/sUwR4/xQfO5XYmfqFs1B5CBzXiUxIZDGNe2IIoH0Re+Q9dvtKd6rMPBq9UDcFrTS5fQhh+7GlL38kbSdfvg2pcsDVn+qeFNxZ1c4J1qodcYZRHplZeJaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QrMFj/3G; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QrMFj/3G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778788176; x=1779392976; i=w_armin@gmx.de;
	bh=T6WRKDoI2L4pDw+sEnEEKLdd7n4ejYOZ8/610xuMdxI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QrMFj/3GpVx1tbtCQWnhqtTqtoqdEhXfs5bpxxxRGzFKBwM+VODdS64mtBLnd6V3
	 jm4WVkE9wyUakR91/hERpFdn402AD1m9iJOvbQTh/pHzC8v0tZQiTYryKCZ4uE6WB
	 kc1Cz3jFmF8j0AnHwjpBBTdO3bii3rzFUKtzKjCtzC7Rvbnx7ePteux9A9hBswt3x
	 XbmOUHfY6C2lF8WgYxHu1UAGlLc2NKpX8FetpJy5PUTCXca3/iUsx7NCg7jB5KyZZ
	 9G+GRlcK4siP2Ga2kypc54xoCbKxTBtepzqPEL1FpejVlUI85Q8mC/+FIxEmiPUOH
	 Khed7xfGllFUyUb73A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MatRZ-1wysYd3let-00lrVQ; Thu, 14
 May 2026 21:49:36 +0200
Message-ID: <be3254e9-aac7-4134-9a7f-dbe99bebabab@gmx.de>
Date: Thu, 14 May 2026 21:49:35 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: uniwill: Add XMG PRO 16 M25 matches
To: Raymen Scholten <git@raymen.nl>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260510210610.53871-1-git@raymen.nl>
Content-Language: en-US
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260510210610.53871-1-git@raymen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YZIQf/e2TdgRnud8mWUY12BC8GPPNxKZj9dUCQ+RJMxro2z4wDB
 LNG9mQLA6TVz9JNR29ooadT4mKKUfpDG0ENu8SRk14Yw8RXIE/Rpa0lo6+d1VCa7V92+REI
 Tt4UWc/vY1So/lgI3p+rQTX7R7S8AowiREOxMPBmwgw+FDmIun3o2VFYJkc9xNsNB89tMj9
 iRoeBrywF535hChkInzCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+ClxewikCsI=;oUWZ50PY5i0EjMGus+jlvR5TWtu
 YtzbBwoD+u5YG/ePUnjFG6YBaeJchorSnBaoxC/A2vmsdiOrxEdqFvHS7UVnYTdrSyrnnjGhf
 Xg460Ra0UbI7cA+4WPwpAnWGSQ3caJBOfHfITpYokzYseuNupH3AgQkg6kovpBgFC/nng3mzM
 DOdt/UcqaqMbp+woUO/OrsgMyFoTWfgXc9LPitwA0T/OJhl8kaWQEa3wZSgEXsTXxkMZdP5Dh
 2Em4IwxEp1BwcisBkVjycpqXTOahCq5jp0xs/O99aC7JrvNpicHNDuOgtNEdGpagotgf4eduK
 hue7+GA/qP8cJm7VBmP5KXUx7CnfDEONCCNa9Jc/iZTivvqf9OdYRGNPYK+kKo5gezAgYx3HV
 qhvXzxJP062/LE+ZmsedZfXrPrlvn+5YkGglW35O2rrb4GVxR1+iToxs49Ygg7LWzo6G9gr52
 bUYO1eFGi2/rOltUTJKUdOJFsV+OQfD3WQk+Z0TSQudfBvOQ3UfhVcUBl6BNIC/rn/1Oj0eWE
 jtey7IwfjVKnMoiFNYioe650BepTTaK+OTsrl/snxcGEC+FONkgV/PYryrFgbHWDWZl7wnNjf
 SGpDe/GzE544xtjbDBVlrPDkV0+HzE2DLQcyaztwGLsWAFAAul3lkgh3IbKxo9y0YuCcKflhv
 GOwz6Dv0/QBMe9r8t6l/31v6I2RoF+41rpzPEpHekOB7QlUQU0rMvQxASz2VJmESnHKitm+rn
 dx7mqbRz/8uRnJ5ntspIqpm6QbeoFVOwgBwm1dzn6MVPISGLgJXAW0DjERnEz+fWkYmx3eD42
 gg4SmSd+xMwjb+JMKAnlAc3ZJMGh4PR0OxIBWDPd8bq9lvZQ9SZxMfRRYByRPztMZ9nsK9aeA
 A/2c2cfqrYR8R/k0DDqHqYvVIL/RzHvQQrnjA+WnwjccziJs6Fojn6Owm5ohfZCtknwKOIahE
 iBhC3ItjOJvz34zKhRR1p/p7DPpj8AxM5Lmnvul5xVWzJ4ugXP6V/ibbEUmJpNMzo3GoEgXdT
 k24Z9ZeZZmx7sI79mBOfcc7v/ExOwn4fHwNEP2LikFU1Bk6sqss3Lsev9Op4aRpo4AV7mMywq
 UjAeVwADOwp6P3MlrBvoIGJpiEBZOW8OpUcEZ/bAUsA1E8uFzrUnMSdxa+IFCpfP+TFjNgNVI
 pQwPtaGig31GbZeFyqzesrUHbUfcvYj1CE7Frv0NOVfd5fIkwUzRWU2ysRXjj25hqMd8tARkp
 x66Sc9Vsua78oLmO2znRRnWwVslgJ0vdYw6YxiqE3yJZXtVzpeNFva26cq7+is+TaL8PUYjJu
 A2z2lKAncayJM5+kCs6OCfXKZLZHnOKprbNSg/0UKEzIy4nRG6/fI9kTexUtXmJWKpHkGjord
 MDF2AZsJnRYcUZK3XKgVQjhFwuLXY9/3a+bez3Y7spDBTodjzqTTWT+uzOyRXKQWY5dnf3msX
 AYXJB3lHgldZTVRYIPfs8esFNMotvrZj8aqCifdJ7v456LjV2+WN4jDDYfN90gMcJ1s9ApPWr
 U0cWpSaZxbg1brosVbaKObc0xeaPl11FtzWqoruReU6+MsbeG+Nne2BvuSfqKHAGmexTHfaBZ
 8xj/bNrJCMWQRqfUubff68VpY6acxZnNr/M3SYySaa2Bsef3ZoSNLr4N7TUPdxQEmnOFr+yax
 +weWvn5cD3is/6tBxVxpU9txRqsqH5euQZELIw/7Uyqe/YnqXL/JHSr//KTK6di3+oIG65UKE
 JYBUPccOm78Pq4RnX82dfV3PPhqh5n6Xr94Ukk8XhfO1WnOQ8q/ZqETgTTi/oSfI8FEpsN6Uc
 CwhgjWTxIl/S8Tez8jeacApVF6dMU0xL+xlUlZqczftKLEw4HXBgLC7cbdSnVjxFayDwgFJBS
 jQCMabmYqaqL5PB0NYbEuJ1GSkq5M7HiFdDtT+EsZrA44/cWfGDuEnCuBLhvgTdId+srU9gAH
 3F/QOtmnyMJzFxSK+e1Y2ph78U7fOtBbCSF8CvJf5B+ZCevOQ8lT+LcPTwmVIWd775AUBx1ts
 pxfmluFHsTzaGV1Ln/YfEJs6ndk1+f9otMzZmCm4DqfhUgQ+nw1Der6T0mef0B+8kvZeAFXzA
 cYHM1LFTbiiUuBqenBmRoLKRB5jrRr8TDH3tINd9UiqdLloWLnL96CRGKFnpoe3CldqCc6Kap
 UGw8doXvhtU8yAZKkRf8fTNNo5B575lvyZvkZJOeHj0yS9hJwEB7bcz7tiMfdCORCJc6H1X6p
 vVBOoEY+AYAU/jS5l9kvzA+iRJ5Nv6Z5EiHr5uYBtglZz0GyiSQ8QJ/uKK5O4YT2SV64rDE+g
 +lyNX7ycPp5N0SfV0DkWqox9+BT3ezh5GL9Nc77L6DQVotZbc68tKyys5IhzBeerM7jcEVZpi
 lIKviMEDsfbjE6x78nH/4u8e1jJxRnXT9DtqNuZ2cDDbzWMffK+VJAf1TPTCpB+qmGnKE8uJF
 kKmm4G2vyM2H9rrO290cvedJLAFsiHIu+dsK1kSVnD5999P1dE3LS7bcokqBwb1XPpiN5ycJC
 nselevfK1axvgMtoOeEktxBbDnTVwujNuE7SxrmpBYDHR53j/edGJquslY/SvRXqm+3cr8MKT
 HDODMN2xVAPrL9SIwwpdo2azH9bzrb68XPxh6fRQ7zvYOKJwCnmUuuo9nxZ9Qi9CZT8i6WKvH
 jfdK/HLeWCk/rHK9WrSamwNnIUrZeB+AnAkLvJyJlrlrUKEHXaQlbBPajlFsSIK7pQDSk5Q4U
 KhVzxfIVxfsZ4nZ2RvnsZAqtuO07rhCFPpaPoWackUywZCMc2VUtFhhweU77iBqbSbPttrVfA
 8hnsgFOCSs5WNQG/22CDV/W2TfY2PrKtRbng00q3rLLirA1kNwxRuGOd2vnRkKE6XCj4GEBzG
 FfdKdtIPjVJ7AJKfP7LU4TpdOixc8tTCYkaiw333VEXfxZd9r/9WHoawzAuLbmccmBpYwSDrq
 zjdknP9bq4xBehs/VArYs9W2B3P+jg5HyTP7fjycwmVAhCRym6PPQWRIghIguWnKTjNAsO1fl
 OsKf9BSS2Ph4jnLJhfkccQdk9joQQmbNvWmqcgezfGPsey0DWZzfc7JopMzi8GBxutijNFJAI
 aO7Ur2u3u499S7Katwxrh7W/mWwoDtJpH1et9+U2xPCXiCchFjPW9mtX1qfL1qTDmdnIyvSmN
 tJdPoML6SSVjRIzP0eJpS0TDkHYrsr0tZUstSqUGfS/Ritv3JwfGdGVrh/57AFG36w8n+dKy5
 BD8DFuBE0Zd48WjDgBkSz9RKC5I/n2a6BpJiIuFBz5GW9thIEcmnahYiACAtXw7mXHyqVS6LK
 py1MUmyN/PCePCfkniz0CQe9ebVptuUqo1pW+fMGIvcVrWjdkizyTEU8lqrKZXNnukpTqHzGe
 iI7g1iMWqG9awL0yT7xlcb3pGglLjXR33fjDZIY/FMKkMOPqz7b6reo8U0sGhNyHo+KpNTCEP
 ndeq47Tqok4ANPGYWB3JZOTvAprvFGXYQX8SgWhg3agKpU9zHDnLNT1LH4l9knAmk/EGdXvJ0
 Vf7K/z4ChuPOWZLWQfKPtt9Le6FCdO4gN8Va6Tw2RFVIVF4d0vS5G+ppYHVSilB/tyA/OZDRU
 yDynP3E4INvrW2KNJ2bUA+EMB1WtM6Bgss5eOkOJUEY8BmYAiP3QA0tFWMCB73SzsKBPzuEUd
 nnLlXmc5Oq2wvQLj+TdrB3NFNm5gmawC/InNIQ2T0ialYzH+PvVzvgJAz2vMXUptixLDSv262
 D6I86urov1zFf5AvkMU9+OUYOoqm6t7BqZ5SAVqzchhZ6Jnm3RcoE4IQuVLUPfdBTEdeHtXvm
 TIr4XXAgJbCNBxGcc8klwiQUQ5SIygoffdvSM4ktCdUufckJg4be3rMsGtvcBiqiRgmHeRH3c
 SwoYhNg/cgNKEiA6ZXSHgBkrjjmKM0xa//x2R6+iwvv0LqabENRF1FF3TXcWwxkmVw7VZByLs
 pA/EjMuG0pf78F+Qc+URk2ZlmBUGYuCJz/BlIU98s/8FKlZZ6LnqRyJcV+GtQD5qTXzrhg3FM
 2HqqWTTYtkmHXifMhRDhyq6fPKglbIhDrYZ+ilL/nIMMpB7/0PJmcwakIYAZOWkTx8nqxKF24
 ZctVjSKVB2xr8UJvlg0olgkq/1qkNol/KNjtDbY6RN4/HHXtl/8rhvBuap0Sf+z7ESAP0wNpn
 PnWb2sGIc4PDe+LA+offfbvRC81MZc7JnMZzQKeCYw/GFcwaON9BpPe3at4O4qXWVq6ljntjj
 Kz4ZyBrObMgJPpRXrI9M1Saem+uBjybFcWmEvHOTjUSpYwAqYgMuEJL+K3r/Kn120T96sfpZP
 MVGoTBJDaJkS4mH84yjmIqr/xKXVWLbQsp6GBNcRqZyRFnOh9mO60+gB4GD4EOU7fpafUYxDe
 elm1fdw0+yTfXXlrS5yO+ltQZqzpa83Sb4PWh1kxBRothBks527jJUKiuwdj4H2H0Dg7C2ByW
 7kRruq1IW7BXQsA+UYef7hy03gmns3bxWwBLBaPSV35Mlr/a8KyKnLUz0MaOTIQD3uMO/OzZf
 s1JDyyJYMwQhNpweZ0FpjFKkpkBcf4EL3/qdoXQmqi//0KIMttCueOLODiwG2HGDRywgp1zvS
 qrqatYfrMs+n462Fd1aUmisUZRK3U0KZqwSfMSemMZsIgliCSMqTUAu31BpLo+G1v5rLmtuOc
 Cr6/pWAtA99Cc1mx/rAHGlQOSqAWxjXTHGjy5TSVhyIpFTVeLTTrLNYn7rQeFBNxPcagv47hf
 TwWlEADqDff1CG0Bv3x7SBatghC/Vv5Gfwdt9uMdV1UUqD3OQuOSMNXacXRJC17JkCb6TTifk
 27/9muxuxE6v9IwWpJ/GJ8W5yKaTZBXZat0a5im+ShMtHuIjxWKl2mDiK4VnjUyrCt6EnyE6F
 A4IRnqvady3gYfPgOzCS81mm5xYB0EKYk8M8B7j5rzQBERHkBUqVTxAcxCv6XC+EUMWo+CHjC
 eSaybi/q1as8rNx8ZY+D7jWORil/cyI5K3d83wmF9H+wPdzVeoBXavHo36mcSjw2DXCQOoNGI
 3NespFCdRxj8wzsXzphF9B8X4bWoRSqDLz2We227d5jP65zHpdIqwaY172Qt/L+TZhdUH56Rz
 oIA2o+AYLvivNiTIeSM9hZeAoiRr4gBNDjvzzpxmSFOvMY6ql+OtbRBH9vTjYr5lCZ3SYJPDC
 WiuC0gRW5S4mdgPqPU5dblHQcUYJOv7EnVjDGZx3Y2dcVBrsjlz/crhtI2072FlCY0JO3hE5C
 JF39PJmFFve6bwv/+UQd15QOGOhZPdYsLrYlNKtjl2z1qxJdyeIp7kXBS50T+6E7MU4z/08ij
 aV6eUGrRO0dlJy3lnOytxzyUJCFvZQD9QCiFUUUBkmyjXYets4bvWEAFOGQojWvIy5iYStN2l
 ciaJGFy9U3H5CjutrnFGyJ/NcqM9laKDmVH8iGscNS33+eUpR6jZ+fo4V2cqluVRuo

Am 10.05.26 um 23:06 schrieb Raymen Scholten:

> The XMG PRO 16 M25 uses the NB02 Uniwill/Tongfang platform and reports
> the board name X6AR5xxW_mLED.
>
> Testing with uniwill_laptop (force=1) and with this change applied as a
> custom module on this system shows working keyboard lighting and hwmon
> fan readouts, with no regressions observed across load/unload.
>
> The non-miniLED variant (X6AR5xxW) is assumed to be equivalent to the
> miniLED variant, similar to the corresponding TUXEDO Stellaris models,
> and is therefore included as well.

Hi,

please also CC platform-driver-x86@vger.kernel.org so that other people can see
this patch as well.

That being said:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Raymen Scholten <git@raymen.nl>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 945df5092..426616a55 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2041,6 +2041,22 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>   		},
>   		.driver_data = &lapqc71a_lapqc71b_descriptor,
>   	},
> +	{
> +		.ident = "XMG PRO 16 (E25/M25)",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxW_mLED"),
> +		},
> +		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +	},
> +	{
> +		.ident = "XMG PRO 16 (E25/M25)",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxW"),
> +		},
> +		.driver_data = &tux_featureset_3_nvidia_descriptor,
> +	},
>   	{
>   		.ident = "Intel NUC x15",
>   		.matches = {
