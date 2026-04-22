Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5FD17DE36;
	Wed, 22 Apr 2026 11:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776856323; cv=none; b=Loc+iL67kutXF44Rz9NsaSqM8YdN1YQb/4vxUMURzYW4O0m5Mq49e5xTCv2UaxhgSJ9lcPccaQFwnnbZwET7TA/0HBu62Pzo9E7gB5sS/SSdoJyqi4ciERWQdS826+69CrTu3FVoIe6qELHbyOddFdTuDBQNdj9fnAIwL/u0BMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776856323; c=relaxed/simple;
	bh=WCA9dDtiutoDH6abi1j+nV+AKR9HUUvLmaDH+JWoybQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7KJFeJs3CfcQ9VscYXI7Oqa3C358nNuiHgg4ikyRryz7IUiymugNAJGkjOFJFkIvRvAYF6g1Les5MY9/PevBSeIRqOJMd4Yq+Hylbh6V/bPuySlPORybMm10j4g+srOeFMcUNkcJ/h7z5EnLv14bEr1D/0WtcpOVNWpadfvyvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SyP5s2GZ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SyP5s2GZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776856319; x=1777461119; i=w_armin@gmx.de;
	bh=3oO0vTiGxPBMmD9Oq0scQajU6s1HkqJLHUuGwzdTDiA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SyP5s2GZWOxskosFrbDU22LKA05WmfxyQZ6osyQrbF8fbAnqzBStb6+SLIUH7LvZ
	 1P03b7h3xuc4by9oPARUZrML2M064DCHR+j2ZvEqpnQ1yB6wS7TjfES5fmaEhrf8N
	 GId8WQj1Ob0ldYjUPA93rZJvz9690DxVQJGF0Ye2CtoeG4888tLjEIUyJRKpBpoeK
	 4z/VXF0ZWxEiWj3XNfi2ftpUTmj+80rnLKyZTRuMV13gMiKA4pHB0qTboiBzmLr/C
	 M7J5TSUV6YcEijsunNQIHiPpXKmF0NL0iJVFsCUcw8vw4CHypLDHAW9HZpcY2gm37
	 79VHPjRjfYIuhqZUzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1vM9Cy15nD-00u9un; Wed, 22
 Apr 2026 13:11:59 +0200
Message-ID: <8f1ba26f-50f6-4e7e-bba0-453e2631fdab@gmx.de>
Date: Wed, 22 Apr 2026 13:11:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] platform/x86: uniwill-laptop: Make super key init
 lineup with other inits
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260421201103.142403-1-wse@tuxedocomputers.com>
 <20260421201103.142403-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260421201103.142403-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bAXlcHJQLZgc2xIjb/Ob04fer+BtNKdivrjCgEyN1bY8AmXHuQ3
 85x+BbflWW1UYUuaV0qCDPk9e0hK1onX7PfQrkxN2BWF83ElHgNa1mMtcCvmVFzxl5Cmotq
 qb26F9E/zm0pOr9ME7d0vWp3OflVVEdp61QJY0/CAy8HPNf++8SJOpT2mZAIv505TEpZ53n
 KQi6cbpuMz633ipkK9srw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QE0/auLleMg=;bTVe4cMuJl05SgrBNo9bcTmyzpt
 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

Am 21.04.26 um 22:01 schrieb Werner Sembach:
> The super key init, while being trivial, was the only one not in its own
> method and before the EC init.
>=20
> Make an own method and move it after EC init and probe call to make it
> consistent with other initialization steps.
>=20

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++----
>   1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 766bc1ee192d2..7d1fdbacc6871 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -768,6 +768,14 @@ static ssize_t super_key_enable_show(struct device =
*dev, struct device_attribute
>  =20
>   static DEVICE_ATTR_RW(super_key_enable);
>  =20
> +static int super_key_enable_init(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
> +		return 0;
> +
> +	return devm_mutex_init(&data->dev, &data->super_key_lock);
> +}
> +
>   static int uniwill_write_touchpad_toggle_enable(struct uniwill_data *d=
ata, bool status)
>   {
>   	unsigned int value;
> @@ -1869,10 +1877,6 @@ static int uniwill_probe(struct platform_device *=
pdev)
>  =20
>   	data->regmap =3D regmap;
>  =20
> -	ret =3D devm_mutex_init(&pdev->dev, &data->super_key_lock);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret =3D uniwill_ec_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -1890,6 +1894,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   			return ret;
>   	}
>  =20
> +	ret =3D super_key_enable_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	ret =3D uniwill_battery_init(data);
>   	if (ret < 0)
>   		return ret;

