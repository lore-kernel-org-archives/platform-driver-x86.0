Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86B3A48E6;
	Mon, 19 Oct 2026 06:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390178; cv=none; b=b7Qcg6hRlPP37LaHrJ5M+IJ05Yg0wAq77LnRdnLtZB7Rf4rX5hLMZ9JN1V1UxAT6f4b5VkqfTIKoTEVftGsdvbrx9/+IcR39nMxfkZM/3XtwFDmIM4k3IFRHdKnIB/ViTypPIKy1YWPCXYoSwNN73hy8Ick0w1oqIAgZgtbOFno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390178; c=relaxed/simple;
	bh=VR5MwH91L0AK2wn4xlEkL6N+2b0KJdySCsZWR87aUEU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fItOmhMm1CQgooHVDD9BItP+FEdhqdrBndnhCa977ZuMzD61yCP5rkAiWuHZp7SEn4oWuuloT9AgY1wo6UMs8N3jBinCzuxoKo2JoX//TrcsG+3//+lPLE/3xFFZOc0cja2sdEkewQuUsMynLGH2JSWb6cZq7CH5c3OaBfeVw3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZoqAWpF; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZoqAWpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792390177; x=1823926177;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VR5MwH91L0AK2wn4xlEkL6N+2b0KJdySCsZWR87aUEU=;
  b=kZoqAWpFEq0yB4OiMJQ9I+Xobxtsapxg4t81xdpLesXmBYOwQ8oYlJBa
   Dtc7G9mkqC3lkog31icftie0HnJVIeJxLzaifu54WcyIo7AIBlqhLLCc2
   QYWFaoVl7XB6Jnjzq0x++C+ei02zMi5VA6p0CQRZotDEhX7zCFh6tPrfx
   oXEn/tFgEcZKGRJel09gq1EFgNqwl0wGEIcyfyUgkK1Y7cSs2k/RK9XBD
   dJrQFH+yGMDpA5pvOowfKHGPe2lI+u7msvRIICWAveow6MZZNZN0u9kWH
   yXc5nRgQlhxrqTg3rxoGR01yVrBB63C+6NJpM8FR40FCuNqlVIdt2m0xm
   w==;
X-CSE-ConnectionGUID: p3QSmiQGRK2PyPSrpKfGCA==
X-CSE-MsgGUID: n8mLTiOxQvashL5y9m8OPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1074737"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1074737"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:09:36 -0700
X-CSE-ConnectionGUID: aTGclExvQrqOJhvkKmF74w==
X-CSE-MsgGUID: ZbuQ7thCQdmn/Lczto9dEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="4297727"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 23:09:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 19 Oct 2026 09:09:30 +0300 (EEST)
To: Jiale Yao <yaojiale02@163.com>
cc: Herton Ronaldo Krzesinski <herton@canonical.com>, 
    Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] platform/x86: topstar-laptop: Check ACPI_COMPANION()
 against NULL
In-Reply-To: <20261017064350.3817228-1-yaojiale02@163.com>
Message-ID: <e3b27eae-df1e-4687-aa61-fd7a476ab477@linux.intel.com>
References: <20261017064350.3817228-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 17 Oct 2026, Jiale Yao wrote:

> Add a requisite ACPI_COMPANION() check against NULL to the
> topstar-laptop driver, aligning with the fix applied to
> asus-wireless driver.
> 
> Assisted-by: claude:deepseek-v4-pro
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/platform/x86/topstar-laptop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/topstar-laptop.c b/drivers/platform/x86/topstar-laptop.c
> index e09d7f8ce45f..f6fafa345f93 100644
> --- a/drivers/platform/x86/topstar-laptop.c
> +++ b/drivers/platform/x86/topstar-laptop.c
> @@ -291,6 +291,9 @@ static int topstar_acpi_probe(struct platform_device *pdev)
>  	struct topstar_laptop *topstar;
>  	int err;
>  
> +	if (!device)

Call and it's error handling should kept together.

> +		return -ENODEV;
> +
>  	dmi_check_system(topstar_dmi_ids);
>  
>  	topstar = kzalloc_obj(struct topstar_laptop);
> 

-- 
 i.

