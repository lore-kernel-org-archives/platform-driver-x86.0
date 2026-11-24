Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795534796;
	b=eFQ20WvNzVcAX6tcYWXIUBrCfW3BAy2FPbxrjlLWPT6fOYIjBdrmNaod24A1zGYC4SId
	 7hYU8KFT3xTTCJeVBbycMCidb8W+xRCF2Bi/2K/BuDFoD0AscP+s7J91rDCL7PGs9OKFB
	 mZJQLfU2Z1c2ebCCSZYFK5M8Up5QJLr/66jhAhQ+I8v0BXwBLCPg1V/GI5Fdeb/IYuj+G
	 ZRaz0881Kx3tBcZZHs2cjHg/aZnEMAvz6dqF9+8cdDV9h7GO6ERaTw9r84+AvLcGzzJiR
	 kV0qliNR1AfODHTFSgziFv+1BAPViaYVf8TLVm6KzNfxH/efkUpWtEXg2smSZQgZwDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795534796;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=OYPrV8hXvhuntKwG5p3Iglqruciu9KECE577Pogmpjw=;
	b=3KCCRmnmFjwkzn/ftRs78uYMs0+m8VnhAFgPEuWXRrCtJKwM32MX1u62iOy/U0wmisGK
	 wsTKvEWiiy4mcchoRVId0JUbUxwAz20lZpB4UWnQnWmZ6cKsxHJrrslu5Ptj96iGjfj8P
	 N6Zkkt5v6cdZLZHzn/BSGCxsWUpnj1dMK6dF75LHQS+GRSrmB7KmS8MwtY3v6YM3ZIxjf
	 bm9PTXDQRimS/MABG6J1zTuVc2t17TsvsfVuZdwPYC/1OCtmeyMcTbHVzPJlbD8ANHcSN
	 qSoUMghFxl1vA8PAl0L1Omb5kfJA9wsoxOcQ3cdtAqlWN4rstA009pUXdt7bUft8dQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=qwUWnu27;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C578F606A32A
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 15:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C578F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=qwUWnu27
DKIM2-Signature:  i=1; m=1; t=1795534793;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:FmdkRsd86M+oNzFBhj/G79nQmSLa
   Df8QmId4KAa0oCxREaHr+HfUXlUaJ/cBkreR3IardSElPr8lvrbMPLygPYovP7sbMxEBhjyw5tC
   vBBZQialXydHmrAqTj3uzyOFlGLxFo3Tp7Cz14gpXXb2D1GVvB1b7PAoJSe+LNUWN1pxWr+cM2e
   NOq3GPouGevms4sYfIVkz5wIethqpoIQqOUTJdqQkC/MdTJ/SHIAN8PUk1dLtC9FTi5rRYw/OC3
   y0Hc36H7PRUgQFC/TmzxjSDhNreTEMTRRgvBc7/5kIKIr0q5/0M+lFi3hAq2xNFF6FI1n9H3UUe
   tqomXUz9Nf68cA==;
Message-Instance:  m=1;
 h=sha256:
   opIVfuWk7g1nE20RL3SLI6Ou7EpAB8cisuCS9VJtp1s=:
   I9UMvducYLxBtNrj1aGKbrYb+CdCSFxiliU+iHDodRk=,
  sha512:
   XDaDo5RZNHTZDtikXqKSdoaC/BAVXUerzBLkzmO26kihk1RYOZZtw4eB+24MyGrpplBYxHX+N5mUzSnH+2f9wA==:
   RU1YafkXsQgFSogDOuIZ5xIt/y+zfQ71XvlFNedHgR/lEv1lBHIHpLOnju7yFdnjNrYTy5pVC44l/WtK50boZA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795534779; x=1796139579; i=w_armin@gmx.de;
	bh=OYPrV8hXvhuntKwG5p3Iglqruciu9KECE577Pogmpjw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qwUWnu27UcjojpjunWbUyOeHg055gbx4Huh0GuD6AOJ52Pq2CMrWCO2t6azYLmn+
	 o1ntf2uN29FRV4PKqX1ZIcmqL+0J6ng5/MTRstW5ysjNMLm0akeKzDp2ao3eu4SCY
	 G1FFvkLrdObGN0jsoBjWd3q7Dtlfdu9bQkGEC7G5Qiec53f5wgS3Y9mdE9JfZkBEN
	 Gnlrs2joqYesshBpv45JKhpfiSJphdpmki9m9Ft7Zzga/wYs8Kz0LYb1rQ2pd+7NQ
	 FAX+BsiqajzQ4hZfkpiWIrdOs4oamUbfJszNu+HKNvhlSBvs0Q6K091XsPhPMXvcw
	 AKuJ1cXQs5sBPyC3mw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MowKc-1yJkwu3rKg-00pSfZ; Tue, 24
 Nov 2026 16:39:39 +0100
Message-ID: <90a3cf06-ab77-4995-ab27-8e10eb9d8e87@gmx.de>
Date: Tue, 24 Nov 2026 16:39:37 +0100
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
Subject: Re: [PATCH v2] platform/x86: uniwill-laptop: Remove cTGP control from
 unsupported devices
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261124151303.435534-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261124151303.435534-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iZsdawWUuuO4kHfV8D4uwy+kIF/99JzU7/wLGKW5vA9P59CfwHP
 6DzX2KwUD5fH7iWxTKqpZb5eXJWXxqZ2NhGm3uD5rsBbic5MJAHaWtXI5rRaxzMSQvsIKgA
 F8Z4CJ1az7iILawKw4OhGv5jBeowwk7nwjFMsn4lo637yLEWTtUyZQaPYKk6IMVPWe4yd1u
 V+qdkn4bEecCFufTjknEg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PAgnk6pX+y0=;VcMUsh5DnhNtsTqn/lmNhHzGjmo
 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

Am 24.11.26 um 16:11 schrieb Werner Sembach:
> Some devices like the InfinityBook Pro series have Dynamic Boost support=
,
> but the cTGP setting is actually ignored.
>=20
> This commit adds the ability to still initialize DB, but hide the noop c=
TGP
> sysfs attribute and applies this to the respective devices.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
> V2: Fix "force" mode not respecting mutual exclusivity of new feature bi=
t.
>=20
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 30 ++++++++++++++-------
>   1 file changed, 20 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index e2a6a704e942e..bef072f9f1b55 100644
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

Hi,

i think it would be better to instead split=20
UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL into=20
UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL and UNIWILL_FEATURE_NVIDIA_DB_CONTROL.

Devices that currently support cTGP control just need to also set=20
UNIWILL_FEATURE_NVIDIA_DB_CONTROL, and devices that only support dynamic=
=20
boost only need to set UNIWILL_FEATURE_NVIDIA_DB_CONTROL.

This way we can avoid having another set of mutally exclusive feature flag=
s.

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

Should we still set CTGP_DB_CTGP_ENABLE if cTGP control is not=20
supported? Also i think we should not touch EC_ADDR_CTGP_DB_CTGP_OFFSET=20
if cTGP support is not present, the same goes for dynamic boost.

Thanks,
Armin Wolf

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
> @@ -3711,7 +3719,9 @@ static int __init uniwill_init(void)
>  =20
>   	if (force) {
>   		/* Assume that the device supports all features except the charge li=
mit */
> -		device_descriptor.features =3D UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CH=
ARGE_LIMIT;
> +		device_descriptor.features =3D UINT_MAX &
> +			~(UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
> +			UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY);
>   		/* Some models only have a (white) single color keyboard backlight *=
/
>   		device_descriptor.kbd_led_single_color =3D false;
>   		/* Some models only support 3 brightness levels */

