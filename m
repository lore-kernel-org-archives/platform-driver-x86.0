Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E52A762F7
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446832; cv=none; b=e2ITkF0MIpTSPcyjXHnlRFbZHUug2jPBWqL1KPBzk0Y7OpO4rygPjbx6hzCXlQhf5dMPsPwPxdlmK90UfhfCfvZIq54dvtrQHFGx4AZMtk9VwJjeqjpPUcJZHdzYAEkc4l45K1sN5XJemuxVJM7dxo3HnIIKkeVb4GbmptAe9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446832; c=relaxed/simple;
	bh=zdExDuJSG95EX2zHd1TaNUnw9twURX91SQkvBv//7e8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SB91mXEh7HEMFa3syk/vK7+laiuxHbXksuMvKqW0j6dAsZ5dKBBxbgV6LM1EI4UelkRYcU4eTbl+GyXhaRzKgFMAQ6cXGAfYTl/BrhtlydLV4QpALVzOX/xMY33Rewq0EPFJ6+YlsZ+6zGoM3EdGvgF8tZYAoOJXM/uQYyXdo00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dUY90XLj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUY90XLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734446831; x=1765982831;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=zdExDuJSG95EX2zHd1TaNUnw9twURX91SQkvBv//7e8=;
  b=dUY90XLjC8tVLNHMKuN10glLCXZ8M5hxtx5yyelOh4+voZyCkRrCWFyZ
   QUpQcSpAeKn5NgZG3QSXangWLuCWSCCFRj8rU3dKK3EKQxKlinYQk/dhh
   Zb9n3txBnw2PkHWGMB00graZ2KbUIes4xDrompDa2vG6eHlaDZJmpMWLT
   baTNYESF6G0Z674lH9unUXbYMcCMo08QmRXqVCxgWfN8X4uYjMn5QIy71
   nJ/eARy8cYyRdykcg6WVqjovr17qiTZFy76s7JzVnTxjd65oDHA9FJqsm
   J2dkBewOP80pGUadfkAQVtDUIbTF+ZWmtgsqbYZmBwBIv3hnmlLYmd+pN
   g==;
X-CSE-ConnectionGUID: 1iQvrZDETPGQbOTiM/ukxg==
X-CSE-MsgGUID: 8bh63U7ASru3G6r0ufsl0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35024077"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="35024077"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 06:47:11 -0800
X-CSE-ConnectionGUID: HLAFrMETRMuV956SP19w9w==
X-CSE-MsgGUID: Tq1RSMWuTFKAAZJD45nJWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="97334627"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 06:47:08 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 17 Dec 2024 16:47:05 +0200 (EET)
To: Dmitry Antipov <dmantipov@yandex.ru>
cc: Lee Chun-Yi <jlee@suse.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] platform/x86: acer-wmi: fix fan mode setup in
 WMID_gaming_set_fan_mode()
In-Reply-To: <20241216132400.302003-1-dmantipov@yandex.ru>
Message-ID: <724c98ef-848d-ecfd-63d0-18fd2a6b89f4@linux.intel.com>
References: <20241216132400.302003-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Dec 2024, Dmitry Antipov wrote:

> In 'WMID_gaming_set_fan_mode()', most likely the (whether CPU or
> GPU or even total) fan count is not larger than 31. But still
> cast everyting to 'u64' just to be sure that there is no integer
> overflow when performing left shifts. Compile tested only.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/platform/x86/acer-wmi.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index d09baa3d3d90..9be6176c0076 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1504,17 +1504,17 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
>  	int i;
>  
>  	if (quirks->cpu_fans > 0)
> -		gpu_fan_config2 |= 1;
> +		gpu_fan_config2 |= 1ULL;
>  	for (i = 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
> -		gpu_fan_config2 |= 1 << (i + 1);
> +		gpu_fan_config2 |= 1ULL << (i + 1);
>  	for (i = 0; i < quirks->gpu_fans; ++i)
> -		gpu_fan_config2 |= 1 << (i + 3);
> +		gpu_fan_config2 |= 1ULL << (i + 3);

Now this change doesn't make much sense. You assumed that fan counts can 
be large which I find highly suspicious to begin with. Reading the code
easily reveals neither is never > 1!??!

But lets entartain the idea those counts could be large...

What about bit collisions if cpu_fans + gpu_fans > 2?

>  	if (quirks->cpu_fans > 0)
>  		gpu_fan_config1 |= fan_mode;
>  	for (i = 0; i < (quirks->cpu_fans + quirks->gpu_fans); ++i)
> -		gpu_fan_config1 |= fan_mode << (2 * i + 2);
> +		gpu_fan_config1 |= (u64)fan_mode << (2 * i + 2);
>  	for (i = 0; i < quirks->gpu_fans; ++i)
> -		gpu_fan_config1 |= fan_mode << (2 * i + 6);
> +		gpu_fan_config1 |= (u64)fan_mode << (2 * i + 6);
>  	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP_TURBO_FAN);

This line tells us gpu_fan_config2 can only be up to a GENMASK(15, 0) 
field so if the type overflow problem would be real, there would be much 
bigger problems with this code than what this patch is trying to "fix".

When you use an "automated" tools to find "problems", you have to read and 
understand _all surrounding and related code_ before submitting patches 
like this. You could have easily seen that those counts are never larger 
than 1 and that the patch is not a real fix. Please keep that in mind 
before sending more fixes originating from automated tools.


(And yes, this code should be converted to use FIELD_PREP() and GENMASK(),
and the fan auto/turbo modes named with defines, etc.).


-- 
 i.

