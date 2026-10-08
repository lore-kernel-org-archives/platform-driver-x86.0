Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218794E1C77
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 Oct 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473327; cv=none; b=BnHTQl6/zZWvXPxzxlj5E8SVO0Swc8LHOO1Yl4wJFHgKNSt2d1Bzzf4c878o2E4lENsbMKIvbbRgWaFZHG7obnfL6TBNJ8UWG8GdQhWmNNQ4NIww2nvJeAeTbZO/9+TXaFIfNb5pgbUAABJCk3wSCOxHDQ8eWqsSccN637uA03M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473327; c=relaxed/simple;
	bh=VRDS1Wy+H3zTPbMdDug+OqDcF/r5LuM8zspUMrFtAOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aEnRRxdhtOVVnlz2phEdK+rcx44BerGObxU+s9mhfz5F5HNUn9OTBpQ35v2xONVP7PfkN+9v/W9fZ1cZMQOYsy/yxKbEYyCY5sMaPh3b7VC4dbH+xgAoMaKvQYFR//+d1GbqimxMUHzcKosHEc8KnRnKhystzrBk2dKSgkDhSJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8BGhbJL; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8BGhbJL"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a9a1ed66b9so14714291fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Oct 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473320; x=1792078120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xD0mCKhBnL1ByDRSKnyKdcT4fj0jo/q8QfY/rh5fC+Q=;
        b=G8BGhbJLfeFqsmOAk7VtguVMtwacuFiIXBrVOm7eRYMrvBiYGn7PQeJeNJu2Ol8gef
         vwwnnt/yVB+HFb4xbHpR5H9/Lk1/NkABFKlZUrgM+83qwBEAzmTRtWFHTdWmFnR0iH9/
         L5RW5Hf3r5JF2M9vsnUkU7DQGOwMB1CJIWqUFYuABIS3ggoqRm88oJXHt2KyTjxdLH0x
         /22En39VRF1YyOkzNeBRkNLalhFucM6brZS4KcS39dVoBkKf7A9FgBC1EJBG8ao+qlmg
         8Qt3kjN6qtWfVkyCfQgjaiMZuQmlmPvIdUBweri0cIGstQhSOlz7gKdcfYA7zhXu56y/
         mFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473320; x=1792078120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xD0mCKhBnL1ByDRSKnyKdcT4fj0jo/q8QfY/rh5fC+Q=;
        b=nmSS4a2uy1hKTzWPTH7s24hL836MmxIT8nm7ryEbYLlkrp4m8HadXvkh2qOoIduiMN
         kegiQahg7c6D/PzOIe3zmwCTTJHLI91Wf5DpElDRctn4NDWJf/DsZ6HexVtLlnlvfvFj
         EteIv2JX3lBUauqxKLIdb5u7uJqrvQD/CrvgnDfRRjQw1pHBZfB0Xsi2FwzyLJjGhtVQ
         4kupvYaz/mCcZm5vCX4d1a+dIRWJQ+q/YxrsGoowTryH39ECWU7RwXfOgEt+yppjbXPc
         DHMVqIx4SaVkKSws77HUf6ZcR6iwBUguXqw5IWgQdo/EKzcVfxfD9bxHTttoywN4yyYE
         rrDw==
X-Forwarded-Encrypted: i=1; AKwUvBwxcAOFqzUFBuZSMhY91riDEpit+9GIOTlFmN7TT59uBIvLjW+lb/l+gORpHXCHA1LnHm7rsrX1Vpwcv/G92IMS7pIA@vger.kernel.org
X-Gm-Message-State: AFq9FYKUhRYxK7iCba8qqBHBfX91rHdheaudTy16MpAe7tljepcQ8gAr
	aVbvp7kx9LMCgTNV38/YacxsXuTCsqsg8vEifeiIQNYvU7xenCrMGUFv
X-Gm-Gg: AYBFou2XQb/wmSYbNfFUWF0+MwUAaJLxJdLCtE3hYPeCx1vcNFwX/XgD/o2FKEE5wk5
	yLMcw2AmoD7S7satGMDOWMN/Y8Lzy89UfVv1kP76Sqhc1KFlcjH5YdcyMGba0du1GNE6nsBXqcN
	f2GhDuJR2E4r9p7QbID2C9/jaGv8M3iZubMFzcu7+BmEI6Q7sRO8HW2TEwz9HvGOCZlRq4URyy/
	G66yHCXwtAIbQYAvwCCPZLfmSN36gH5wYVw/p/FKDtarX8T4cljdQTSGc4f16qUummInysl8CEp
	q1/TIdXBQ09iRaGiPpsLqwAYlrX9i+Ppf9Ss8Rh+DTO1tRBKZ1IoqT+n4pPH0Qut4ouRtwBkBUb
	ULbxBtvLbbNDC12PB9O9oAhND9/U+aDerembRBj77rn6gcqgPJAxaKAhSxISrgIpJ53QIdrfYhU
	UgsBAMsvJLdOmlftLpcxuvBt9HTH/+rxrT0EwL65tIdN49Vp/IACLBrxyFBtZuyP4mW/PDpmRlw
	lqxxdfOrnJSLv8n9/O30KYbKI+Yct+HCWSDvKF4VNHR4TTp3MzTfOa2Y0T9kJk6KGLY
