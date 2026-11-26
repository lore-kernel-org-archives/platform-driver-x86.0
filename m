Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795695755;
	b=RMSEBNewylIWM2nEV1o8CJPZrShWMqqnri9bn3dc0j6+fAg4HdXqzyfvU2A2t8WpUBwW
	 653WEpFkOtDGUeS/+geIbKH0joD/ITS713XZP0ys9Pa6uTXk7pPspA36gSbgaCJtGuAX3
	 HWhJmAUeB+37bcPbhKv+F99eZNaWYk2SRE15SZn6jw4pdf2rCIQ6laDHoLEIrfopAe0x4
	 kQwpUNpuoAigVwBTJ/WSAJWkcQiWQkcb0qy8TtPsUqy+Rb/g1flRXIafKH0zyeQ1odlz2
	 c0FA1W3S0qZ8kX3FYpSN21ZgvvEzfxMp2lNJ5umcrq9TT+txDTQrXMR0Wgaz3aNiC4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695755;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=qwd8XaoEVKx8m+YXXNbuioImsUvVNc5/xb+QqedU5os=;
	b=r9z3ZI+Mxch4mHu8OmAusBtRy92AJ/4HtMQbc91tduC7eBA4CxUPxTjnudgMvt78Hunt
	 WLnbyBpCOfyKkl6dLpjXkZYelV1pNdlCPBRiopAG4T5mVDzdanre8S+Ui2/ExQWfhGucG
	 c86hNFMaAWntRJeoPaVNT7p7XMIry4EJTf9gjUWzUeMOWt4rdF7+Eao9lNTXR0YLzuQEr
	 LI7ccnMEeD99tovN+BJyRGw5MyYzb4QXfdCuqeMZGAxLL+Hw6k7TIvV1d1La0XPzpqGK5
	 7s3dwswIOAbKZhuUpP6Qq5i7QIStrwumZSErI8JObjdoKkrSRrqeZxy7FQo68j58u8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="VY+R7M/P";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE1606A31E;
	Thu, 26 Nov 2026 12:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1FE1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=VY+R7M/P
ARC-Seal: i=1; a=rsa-sha256; t=1795695729; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MANSwN5XsGCaWVM+EwvuYgGkbSwQPoyqxkL58/0gWcUrJBjJLqQod03vRPw+P1Y9+Fdu0bjb2QMZLGayiHYvmXHynMKI/37++ekJfXB5BIOwsuE6GTG6QpHf5TSCfvQw+BxNRxeBKihxdrseQ+nMt3oBmlGVEwZ7ctVm/+QdXaM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795695729; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qwd8XaoEVKx8m+YXXNbuioImsUvVNc5/xb+QqedU5os=; 
	b=BpY57NuElTjhN9jstv+593Ls8/MCYh0nNuoN+Wj2eCMKpzh5h250f54wOqx0Ysfh2TiE2HJ6tBu5NY9180qgNEBf6g7GMwe+et2fxcwpt/gjXMqYvOo12TCifi+h8XjsHGOd6c4/3IeY4s8QkHIRAOWLM0kt39wD3mqe41BPuRo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=VY+R7M/PDW8uo59fi5DCyr5lqP8FiuxOfqbMzZqtzDH9W6gNPGrt0xVg80W/ZQ4+V1AKvp3daIvVq+DOtEKC7LPtJ6f0gRly64d/u81K4IXUdptnMGu9IEzZVfIjNLAF37GijK7gdc3iHTTqVvTzBg9p6MAXQ1dJAx7hyJxIZwXB5JqXoU/xY8JUF+AA9WIHqSPNrPq5fl8LbZubewL9HutmRXvOZjViZPvKVom4g0vOmxDKizusPz4e2DP5EJrPSdatO7y6pkAAep3DeC0lAIwVHUW/4UT2RVzxDnPaB/ap883RR41eCeqMHjTa3wrLGlnKQiEAjyMUiUJpeMR5qQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=qwd8XaoEVKx8m+YXXNbuioImsUvVNc5/xb+QqedU5os=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795695727925445.9821566841407;
	Thu, 26 Nov 2026 04:22:07 -0800 (PST)
Message-ID: <28df34b19682af96231caaf30185113972d2f735.camel@rong.moe>
Subject: Re: [PATCH v3 2/2] platform/x86: thinkpad_acpi: Default
 charge_stop to 100 when unsupported
From: Rong Zhang <i@rong.moe>
To: Tom Hu <huxiaoying@kylinos.cn>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J . Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, xiaoying_hu@126.com
In-Reply-To: <20261126011058.39175-3-huxiaoying@kylinos.cn>
References: <6066c701-55c8-494f-9348-f9835b258b44@app.fastmail.com>
	 <20261126011058.39175-1-huxiaoying@kylinos.cn>
	 <20261126011058.39175-3-huxiaoying@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:16:06 +0800
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

On Thu, 2026-11-26 at 09:10 +0800, Tom Hu wrote:
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
> Link: https://lore.kernel.org/all/8aceee902d146619d2d5b92b84942baeb27d111=
f.camel@rong.moe/
> Reviewed-by: Rong Zhang <i@rong.moe>
> Reviewed-by: Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

You didn't fix the corrupted tag, but claimed it as fixed in your
previous reply!?

Thanks,
Rong

> Signed-off-by: huxiaoying <huxiaoying@kylinos.cn>
>=20
> Changes in v3:
> - Add the missing Link: tag after Suggested-by (Rong Zhang).
> - Fix the duplicated "Reviewed-by:" prefix on Mark Pearson's tag.
> - No code changes.
>=20
> Changes in v2:
> - Default charge_stop to 100 in tpacpi_battery_probe() instead of
>   guarding the cross check with stop_support
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
