Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0D44A21;
	Thu, 26 Feb 2026 00:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772067507; cv=none; b=ZESux/vQFr+7r+YSKwHIhAC1ZCKXzjVQMAcQXqh+1J/h0ZjKPLagvgIF2JeuhKXUmxv7Jy5n1QLk/JclQEvsSOTiBhDl5PmXXoi0x/Tar/IfP6g4zxRvz4PnNvfz+STU3Xse/A+WdaTZKiuwNwfWUGHJHIIzTiA167sK7F08788=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772067507; c=relaxed/simple;
	bh=1PYdRuiph+I3TNZkJQs8u9GjYt7EWjakH/Te9PaygAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qo2uRVBpbtGg7abJkkUXVQ12MSDdM7u4XHHAjtcHu5jN3pQn+j+PRpHGfVo1eLa7DkixT+PeKROD1XoMrim5ZTb3rb+Ua/DPrrjS6tGIMorqUZIw4DH/N8sZ7+9ymQsbE/qtqBR2p4Kv00Y/5xNoO5ooBCZQh0RcheGo/KAtdYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CABx4Fqm; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CABx4Fqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772067500; x=1772672300; i=w_armin@gmx.de;
	bh=yIdivZqdMr6FSC3c6bg93XIN8P1Q/xtzfuoI/ZGWw1M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CABx4FqmaIjjKsxjjmonOty2FriQsIpVeP9IE9VUUdg2c3DDRRO900PMeDFdEo6C
	 L2k9copimnKYdCqdJOtIwF85UYdhPo/6j3M6Uf7MrD+9iZxf3clx6/OousKKwHxTF
	 HkFA+F0N2TjjWm7GgoW4CE1pVzUlNLqBwl2tZWGmbD0ZfTKzNRmZ3a0+YxPE2LxjG
	 QM0EDIdrcD204BLUPtKjAcovPjCErx7hU3n+sbPVIZaCgxWfTNTPZSqdACogOSyjl
	 F8940c89PilDVpWZp40mtYZ7U9SfxWBYRDOwkB2YU+8Zbd/TwrbHTY5/k+nKRQnqs
	 ufgj2Im2hXmEfufOyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MybGh-1vVkcI3jPp-0154nn; Thu, 26
 Feb 2026 01:58:20 +0100
