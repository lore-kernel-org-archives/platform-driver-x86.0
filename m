Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DEA1514C9
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Nov 2024 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730822648; cv=none; b=pOAvTqLBYFepbChtBkgIiXKfceHxdnukJYA/wHY8RgoUZkR+ONicqn4pjePeN0Smds4gLsVuZJnZ8P+1klWBcf+QRtmfJ1FXR//OMCfA83TlsbKRqCepgG270xgL7D9L69QgGDjSQyKkLHhW4PiusFB8DyagXrTrDldppBHUPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730822648; c=relaxed/simple;
	bh=iiPJ0C4NXTbVKdY57cVNW8TgkMPKWSxxBGysKIeNhFg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dphrot1g6KbAMMspVEtEBIgdfazoI0Q4LxzMwfw0/YxDR3n1DmkvVsiNTEa42pI4IddsLhfSbLdMbtQoHCoNcb8XrY9HAHnb9LpFBx2Wmtjj5Rj6ulysvs9hBvFmU2gbchaONBHvwJiHgy66dIyXr5LaVylMShy1UwIunkbyfeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjNCOIhR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjNCOIhR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730822646; x=1762358646;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=iiPJ0C4NXTbVKdY57cVNW8TgkMPKWSxxBGysKIeNhFg=;
  b=CjNCOIhRxPtdqDH45AlHovfD3pTkOjnWd07U/RJfyT/w2ZSjRV2esh6v
   kWOy/b5UGNCbTMHn4nFCpUYRqkCR0NCOkjHmFO1cZfp4R6RpeNPc6TowI
   Qzy8raHAkHF5+kE8Vmph/M1OksRhze2wwoDFuLLW4Xa0rG07rU9ONRmpr
   akjOX2YCEUrsFFmH+6AcL4bg5L9B+oMxJ92aw+k/TOyGM+XL4Ql3wCcBr
   P3VdRMmX3b0hGJ4kFolexfgpYUh4z6FbzS1zBi930vI82BuCVeKpi85ao
   Hc/FBaDC0nycAVGP85I0kg1yCcXHXhhJMPL/8+KmHCiMfqq/YE535wO9p
   A==;
X-CSE-ConnectionGUID: RAuIdzrhSYuZlPUzXwJY+w==
X-CSE-MsgGUID: SKnJNgyqTQWi33I/2TQJGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30688797"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30688797"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 08:04:05 -0800
X-CSE-ConnectionGUID: ObFF+IxzRBm0Dy0KNqllwA==
X-CSE-MsgGUID: /SlD75uTRFOXo+UYwzkeEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="84886925"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.201])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 08:04:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 5 Nov 2024 18:04:00 +0200 (EET)
To: Yuan Can <yuancan@huawei.com>
cc: jithu.joseph@intel.com, ashok.raj.linux@gmail.com, tony.luck@intel.com, 
    Hans de Goede <hdegoede@redhat.com>, darcari@redhat.com, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/ifs: Add missing
 destroy_work_on_stack()
In-Reply-To: <20241105120728.21646-1-yuancan@huawei.com>
Message-ID: <f7172ced-57a2-4048-dc3b-23bcbb323b35@linux.intel.com>
References: <20241105120728.21646-1-yuancan@huawei.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 5 Nov 2024, Yuan Can wrote:

> This commit add missed destroy_work_on_stack() operations for
> local_work.w in scan_chunks_sanity_check().

The commit 3279decb2c3c ("platform/x86/intel/ifs: Annotate work queue on 
stack so object debug does not complain") missed calling 
destroy_work_on_stack() for ...

-- 
 i.

> Fixes: 3279decb2c3c ("platform/x86/intel/ifs: Annotate work queue on stack so object debug does not complain")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
>  drivers/platform/x86/intel/ifs/load.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index de54bd1a5970..2faeb1ffbd92 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -347,6 +347,7 @@ static int scan_chunks_sanity_check(struct device *dev)
>  		INIT_WORK_ONSTACK(&local_work.w, copy_hashes_authenticate_chunks);
>  		schedule_work_on(cpu, &local_work.w);
>  		wait_for_completion(&ifs_done);
> +		destroy_work_on_stack(&local_work.w);
>  		if (ifsd->loading_error) {
>  			ret = -EIO;
>  			goto out;
> 
