Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795529311;
	b=ianWsw54ZhbfwjyTBq1TSpWadBloURhRJ2+4EgHrqNQxuYVGSrM6nMYqWlLNSYa60UMZ
	 bo0oAITe7GkK3GCraXeuIgUEf5Y+8aoEEqs71gob5LqWQK0+gM7QNuwUSJIXT84fL9A1b
	 WRkkEC4eFBDTcJFdxe1qh0Zk4GALhE7WbgMq8qBAQ49lnFiIFuwBtWufoWbNRZWWauLQF
	 nmJHLQYTC8O9iDM1LVgnIC6cLBimFWV1mXdz4Pxx/WA2zxYYCu2eQ/QpO3VC7yF0l1gZi
	 U73FXtrGUhxBkkZHNWjOJa1pEe0Cx076K+tsSwuW5unwyaMFWARDtL8sqGaAbI9eEBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529311;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=m+qxUqkktlaJguwPxZWYSfLKDuNSRICC2oSo7kwIWcg=;
	b=Z62Hmdn6AEaSvf2gmWeA5cbNWCwbo7pCS/SXZPyh7oMpmKjSLT0MKNPUiibNGbwxBVv7
	 iljJG9aBRNgyXaDIAXLkh3WLZqIIcH5NCcP1yc3BGIH7w/dsutQ68EbY1UCYgTAPo9mF9
	 69Ua4EjEvEghj4YFh7TPPgpAZg0VaY1YjrZ8CdJAtY76vH1b24cy3/SQYyYNwpBEkJr8C
	 lh3ZGWlMKHE2FI52ZXN/kFsg3I/nHoMSgtGTG5l1sEFimPWFFuEo+5hXClpa2ykfyw1l7
	 FuRmTiVcqQS5Jig83CEe4Dpr63c7a/QE4HbewrN3J2lR4nRQEHozCU5QgPVAZ5L7dBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=iqjbcp7H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D26606A33D;
	Tue, 24 Nov 2026 14:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D26606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=iqjbcp7H
ARC-Seal: i=1; a=rsa-sha256; t=1795529261; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cCyaELbdJ5JkG8sp3MbV+RVxrxSunt6wBujcAqn/wbnzRIQ3BZwAF+GzP3oUroBlBIAD6MLzuhU/rzQMo1UnasRvl+RpKK2ewu7D7UrLbVfCBTV9AIILUI+m5E4ryddH635W+nyLsD8iUXp38JAH3je1reHcRmCIxw5qU9FKgw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795529261; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m+qxUqkktlaJguwPxZWYSfLKDuNSRICC2oSo7kwIWcg=; 
	b=a73QEbM6JRNk6AP1Q//jKpv/cBW2r+vudrgXI3Gx0ynAW+lmBScWhyOeCjTzi0DP4FJW9U1FF5QNdMEnViu+apUnbzu9iHPmSD14GfJZa0PWEHgdUT6mmkDtzv7S2zToDhcKQc9GmTHfNJYZn/0qCeGhW6KaNrhiJgwvzXYVVLo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=iqjbcp7H2Fh2JvTfu1itLWIXhoods9CPPPoGUrZHmkjkjW9aQqO8W/3w1ToL5+gRImd8KQFK3ULiw+i5CuWAsRJoPVkeJvC8J7m5MhjkWvMbRejuzwKgjHmE+Wo2LNb0p74qlDeVlem3Y/1iYm10UJVAIfQj19nQ9RkwVzKB5UV31mT1Cuw8gYU461dbJgw3uIzw/zlzLpBiDmWFAUa7pv467GHcIvrNthZEAEtQ1Y72yOy3MeFmLSIs6CfnfmiuJMo7AVbhUeXM77eJXdZwLn7BxW8g9HEdBNIqusx/yDbyO3+ZKVM2FuGABRwVbX2ZV6gu8/wZyjdX+zvlZrL5Ew==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=m+qxUqkktlaJguwPxZWYSfLKDuNSRICC2oSo7kwIWcg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795529259424768.2829272734709;
	Tue, 24 Nov 2026 06:07:39 -0800 (PST)
Message-ID: <4bba92e05349453e5374754ecdd9f469391a6c48.camel@rong.moe>
Subject: Re: [PATCH 1/2] platform/x86: thinkpad_acpi: Update charge_stop
 only after it was applied
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org
Cc: hmh@hmh.eng.br, mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, xiaoying_hu@126.com
In-Reply-To: <20261124103946.897642-1-huxiaoying@kylinos.cn>
References: <20261124103946.897642-1-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:02:28 +0800
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

Thanks for working on this.

On Tue, 2026-11-24 at 18:39 +0800, Tom Hu wrote:
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
> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>

The previous behavior seems faulty. Let's add a Fixes: tag.

FWIW:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
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
