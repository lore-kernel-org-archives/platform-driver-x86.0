Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795453380;
	b=lktSYhMYsc4fgMpjTUWpbMGdCr1K92bmj/ss9+6sMAwRF0oK19MFh5y3TmEVHiwczPxL
	 DiwRjfklM4/tHbNzjMCZHMSkZEE1SucUHIvCkK/rxYOHF0cN3CLb5IF3LYnWP+DfBh0K1
	 uPLzIYdOqyB9dITvdUIdZiREK2nshB4IL9ZP4cry+UcmkogX+WogyODrGESFmAOvwjZTM
	 yBWom0vQ+pQ0pRE00C2Sw00H0hyHbck56ijkZlG2I1ULdCOnoCm7w3LVm/nedMAXKlKPp
	 Z/0zUEgXMyCOwxMpNsVKG8AhuihvtHrh0sXdd9z3mRKOIAExXNZx5c9aVRG/sbfaWVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795453380;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=h12qx8EMwDszbaXrxntP0fdW38wsPXPt0wGDsE19Quc=;
	b=iTk6oWDerFe6QPKCT0UrU9udlys2uukY3IVaR7LB0aWnuIkkpWhsod9RJDNuLow/O/dA
	 blfprA0P73HcvJ5EeRAtQw7WWpyb87EOU8AVXTkMImUA7vR8WEsB2iZ3djJsHB3t3/vuy
	 kzE91aDyPefrXItGbPuFd0FNSxMdWzuPxpZMnY2Yv8TH0fc3OSe8ntOcdD0BA3q60ssG+
	 qLwSvQhO9Jj6S5qFTglARjUH8yU7OtgVTBiv4to5+U5FVnEf+OeHffcMN3NS0RRvHUPx0
	 9uyhLV2OpMQKA5VxtqkqM3mXtwFVyAOQSW4tNqic3aqpqNdu4ykGdjKUn9521DjhOuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U5o9gVQ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CACC606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 17:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CACC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U5o9gVQ9
ARC-Seal: i=1; a=rsa-sha256; t=1795453352; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LiR/ONjolrMUEYFjlc6E3jWLfwyPBaK1cStW0GdL/8Yq06zi+ZHLxJIFJuhPh10caGr9cmRboiSJkmAyezo9u2SSTLgsPzs/KnFQhc7kMssrRNPjOTYk8BvRIoUs47BBfYRP75yiJnS522tUm9z0DRqGia9DJ3jCcYa7/c5Xh1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795453352; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h12qx8EMwDszbaXrxntP0fdW38wsPXPt0wGDsE19Quc=; 
	b=m5lbzuCnWmpBODBtWQUa5WdSYpUV9k4pvCVvpzSZ98ju5LrDBrkkuCUAXZQO+nAV38AKh1yt9y0Wqjk/mGROJPFwTE+J9ARSJG+sVDxDxtSkEOCQJsoeWo7HArPQrSNg15A5uNMxLZGkiLfg6oQgZ8xNuwMvgp528MSnhS4imtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=U5o9gVQ9yflmMxo0XITzkklqx2h2I9/rERO5S51+xFpCWYZkRZ5XBUsK18fs0ONZaXhNBuQnjaRQlRGKFphwAMMYrlK2ykkE6wNczQQ4DPrHNjxrmZypeEQxn997OeB0ITKnESWASG/Rq5n4468UelaZEmEy3ouPT98CNPvn2ABLUED6bjujMhb5b8R4twHu2DeSCaGBXXZ0azWHxq5XRyQBXHJz3FrokDs1uWwj3WU5kJOkDSQi/2lCpJKl4yCkpOy5/blhKeUwnSpl1vbZQV18zjy0R0ZoA2+t5/3kM/XkyIOF0KuDB9dXYy14cYwOb4TITJBXxPi+r2pTN9IytQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=h12qx8EMwDszbaXrxntP0fdW38wsPXPt0wGDsE19Quc=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795453347884924.7149761957031;
	Mon, 23 Nov 2026 09:02:27 -0800 (PST)
