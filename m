Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DC83CAA57;
	Fri,  3 Jul 2026 12:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783081720; cv=none; b=a6ggsG1jHlNo/hdEm+x/pqOlj50Mc0lNW3zR9hY/qaaBtz4oSx7VSwkZ/3o/U6f5hcRv9RCIF6BRrubibn8mSaBeuc50Dj/Y1SyXLoF9JieQu06dHc/IdNcMfHJ0RyPERdlGlY0y0r3UYhNMYpZxrx0t+UKwAAOSVrGhCSu3978=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783081720; c=relaxed/simple;
	bh=hoc7AW4AkJEYkJ7cSx1mYrev1SDmcb10P0QMdRiFY1A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Vd1Y4cRrQqPSzRyK0BBDyJ3B8k0KqA4Sp36NpZULBD5U/DmXf4vPWz/TlevRUR56Uz2NVa7MMBdDkjNPFfxc4I1ycNbM7Q+/J2p9SwXBIUU9s5N9bGFPzZ1pV2E1bdZAmYm3/zFJXPP49Ns+lEV9XbEXoDHsRwOOb/tdsp8Iu54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYl5zNoc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYl5zNoc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783081719; x=1814617719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hoc7AW4AkJEYkJ7cSx1mYrev1SDmcb10P0QMdRiFY1A=;
  b=AYl5zNoc3kkrPWOeLonB0Dkp8cRMPznioeW1htKFR6pBYrSoayvrEIOL
   2+qBrQdhK4oF7gZOgBErNiqT55CrgXLo/VzBKie4FPpADI9rVbsWuir30
   87BpeE86JDznfLTJsH7ZU6+kHd/F8Rbo2oYZUY/QnZ7hrZkphsA140fEa
   G5AXHEQACjryV5xeh6zFeWh7WmAQalIW69Pfs1ZtCrcv2qXyS9YiKPCvh
   8wVDwMOTynWC2WmfaLpZVLi+Ea1DP0KpyVa1IJ6OiEmMviP+Gc0cGtOFS
   kBwGmaY1YeOib9+RdtN1LsfF42407FoF4anZPbTx5HiCs6XAAiqf47Nev
   g==;
X-CSE-ConnectionGUID: hGKtdfOiQLqGDM17v+Doqg==
X-CSE-MsgGUID: ySg7ADpWSqSjJxc3XACkQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="86384149"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="86384149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:28:38 -0700
X-CSE-ConnectionGUID: X/JtPLzLR4iKmCHjfEfO7g==
X-CSE-MsgGUID: +ofYWM/9ThCJeICJh9HRIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="257428993"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.152])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 05:28:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 3 Jul 2026 15:28:31 +0300 (EEST)
To: yahia <yahia.a.abdrabou@gmail.com>
cc: W_Armin@gmx.de, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
In-Reply-To: <20260622191838.23187-1-yahia.a.abdrabou@gmail.com>
Message-ID: <2df479ed-7a3d-7f89-9f2c-77d5a8270837@linux.intel.com>
References: <20260622190409.17268-1-yahia.a.abdrabou@gmail.com> <20260622191838.23187-1-yahia.a.abdrabou@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 22 Jun 2026, yahia wrote:

> From: yahia ahmed <yahia.a.abdrabou@gmail.com>

So do I get it right that the conclusion of the discussion was that this 
still required?

If that's the case, here's things that need to be fixed:

> Fix a use-after-free error in wmi_add_device()
> where if a device_add() fails, it will forward
> the error code to the caller function parse_wdg(),
> which then frees wblock, but doesn't remove it From
> pdev's list, thus if pdev were to call it, it will
> call freed memory and result in a use-after-free

Please add the final stop (.)

The lines are too short, please reflow the paragraph to 72 characters.

> 
> Signed-off-by: yahia ahmed <yahia.a.abdrabou@gmail.com>

A Fixes tag?

> ---
> v3:
>   - Fix corruption in v2
> v2:
>   -  Fix use-after-free in wmi_add_device() by using device_link_del()
>  drivers/platform/wmi/core.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
> index 529825dcfbfe..1afc4d12bdfb 100644
> --- a/drivers/platform/wmi/core.c
> +++ b/drivers/platform/wmi/core.c
> @@ -1268,6 +1268,7 @@ static int wmi_create_device(struct device *wmi_bus_dev,
>  static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
>  {
>  	struct device_link *link;
> +	int ret;
>  
>  	/*
>  	 * Many aggregate WMI drivers do not use -EPROBE_DEFER when they
> @@ -1282,7 +1283,11 @@ static int wmi_add_device(struct platform_device *pdev, struct wmi_device *wdev)
>  	if (!link)
>  		return -EINVAL;
>  
> -	return device_add(&wdev->dev);
> +	ret = device_add(&wdev->dev);
> +
> +	if (ret)

Please don't leave empty line between call and its error handling.

> +		device_link_del(link);
> +	return ret;
>  }
>  
>  /*
> 

-- 
 i.

