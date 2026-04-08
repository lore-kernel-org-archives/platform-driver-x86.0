Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8724D2DC767;
	Wed,  8 Apr 2026 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775689730; cv=none; b=qefOox+N/d+1fSE26EdmLAQdYavANo2QsWbMp97of7qdypGx5Ck41X+uif+GZtphphaO1F2vyLrg1waaVDXqDk/5I/vRijS1s8VlbKQHnvb3LWKa/v/9boCOAnEdUIuF0Zb3guY2BOA+5fYZKKrShee5pWCi3tN5pN+PQNiUi3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775689730; c=relaxed/simple;
	bh=UEFFzhfhSNOeRhdGMgXG3BaZpSYLhk7SN3zXFvdYT7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gReKwqlPLRwewPL86QEDEHXiHq3/dl8UfNgUHfdvDbZ7c3si2WLTESDIzDnVx0f5+OfI4M+4WVrU30X0JhRBVftQXd+xWD5wV6j7uHWA27KbBpQ3Rm5DDnybPeI8Dp6QVHeYVf4UwRNopKcRnaok1x/QRqXSRWc7BoCQqdDSM4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=QGu7uVig; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QGu7uVig"
Received: from [192.168.178.25] (i5C75F404.versanet.de [92.117.244.4])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 0493A2FC021B;
	Thu,  9 Apr 2026 01:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1775689725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T9mkXqSxlJpr17vbkmBn/hKgesQw2p04fiQrIwb+Fow=;
	b=QGu7uVigvKVfwfcE4rU5DEAbXQVDTDRwcUzLqcX/B/5obGsqQbJ81xoHfeTiJmNGySGWnq
	rLZbQQHyvAQWg+TMJUGMm04J6Z3NnyiparorRjF5kvq1TmNmd0izC3vgAGdWwAQmy2XkvY
	Mv6NSvgI8InJ5g1MOxI2piALy+t71Rk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b184557e-545d-4829-847e-b52655757e10@tuxedocomputers.com>
Date: Thu, 9 Apr 2026 01:08:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86: uniwill-laptop: Fix behavior of "force"
 module param
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260406193653.7799-1-W_Armin@gmx.de>
 <20260406193653.7799-4-W_Armin@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260406193653.7799-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 06.04.26 um 21:36 schrieb Armin Wolf:
> Users might want to force-enable all possible features even on
> machines with a valid device descriptor. Until now the "force"
> module param was ignored on such machines. Fix this to make
> it easier to test for support of new features.
>
> Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
> index 5551f193c2c1..7c7ea0e76966 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
>   		if (!force)
>   			return -ENODEV;
>   
> -		/* Assume that the device supports all features */
> -		device_descriptor.features = UINT_MAX;
>   		pr_warn("Loading on a potentially unsupported device\n");
>   	} else {
>   		/*
> @@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
>   		device_descriptor = *descriptor;
>   	}
>   
> +	if (force) {
> +		/* Assume that the device supports all features */
> +		device_descriptor.features = UINT_MAX;
> +		pr_warn("Enabling potentially unsupported features\n");
> +	}
> +
this should already exclude the potentially harmfull "charging threshold"
>   	ret = platform_driver_register(&uniwill_driver);
>   	if (ret < 0)
>   		return ret;
