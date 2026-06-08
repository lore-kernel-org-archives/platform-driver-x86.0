Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE4A28980F;
	Mon,  8 Jun 2026 12:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923349; cv=none; b=WW0ru1D0jIfMt4YEEwSYp14ZWPP76DcUI3Z3Q910EC1ON7Lf6KnrvD4zgKzF0tL4W8eF5ycjMBC/z8oYfKKpy5Zf0+YTXu7l78PSWeMls8um3eKzS1N2KhVNXA4d9Zpy2v8XVX8Pj1kSJM1KYHFu+sixSNeROuwuIVn5womA/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923349; c=relaxed/simple;
	bh=yybuQY2cYeZQf3HRcnXPuLQddSzTay/aS5YWm03KGBo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DqmmowJr44Zh4uprKtvVnjiMyisZYAWTXChugcQv+De0/juX0lSL2vEZlHeRhv2bOnCMWck/b60hlMdafF38FuEiQHMQCXlwPQk2cX+9R/hxPRBkqo29Nf1IAr58xzNd34aZAY1sJw/MtMWcNZNRdU8l+D7q7L9IKfK82/yZx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bjEdxmtU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bjEdxmtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780923348; x=1812459348;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yybuQY2cYeZQf3HRcnXPuLQddSzTay/aS5YWm03KGBo=;
  b=bjEdxmtUcOjFIFHIgN3ddJ4k6VCviAQJSQaoExpIQuNnsS/PJmeA+KS3
   +dcS2QImS5l4vyDLJ4y9PDx9cz24CKSlmFoFSsrRz3xmqR4rstVjayny+
   z0dpVkqAwSMiFkblkJeLajlmbZEC84WfGqj7UvZ5IKCHuFS8PP1/UUUaw
   wRifRohMurhgpm05lIwTk+020V8UgR9me8qbwebIfrXzHjaQgbHC/Wd5y
   dcD2EM5q/Ck+o8SLVBN7Kn2l2wTYzRXMecU2b0A+pIHJqA1pSy9880e1H
   tfZY+rgy5zrzV061ceM0qQ+aqCw6KYKXd7Kc0fhcspl5jxf/Z4u5cZIoR
   g==;
X-CSE-ConnectionGUID: zcBcSRExQ2q9AHaIjUobeQ==
X-CSE-MsgGUID: 4PrnY6+vTTShky0sGczJNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11810"; a="80684042"
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="80684042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:55:47 -0700
X-CSE-ConnectionGUID: do+IGqgcQ4eseN9LjrNgDw==
X-CSE-MsgGUID: 9kvwVEJbSJWYmRx/ml8b6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,194,1774335600"; 
   d="scan'208";a="244689823"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 05:55:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 8 Jun 2026 15:55:41 +0300 (EEST)
To: Julian Haarmann <julian.haarmann@student.kit.edu>
cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J . Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: lenovo/ymc: Only match lower byte in WMI
 lid switch response
In-Reply-To: <20260531204937.62049-1-julian.haarmann@student.kit.edu>
Message-ID: <17d6f718-6653-a42d-5d12-d21c19874936@linux.intel.com>
References: <20260531204937.62049-1-julian.haarmann@student.kit.edu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 31 May 2026, Julian Haarmann wrote:

> On newer Lenovo Yoga devices like the "Yoga 9 2-in-1 14IPH11 - Type 83SE",
> the hinge switch WMI query returns extra data in the upper bits
> (e.g. 0x50001 laptop mode, 0x50002 tablet mode, ect.).
> 
> The driver previously checked for exact matches (0x01 laptop, 0x02 tablet,
> ect.) causing newer switches to not work.
> 
> Mask the WMI query result to only match the lower byte and ignore upper
> bits.
> 
> Signed-off-by: Julian Haarmann <julian.haarmann@student.kit.edu>
> ---
> 
> Hi everyone,
> 
> I just recieved this laptop and am trying to get it to work.
> FYI: To get tablet mode to work fully you might need to extract the
> Intel ISH firmware from the Windows driver.
> This is my first patch, so I hope the way I've solved this is up to
> standard.
> 
>  drivers/platform/x86/lenovo/ymc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
> index 1b73a55f1b89..ffeca452b392 100644
> --- a/drivers/platform/x86/lenovo/ymc.c
> +++ b/drivers/platform/x86/lenovo/ymc.c
> @@ -87,6 +87,9 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
>  	}
>  	code = obj->integer.value;
>  
> +	/* strip upper bits (e.g. 0x50000) on newer devices */
> +	code &= 0xFF;

Thanks for the patch.

As it looks like there are now multiple fields in the value, it is better 
to add a define with GENMASK() and use FIELD_GET() to extract the field.

Please also remember to add bits.h and bitfield.h includes when using 
those macros.

-- 
 i.

