Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616102;
	b=br2UaESQ4mxeK2EGXMXBzfzERyvOLMV62/sIyIFbgufMUbmCJJFfqHET1rJv48DMAj+n
	 eZn/TIVqUB8ivMBS9hyae8tCDRyWOF61zOhd0Q13bHa1XlUIC03YLE7Z3OMqmd3W0Da/b
	 kZpN5a0ZGZ/LpzAluK5UmtxYFedAsXo7ud1IKD8Ew7xMuMwBG/1k1koRNU52tUBREaMrY
	 oTbi5GPRkmPdNJ3w4km4WZoYVB2Se3JvDsBZdlMSyyFyzO7R37edw6KbMclkk4okkWh+E
	 W8BT7wKMlI4Bi0vCU+4kG/8NtRc3aRVclElBALGolu6uVXxJrqXhp43mZE2FflXN40w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616102;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=fd2VmFusPpkwkkZUWYVK1lkPX2FmQAvn7u19nlBb/ys=;
	b=5AXwPK/rvPj4LKP9MLwtRM/hwgPhUQpUuVv9cUtwORhvOMq00hoZjzxJ/TdDMn3/v0AA
	 VMGdzuRIyyqG87xim1xLL+eZfD9DuEsPP2EXlGZIrlGzKtR3yQ5XDb2s7T0nDdmlswWb3
	 hpOkOTkTMVL0ZrXZgicc3Fm/bFQtZDfq75dddEji370UeZSdc1NZcmREYz5AyWvfuueYu
	 l6R8gOV5JWvLo1EaYdmfC3JeoNLnmw1g+zxz2KF37mzwrUiN6r6sZqP2Ee3P60KINgIXe
	 nXmE4DxyzwID1jZ9EZ9X2QmnpgF5tZmqBy3cUXu4O0fRIkElLf7wXmXPZAIrhftAG5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kEb0KXBQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E303606A326;
	Wed, 25 Nov 2026 14:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E303606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kEb0KXBQ
ARC-Seal: i=1; a=rsa-sha256; t=1795616068; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YH6aYALokYHVxMmgcfuC0xQklfH3H+gYxkxdw9kv8UV5p/nD19UJNizIFfHNa7gG7UXTQWgkCJKDcE9vKj978Tf5z9Q4BcejDC+SQC8MiRZrI860WfIg+fOV2C880aPl7VTwwXbY6888J0V/eANTluGKVf98lzwyMen/yU1xMe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795616068; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fd2VmFusPpkwkkZUWYVK1lkPX2FmQAvn7u19nlBb/ys=; 
	b=ncqHMXePBduwAnNaW68rMBMxv8Uc1ifDKrgSCOhUgkOIlGRlWBgdX33hq5gLeTaO6W8wsuHSi+JqlNimhD8xmh3C/2US0ZhmC0Zckj2lIa4u5U1b8K17pczwS/VsWO0jTh5Ytf6FNqB0bJDkK6Y112AxvJd02E95k5NHUAdV/N4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=kEb0KXBQ+nXlCjvAGn8qZgTz3hWYzXjBDJUUlJ3jKCBlpSoAjN78P8sXQZuQJ/jmmlk9N0F4R/whdfClwTXEe2XpoywtwQCesLNd0oMmDu1vuk86sCYg8zwbWN0OjTtncIWw8MxAQlURZAHw5F0aSYHC6XxLdBw1KMeW6tJwhm3S6Webe1MlusXRqutH2QKiKblOioyra8GbFFdCOSveDg3ER1+WpcfHTV7+16wkzxHXr+vXvuGT1rL5Nu+0MQv52ZROX46zyDNF5EstFKD+fCYSufVL08Qb02pq1UpWFg+ncJ85QVeo8MEmrh7mIkgmDgFDNgyKSsI3jkpt5G3byQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=fd2VmFusPpkwkkZUWYVK1lkPX2FmQAvn7u19nlBb/ys=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179561606434958.59232992367242;
	Wed, 25 Nov 2026 06:14:24 -0800 (PST)
Message-ID: <5f8c406436d18dff63f209a4cb893f5c835293b2.camel@rong.moe>
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Update charge_stop
 only after it was applied
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 xiaoying_hu@126.com
In-Reply-To: <20261125125252.38003-2-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
	 <20261125125252.38003-1-huxiaoying@kylinos.cn>
	 <20261125125252.38003-2-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:09:20 +0800
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

On Wed, 2026-11-25 at 20:52 +0800, Tom Hu wrote:
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

Please add a Fixes: tag. See my reply to v1.

Thanks,
Rong

> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
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
