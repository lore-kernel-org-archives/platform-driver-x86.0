Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C737C92A
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 18:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955333; cv=none; b=Mg7SvXS2AuZXc36F2wBfAYUdAbSHT7k31wME7kuAbbefPPsTPhQMWKlKeuAILR3u3Mt9TZ0TqziqZqs+Te5OooSxkmX1PSpJvXYU2DXoIVJAvhEF+ZCLSxemqrmAVQHYjmLcB6f2ojqPip5eMdZ/xllwdwIQFjVbbYr/upJHCPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955333; c=relaxed/simple;
	bh=IHfCPN8lt1sVEyi/CG37S4cFImG+Ssm4DkJcqujByGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NsYm86uoqXg7Sj98TjAz568EkKssoGlUwCyVWpFE1AUPnXEXpW7OgF6qdPwqItlu/KCk7KQ09Hyj/c4uvpQIvckAKh5RsZXCyFKK4KjZpmT53DXri59mx+tYkzLYJGX7X5v8ZmTD+yr1tAIcDrnQj72FYRFbqv73qRjEguwacB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=YBq222m7; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="YBq222m7"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 03AB95E4D9
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 21:42:05 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 520385E508
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 21:42:04 +0300 (EEST)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4C2A61FD966
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 21:42:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785955323;
	bh=L5CKOeqgpljDTERVHt40Mvicb5XYkzgQbWCh5eFbyZU=;
	h=Received:From:Subject:To;
	b=YBq222m70u6dRMFtVh5eUg/s2Z/EN5HEYzWeQzIKa1ag16PYDaRoxtAAA7geVLgJ8
	 Ut3P8DAl+zK4JTQw2tH6gNVvM3DgsUfrwf/LyKtKOQLb0oRn9G1bX0wTH4xguD9buF
	 ECpCy/COPV5I21ogJfHiRGC21ODYsaLiLVWMjVTh31UFPwHcdV6ZbxPRyXa/ZIKY+S
	 I4NU7cTyqrcB0B5gUU5oAO1mCBaz4lgALfaPlD0z6/EWvEs8RdbKNK54jadRAsFJDB
	 dBLBlMd9rsdhSCxdv8RUZQc+F4XF4Ksj2WPahXVeAu0g6PZg13Wp+SV8G0TT3kW1lw
	 okTfCkoBbvtfw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-84e27035206so1066570b3a.3
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 05 Aug 2026 11:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RotjIq8cQVEwlbgBzDyfO4r884fupGWafeX2R7PlD14uKGdiUK13dSz7uCOCLVKCpPRtQbZFGwRxPGbszsC93vwh/+g@vger.kernel.org
X-Gm-Message-State: AOJu0YwCLM8u/00ix/RFW6UrrZn9pNTIO/5CZWdn/T5JaDZYgB6CJyIw
	LghQ6q4k7o63bi+P7toBZKh31zGEWa7N/ZIQIUKCi7QqmZd5iPaF00Zucq1JuSLqjYXAVKdT3Py
	RcbHrjdiRRawSl+an4OuGYSPrhtbBmgg=
X-Received: by 2002:a05:6a00:2d8b:b0:848:2d1d:836f with SMTP id
 d2e1a72fcca58-84f2e017a86mr9096671b3a.28.1785955320877; Wed, 05 Aug 2026
 11:42:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260805183102.38408-1-jeff@aletheia.io>
In-Reply-To: <20260805183102.38408-1-jeff@aletheia.io>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 5 Aug 2026 20:41:49 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFLUYNr0YFpvSytX7m0fcOyUuxBjeUnrJzM9pAMdQ2BJg@mail.gmail.com>
X-Gm-Features: AUfX_mxFSxu2fq2BZ5HEz00px1AWneyJ6Nrjp8QfqXl-6or2sberGPiopg3U-IA
Message-ID: 
 <CAGwozwFLUYNr0YFpvSytX7m0fcOyUuxBjeUnrJzM9pAMdQ2BJg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: Add support for OneXPlayer X2 Mini
 Pro
To: Jeff Hagadorn <jeff@aletheia.io>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178595532291.3303364.44741054817028938@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 5 Aug 2026 at 20:31, Jeff Hagadorn <jeff@aletheia.io> wrote:
>
> OneXPlayer X2 Mini Pro is a new Strix Halo handheld. It ships the same
> system board as the OneXPlayer APEX and uses the same registers as the
> OneXPlayer Fly devices. Add a quirk for it to the oxpec driver.
>

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
> ---
>  drivers/platform/x86/oxpec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 99c0dfc..34bb17f 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -289,6 +289,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_x1,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini PRO"),
> +               },
> +               .driver_data = (void *)oxp_fly,
> +       },
>         {},
>  };
>
> --
> 2.55.0
>
> base-commit: aca39607c1734ed976fdd65deb75b3555a5a0326
>

