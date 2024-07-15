Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411E186E37
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721036371; cv=none; b=aOL6PTqIco9HDsrUFy/YLqdfI+Nc9HgKPauBJwMO09ziB5Y/mB8cY1LHbDXX0UVIDsBndHFDKZxbCH4YYYWxQ/Q5KVoDLf/mj5nUzYfCstVr8dKySOp7Tg4WEUyQh1t0CO6vCQzYCG0F+Ib9f+EPEHeF9ckRdsEOUlU23iXcF1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721036371; c=relaxed/simple;
	bh=YRHnu1OBQLmhC7SfIYBvefTame5RVN7nN2wFyO5uD+E=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dRWfaDRCK7dze8zLvot0DFfzVK9hleb9H+NuUv1CgcSNaWypz3vhDr6MlPsBHjSs98wCH16TaSwvmJTYrGQ/XwgC1dYlCxYouP+HCzuvBk4pw48pb44x+eBMPy0zBfGv17ypypmAyLWDQlPMa6PHHdVTQir4pAc4zjYUf85kUh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=itpW7XQ6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="itpW7XQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721036370; x=1752572370;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=YRHnu1OBQLmhC7SfIYBvefTame5RVN7nN2wFyO5uD+E=;
  b=itpW7XQ6oZUWpCeO6kXkOSj/RISJsnsXTiDeF/HhbpL9VoaXCVhHM2Ap
   5Qn08ADZUHcbAsmfd4X/2iN8YbSoOuftM7CojhBWbHb6hT3J2h3MVSQaa
   8JVCc1H1dBlKeuCCYqP3hNLgIYkEWAGmWw5y9DLmpE26NGXKa0WdTNGn8
   ztZofi+GXUCdJWaMR4LRajxmnbpYatZfuXPJZtT7FYNdr8NzP1Sm7/dfa
   dMvWSZVG+YjsOQrpJcgSoLKhSjjlOC4aIsG1I4rpRpcYEyBcRoFA7UAiY
   IEZqCHZv2wKnOlnM6kIBSeW2v9tvc+0n3mwNyqEkrVP6jq8dNspPu4gif
   g==;
X-CSE-ConnectionGUID: N3dtPKEZRIeO+iFs8LVpFQ==
X-CSE-MsgGUID: rn8CRhiDSn+dhSkgCxOhzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="18118843"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="18118843"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 02:39:29 -0700
X-CSE-ConnectionGUID: BPKXBqxUSvyzhvO1MVNn6g==
X-CSE-MsgGUID: NxIehBR7TImoewfkqtg4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; 
   d="scan'208";a="49302290"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.131])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 02:39:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 15 Jul 2024 12:39:22 +0300 (EEST)
To: Alexis Belmonte <alexbelm48@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, W_Armin@gmx.de, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Fix implementation of the
 platform_profile_omen_get function
In-Reply-To: <ZpFnV8w1558BW7iZ@alexis-pc>
Message-ID: <d616eb65-dd32-faff-2fb9-686305c1810b@linux.intel.com>
References: <ZpFnV8w1558BW7iZ@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jul 2024, Alexis Belmonte wrote:

> Fix ill-formed implementation of the platform_profile_omen_get function
> introduced by patch "platform/x86: hp-wmi: Fix platform profile option
> switch"
> 
> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>

I took this patch but there were a number of issues with it I had to fix:

- Reported-by tag missing
- Fixes tag missing
- You didn't tell in the commit message what was wrong.

-- 
 i.

> ---
>  drivers/platform/x86/hp/hp-wmi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index c8bcb3e2b344..876e0a97cee1 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1238,8 +1238,6 @@ static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
>  static int platform_profile_omen_get(struct platform_profile_handler *pprof,
>  				     enum platform_profile_option *profile)
>  {
> -	enum platform_profile_option selected_platform_profile;
> -
>  	/*
>  	 * We directly return the stored platform profile, as the embedded
>  	 * controller will not accept switching to the performance option when
> @@ -1253,9 +1251,9 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
>  	 * See also omen_powersource_event.
>  	 */
>  	guard(mutex)(&active_platform_profile_lock);
> -	selected_platform_profile = active_platform_profile;
> +	*profile = active_platform_profile;
>  
> -	return selected_platform_profile;
> +	return 0;
>  }
>  
>  static bool has_omen_thermal_profile_ec_timer(void)
> 
