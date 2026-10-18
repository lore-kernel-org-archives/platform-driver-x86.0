Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708FE314B72
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 05:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792301459; cv=none; b=eXDlKLpP5JjI79UTqG4TNUaMF1dapBbpxQuWYdp7Acm705kPv6GlGjSndBrhf8ej2/dnVhlMplVdDBSFh929mKRZgGBOW3naf2d6LRrHG4wE9XfqdygENpr4pwdWDPi4bNM06kFzp25DlOKmUyr2MKAfyGBU0LOdYhsRbbyRzqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792301459; c=relaxed/simple;
	bh=FcZ9RRO/SMMWE81u2/SJIHoGw8K+8+ypQ8z6uh8xyk4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=piS2fCeY4OVf3S7xpOePqyaEl4UAlfhGcmrFeYuApnAh0yCLII3tFHnPKXF7tgACnpKE2FEB4XFjZ3BtCGMlKniyb2wNV/RHuoR4/ciNvpsmiEv8/npjGVMYH+BjkWFjD+r6A2azaGdY6mWY94SKjtK1UQQtX4XlAR41rzuQi3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw1eMSaT; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw1eMSaT"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2285975eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 22:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792301457; x=1792906257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9FP8MReeBZgusLeHETDjLoA5Qgo2lDJdxzRHhcUPREg=;
        b=bw1eMSaTR35xn1IJIA/Pm1bAWDCuhQijcvlS+bYxSIX3mQ6+TRlusZmpZ8xpTP1VIw
         /ayqYSjy9H4zeVcCg03g7FAfbqgfXAqiIgu5gS3PXtL++3aO/d6E6C9wQDazH01oc9FH
         giP8BAeOABs8PmLvm7q3ZfzI9fy4eEnSMAVWZAiuzDy/VUoCuOovYviGLxeesfvJFCTA
         LncMc5OToy5rm2U+rQ4jlgKeShe5r5+vM7Ky3OcmMttCjkhQG7twyT9XPOK8ZaZ+KJuA
         g1i3NwiH4jYcGgFTUcDURBTtMJeqXID1upigaLyKYOrT1kVm/t8kPa4n87UUoFXNs65I
         wArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792301457; x=1792906257;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FP8MReeBZgusLeHETDjLoA5Qgo2lDJdxzRHhcUPREg=;
        b=1ICSCV5HqTBgs8ny0Va8IYnXkw5g0brqHvt4zvacR0/pTNUMBPj999rzhIhouBPFTJ
         TWyOyZycTNGHxsXKa+8gk/J/q7tofDeYTW72m/JlRRGRQOL8RYPUtPQo8zha/K5E+dha
         eE40V8ukuDmE3K5RQq8Jq2MTUaxSVNYp20AUfe7Eua1l3Hh8Nr5v1bRAuk/sOQ0zHSLA
         jAMJoBd6obeMUr8Udo9AE7pNOX6xr6BlkpRxjyhpMjrWbC06gVO29djgmKwVexCQbXDP
         XmRZ7h1398aUSds47KN75DM/XjhExxYLJRpYetMMGIn2lTLQGWTv2LfFdt5nl6Qc+jmJ
         5JaQ==
X-Gm-Message-State: AFq9FYKkzp+ChiJuSSgCCyEezG7Z+OXvuy/EHYX9gA+Zfl5TSP8jrcO2
	3bkh0WVrFXmovS2SfqSj6p9ho4Ys5+4dBNey0W1sx/0w0oBmCduEKcYh
