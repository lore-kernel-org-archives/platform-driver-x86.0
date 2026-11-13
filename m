Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602592;
	b=aIVXGwrYg3uH3Ag86WFeFM5qlMjMTOVePiMNcKQmPvdp7LSd7aKUUwwD+8YHpGCwSXE8
	 jrJn45s2VnRn2qmwLTkMc5gEzp45QKYn2rvnesGOLquLU4kP2bPxsH5fhvrlS9Jva5wIe
	 6zTxwqIrZJa+d9ZHX5t8v1kmeFzd1eOdn6gnPua8G+EqVzK/2HKmFpJlWNICEGSBjTSMw
	 4MuTB6xudLI9ck7J5oDPgyCPjFmnSXCkB8v/aAkdjcYPMvvCun38MKFtjQWKKwceNBQHG
	 3rUXD8kjxYUMituL99uVSzT/peFFq96+z0NW93bxjJTtRyUBmVD94C0jWK4sq+P7GMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602592;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=TanOtqqbIG2hjOzbHVB+6cLC1rC3H/7pAKOSHH915KE=;
	b=aVP+Bwjb0JlM0dOq0wXiOPZPS9CPpfMHpLdEVlDO9PLtuxAYPJJF4JhfT8zuVEy6nc8J
	 7bI8oOin9PDjrk0EEYCOxieJh4haz1S55Za0DxLF7HLqIuY+LcrZnACMVebEmYcQY/NfK
	 YqO9qC135jJEF80qVKPUzcYYGo8wWHChdWDLwMl8bm9upngvXlXNK1NsAUbMDJdS3T/dZ
	 d8suyOCINVmZgpPx7JbOpxHgPvtq0e8bVLK9s/7lvyutbdHraAgoLgIfNt+o0wP4Mn6l+
	 SOKkvfGNlRNaGVINnLD0u3Q24raDPkKsi3YcOveYfdf/oRa5cHlC8JEd8fhqapmhchg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q52O5wSQ;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115AF606A336
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 20:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 115AF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=q52O5wSQ
DKIM2-Signature:  i=1; m=1; t=1794602589;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:Ny24/GPklIf5egrwHFpn1sXa4lUB
   mHui5cNG1DYrI0GF/9o5nTeKaPcMiWJFcBPY3yJLiZqSP8vR+zxfeRAdEK+FHkHhlXfQmx+u5JQ
   n0EjpHVKecq/Iiz6AyPnRXthLP8m+T1nSI0FdurSsYO5QZ+d27oyMAPeu8YIK1YzJD6SXDeW8r5
   m+UCnIOXQ2VVWPCBueaa9pJMLLBs7zQTvqHdDQK75OhpTrTGPFSg/6Z+Va3faFpqGg5+aGuRAF4
   YaG20Jqgg0JkqxQCV0ZOrbj1iDOs6P+W68gddhsHnFVcGJQmc0DLf1Vgkmgqvt+DQkXBkx4aoYB
   DwDHIPZwFpsgUg==;
Message-Instance:  m=1;
 h=sha256:
   2qj2+eiig9lLp4oPODpaOQXt4W4iX5l17j43gLf6uNM=:
   IyNqo5CBPARaIWaOvWFREKYBNUrrioCd76U/ouJL2OQ=,
  sha512:
   SAm4/Hdt6A+Og7y5BNsqywpsmVITVqiHZK0zuqGd2eNNKSS3wvbRvqkJ6/PwrFyNxZm+pD7AOZN52zBzTNHcdw==:
   I7E4VePICpu2i2CzuFmQiNDCUnx/J4cWSP+xrjybOAglj/r/7xWSW9g7mkshwJHh8JXnevRHdR65lrO2Oltpmw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794602577; x=1795207377; i=w_armin@gmx.de;
	bh=TanOtqqbIG2hjOzbHVB+6cLC1rC3H/7pAKOSHH915KE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=q52O5wSQlx0sWnlJjILwRVD2ES5m2TVRBheIj8HIvadPo8QeDmqHHEyDgP8roUHv
	 XTdTvAPdBYrMsMOreiYp6ALzQSp6oFg6GLypr4n1QTK2E68XZx8lzFUXzugUHJIp7
	 xjyYxPm3qj3pECB3w5h36xCZ8SjQzA9g3V+NpCIXwge1QNXruqw8aqQWyISGebNLL
	 22+tsfw3r1xaCqfNE/KF0t8HU7ZrkyYhPcFgOTIdZPLrXaUSRtbaozzS+Qi8AP4sI
	 CDJw/MyRU2Kmjo+Zha93GxCv39DWYt+qd6Nm/kRwdOhox1pHyxGhiM2kwEd9HpyUJ
	 NoqU2HypI3S8CoEBpA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSKu0-1x3fwH36Yi-00NQFa; Fri, 13
 Nov 2026 21:42:57 +0100
