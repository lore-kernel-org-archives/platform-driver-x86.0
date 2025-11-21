Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754371AA1D2;
	Fri, 21 Nov 2025 17:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746083; cv=none; b=ebqgIHMbLguc9GsK+ggpCsm+LOpDsclxomklRHt3MxDS4dIIMCMYLXtVuz0j94DitpNBgohaBezy0U19E0nGhg/SbcUgsLLWMzJ8derFeMuqzm2zulImKxXGtvovD9iE3um4MOtlZJ0TYgzZ7dtYIojr215JhZEpw+2lQA0gcqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746083; c=relaxed/simple;
	bh=noSfWXD52sfsRRnhlkbPQC/HuP7vYWvBGCAaCE8YJNY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rdK8iaLtR2pjZrOAZA7Luqi86dSo9uC1khDrhANoeR/oZTd9mJRqoU+VWJGNEQnWUVAKjZYjzrJcF0zzGpvhr+rq7y1UASryDyVsxOCxsLjUqCkFgcK/ahh4tPFQQzPaHY/3aaernKL8mkfHf8ZAxdq78epNk5VnWzB2dLtOD8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YIr7QvSI; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YIr7QvSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763746081; x=1795282081;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=noSfWXD52sfsRRnhlkbPQC/HuP7vYWvBGCAaCE8YJNY=;
  b=YIr7QvSInPklhlC1Y9O4tucLVdvq1OOz4mM/Fz6e9KBiSjXckQIBqNgI
   JTHwjhCgqTJdOBDa09iu2zwqnM5GLAPh4H92UZ3IVeyZzGTtykqIwx5cx
   eOfMiI/zwvNOtwO8mEgQXgrM87dLnvMrnntD5DBMzWobntm5rg+Zh38l2
   2lxPIcL1cAm+/8IiGrtvFy78HH6HlR5jA3ZkadQcW62llbQd/FhsQWVFW
   iMe8UtmuwewocqRhbTl0Hs5PG41uWLCZAmVGOekd5a5f8GU3dNWIddlLq
   IFysQRF9PqT0f1CGu3L+9HdlfUIgX5CmKAGnKyIZQ7LA+hibvhcNx8PXr
   w==;
X-CSE-ConnectionGUID: vjck3HhXS3aGzol/0+SuJQ==
X-CSE-MsgGUID: jsclsdSDTc6NC9WNCCaLYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65886314"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65886314"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:28:00 -0800
X-CSE-ConnectionGUID: G55ZJNGiT0mzBR26K/WTng==
X-CSE-MsgGUID: hjU4it7gQy+I62wIhpN44Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="215107470"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.50])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 09:27:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 21 Nov 2025 19:27:54 +0200 (EET)
To: Dan Carpenter <dan.carpenter@linaro.org>
cc: Qipeng Zha <qipeng.zha@intel.com>, Hans de Goede <hansg@kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Darren Hart <dvhart@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel: punit_ipc: fix memory corruption
In-Reply-To: <aSBqXtt8hJb7WYIc@stanley.mountain>
Message-ID: <c5867aff-4b9a-9cf4-98ab-2e00df9aa4f4@linux.intel.com>
References: <aSBqXtt8hJb7WYIc@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Nov 2025, Dan Carpenter wrote:

> This passes a stack address to the IRQ handler, "&punit_ipcdev" vs

This first part I don't get, why you think &punit_ipcdev is a stack 
address? The punit_ipcdev variable is defined in the global scope:

static IPC_DEV *punit_ipcdev;

> "punit_ipcdev" without the ampersand.  This means that the:
> 
> 	complete(&ipcdev->cmd_complete);
> 
> in intel_punit_ioc() will corrupt the wrong memory.

Can you please also rephrace "will corrupt the wrong memory" as it has
a bit awkward sound in it. My suggestion:

...will write to a wrong memory address corrupting it.

(I'd have done this edit myself but I wanted to ask about the stack 
address claim so better you just send v2.)

The change diff itself looks correct.

> Fixes: fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/platform/x86/intel/punit_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
> index bafac8aa2baf..14513010daad 100644
> --- a/drivers/platform/x86/intel/punit_ipc.c
> +++ b/drivers/platform/x86/intel/punit_ipc.c
> @@ -250,7 +250,7 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
>  	} else {
>  		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
>  				       IRQF_NO_SUSPEND, "intel_punit_ipc",
> -				       &punit_ipcdev);
> +				       punit_ipcdev);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
>  			return ret;
> 

-- 
 i.


