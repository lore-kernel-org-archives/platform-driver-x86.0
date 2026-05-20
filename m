Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC963A3815;
	Wed, 20 May 2026 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272723; cv=none; b=pqjtvBQtCV4v4vFoGcQj8qumAaPvzHeQ5boAMpBYJ0iJZjnnq7CRvh/omAz+DkgDGzzMzvWpv69PV738VDR0hCxx1sxGsJhbRG7dgg/oN1uzotku5rx+YyXI7vqlAQv/eOS9oonMcrD91sw30FCAoOQshJWV9djRaY/+L1FsQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272723; c=relaxed/simple;
	bh=jFtYqK9fqYAuubO3XAbS6DSljhnmBIwjDk+jPTKMJEs=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QWvXD2QwGpBlSOE7p+L6q2nCpMdroYshUqfU5Ipaq6wGqQT9n7JfargsiiZTp8k5hBOOyccq4ooXTeNN5FyiuO9NP9qP88k1wW3gN8xf1j/kw/4SwFlmRVam4qwC0pAYxqdTuIM8g1/d98/78OJiC+Z8ob/CcRaO2iCoTQnclhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kcPVrvMr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kcPVrvMr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272719; x=1810808719;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=jFtYqK9fqYAuubO3XAbS6DSljhnmBIwjDk+jPTKMJEs=;
  b=kcPVrvMr8GLNGO2wGbTo0px8J3ZoA7uMSB4QGlKzFvQ+Hw9VNCjfswY2
   tISPkd7+DxZX6K3AGf+gNNcSRhChDgQN2YS4Fk9NI1aGbiITFs/UCFTO8
   CNEGB9azvXEC2d8YAKbUUMPoMvoy0t1P46E9/RedbJHyygXHJGYDPSd41
   pw/7ckxqOvv46YJHPkYJ3ArZ3O02hG0NaJTNRrzUladimS0AdVfETZhE4
   A5jLwgLwbO7Kb0glV3sZ5msTgg6gTuTjKg6L76c34PKfTJap2RkggBppR
   INLoh/m3xRxUmUuJl1CjifH0aCopMN8ye4r/o2cM1dxWnQ0D7blJPRK2r
   Q==;
X-CSE-ConnectionGUID: kcwBhJ6oSVmrCWb8OTKyyQ==
X-CSE-MsgGUID: LneRhxXzQ/ml8M2anRsxqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79894186"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="79894186"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:25:13 -0700
X-CSE-ConnectionGUID: ex6Z6N9qSsKxQ6dgeqMg2w==
X-CSE-MsgGUID: +B6oUIYeRr+fRWDL2EmFEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="240376476"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.181])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:25:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 20 May 2026 13:25:05 +0300 (EEST)
To: Arnd Bergmann <arnd@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, 
    Mingyou Chen <qby140326@gmail.com>, Lee Jones <lee@kernel.org>, 
    Pavel Machek <pavel@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
    Antheas Kapenekakis <lkml@antheas.dev>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Luke D. Jones" <luke@ljones.dev>, Gladyshev Ilya <foxido@foxido.dev>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: add CONFIG_LEDS_CLASS
 dependency
In-Reply-To: <20260519202804.1339581-1-arnd@kernel.org>
Message-ID: <e09ac3d9-2749-ab31-5df3-2fc75a7f2758@linux.intel.com>
References: <20260519202804.1339581-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 May 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added driver requires the LED classdev support
> and causes a link failure when that is disabled:
> 
> x86_64-linux-ld: vmlinux.o: in function `bitland_mifs_wmi_probe':
> bitland-mifs-wmi.c:(.text+0xede02a): undefined reference to `devm_led_classdev_register_ext'

Hpmf, I always try to check these for new drivers as they're so common 
mistakes but I don't know why I didn't notice this one.

Applied this fix to review-ilpo-fixes. Thanks!

> Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ----
> There is currently a mix of 'depends on LEDS_CLASS'
> and 'select LEDS_CLASS' in the platform drivers. This
> is something that should be fixed at some point, as it
> risks circular dependencies.
>
> The majority use 'select', but I went for 'depends on'
> here since the symbol is user visible.

I've noticed this earlier but I didn't know which one is preferred.

Checking it again, it seems that anything under drivers/leds is using 
'depends on' so I suppose that would be the preferred alternative.

> ---
>  drivers/platform/x86/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0e9f4403a4f4..d7beda4239ab 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -118,6 +118,7 @@ config BITLAND_MIFS_WMI
>  	depends on ACPI_WMI
>  	depends on HWMON
>  	depends on INPUT
> +	depends on LEDS_CLASS
>  	depends on POWER_SUPPLY
>  	select ACPI_PLATFORM_PROFILE
>  	select INPUT_SPARSEKMAP
> 

-- 
 i.

