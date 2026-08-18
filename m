Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91A3E2ABA;
	Tue, 18 Aug 2026 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787051959; cv=none; b=Lhd87oApAIAdMHJIMZ3CSFAtJaNXDwOyBC6XXVSRIfP9D/5dgd7oCjWaAqL8izQWoUwYh4y9kbNQVkjGAdfHdM15ER1L+1FB0XDLFJD0okL6WxmtVKu75R3JlJI9zqVawtKebUCdUaCvJBSqYyJ8NAE7yNxa4PBut7fjgBNxnhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787051959; c=relaxed/simple;
	bh=cG8tyCMr3Cy2JJ2XexByS214Y0+BNTbsopdstItC+b0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jPV8xgtgV6qJvubQMD5hMgXDncj1KVe5OkQI+DouM5ydmI1fPe5LByPOXb0O2Hc7ZOY/93Qcf+iu/fJwJbYq0Xdzpkgv2sv0OG49wEQUYn1YWb00cKtJXe/FJOTvQ8TPbBdMRQrBlcn5KUaAFjlyD99RX02d8KVBIxd1aYE+wtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QY9JuSov; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QY9JuSov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787051958; x=1818587958;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cG8tyCMr3Cy2JJ2XexByS214Y0+BNTbsopdstItC+b0=;
  b=QY9JuSovymhL6hljbHJKBH/SqvNUBnb15ZNkeIne0DWWiZ3eXCZs++Nl
   8QVdsWx3wmuLzkyE/dO4LdV5qiK8TDItxhVKbWGRs40kqtmjWpFfyHLpS
   /h4W4LO2KGSC5f7rjOAGFc+xPdyC4dbg+yZ+QVdHTrpu46Wzpz29O8fbp
   T3dx/WT2+eZb2YYt7vVYODwlpfByp1jKutF5PNXDeeOrZraPBGC2mrfYw
   ilY/7Bf5O+mXYz+8m4rqis8qBk7L+2Gl9cY4lKwe/MktCqEDEjtfdR73V
   WASd+8pLj1MoL/HBC4YVRhTxtcP+BVVXuJ6fe2aYnymoCavxjO4oGbLdB
   w==;
X-CSE-ConnectionGUID: R09uEm9OQs+h/UFTwoCuwg==
X-CSE-MsgGUID: xXB1SHThTlaiXZl6668l4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98131694"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98131694"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:19:17 -0700
X-CSE-ConnectionGUID: s25X1BEWSpG9ijFn0qpx5g==
X-CSE-MsgGUID: SQCqEc3IRA2yBmpt7ySxww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="270420058"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.38])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 04:19:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 18 Aug 2026 14:19:11 +0300 (EEST)
To: Mohsen Tahmasebi <moh53n@moh53n.net>
cc: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] platform/x86: acer-wmi: allow hwmon without
 predator_v4
In-Reply-To: <20260813154939.9850-1-moh53n@moh53n.net>
Message-ID: <894d18f6-6f17-5d3b-00d1-65f395fb23de@linux.intel.com>
References: <20260813154939.9850-1-moh53n@moh53n.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Aug 2026, Mohsen Tahmasebi wrote:

> Some Acer laptops expose the same WMI sensor interface without necessarily
> supporting other predator_v4 features.
> Currently, ACER_CAP_HWMON is enabled only through predator_v4 quirk, but
> this quirk enables both ACER_CAP_PLATFORM_PROFILE and ACER_CAP_HWMON.
> 
> This commit adds a separate hwmon quirk so ACER_CAP_HWMON can be enabled
> without other predator_v4 features.
> 
> Signed-off-by: Mohsen Tahmasebi <moh53n@moh53n.net>
> ---
>  drivers/platform/x86/acer-wmi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index e0eaaefb13d..83448561189 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -403,6 +403,7 @@ struct quirk_entry {
>  	u8 turbo;
>  	u8 cpu_fans;
>  	u8 gpu_fans;
> +	u8 hwmon;

Hi,

Thanks for the patch.

Why is this u8? This should be bool.

Some others should have been too. If you want (not mandatory), you could 
add patches to your series to convert the other as well when prepare v2 
of the series.

>  	u8 predator_v4;
>  	u8 pwm;
>  };
> @@ -421,6 +422,9 @@ static void __init set_quirks(void)
>  		interface->capability |= ACER_CAP_TURBO_OC | ACER_CAP_TURBO_LED
>  					 | ACER_CAP_TURBO_FAN;
>  
> +	if (quirks->hwmon)
> +		interface->capability |= ACER_CAP_HWMON;
> +
>  	if (quirks->predator_v4)
>  		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
>  					 ACER_CAP_HWMON;

Please properly split .hwmon completely out of .predator_v4 so that quirk 
entries that have .predator_v4 also use .hwmon.

I'm on the borderline if also .predator_v4 should be renamed to something 
related to platform profile.

-- 
 i.