X-Gm-Gg: AYBFou2D3wRJs+3FKtIW+DfoqgIA23OgTl8Rqy8/wKu9wGFjAk21YU4S7+MlX2oyKUZ
	+tJ+UUPCyXvC4epUdKY4TUMMkNFwy984V/MvS772oR6sIMF1s5qEoRW5M4XhNRTtKrYIDYG1AuO
	7pSP9h3PLXzBdTn6VLdOejR+qjTQs8/bZ9XmzK1ySGmarmckQpESvtIZXD4MQgY18E1gy8zabLB
	Mw/IzW2nnIVTxskV9mqDd8eAdYW3/qj/Mc6ZFz3JsoNEcWxxV37GsZz6sFWYoJzHw9qeJ8Iku43
	w+HPAK/cuBLCo51y7NTQiApU8D96Mvqc8B+ATSkLVyly8csgTxDXujYJmi9+7QiRNYmoWeXJbFx
	YfZsQOmpA1kpAyiLZnZZmIwz5UzmIUP1HPiplx1FscHtp58gFmWOK0zNmelFaz1CiVLApXLUoKR
	i2LH+cUKmwKHlITLPY0ZDEYxP6yuTCV/WsrSX3KTIFsgPyNIuk/yopnM8CMoGPhuJ5IO+S6x5nX
	buVe3JG7U4bgnpZesDzn9WsdjYyfJYc8OEq46NEafvVuPgv99WAZ4Jwrwc284xmBOYbkDickns/
	QOs=
X-Received: by 2002:a05:701b:2618:b0:143:297c:276c with SMTP id a92af1059eb24-18513107afdmr6091679c88.33.1792301457336;
        Sat, 17 Oct 2026 22:30:57 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm17356480c88.10.2026.10.17.22.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 22:30:56 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:30:58 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/2=5D_platform/x86=3A_ideapad-lap?=
 =?US-ASCII?Q?top=3A_Fix_unexpected_charge=5Ftypes_on_probe?=
User-Agent: Thunderbird for Android
In-Reply-To: <20261018-ideapad-fix-charge-types-v1-0-db52e3bb061a@rong.moe>
References: <20261018-ideapad-fix-charge-types-v1-0-db52e3bb061a@rong.moe>
Message-ID: <DB59F3C0-040F-4663-9750-C387963DCFE3@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 17, 2026 4:16:17 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>It was reported [1] that some unfortunate combinations of BIOS and
>Lenovo utilities (e=2Eg=2E, Legion Go 2 + Legion Space) may enable Rapid
>Charge and Conservation Mode at the same time, which is very out of
>sepc=2E
>
>If both are enabled during a previous Windows boot, ideapad-laptop will
>see both bits set and correctly shout "unexpected charge_types"=2E
>
>A planned BIOS update will address this=2E Before that, if unexpected
>charge_types are encountered on probe, enforce [Long_Life] to prevent
>the device from operating in an out-of-spec state=2E On check or fix
>failure, skip registering the battery hook and the conservation_mode
>attribute=2E
>
>Note: the switches never enable themselves autonomously, so there is no
>need to fix it during runtime=2E
>

Hi Rong,

Note that this isn't strictly true=2E A known bug in multiple Lenovo devic=
es is that querying the EC too quickly can cause it to reset into an invali=
d state=2E I=2Ee=2E some games run under wine for check the state of the AC=
 adapter multiple times a second=2E In such a case they can reset and then =
report both modes on=2E I don't believe the device re-enumerates in this ca=
se=2E This is documented in the driver [1]=2E

Lenovo ha mentioned to me a BIOS fix for this issue will be coming for the=
 Go S and Go 2 at some point as well, but this isn't exclusive to Go models=
=2E It may be prudent to fix any time an invalid state is detected=2E

Thanks,
- Derek

[1] https://github=2Ecom/torvalds/linux/blob/32c52ec87d6245ee2d12ed5dd509e=
40062939b50/drivers/platform/x86/lenovo/ideapad-laptop=2Ec#L286-L296

>Fixes: 90430ea98f55 ("platform/x86: ideapad-laptop: Add charge_types:Fast=
 (Rapid Charge)")
>Closes: https://github=2Ecom/ValveSoftware/SteamOS/issues/2876 [1]
>Signed-off-by: Rong Zhang <i@rong=2Emoe>
>---
>Rong Zhang (2):
>      platform/x86: ideapad-laptop: Factor out charge_types methods for i=
nternal use
>      platform/x86: ideapad-laptop: Fix unexpected charge_types on probe
>
> drivers/platform/x86/lenovo/ideapad-laptop=2Ec | 113 +++++++++++++++++++=
+-------
> 1 file changed, 84 insertions(+), 29 deletions(-)
>---
>base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
>change-id: ef28eda4-ideapad-fix-charge-types-067d46d08945
>
>Thanks,
>Rong
>

