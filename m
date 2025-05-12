Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D14029D0B
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 May 2025 10:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747045355; cv=none; b=LRUXNwjfKgruWEnW05DPEHDmyawFJYct8yg9qb0DgoEd6NRuKZZOO9ZrPSu1eZyofQ0WZzj5p7s22hqtpligXundBCyStADQL2q3xsz8r/w3OM+kN/2F7PJmPBakC5cQu5Ri7jK3HitLmPGD+nu/IXjqGHRbDQEXhgRWH7D7QRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747045355; c=relaxed/simple;
	bh=KszSHd5jviN3CCKN6MIaSoQME9wRM0hKxt84+Y3TnG0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mCuNiSK3ZmfvhpFEHjymCWH6doUiJW7qDuyuuxHLXf2Ft4zDhiPWSwu4qcL50umeURu9eRx8pWw9EYN7Gpiom/d9PwH8soUTdBq32rzWaVsJY5feVkLaIpQoeNKgws4qr2nf+z9xXL24IohsBD2qTpY47n0MlJrvgoO4i6nnGYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gLrN4Ouv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gLrN4Ouv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747045354; x=1778581354;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KszSHd5jviN3CCKN6MIaSoQME9wRM0hKxt84+Y3TnG0=;
  b=gLrN4OuvrMnvhBhIxIkO3OVrvZ9yTkQDAo3za3xwNFHdQ8JMG43OCYwx
   lzgbFvr+ZG5PtGc2XMBvDFuq0qjTPTlzgPDEHnyAMDl/PcCNAkeruJ5MX
   y7bsJGqo4ilf5ewZakyvJFcU8IWnstNpL+nqm8Kx+G+jLQ9t9jcNdSm6D
   mX8SCFONK0H8cZEt1h8aiJ3c9as4XC2gVUzYt9D7Mh9vC2GxLasnIjBWY
   zaZ4s6Cr+OW2g7zY7QL4n09Lo9UTHrDS18FJMp6JYK+qvl5OD0E7UCFqV
   JCn6KhHBPbIOnN3jcUjTwS7Bk8X3gK6czMbjVx/RVZSFT4+QQPGGmF60h
   A==;
X-CSE-ConnectionGUID: GaxtbDOqQIWIdr4ZqGcmAQ==
X-CSE-MsgGUID: 1cgcZ0/JTGWivkJy56G49w==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48529283"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="48529283"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:22:33 -0700
X-CSE-ConnectionGUID: QYs9mifiSt6AEKwimjNpxw==
X-CSE-MsgGUID: NSxR4SEAQbG0x9ddoaBVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="138297330"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.245])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 03:22:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 May 2025 13:22:26 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH] platform/x86/amd/hsmp: Declare hsmp_create_sensor() as
 static within #if clause
In-Reply-To: <20250512063710.1364391-1-suma.hegde@amd.com>
Message-ID: <a5a6a5cb-b330-4df9-8173-f8338109ddb6@linux.intel.com>
References: <20250512063710.1364391-1-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 May 2025, Suma Hegde wrote:

> To address the kernel test robot warning, declare hsmp_create_sensor() as a
> static function when CONFIG_HWMON is either not defined or configured as a
> module (M).
> 
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505120930.5xrE7jfc-lkp@intel.com/
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505121359.IvDzAbhN-lkp@intel.com/
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> This is rebased on review-ilpo-next branch
> 
>  drivers/platform/x86/amd/hsmp/hsmp.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 027db8e1de12..36b5ceea9ac0 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -67,7 +67,7 @@ struct hsmp_plat_device *get_hsmp_pdev(void);
>  #if IS_REACHABLE(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  #else
> -int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
> +static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>  #endif
>  int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
>  #endif /* HSMP_H */

Thanks, I made this change into the original commit before seeing this 
patch (but I'd have folded it into the original commit anyway).

-- 
 i.

