Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083374A21
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766491250; cv=none; b=YrYv2tRGxf4FgAhywbIbuV6zVbBMtGRgkO3cJfslCe0mm7egseAYHll60VviB0t40yBF8qDdUtFtTBGRwyWOMaq2QyqtSs/uq94w5EJcnm1aRVtTRgfi6MaqAMqkWc9Hxq4SaI8j8kRAugQuv6qQgbp/esQW2oxrQq4KHrdlZ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766491250; c=relaxed/simple;
	bh=vnYzQAEy/Yu7zBQec3b1PgJHPBeSGNbHnXt819bPSjM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=K+Mvg9KgVqnaJX9HvrUqSPFYWQGyZ8QUIjvs0iB2Ln7zTLjkAd7kk74PyJVWAM6Hq2lBmxil6+h2q/M0ZYHMTE44gY/i+dbw0t4fSWukyBIM4tAKu6lzposLqsRw2hEl8lMZz62V4QPksBc/ssbho9inDAbBWqhBD5sf5EaUs5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcPwvC9Q; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcPwvC9Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766491249; x=1798027249;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vnYzQAEy/Yu7zBQec3b1PgJHPBeSGNbHnXt819bPSjM=;
  b=OcPwvC9QpnlQpvdQX+so1IW8dF2Un4UN0tXDa5ts9yP5eVZ/uXGAsBVD
   TNRaj19EEyjLBaVk9A/JwtpweA1K2RWsB3RpkAVpicBRDpNw+FBXouTgA
   HSVZQ7cuKt6KTL8nBhSxvMMu8FZvqIEcdFlnlLp0P48D/MUkaZ/n2juJd
   HlZ6cn0Ohay8PvIJ6uTBzyrfPZOh4VxzDkR5sUbApNkZmpUvRrLcvJlgp
   nqm2iUyfcJ4YZKDTc3XQ8KlH/ib839x8k9v0b5/r1T86LAIRvpR4mBNV4
   CM0ftYF3eEAmH6eJW+E0zGN4DCZ4jOQi6HMNrsPHxctgpTyVr/s5ICohH
   A==;
X-CSE-ConnectionGUID: tObONS1TQVmidPYQBKMOXw==
X-CSE-MsgGUID: jotQ3qhLTu+oBFuh0ZtFUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85754503"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="85754503"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:00:48 -0800
X-CSE-ConnectionGUID: bdIebWWfQLK3jLq+/HeP6A==
X-CSE-MsgGUID: NJyFkQXoSKucRwS2PGrg/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="223250091"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 04:00:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 23 Dec 2025 14:00:43 +0200 (EET)
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
cc: david.e.box@linux.intel.com, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/pmt: Fix kobject memory leak on init
 failure
In-Reply-To: <20251223084041.3832933-1-kaushlendra.kumar@intel.com>
Message-ID: <802187c0-2172-e63e-c855-1d5750b4c2a9@linux.intel.com>
References: <20251223084041.3832933-1-kaushlendra.kumar@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Dec 2025, Kaushlendra Kumar wrote:

> When kobject_init_and_add() fails in pmt_features_discovery(), the
> function returns without calling kobject_put(). This violates the
> kobject API contract where kobject_put() must be called even on
> initialization failure to properly release allocated resources.
> 
> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>

Hi,

Thanks, I've applied this to the review-ilpo-fixes branch but I had to add 
Fixes tag myself as your submission did not contain one. In the future, 
when fixing an issue, please add a Fixes tag pointing to the commit that 
introduced the problem.

> ---
>  drivers/platform/x86/intel/pmt/discovery.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index 32713a194a55..9c5b4d0e1fae 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -503,8 +503,10 @@ static int pmt_features_discovery(struct pmt_features_priv *priv,
>  
>  	ret = kobject_init_and_add(&feature->kobj, ktype, &priv->dev->kobj,
>  				   "%s", pmt_feature_names[feature->id]);
> -	if (ret)
> +	if (ret) {
> +		kobject_put(&feature->kobj);
>  		return ret;
> +	}
>  
>  	kobject_uevent(&feature->kobj, KOBJ_ADD);
>  	pmt_features_add_feat(feature);


-- 
 i.

