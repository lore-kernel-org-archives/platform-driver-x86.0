Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795786398;
	b=3Evk6UrPQNFtQzusf2j0B3Ma9JKQ1gL9K3OL2E7oSeQ+Wk7YNkEBm4QZ6qtuqoJxbmcf
	 i6buLo4S7jXTRqSND62VM/B3rZ1zF42Dxol/aDRTlRw5nHBuaMLG6YsTZWlPuX3W6yJOZ
	 CVDRwPqH3XGcYjQLV6Bwrxql80xa2pqvI0swaQXsUcTJOCxpXq2moWBc/xX8Zts5F3GNy
	 scfVX4IIn/DeieqbOvQ42wnThFKPvjATVVRGo2bxTAz3U4i+7zsubtGhOvdVVY3OvtOhD
	 rHGi6jKY/UjTtUZ2Vb2NZMXh4jd33nyWwtve9uyQ0UCp19khJPOLV7tBETfDGv6cmrg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786398;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=Y6p0dqAjwBRY1H1G5q95WDAFDUxF4hifyZawCpTJQII=;
	b=wsUX2zyvn/MLbxRq15gpWVJgXheyWg3S2MtTRyAc/KecSfBEDN6jHOFR/nL4sJ5pzr7P
	 FB/nSFNuFivsTu6hYKGXyIPB8KEZbvXFU1JBfttYCod0r4fXG30ducVIcGpFcobeCvRnp
	 7VPRrswj7hude3SkuzV/0ooJwfujLpRsFIbfXD9PVxcEpDe73tcLBYrWlp6ek3jQhxrLw
	 RLDe4SwCT06vqvDidZ4kwbsVxoD1wdOCHvt+NIkOnv8rbPK6yyBSYYXNlh7DUBt0J0Rya
	 Ju3mPZDE/OzWoarxhZo1apGGJEKfk6fMrPvWhiNIGsvLw2tdn76tyHdlD8WWKeR6iTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZwguUePq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B79606A32F;
	Fri, 27 Nov 2026 13:33:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91B79606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZwguUePq
ARC-Seal: i=1; a=rsa-sha256; t=1795786361; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WuAT424A8IbPa8h5fj+LhFXRAiZGg3vDxVlMw6y1st6RdT+fLR1Le3uD+Pvo7XJif2Jk6fJSoUr/7UHWI2BVI/HdVmjXjbCY8yPCbAhngUWZfOcJyHc+LuH3ZVoQ1fP6V6zz+BkGajMu8QbXruz4ViH3nbildZ5pAfKYitcqhYo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795786361; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y6p0dqAjwBRY1H1G5q95WDAFDUxF4hifyZawCpTJQII=; 
	b=dGhaPiPvnWOaAh41tZO/qle/sI3x+gxel0QOA9fbxvix8z72Yfxp98eTN4qpRrEvrvfDuBFHszW0uCNQm1zA+GY2BtDYBdliIhwSHFqMwcQqQdw4omiGVzRqMC7T7afPEk89e87XvBtmQ14q5zfUQYGoGFVJUGp/onPw8+1/w9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZwguUePqsql9bjlqH9oQt5seskwGtWI74ArSMS9wBmrMUV17L0mmJgdoWzi+wjg1m1iOioXXZAL4yVZPTNrnYgHLG2Z3wR0aNrzzT+v3CQiXdMxfi7cGLCQWkXGFSP1ttS51lGWcUYMxAvXnryr5QHk3vheOKRmEVIgpr1K0LfjVvqPTkJIj3YcE9XYtdhNWMZCyn72Vwnqo2dP5cvpaVRrddADc5vTzwqKBMKIXGBFGdfIHE+x9rJ5rL8J05pW+MkZVgUlCs+SQ6tSnRV7OMC1LaawdGxCFBE18gYtLNhQqYGoFenYF1BbuurW8lqhtwA0zEnJwfOXdJdmQ5dGGmA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=Y6p0dqAjwBRY1H1G5q95WDAFDUxF4hifyZawCpTJQII=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795786359624147.79679442821134;
	Fri, 27 Nov 2026 05:32:39 -0800 (PST)
Message-ID: <9b7206772ad9ff49bbde3c9695c7af4c9aa698f7.camel@rong.moe>
Subject: Re: [PATCH v4 1/2] platform/x86: thinkpad_acpi: Update charge_stop
 only after it was applied
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, xiaoying_hu@126.com
In-Reply-To: <20261127015018.81906-1-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
		 <20261127015018.81906-1-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 21:25:22 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Tom,

On Fri, 2026-11-27 at 09:50 +0800, Tom Hu wrote:
> From: huxiaoying <huxiaoying@kylinos.cn>
>=20
> The charge_stop_threshold store writes the new value into the cached
> battery_info before the EC has accepted it.  If the ACPI call fails,
> the cache and the hardware disagree, and subsequent charge_start
> writes are validated against the stale-not-applied value.
>=20
> Move the cache update after a successful EC write and report -ENODEV
> on failure, matching the charge_start path.
>=20
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>

Now you've ignored my replies for no reason for the third time!

https://lore.kernel.org/all/4bba92e05349453e5374754ecdd9f469391a6c48.camel@=
rong.moe/
https://lore.kernel.org/all/5f8c406436d18dff63f209a4cb893f5c835293b2.camel@=
rong.moe/
https://lore.kernel.org/all/845a099746be67e72abbed7b4a63d169a1c1ac86.camel@=
rong.moe/

Please read
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-t=
ested-by-reviewed-by-suggested-by-and-fixes

Confused,
Rong

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..8fc5569131f6 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9847,16 +9847,15 @@ static ssize_t tpacpi_battery_store(int what,
>  =09=09=09return -EINVAL;
>  =09=09if (value < battery_info.batteries[battery].charge_start)
>  =09=09=09return -EINVAL;
> -=09=09battery_info.batteries[battery].charge_stop =3D value;
>  =09=09/*
>  =09=09 * When 100 is passed to stop, we need to flip
>  =09=09 * it to 0 as that the EC understands that as
>  =09=09 * "Default", which will charge to 100%
>  =09=09 */
> -=09=09if (value =3D=3D 100)
> -=09=09=09value =3D 0;
> -=09=09if (tpacpi_battery_set(THRESHOLD_STOP, battery, value))
> -=09=09=09return -EINVAL;
> +=09=09if (tpacpi_battery_set(THRESHOLD_STOP, battery,
> +=09=09=09=09       value =3D=3D 100 ? 0 : value))
> +=09=09=09return -ENODEV;
> +=09=09battery_info.batteries[battery].charge_stop =3D value;
>  =09=09return count;
>  =09default:
>  =09=09pr_crit("Wrong parameter: %d", what);
