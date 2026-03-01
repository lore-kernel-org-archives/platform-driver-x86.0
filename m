Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F1363CB
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Mar 2026 18:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772390739; cv=none; b=hfNjM9T/gFgjum6pX5XbdbfolnglL2zLkyKBaa4ufGiIKiZFQV8hMwpYWjXasi35UaGTZXME09kAVuk67QRR/Hk5R2yIcvZtflNZUCJYf4FNBE1u60APPivvHmfSHPDXMgqypRpwjHH4WPzEKx8sc/6RTh8UiowJ5bAnAQJ3i10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772390739; c=relaxed/simple;
	bh=Q6ldH1BEngFgOnhEU0bLBrOKdxHRek4CQLCW0XbAkhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gh3a2j20Rb05WF6zVXQMm+YBQ8GrmE1MHR0T+9tiWs69qUDIVmziHZUPV81NmvVJClTtOfhwUsdW7lSYhxbi7V1zanja6k8MPO2PLteYNeTBls39atUpyggMcBpx9iByuhbpajGAasJncf939cgJVnjEKxahEdYf8HK67JiyCQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=IwaEyEy0; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="IwaEyEy0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZlyiHLTtOYPShmfSZP3ZRUPDHND7Ji04LS9gTMatMrQ=; b=IwaEyEy0WLJVal6GzR08zxs4Zb
	h3AJVpsYydXYPO7xP7lGOjezBGIjcAb63+cxrOsXNRdi83nY4XLbSsU4V81uXpLKRhu/yNY/BdHN1
	camN/8T+nBJiGM8zT8XZPRtNOBSpRDEwHbFDVsZ+rOlMmxkXGK5Uaj1YSf1uFGCK36Hl7r8ekJHBG
	32cIa9ydMlP9yStj1v9lhHT0gCJq0XL+kfMjJG/1TKLcwXgYLOTjgsDO0MtU0WsT69LUAfXir143a
	5GvuaRAJ6/gDou56Q1mDRszwvGvR5OHmOznqavhqJ4mmphCJuzDhlCGGNWwl1G8w3piQ8Up8etMGr
	zwBWAdwQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwlnK-0000000BnEn-3Xd8;
	Sun, 01 Mar 2026 18:45:34 +0000
Message-ID: <98a467d4-c0ac-46ca-aa59-00b392d6a30a@infradead.org>
Date: Sun, 1 Mar 2026 10:45:33 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] platform/x86/amd/pmf: Add util layer and userspace
 misc device interface
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, mario.limonciello@amd.com,
 Yijun.Shen@Dell.com, Sanket.Goswami@amd.com
References: <20260301131124.1370565-1-Shyam-sundar.S-k@amd.com>
 <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260301131124.1370565-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/1/26 5:11 AM, Shyam Sundar S K wrote:
> diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
> index 25b8f7ae3abd..ad21f679b8ab 100644
> --- a/drivers/platform/x86/amd/pmf/Kconfig
> +++ b/drivers/platform/x86/amd/pmf/Kconfig
> @@ -30,3 +30,13 @@ config AMD_PMF_DEBUG
>  	 in the PMF config store.
>  
>  	 Say Y here to enable more debug logs and Say N here if you are not sure.
> +
> +config AMD_PMF_UTIL_SUPPORT
> +	bool "AMD PMF Util layer support"
> +	depends on AMD_PMF
> +	help
> +	Enabling this option provides a character device for userspace to capture
> +	PMF features (Smart PC Builder, Auto Mode, Static Power Slider, Dynamic
> +	Power Slider AC/DC) along with PMF metrics from the AMD PMF driver.
> +
> +	Say Y here to enable it and Say N here if you are not sure.

Missing indentation of help text.
from coding-style.rst:

10) Kconfig configuration files
-------------------------------

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.

-- 
~Randy