Message-ID: <2e40ec0c1b89e84ccd24edd5a6c364b4b6a25dcd.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Fix DYTC profile
 use-after-free
From: Rong Zhang <i@rong.moe>
To: Luo Qiu <luoqiu@kylinsec.com.cn>, Ike Panhc <ikepanhc@gmail.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
 <derekjohn.clark@gmail.com>, Hans de Goede	 <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?=	 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn>
References: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 00:57:16 +0800
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

Hi Luo,

On Sun, 2026-11-22 at 21:34 +0800, Luo Qiu wrote:
> ideapad_dytc_profile_exit() is called from both ideapad_acpi_remove()
> and the probe failure path. It destroys priv->dytc->mutex and frees
> priv->dytc, but the platform profile device is registered with
> devm_platform_profile_register().
>=20
> Devres cleanup runs after the driver remove callback, so the profile
> device remains registered after its drvdata has been freed. A concurrent
> read of its profile sysfs attribute then calls into the driver with the
> stale pointer:
>=20
>   BUG: KASAN: slab-use-after-free in dytc_profile_get+0xb1/0xe0 [ideapad_=
laptop]
>=20
>   Call Trace:
>     dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
>     profile_show+0xe4/0x1d0
>     dev_attr_show+0x4a/0x90
>     sysfs_kf_seq_show+0x29e/0x4a0
>=20
>   Allocated by task 411:
>     ideapad_acpi_add+0xd1f/0x2420 [ideapad_laptop]
>=20
>   Freed by task 7150:
>     kfree+0x1c7/0x500
>     ideapad_acpi_remove+0x148/0x3d0 [ideapad_laptop]
>     device_release_driver_internal+0x35c/0x560
>     unbind_store+0xde/0x100
>=20
> Subsequent reads through the stale drvdata also observe corrupted
> values. They trigger WARN_ON(val >=3D PLATFORM_PROFILE_LAST) in
> get_class_profile() and fail with -EINVAL.
>=20
> Register the platform profile explicitly and remove it in
> ideapad_dytc_profile_exit() before destroying the mutex and freeing
> dytc. This keeps the profile device and its drvdata alive for the same
> interval on both removal and probe failure.
>=20
> Fixes: 0d882fae334b ("platform/x86: ideapad-laptop: Use devm_platform_pro=
file_register()")

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
> ---
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index 91a8d11c79c5..2cbd0b87defc 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -1185,9 +1185,9 @@ static int ideapad_dytc_profile_init(struct ideapad=
_private *priv)
>  =09priv->dytc->priv =3D priv;
> =20
>  =09/* Create platform_profile structure and register */
> -=09priv->dytc->ppdev =3D devm_platform_profile_register(&priv->platform_=
device->dev,
> -=09=09=09=09=09=09=09   "ideapad-laptop", priv->dytc,
> -=09=09=09=09=09=09=09   &dytc_profile_ops);
> +=09priv->dytc->ppdev =3D platform_profile_register(&priv->platform_devic=
e->dev,
> +=09=09=09=09=09=09      "ideapad-laptop", priv->dytc,
> +=09=09=09=09=09=09      &dytc_profile_ops);
>  =09if (IS_ERR(priv->dytc->ppdev)) {
>  =09=09err =3D PTR_ERR(priv->dytc->ppdev);
>  =09=09goto pp_reg_failed;
> @@ -1211,6 +1211,7 @@ static void ideapad_dytc_profile_exit(struct ideapa=
d_private *priv)
>  =09if (!priv->dytc)
>  =09=09return;
> =20
> +=09platform_profile_remove(priv->dytc->ppdev);
>  =09mutex_destroy(&priv->dytc->mutex);
>  =09kfree(priv->dytc);
> =20
