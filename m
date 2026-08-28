Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59A35F19D
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 02:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787885266; cv=none; b=R5hT+621Vtm2vgP+qYE7fe79jk6VzEE5mS83ILmFMqesJI9IL9hTALsL4exwzQ5VqXR74+U6necF/JgVHLk3YfhjVTIvTiEpxuyKIaf7TMixmVQb9dxuv9dvOrgIQ4D/FV7DiA6K8435nvQ/8dpfeeff7WoY5R72v4frIYu9/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787885266; c=relaxed/simple;
	bh=r7bYlS0ZfXppJ6Y7GdWAXlpWYLSdLUndMo9cUyjaL/4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=mkv5jcLU7DwEpUaTM4d8RdPMzUATOqWfdcMmBmiqgHMPIlQoucKqUavaySNEUZyIUic3ljKL61iclEl78VaTsyZlD4MD8BTelPK87/AIf9U8yfyWEXyTypwrkyWp6qgrm1+uQKNn09zE2ct8M4mdaqyvV0YV5hpAwi2A9k0o0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRCP5ST4; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRCP5ST4"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-784a1696a21so354485137.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787885262; x=1788490062; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=r7bYlS0ZfXppJ6Y7GdWAXlpWYLSdLUndMo9cUyjaL/4=;
        b=MRCP5ST4m0TZQoTCEqZd8vaujWNhfiLUiNchHwRXaGD3nzZVi03nFPV97WM4ErGWGN
         Q8o4GWj0SMPay9Ypd2Z4KcIwg4m1nFCRTcP3yqZIkVroqzlCyvxRURf4xs9OzN4st1jf
         TC902PmYMwO/jaEcYwqUqXumG8Ke7wSwF3R0oDjafkIuRFKJKSDgLBZFPy3L7AAhRXfi
         WsZlPikf3VClbjRXt1VUnMdHI4+7GU6G+La6/wcdrJxaUEOn+QplJu+nwq5X4dEf0xJ8
         GxRIC5cpQgtpsYkSTtE3E7FkHTPdvL2yba5UmnEznVszA1mJaGwHmicUASsSMU7wNYmg
         A/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787885262; x=1788490062;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7bYlS0ZfXppJ6Y7GdWAXlpWYLSdLUndMo9cUyjaL/4=;
        b=fxCoA9KiJtYThZE0O/tGegEkc8k0nUUi4k2XA4benV75YWpt9bKUlNSq6jYQSZ/x+9
         bLlz037rJyrjHz/URx0pcnJjBxrdqjNM0EATVK0bb8X171UB0klLOCWViRq0bF7NUzle
         ddXcd5m2gZ7jpGdmdKiTdsASWEt8/MD34QN6s3wttImkBkaw7j6FMXEtvNPlgsFft9Sr
         5+fdxNEqoeR/6JVCgWdPb4S9kGdMTRUHCPTucfR0ni2zF8DTXSDGGCGNMcUJ3jMBDad0
         wN+ncYUCyy21IyJEviLK8LyZ7GhLjkkIYcxvsDjx1wRzhAsIc3+FXJdiFNyPoGwVBj85
         yr9A==
X-Gm-Message-State: AFuF++lgbXiGl2yyJa8TEZWjaHmRaDs3bEIKFGMjfuI1GofLDRRTHSSF
	W1/z4lLpsm0OrVgXMmFajBf3pnVjZj2XgeN3IYSbCjMuhOkJVzdtVAXh
X-Gm-Gg: AR+sD11cUf36jpXU7C/z2TZLcJmh672Cq9DRVDc1r2YwEmcmltGdc0KDGe9h1zzF1YE
	uy3Z/4qbpen+sQgpgeOonOujx8N3vJJS9IW2hiu6V1ktYG+ZdudnJkUTdXhJHv5UGyIeTb89S+B
	qJrkIv3P9+gwpF/8kevxegbJmCoK6ifX7ivasigZurM8EdXQiNL1xlVX+DNLJicXPicSbmzq2JG
	MVN2idNsVb85pwya02+nFOar4GslF0BTafCNgaKOevclVmUMoKS1dKNsykZsPfQqfaLp5rCyEQd
	a1keyv2rQRqVhWqsmc39QtaO1OZ+GFj42e6oqkp4EPrhUc+RKKocK7Nxv+Ck867sHgnHW7cOXSu
	Y+ngXyY9/Q+kA0bA7jR4s09HxNb653xQLuxuf+LtvoZuuPhsTenJuhvFdAHGKS6BDTmSuj7fCwA
	e5xU2o05HI6J8SlcOdhVkr6V8F3F2dIWga4/iTBrwprrvqtBTmWJ9YDsw=
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr1238685137.12.1787885262568;
        Thu, 27 Aug 2026 19:47:42 -0700 (PDT)
Received: from localhost ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-785f247e397sm239421137.0.2026.08.27.19.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 19:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 21:47:39 -0500
Message-Id: <DL08FHLYHRAB.2CA5JTNXDMNSQ@gmail.com>
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rickey Bartlett" <subtexel@gmail.com>, <kuurtb@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>, <Dell.Client.Kernel@dell.com>
Subject: Re: [PATCH] platform/x86/dell: alienware-wmi-wmax: add Alienware
 Area-51 AAT2250
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <CAAqcVzxJMxg83EJJD+e2eatjmEbF63jX2i8x0=KKeNv2F=5PEQ@mail.gmail.com>
In-Reply-To: <CAAqcVzxJMxg83EJJD+e2eatjmEbF63jX2i8x0=KKeNv2F=5PEQ@mail.gmail.com>

On Thu Aug 27, 2026 at 2:37 PM -05, Rickey Bartlett wrote:
> Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
> table. Tested on hardware with BIOS 1.6.0: loading with
> force_platform_profile=3D1 force_hwmon=3D1 exposes a working platform
> profile (quiet/balanced/balanced-performance/custom) and a fully
> functional hwmon interface (6 fans - CPU, 3 top, 2 front - with
> fan boost control and temperature sensors). G-Mode is not applicable
> to this desktop, so generic_quirks is used.

I would move this G-Mode sentence right after the first sentence.

>
> The full product name is matched to avoid colliding with the
> "Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.

Same for this paragraph, it makes more sense together with the first
paragraph. Then you can let the "Tested on" stuff be its own paragraph.

>
> Signed-off-by: Rickey Bartlett <subtexel@gmail.com>
> ---
> drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -122,6 +122,14 @@
> .driver_data =3D &g_series_quirks,
> },
> {
> + .ident =3D "Alienware Area-51 AAT2250",
> + .matches =3D {
> + DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> + DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51 AAT2250"),
> + },
> + .driver_data =3D &generic_quirks,
> + },
> + {
> .ident =3D "Alienware Area-51m",
> .matches =3D {
> DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),

This is not the right indentation of the file. I believe your patch got
corrupted. It was probably your mail client so you should check that
out. Additionally, please use ./scripts/get_maintainer.pl to get all
maintainers and lists involved. You are missing Ilpo and LKML.

Thanks for adding this model! Could you also email me the acpidump of
that machine? I like to keep acpidumps of every model on the list on my
personal archive.

--=20
Thanks,
 ~ Kurt
