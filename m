Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616202;
	b=tFkcjobOCz9SNEA79JH0yZlLe/ugKa9sLVB4XMcMmmU17LQYXQcIiD2/2BEHTLScjdkD
	 0YYjH/3+deD82TT4YY3XcCNIZfn0RTZsMltwSy8N+OhCv8rJWxvnWu20LOQuP0L3KGi9q
	 0+iIMHGzk2Z4njZkFh4zU91TDkjywTVQrAib/43DcBObYiXYpyTc2bnpRmK5rb9TD6Ot2
	 v6Wt9LW39jMbRoEa3eRWQB4alDKNC9c2seRy2qzMa+uN/BtfcWzbXkD3ZGHZqS7lWaSLN
	 U/EFm4nO/4kqXn4uYZ2aTu3XRgtBv8GomFHF/D5BVjLkBNhR2YzxIGAWGsjq2VvSDiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616202;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=ArhpYEDQE8ZdviwwTBn7vEa0W+QU2k77BuW8nuPQq3w=;
	b=HxfZBkJjCpYKMowUSECkOzdd6Ygbhn8BUq7cwrLVLXa2dTYCis8fdtFY/Csa97FDALXx
	 NGxe9pcMr4lP44ctD5IbD6RpQkLq8e9gM9GGjfFmxwUMPOa+D5wI/vWx037Zp9Rmd/68w
	 BMLSLO/MCdzZbgTc5557KDbv98KIOptuejowYzD7MyERs1cRE5S7uShbhgFiNWjHeLwgP
	 RxjXndlUHwAKmvEfGVIB+uoqn8A0hCwzJOu4u+oGQsJrxYEcJngb12qLQb1o/yZZ1a6Qt
	 SLQnAMHdAIfE1vBDOfMuNtVXtlHI1CD0i3nTL2DQi9fFIXeyv1WzWKVVkCWD4hythrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=b575YmPJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54A606A31E;
	Wed, 25 Nov 2026 14:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C54A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=b575YmPJ
ARC-Seal: i=1; a=rsa-sha256; t=1795616138; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DQtsjak1355PYkKTSTgonjsIaTisM+uJ/IVo38EpCFLdvmTwsZq9k2ktr/M1mbbVXqOhunSLj6YtSmXDsRz1dwuaVdKOZ/AvuoF1NjyIblFn8SqRvpMBLmLI/Cj5ejL56SrnezsfjPBQkLdx8u6ypmjEErQd1v4xqDHq2XjTP0k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795616138; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ArhpYEDQE8ZdviwwTBn7vEa0W+QU2k77BuW8nuPQq3w=; 
	b=AA3zfSX6erEFVAyEABB8fXqa5W+gPcMjyHGEG0QmfPh6NNTLAkyHUQ1XaY004PNxmqMPbh3IBWGe7wpIDFZ42Zoz9I4u0RIHniuEjz7c4Br7AZ1ALDGZnR2jIFjCRQwN+HrKLh3q3oQts7IsgEKvcfLAHgN97A7xdt/HSf3zeYI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=b575YmPJVWOYsFd0vh6s6ZlbQNRAaQ1xYC/SiGf28IMiyxgnFNmkHzJAo4NDH82drrlUnui83WcrqHSk5fmQwodBm7Zo5eG4NBGE6GaEuFSAbMZtrpn1Fi0AZ9+U/GaWg3BuB6hPC0p1A6Scp40FTbxnx+cXUwH/zf5rusS0Zc4D8N+9dEdTSBWbbOf4f8btE0Tv+DvT6A6p14p0DIfQv44hlCDXh0zz/VtWUM59xuVygMiB9d3tAKlObtHZSVTXXjrwFq5ibjOksv62Yeoz305xDcvMWkrj6o6sak87sX1muethf/b9M9ytzhW2PdG8Y9HDSOXlIUfupcFTlHGICg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=ArhpYEDQE8ZdviwwTBn7vEa0W+QU2k77BuW8nuPQq3w=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795616136432245.25563832862883;
	Wed, 25 Nov 2026 06:15:36 -0800 (PST)
Message-ID: <8aceee902d146619d2d5b92b84942baeb27d111f.camel@rong.moe>
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Default
 charge_stop to 100 when unsupported
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, 	linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 xiaoying_hu@126.com
In-Reply-To: <20261125125252.38003-3-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
	 <20261125125252.38003-1-huxiaoying@kylinos.cn>
	 <20261125125252.38003-3-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:10:23 +0800
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
> When the EC does not provide GET_STOP, stop_support stays clear and the
> cached charge_stop is never probed, so it remains 0.  charge_start is
> still validated against that value, which rejects every level above 0
> even though the start threshold is supported.
>=20
> Default the cached charge_stop to 100 in tpacpi_battery_probe().  The
> store path already limits charge_start to [0, 99], so the
> `value > charge_stop` cross check can then never trigger when no stop
> threshold is known, and stop_support does not have to be consulted in
> that path.  A successful GET_STOP probe overwrites the default with the
> value reported by the EC.
>=20
> Suggested-by: Rong Zhang <i@rong.moe>

A Suggested-by: tag is usually followed by a Link: tag.

> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

The tag is corrupted.

Thanks,
Rong

> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 8fc5569131f6..0c27e0b74b48 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9698,6 +9698,14 @@ static int tpacpi_battery_probe(int battery)
>  =09memset(&battery_info.batteries[battery], 0,
>  =09=09sizeof(battery_info.batteries[battery]));
> =20
> +=09/*
> +=09 * If the EC does not provide GET_STOP, stop_support stays clear and
> +=09 * charge_stop is never probed.  Default it to 100 (no upper limit)
> +=09 * so that the cross check in tpacpi_battery_store() does not reject
> +=09 * every charge_start value.
> +=09 */
> +=09battery_info.batteries[battery].charge_stop =3D 100;
> +
>  =09/*
>  =09 * 1) Get the current start threshold
>  =09 * 2) Check for support