Message-ID: <18069b04-d68f-419c-9704-5b017cb3e72d@gmx.de>
Date: Thu, 26 Feb 2026 01:58:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86/uniwill: uniwill-laptop: Rework hwmon
 feature defines
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226003408.1623547-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:72MvATgRfL9Nl3Z7lOtiS4vafEXUHMSSbjclgcDZEiYyyR7zRHt
 o+21vgcLNTZXDoFjcBOfQYAfnGVTlIFdOHg0VyQbi6mm5CuFgm8fo7Zzn0HUjoeMw7+rTZt
 gDSDotVfqZAtlAtti/5pPaaR55YgTqLqmkUugCGAuQH1T9h5Ikt1OEwSx1Yk9WDvlXLfTRw
 mF13iHhJDXm8SKTZ4qRZQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OdFGj+0/mLM=;hYuq0zS0sQNIlNiBVdR0m1nx2pG
 pEWt0R4WqOBUUtL8uoKFRxoy6Ywe33sFVFVsfWxTDOvT3z2qWFtJHXLLTufxMwEBy0aevYnZD
 K3TyHeg/D5pdnNHRD3tEbY8rm/RwyWchqRGU/7b1ZbsstDVaBcovqjcRYyNhKIqH3MyMybm1K
 JlI9hzYvEEWQPo6r47WmVC8IMp8xay/h2Lg9CvUJCME4ikF1H3ecK88g5GWHBxCuOp1XTGBgY
 BqBM1giVqbJaf6+s9oJ0Ozmn7QOd8JKvlv53oEc6jgrB0fOf44tT16W9F57S8ykv8yT1szWDU
 AMXLqQbeaZ4q8ohLt09j40RqzEHozubcrvYhMtb1z7YEDGfxc2lP4W62SD/qHDa46HqvvPZXo
 EG837ag3ZTsz7RofmPAaz0AnmXhp6OdJcT3upBf5U9aafgm4Xj7nHgTOtuv2JhlNKm8pBaWPt
 UBmTzsDBgqr0t0c34gqgNgtBl1Ct2Ta/0ZqIzPbKVKt+HOruw7Yv0RcElPrqgcDfyRcMpoGQA
 9Q6WKdDi4QzyP156DEj6xB64IWR1z7PkO1hGqglmMlt0wXaG4ARFIl8up8NJfGk2TMNgNsfR1
 LTC5LDfRlz/N4UuZwtw64FR9u+1NFkjIqNzKr+5yiBxvc1T/Z84I3yL94NCcTxmjmQ288RD9N
 nVAYWRo2DSi6XKLLVccQcy4Do/lq4f8jLqV7RCiy9LPVTUTQvfs3r3gTaYWKZBMViz7z7aL/5
 Gv/ISq68zBLlQwV1JhHUW9RGtdwQXhXW/OojKX7Qbbj0WlQ1ZKCQ8SLBM0OBwfNHZ3VCJj73H
 vnY5PKlrnnljKnHHZoO8VamBZEZfyQITgG4kWDK+nh4ZxFgE/zlz2rQbD4aNtg7dabb6KfSbz
 Fn0jQ0G0L1PkDYF3cqbkIft5NlftuYndLyOB8ovE3SiQiMp+r8bI1fdEbo1ZAKg7zwKdGaGKw
 ofZpftmlQeGxTl1rcui3kN/DzDArMz1r5VxAawVYSiwJbuOQL9xU6cCAtqrCaVuFYbFvo85yG
 0w5Vzj/cE5Lh5Nd2ln/ugNx4dIOq9wYa5m0OLKy8vBruCgSFY1XlSSueBbS+xzhUPAoE2YliU
 Ixh5/OQp4sYfG2TgSjGvLlu+VR0Ex+l7YPXx1x7yLNLDvL0q+VpEcrttlKOvNIPAG3uFfq5sH
 ZBQo8FOIIS1dPtGFZ41tHH+vbiBPs0RqPe+KRlFVFlcpiJozbGObqeRgLySfRg3X7wSIvCvP+
 X3mIUbbVJphKOUgpFWFU2TbqZuyImEbE0xSLBRHGy/BX4cOMajdJRAjUv530Wi/KGsXNCnZx0
 K/wd2+WFfTuUyWMn+KxZdLoBrN4A5cgjZm4G/g5gayx6+Awt0ZJm/iARlHHpygFs4K+Vx/9Zk
 07dlfNSGsKexz5fRQcu+OqWe2hUy9592Kyiu/rDpm+LxDZvHFaK97V0iu1JnIJ6tBFrSIUYBW
 s5I9Lm8YgxbLaukYqhN7SK916D4MErkNuJzt/g9naA797J1T5ZMt5n3JIz8QXWHrDVw/00wuq
 PQmLxggXKGh+40Cqy6j0o7QyqVTtHEXbISiYxe8uhjy5XDb4OdUXr1mApPOr6Nx+gpHy1JovV
 biur445QBYc1RB197xmAVRi2rbqxbkmwrMaVaCMaXFvyMouxyX/OKXUeMzA54RXKTqht6mUxO
 SMc357DgahrYczvU2Mx5lpatC9P8QX67re1kn/TLr3XH+jBoc0pFimseN8aGFGF5Oa4wIaqDi
 cD2ZlDjTeWP0qarCcCkS8lfn8oS4IpHADuPTVRAiSbgZ0OibBh0krWVcRUPXnnbcBhMxJfLmO
 fJJJ0zvD08DdQnKB+o73ROoA6zHIwXGltuXSs0K7IgqL5hJjKEKx2JCEButndBQllW8RXUTbg
 BPLNIOLcgR3ghU24tKm7OHLouUqaaZyaebIFtU+BuWKs0zrvGZrOJ25ymyk6NS78/0dznAHr5
 KItyrGdg7tNtB4tTpIRwGnUPCT8jNIRo6EcRBlJrTcfh4heKQoiEZeo4PPrN+H9n9PKPqDR1m
 WCmWmQQLl0aYbUkEvmblYjDm00EH0a8MneNmlLqlHxb1L41DIdM7+a6JEzAfUDRb83UBGYcSn
 vUymxgYpRMSqrE5iYmFZM2baxMPeS7xaf4drKWIMatFU9VY8noIfXdofXmsnO8JqRa4tuxPba
 +387wlXXJG9hyx3b/JaYztoTDkhJht2ENgvli0xnPwr06FC25CjyFCa6Iq5DBxcA80KyqZsXK
 5B2DsQKJW3EHjpTza/v4vvYYOn4f35LUE96JebbOx1B5CBgAoLNFeIuhH5nztou6cciQQGd12
 11onGbAAI/cPpG1DqHUQc4e9duQsYp9UJNgR8jkx4UzGoFtzYeMdR9UQYwWQ/7LcCOrRSxdu/
 dnwRfJtgK/BKLLEjqV4feYdi0PE1wm3mId+396Z5sslwBmw1PN/D+ut6X1enV4tBRqnW1pZSP
 Y5vbEY3SM5+SfiAzv+tcJdxPK9ByucQS4L92JtTeSrAoKfkZo5V4TX9rdgStwvE8xX2+RbeEb
 22MgKHb4otEbENFVM+0FVhT0B8KoNItF69Wog0mlbtYSYxLO00KnZd6yrfndDAOeXDvoUb3qn
 6E3Ef2oL/XDxVWQ2ON2ivvhwGApzKG5mO6uH+6W/mO+RgiX4k9oI8ubueiX7fu5rBMs42Fj4B
 h+XPHLJxmClewOaGyeD7XYfpjW3LUD0ElJAUqNXFn2mb8rUwk5uu+1Chm1ygSA1c7M93IJNk9
 UaLKDIMxFSAtU9fzrmzYgCGnIG279/EvQmfaxHvBaAmTcglY7STkBh9DhLRi25K1Wh9dSlWHK
 FbgfP32SFb6mOt6Er2bEWOLHIRssBFr9k6DBgQhTxjeDxt/e+6Ew3Z2ifSZfxJpsHYY2raoFS
 jeuEMaB4GqTA54aXz4z7ta86OpxnA4eTj1Dhxl+SMfZjyYdclX21AVOkhiL7b+aywGz708Gj0
 vKTC0oMtPKst2gV+1JO1nDH7RZECLKYI3ud3lZfTFw6j6qjuzwYflX40JuhadDcCy5h05a01m
 q81yZZZK0xidXrFKfnjrUFvZyFpoHlBUVCCRTQYifhiph0WI5PmypnwVIY3p/Mz/yqlxLykWa
 iv0suM5Sk6MWbcDSWQ9Yt1BQwrgDh2sSBg258U7ohXxGlu85arq1Z8DYBoJ6bYXbaI3dSXQVI
 AB46V9S64bL1Gh4gAHgDDG+SKqrboFbcZ+YwixUX4ZcNmLINVM7ei9XWsglhJ/xREJYFft8d7
 fgFr1iuBpL9w3avAvK1m9K+KrlBjh7fVImfE/vny9QzW65AMv+QLPPzEDqiUETxAJbfb8blxI
 ROz2cg242GgoHPwiTvmbzfT4jLudYmF+nMkJHjycy4+q23axLfQmxcBjwF764Ib93w9XU9NAF
 ooTRjjIqiSnpnJ4mfQoyfIv3LOSO87jkCC1U53J/iUO5F/pCVhbUFP9NEm4soMvs4kkJHN9LN
 hOV55FZlu+FupYLeEYXv4W5Yk1tsEGcNCM+rCSxNH5yg+Arv19BovW4hGUz6218lXu3RQ+cNS
 5panhsmQkk899U8UYpOPXbmCLgZP8gJClOZcU/Atn859thn1/+APrg4Az8pQRkvJxvBxtbtXQ
 VakE1dZ9LwSnE95ErDIpc+hsb75Jarog89CJD/zZOIO2uLEyeu7EUxz9DPc+h+7AjvI0JFQuI
 I/VaSuBBG4DK7SETK7+Vtc2PSLgw1dX8wWqw40ggbxAIvfnzusJ8yYBToxKxe4bj3Xv/m8Hhj
 YQTDKebo4MiJSZyclv4kJeSV8byjYwcEadQrSqnHA0VdzGyd0KLFV//8TEMnukcAkOU0NKx5G
 3Lh9JYmp1RAVABHz9/hVQ14P5AyyscAIAwTPDFJeEMLbzlt5G/gnnc8w+r/nMnEFgrZhfxdSn
 f+NxDQeO0M0dkTOe1vcyNgRAQmqzOhveR+bcUSwawEWYKWRV0sZ132cqW5X+RJOVPyPck6k+8
 aTij8jbb7Gr1rQ9AMAMBGQqWzSwrLCjPh/kuvkL79/JPa3Pet62vLJXFpv1IE2XtsIs/J40kp
 wwRenDTR9l8+9hBo4swmoirHB5cGShr3Woas5klrlBBLtvB9sx1P8QNMQBaZXSVH3EuQYKCtU
 kPRmZV++T8huvmK5kOO/EhDfHtumQEnJGM0siCxlqBhhiCLVhR0vZgDL1euoMeV8fXfZM4eih
 FUNrjv0Ib1BHpO9q4ksoE/+pIfXyFkjl5tePaia9sFXbm7C3VtmsHb4Ok3F7ENX5HcHmJgEdf
 9C3ZJ704FnGHf3+cx3I9ZRrAK/NG543DRJ8EgdztvsL/BAacuerdKMvKHFPCKAfLiS/nrhaUz
 V1AQ8EVs3bDzCQXMq3CyFkac6UJ5aJzfMXnvhhRyjvSrRU/5IYuQE7TYxYoxqE3YflS3B/RvP
 2vplbLaf9KUaatfNSPbw6rBP5Buza7TTSlQTCyT663vvKi1iZX2HlB231B0JrfSc6XefsFmwS
 hZEZVx512lstpuoU8pNvNZJGVhPOJYSxB6fIWaNKTS9raV/SzzzIT5G7Ucqze1MeIZepDUI6I
 rTgXGdaSKsrxJ74v8oEi4y8Ji0c0r+48Mjl9wbPDXndkmyua6sGXJ2JyQqmqBey81JF7zbtXN
 9aFPjuxgVquFV+Vaesc1urkZl6ufUJGi8uG6CHlj86xXzTWGSuZ/tXtEjBKN0BFxnt3pACMfg
 HkvFbuJ4blYZMxlIrX7kyFHDfsYyaLoYUyDhzhEefAx4bSwgA4VvRS5q8sqSOqYY5LX1PHhjd
 aCgLveUxgAhdM0r43zGjy/KKCAJQ8fq671dWw1IMkTdFKnv5o1cGKavI+7x6XA1fdjyZsVkLd
 qvnRUVTvApwEbudEaI3PzOGrJ3SI/MujZhnO3NOXuf0ynvSCmaM8T6OJbbHekYFXQ+GX9FwhX
 KktvxDXmVfy5XodXCStjyorKbzmoZzBc5GYS9k2lx/07RUkDNLRlO9/KTQE5aEsB4/E86EgQ8
 E7Ne5x5W1nW3qh+7Tu+/93MqzoV2b38h5g6HA3Zz1SRZNsNCHDrwMHFkKyMd57lx33CcO58zA
 lQvsrlDeTsmFSCQjYNwsO3kcycaGwJ4hFPwjpfxOtMpVW0DTSxCZO3VhG/05+hVRLB5QBe1g+
 DMMA8e4jNeUclK1VnwHL/tz8ngNB+OUSeSThEuUci7Qb0SyeDR7+1GfmFpmXQn8JupI3UszIe
 an+bxLSAzqzAY9KSv6dM0YgrFLgJLx/CKoTOcll8ETJIX4i8ajw==

Am 26.02.26 um 01:31 schrieb Werner Sembach:

> From: Armin Wolf <W_Armin@gmx.de>
>
> Split hwmon feature define in smaller parts to accommodate for diverse
> hardware. You can now specify the presence of a cpu and/or a gpu temp
> sensor separately and if one or 2 fans exists.

Hi,

it would be nice if you could tell people that this series currently only =
applies
onto review-ilpo-fixes.

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

I just noticed that i made a mistake here, 0444 should be the correct perm=
ission setting.

Otherwise, the patch looks good to me.

Thanks,
Armin Wolf

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
