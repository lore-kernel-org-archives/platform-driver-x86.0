Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC284287503
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Nov 2025 15:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763911324; cv=none; b=lBkupcxfhfYdu2FWStQbbIsevJZhoPFQM8s+EP6NFO5850LMD2cWGO1VnUO98k6X8nUuokWoyHoyI5TxpVGWiHEhT9/2VyyM378ecz9l8QF4QJWbX3TFXwwqvoJEMpS1t6Q0w21rwhzTT05e2U29jRPcjj969GlvYjbMVQDSzDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763911324; c=relaxed/simple;
	bh=yIGkGceCU5DgApzqCUyZSElnurFghB05F/AvJTkx1EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dge6WnHQ6yG1sHNujM6qjUJuTjqIbD/4RMPJOVgRpijBAXxaJOE1cL1Ie/+57z9GT8UB44/tjnM4+u0BL2f+YRPM4v3RMDiw6KD8VkPbcqiOXnGwu+FZBaYgpGRJw10Y4RuyADyJbMHLLNEIxfvjupIY9sK4NvS0Sw0dx5s+7Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0KPLtE5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0KPLtE5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so19740885e9.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Nov 2025 07:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763911320; x=1764516120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DxU7skL01mQtNUGJwCh+j4X/LM5Tft+uC1GbpVk6j0=;
        b=H0KPLtE5gNknEZmlIcg0WUcBeBsB+xkR/z0BsnYKSmtdbh0rXk3Ge0hLwKp7JZgAxX
         rF/gzYzeJZAAtuGa+Hd8JzrkSvYlCN7d3C0A7gdlv7D7I4xfnDFeIJzNXo2iF7y2Fftl
         rtdBhv+MaZKByL4H7YzHUyqa8A8gPKFGJD9efDKwdms4Yy5zABDvAqbVoifF0EIS1htS
         i3VxI7rTo8xrCnnJ6tOaiIhFTrkrzxWICXtKFQnwDvB6q5Oyi1F4YzR6cEb8TWdBnJ6f
         aFNs0oMCFCaL29cyW918yO+L5xdE4L/micNGKf+cvxe0VUZbAjcSfkckCG3dA+ObJHu8
         FMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763911320; x=1764516120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5DxU7skL01mQtNUGJwCh+j4X/LM5Tft+uC1GbpVk6j0=;
        b=kBhimSBUMS1h8JgAz8jYTXqi06k3H05QMIdsm1p5kR0jusaf3Dh9I/aTt80WeME32n
         iKnWOsrv2K0GqAIyyVs/j4U7HyQOG4Qv8X7+xOtSPeUq1P+2I0nMbftuvRH2TAxrBD74
         PU+oVfIb34Ydrn6zvVPrLBvYaN3C5+yt7jlYM0J+Z7ui1mbcF8WnB92HdjHH1nXTNPMo
         Bc9RBCC9+hkG702g07Ndl/fxXqVOr2x6Fp+3fIpR9uVH25k9SaK346Xf2yB/CudZif9H
         /bhpVz47md4fnTy5qtiQQDfrGk+Du/+wzr3iYNXur3tKqwicE2Cs+EUiBaM6/R0fHUQj
         L4/g==
X-Gm-Message-State: AOJu0YwpTStetKBYKYQfnWKQpx/vbHwNK4ome+r3GWOvHFg/sSGIg9ga
	nxHyPbdNpagZdYfLFHUG2fomct6aEx5B/C1MI8wSCy3QIkueFKj/yDjz
X-Gm-Gg: ASbGncvpZHCkl0a0GMjthTex4s46FJ7pDh0AP1uYOTWKT3Z4iLTPybsRX2Xly6Ki2nI
	+qUVWKxzhluLvs1oYPnSN0pDFC+WiLl/OmXGzk2Dj2TCCItg6+PXSZP4OcFFq3mfis8mQ1Af9LJ
	rZXuw4TBwmGsCn0CqEIh0ikq2EJ43gOJ7EW5dPXeEjQBeoL/9O9dvJAFmeHyFZrQ7spTO7nQQaT
	upIVt89mkUnHVESjzXLU7c44g5sKf+qTxhujIYLxe8IFkJbvGiPInS/VtUl4aq8TFsHwMuYeafK
	j41umiiMn4Xs2yssL9cYnauXOiuVdpvraMZGA2SVhkpqlQ6lmltNenE18Gkkpe7MBwqtRp812Jg
	nbKZBXIfb8xkdGk2lO/N7EH1BgogUVy44RzqeVBk1EzRPTar+EwyqKsqmnKhIofou8zwlviSH2N
	idCeFAaTRqF8+6KBf/M2vrQ2c=
X-Google-Smtp-Source: AGHT+IFXKA171frJD96g2suliUSEufMeNYA4mJLuIVAx6bCLFB8PafUPH/nlr2eniF8u0fJa4NUhCQ==
X-Received: by 2002:a05:600c:1381:b0:477:994b:dbb8 with SMTP id 5b1f17b1804b1-477c016e7d5mr89588455e9.11.1763911319877;
        Sun, 23 Nov 2025 07:21:59 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477afb54774sm113910645e9.3.2025.11.23.07.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 07:21:59 -0800 (PST)
Message-ID: <d2cd2ed3-6f0d-41c1-86bb-dfe57646262a@gmail.com>
Date: Sun, 23 Nov 2025 16:21:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: fix only DC tunables being
 available
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251123150535.267339-1-denis.benato@linux.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251123150535.267339-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/23/25 16:05, Denis Benato wrote:
> Module asus-armoury must use  AC tunables to check availability
No idea why I missed the double space here.

Do I resend a corrected version? Should checkpatch.pl also check for this?
> of power-related firmware attributes: fix missing attributes
> by using AC attributes instead of DC.
>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 5106e8a41e25..9c1a9ad42bc4 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -869,7 +869,8 @@ static bool has_valid_limit(const char *name, const struct power_limits *limits)
>  
>  static int asus_fw_attr_add(void)
>  {
> -	const struct rog_tunables *const ac_rog_tunables = asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
> +	const struct rog_tunables *const ac_rog_tunables =
> +		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];
>  	const struct power_limits *limits;
>  	bool should_create;
>  	const char *name;
