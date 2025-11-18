Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1574E30F93D;
	Tue, 18 Nov 2025 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763463803; cv=none; b=EaK+uqCPPeDEkq4bizmD3QnWfxdGf0H1YLJKh/BCov10nRmhxMS3g0Ahhg4JnbcL32FVNd0rTZngtiYSbe+vt2bfl9QtTwKgFOMKvrs/di2lizTAP70J0FPyt6RF6ZGFLEZoY1N1O4CTsUSgCK6k2UughNIuH1KNPyHNuYokzRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763463803; c=relaxed/simple;
	bh=RUAy7MI1fFps+nEbncqYhrplExeHw/QcfU0C/kJ9x90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3tnNag/uw7Pu/85MfsswJOex3Ai6n3hVnwthr1BsOu4sn2ltx2DVktpV46uv2FQIh3itv9sqiaZEmDuX7vRqLp+iiARk7k1qHOZ+Xql6jLh/EVyjr5BkMSjnIPha0M8+fVvO8gQrFokqBuDpfkWgNv99lEB3f2JASLw26I/Zts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ibKD3BaZ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ibKD3BaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763463797; x=1764068597; i=w_armin@gmx.de;
	bh=FsXdmoN1znYusKZyzJX9JMyuiVdZrWVRYl3rZyChOfE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ibKD3BaZbkQs8/bWTjSSUxuRb9bjsNRXoyP9ZbCki9fHjADlZZbFqevVf4hRGbXc
	 RIJBVCTEdZNK5Aqzi6MxxJLEqqG2kU8NsIqSUF8FYX4mFiYznku6hu26sjr7+1+x4
	 xH8zna28W2RmjjZDdYzSedoeCGOk+IYFW9Gc/3e9WMJ6c9UhtUmDVrKJybp+w4lI2
	 MAedlw0tjabFMKH9BPx0kgH3THZGQ6EqRIqvTUPuO+PW7aYFhbnHuyqQeLLlXghY2
	 6iLt/XW06FsKvC/GSXxWDPzJUGQWP1gk+KqbIbHimZRxDUgr9jaIG+7QD0++7qUMH
	 RuMRhLL0HVbIvuxwBA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1vFWrW2cZP-003UX4; Tue, 18
 Nov 2025 12:03:17 +0100
Message-ID: <7f0e3a37-48bf-473e-86d9-c88620206a04@gmx.de>
Date: Tue, 18 Nov 2025 12:03:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] platform/x86/uniwill: Add TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251117132530.32460-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GsySNC0mt94nyJJSPRHbDUAhyObVtjZJ9ENIj0clmYtfCVMDAV1
 QxdCUDSUJBsp1UnBg+6PZuMjv8PJ3OWuu4h51q4I7yeRd91ByyL7Y2gHqsRw6LEypFYv4gV
 pPyxTXBOdNPIdyGiDYsqjQi6bI70MUDJrYncbOph4w9JnONNOWevqnQdDEYQdUltYghnqfR
 72jn9R1jl7y0E6rPPrdKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sH00bNOcTdQ=;h1jEQHB0oOJI8mnprvJgMuiG4RV
 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

Am 17.11.25 um 14:23 schrieb Werner Sembach:

> Add all TUXEDO devices that can make use of this driver.

I think it would make sense to place this patch behind the patch for the a=
dditional
WMI events. Other than that:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 308 ++++++++++++++++++++
>   1 file changed, 308 insertions(+)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 014960d16211b..29bb3709bfcc8 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -1478,6 +1478,20 @@ static struct platform_driver uniwill_driver =3D =
{
>   };
>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
> +	{
> +		.ident =3D "XMG FUSION 15",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
> +		},
> +	},
> +	{
> +		.ident =3D "XMG FUSION 15",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
> +		},
> +	},
>   	{
>   		.ident =3D "Intel NUC x15",
>   		.matches =3D {
> @@ -1503,6 +1517,300 @@ static const struct dmi_system_id uniwill_dmi_ta=
ble[] __initconst =3D {
>   					UNIWILL_FEATURE_BATTERY |
>   					UNIWILL_FEATURE_HWMON),
>   	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Boo=
k Pro Gen 7",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia-=
Book Pro Gen 8",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Boo=
k Pro Gen 8",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-=
Book 15 Gen9",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim =
15 Gen6",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
> +		},
> +	},
> +	{
> +		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
> +		},
> +	},
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