Message-ID: <6ac5ca43-25db-4843-8317-dee4cd55c627@gmx.de>
Date: Fri, 13 Nov 2026 21:42:56 +0100
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
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261113144749.59958-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261113144749.59958-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vjgrq9umqFD7C37f6B0afrCRtEJW16YW32Yum8qNVTHEjMzD4BI
 B6NlD2F5gSTNK0o8TwWXcTgxOuBfjsXbXklbMFjLee6xo49qnfmItV/xj9M0dPn2QiVcYRv
 t4rbCNr0ssIQARi3BS6mVAXtLyekTaVgTI1b3WNRjRN3Aaa1dA2/6IMp4j8ULK6C/JonjyA
 SAGZdqwKXYLH1lv9/5ItA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:IOleVDsH7VE=;h60pbShfBk3fys+U54lJZqXLUYt
 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

Am 13.11.26 um 15:47 schrieb Werner Sembach:
> Some devices like the InfinityBook Pro series have Dynamic Boost support=
,
> but the cTGP setting is actually ignored.
>=20
> This commit adds the ability to still initialize DB, but hide the noop c=
TGP
> sysfs attribute and applies this to the respective devices.

IMHO the cTGP setting only works with the official NVidia driver and=20
nvidia-powerd running in the background. Also there currently is a tiny
issue with cTGP support, do you have a acpidump from one of the affected=
=20
machines?

Thanks,
Armin Wolf

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 26 ++++++++++++++-------
>   1 file changed, 17 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index e2a6a704e942e..c0a75bc6e66db 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -366,10 +366,12 @@
>   #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
>   #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
>   #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
> -#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
> -#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
> -#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
> -#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
> +/* Mutually exclusive with the cTGP control feature */
> +#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY	BIT(11)
> +#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(12)
> +#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(13)
> +#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(14)
> +#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(15)
>  =20
>   enum usb_c_power_priority_options {
>   	USB_C_POWER_PRIORITY_CHARGING =3D 0,
> @@ -1004,7 +1006,9 @@ static int uniwill_nvidia_ctgp_init(struct uniwill=
_data *data)
>   {
>   	int ret;
>  =20
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>  =20
>   	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
> @@ -2577,7 +2581,9 @@ static int uniwill_suspend_usb_powershare(struct u=
niwill_data *data)
>  =20
>   static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
>   {
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>  =20
>   	return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> @@ -2686,7 +2692,9 @@ static int uniwill_resume_usb_powershare(struct un=
iwill_data *data)
>  =20
>   static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
>   {
> -	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +	if (!uniwill_device_supports_any(data,
> +					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
>   		return 0;
>  =20
>   	return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> @@ -2910,7 +2918,7 @@ static struct uniwill_device_descriptor phxtqxx_ph=
xagxx_phxaqxx_phxpgxx_descript
>   		    UNIWILL_FEATURE_GPU_TEMP |
>   		    UNIWILL_FEATURE_PRIMARY_FAN |
>   		    UNIWILL_FEATURE_SECONDARY_FAN |
> -		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY |
>   		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
>   		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
>   	.kbd_led_single_color =3D true,
> @@ -3106,7 +3114,7 @@ static int phxarxx_phxaqxx_probe(struct uniwill_da=
ta *data)
>  =20
>   	if (value & HAS_GPU)
>   		data->features |=3D UNIWILL_FEATURE_GPU_TEMP |
> -				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +				  UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY;
>  =20
>   	return 0;
>   };

