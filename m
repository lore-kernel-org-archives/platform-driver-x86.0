Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3D82343C2
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Jul 2025 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254625; cv=none; b=f9B9pUL4Ik+jkDdz0qcILOLv6EdSRt9uTEvrKO4moFkQBChAdOZLZv43oiXC8F5EjWeXHsddWRdcvvr4BIx8IaBMZGNNBIdOVzZ/xA8zgSLeueV/5Lx6CSF6N9fDzExy78ZzpvAynKXWndNY+hZVoAq9dkdrz497GDTC1rxBVZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254625; c=relaxed/simple;
	bh=G3lpKJbLJ2xnbIr6X2Nvo37pm/R3yRi4XwNfTFvjtLQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WOiNVc1F7aytsSfczG7C8S0S0jWOTGGMCBfuu2ehAUmhoKtNqZjpFUsdYgLEbMzkBHRhvsIWkFmJ7SE7sYwjwL/SZDM5w/rqe36hylUKM24YtrwRD89tO5/2GTlVx/4KOUEqOw6LYghHl6RNHjKOg9jCWgtP8ivuG7j3ZQaschI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fa5ZJGcX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fa5ZJGcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753254624; x=1784790624;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G3lpKJbLJ2xnbIr6X2Nvo37pm/R3yRi4XwNfTFvjtLQ=;
  b=Fa5ZJGcX8AqSF6FqRf2yJYRmjtbamDABahWqYfSYmHp7WuQhBNOEaN+y
   SVcAiOI7cUIOHyEr7fbhfBS7dDXnLZvg4qLEE4KiBslu0AhJw8sIrLq/k
   4obaZcmb4AD5fyreYYyRxcbhlSPfZPSpGbSDD0MAFs9Hphs8avk0FcOxk
   QQzDbs5iCdy/7B4CzOJAhuSGnJpXR3AxAM+GW+XlQ1ptTSNx8kQRfCZic
   koLgRfFav7WZseBbConLRsXEJ+K9ndyjdtPlFMKsYVnKwlypaCHNwCpES
   YrLPEhd0x6tXSpdkUL7Inqe+CryMlTdbuj20brvcnY/s44M4gbqnBJE0U
   w==;
X-CSE-ConnectionGUID: 1uehRbi5RLuTntkwU5iH2g==
X-CSE-MsgGUID: A2RPikvpQ4Or7054iFahVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="55634842"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55634842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:10:23 -0700
X-CSE-ConnectionGUID: +rgR0f//Rdq2MtumoLSRNA==
X-CSE-MsgGUID: 117i3ZjJS7+F5ka07LjX4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="164810796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 00:10:21 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Jul 2025 10:10:17 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH v2 4/4] platform/x86/amd/hsmp: Ensure initialization of
 the sock struct in hsmp_send_message()
In-Reply-To: <20250723051251.3009625-5-suma.hegde@amd.com>
Message-ID: <11a77699-49f4-ac5f-4bce-6dedae7f0170@linux.intel.com>
References: <20250723051251.3009625-1-suma.hegde@amd.com> <20250723051251.3009625-5-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Jul 2025, Suma Hegde wrote:

> If all sockets are not probed, invoking hsmp_send_message() might result in
> unexpected behavior due to accessing an uninitialized socket structure.
> 
> The initialization of the sock structure can be confirmed if sock->dev
> is initialized.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v1:
> New patch to address the partial probe/removal issue.
> 
>  drivers/platform/x86/amd/hsmp/acpi.c | 4 ++++
>  drivers/platform/x86/amd/hsmp/hsmp.c | 3 +++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 15c4cedc2759..a2d91d4a3e02 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -617,6 +617,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
> +	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
> +
> +	sock->dev = NULL;
> +
>  	guard(mutex)(&hsmp_lock);
>  	/*
>  	 * We register only one misc_device even on multi-socket system.
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index e05d824045d6..a4420db42781 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -219,6 +219,9 @@ int hsmp_send_message(struct hsmp_message *msg)
>  		return -ENODEV;
>  	sock = &hsmp_pdev.sock[msg->sock_ind];
>  
> +	if (!sock->dev)
> +		return -ENODEV;
> +
>  	ret = down_interruptible(&sock->hsmp_sem);
>  	if (ret < 0)
>  		return ret;

This is still racy. AFAICT, nothing prevents assigning NULL into sock->dev 
because of remove while hsmp_send_message() is running and that can result 
in dereferencing NULL.

-- 
 i.