X-Received: by 2002:a2e:a7c1:0:b0:3a5:d070:9fef with SMTP id 38308e7fff4ca-3a9a2c5bbbfmr13192841fa.10.1791473319681;
        Thu, 08 Oct 2026 08:28:39 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c13e6530sm221651fa.9.2026.10.08.08.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:28:38 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: Milos Vlku <vlku.milos.fun@gmail.com>
Cc: qby140326@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	W_Armin@gmx.de,
	ilya.gladyshev@linux.dev,
	kento@kekto.ru,
	ericted8810@gmail.com,
	chris@miget.com,
	matias.civadda2342001@gmail.com,
	btx342@gmail.com,
	wleizc7319@gmail.com,
	wolf109909@outlook.com,
	i@rsplwe.com,
	bozhenpeng93@gmail.com,
	martiya.ar@gmail.com,
	aleksejirlik@gmail.com,
	zsanya322@gmail.com
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine ops table
Date: Thu,  8 Oct 2026 18:28:37 +0300
Message-ID: <20261008-tm2307-tm2309-entry-uselessfire@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com> <20260929134503.17249-6-qby140326@gmail.com> <20260930015058.3076905-1-uselessfire@gmail.com> <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com> <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Milos,

On Fri, Oct 02, 2026 at 02:18 Milos Vlku wrote:
> It matches your machine on every point you listed, checked against the
> ACPI tables

I checked the WMAA and NTDP points of your mail against the TM2309
tables and every one of them matches, so one entry for both boards
looks possible.

> So I would suggest an entry for these boards uses balanced = 1 rather
> than 0.

Agreed. My local build already writes 1 for balanced, which is also
what Fn+K sets; listing 0 and 1 together as balanced in my table was
only right for ODV1. I have not repeated your measurement on the
TM2309.

One thing to keep in mind with balanced = 1: GET returns 0 whenever
QFAN is not 1..4, for example while QFAN still holds the 0 written by a
kernel with the default map. A read of 0 then maps to no profile,
laptop_profile_get() returns -EINVAL, and bitland_mifs_wmi_suspend()
returns that error, so suspend fails -- the same -22 that was just
reported for the TM2426 [1]. Reading 0 as balanced avoids that.

On Fri, Oct 02, 2026 at 02:51 Milos Vlku wrote:
> - No machine-specific capability check is needed on this one.

On AC, yes. But bitland_pp_check_capability() calls
power_supply_is_system_supplied() before anything else, so on battery
balanced-performance and performance are refused, although this
firmware supports Turbo on battery: Fn+K reaches it, the GDDV has a DC
Turbo target, and writing 3 on battery works on the TM2309 (odvp1 1,
thermald applies the DC Turbo limits). Could you check the TM2307 on
battery? If it behaves the same, these boards need no capability check
at all.

>   balanced-performance -> QFAN 3
>   performance          -> QFAN 4

On the TM2309 Fn+K only cycles 1 -> 3 -> 2 and never offers full
speed, even with the stock 140 W charger, although the firmware accepts
4 without any check. Does Fn+K on your TM2307 offer it?
power-profiles-daemon maps its "performance" profile to platform_profile
"performance", so putting full speed there would make the desktop's
performance setting mean full speed, with a PL1 of up to 90 W on AC on
the TM2309. I would rather map performance to Turbo (3) on these boards
and offer full speed as max-power, which platform_profile_cycle() skips
and power-profiles-daemon does not select, so it is only used when
chosen explicitly: low-power 2, balanced 1 (0 read as balanced),
performance 3, max-power 4, and no balanced-performance. Aleksandr
asked for full speed as an explicit choice on the TM2309 [2]. Chris: if
the generalized table can map max-power, that would cover it.

> So that is a Tested-by from a second board if it is useful.

If you reply with it to Chris's patch [3], b4 will pick it up from
there; here it is easy to miss.

Once Chris's series is out (see Ilpo's reply [4]), I would suggest a
single entry for both boards with two DMI matches (board_name TM2307
and TM2309): you test the TM2307 and I test the TM2309, and whoever
sends it Cc's the other. I am happy to fold the TM2309 into your patch
or the other way round.

[1] https://lore.kernel.org/all/tencent_D96ED693B9D664B3CDD8943D920571929406@qq.com/
[2] https://lore.kernel.org/all/CAFpZVRM_A9K+6-eFy_zfC-8gE+3r7pcdhgU+3M3g_XdQ_SJdiw@mail.gmail.com/
[3] https://lore.kernel.org/all/20260928154337.154969-1-chris@miget.com/
[4] https://lore.kernel.org/all/094577b3-7b96-72b6-4ef2-a5d1db457401@linux.intel.com/

Thanks,
Anton Karasev
