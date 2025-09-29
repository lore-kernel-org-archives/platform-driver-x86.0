Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA86B1DFE26
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Sep 2025 23:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759188894; cv=none; b=FB01oVuo4mdrXiswwADHWVBz0nSpi7Figib6TH+PU871gd+A5k+fuB4n67kyA4dX60WK8yg/yawcOSGF6tr7j/I8luIkeFFu0Gy1++nnTOrsYtSvy2C7qxeC9sUBEV4zrTNCov2MGt5JQNnWKnmTPL6s4mFbIf5Uq4CJ97SI5tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759188894; c=relaxed/simple;
	bh=KGGO/c4iwGbuNioarw8Fkcgaz8f8/ESRsoXID/0Vbpk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Um/qbkLZUX97xdKNGgiT2N/VgMqf7krqbD8NxKLDWMJOE7hV9rxzca2zj11pY7imE1Z0k0j9MDG+5gbE6p0pHTlcjE40mfWMKuvR3GdwtwKEf0J3sMB2Wbw0kRjyHY0mAqRifXmZRgP4S4K5/y1Ztd5UdFUKHw3edqjjr+QicN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sign1ugM; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sign1ugM"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9231a251c01so958645241.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Sep 2025 16:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759188892; x=1759793692; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFiL7tvxh1E8ppfUCLvnfmPCueA9DAsnng1eogfHRMo=;
        b=Sign1ugM4Df6Arli0EsdPdwH5NzJJbY/nEuZjLUA3XfgFUbzz3gTWWQeZJLOtamWuE
         aqP1vY1rZiBfEo3gy9aoHZGX0kn0BacTm3JJYClYpHtILk5F13Kzn+KjyxIkYSwNfQzr
         OKIFe9aauJ7GC8ISwv/SgkALEaU41p4vhS1vIalBuJ8cNBaEMUmjH7teSKO0zpZ06byZ
         yQQHzIwzeYaJBka1Vg7Ajd0+TDfrvWf/M4hV3joHlX7Ktisdbi49xWz4j5D1HdEgeYbz
         kGT0PgKVztE6tot9McpgNscCgzgn4PUgCvEK19oJwN7SSk5CWVhnuLGsNB6C+Xo88mtH
         t2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759188892; x=1759793692;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wFiL7tvxh1E8ppfUCLvnfmPCueA9DAsnng1eogfHRMo=;
        b=IWEFmKyhi4aLdXI1A+fegbwaSaKA23uduSVpY0MyhDdO4vGAFz8sxSxDy2sSBEIISM
         M3ymckIcYqZi0xcJi3plPgNxZS1KzJnxfQyCFKcIXjKodRv74ObDCrrJ1acgP0i1uxTF
         ltRbI4MLBgZvJI/rehTs6NcvCBu3FZj6t7mYikTydFxSf97JCGEu5filgMsqPmOC5ZLf
         SftASRoicaTr9MvgtiuQbwCy7b971kqrgxPmDJXUAPXfAMHbeJF26SsAoGOP/T6MjI9G
         eH8Rv84ss0g3RQ3/S5XPOVjPHG9H7nBE5K/D1tp+tGcwVtvBzGOz/bcWbReu9oVuzeRv
         O0Cw==
X-Forwarded-Encrypted: i=1; AJvYcCWV47N/FcWTNaYXq8/apB2odFMhcxPG77gQTKO/lRlWzAF3T8kRgd3xh8AURjf2htrw2I1+4ig6Vu+wQNeXGoZW1EHC@vger.kernel.org
X-Gm-Message-State: AOJu0YwENQ72osRB30k8cOdydFY2zy4e6XnqvdH+jsujX7348l6UZQKS
	r6uQZJnloRvR/sf/spSmzNgLPwZNunJEvZMC71iw6WL1QKe2GrgFcbkz
X-Gm-Gg: ASbGncsyq7tG2FsPuwAPb2YqjEbnUfCmtllHDuu/kHCImXWMw4Rk55mfs7QQlGfjftn
	PbdPSEIYbis5TAGcedKLBDcHzZu/jTFa0bQo+n8rrYhNVl1O6Zca2yyT9D4sCDGcJ/+CeBu1IGV
	FdiJhwGxGhIYu8iErOcNctl129Zld0UlBMf+Vt4Wnf1ICrc67hl3hpTQjLnNQJMCIEW3hg9vQhk
	aaaNxdUBCgC+96bQROdPBjXdcuAaPKhRqrC/uOBxEe94nthXr8787Yu3JvyCRkQh/3B7R81R1Bb
	j9bsTDrgcCJznPnPtfKM432eJS2uTh5nRtpORZZzQtAo9mEIJUeaxnDxCEzfqY9x8J29ApqaQLv
	tV3LWsSzdfkPrgvBYa5hGiObuyPNB6nQ4g6SOf5g=
X-Google-Smtp-Source: AGHT+IGNT4CaODm9AxqpmbifcaCr9nrgDOnLfemEictGIa2Tp7pNkJNdPA5rCN1cnR+7ZsfJc38lHw==
X-Received: by 2002:a05:6102:50a0:b0:5a4:138d:b13c with SMTP id ada2fe7eead31-5acd2b17270mr7054801137.29.1759188891810;
        Mon, 29 Sep 2025 16:34:51 -0700 (PDT)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916db3be313sm2665732241.20.2025.09.29.16.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 16:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 18:34:50 -0500
Message-Id: <DD5OEZAR3061.I5SI8XGJ0HHG@gmail.com>
Subject: Re: [PATCH v3] platform/x86: alienware-wmi-wmax: Add AWCC support
 to Dell G15 5530
From: "Kurt Borja" <kuurtb@gmail.com>
To: "tr1x_em" <admin@trix.is-a.dev>, <platform-driver-x86@vger.kernel.org>
Cc: <Dell.Client.Kernel@dell.com>, <kuurtb@gmail.com>, <hansg@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <stable@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250925034010.31414-1-admin@trix.is-a.dev>
In-Reply-To: <20250925034010.31414-1-admin@trix.is-a.dev>

On Wed Sep 24, 2025 at 10:40 PM -05, tr1x_em wrote:
> Makes alienware-wmi load on G15 5530 by default
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Saumya <admin@trix.is-a.dev>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index 31f9643a6..3b25a8283 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -209,6 +209,14 @@ static const struct dmi_system_id awcc_dmi_table[] _=
_initconst =3D {
>  		},
>  		.driver_data =3D &g_series_quirks,
>  	},
> +	{
> +		.ident =3D "Dell Inc. G15 5530",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Dell G15 5530"),
> +		},
> +		.driver_data =3D &g_series_quirks,
> +	},
>  	{
>  		.ident =3D "Dell Inc. G16 7630",
>  		.matches =3D {
> --
> 2.51.0


--=20
 ~ Kurt

