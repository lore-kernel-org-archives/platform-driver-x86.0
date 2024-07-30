Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070AB757FC
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jul 2024 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722343124; cv=none; b=QrEFcGfatl8HnFdfU0om+9Qb+abtLOKcw6n7rpDuxXFVD0F1lfFx5P1K4xD15WD0uXjVIhthRzn9ho0y0uSRMD6xvbN38FnFq4nBdQFohoYTl7UGgn5tc3BMwWCu6+LyahU+pQPC4eBX4hYpNJZOSwV352SQh8vcPOmCTa9b6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722343124; c=relaxed/simple;
	bh=ci3N0Ni+B8dIafQ1ikIG8z/OI4u5PBAzVBNd7j0kmvA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sUSSoN+wh4Ii5F7nzb3JsGd1BhTxpLlwfLPjddeqJ9Vza8AgtR7CEYqU8IrE27N87vdIX/6Vt1GnUA723sVQA/+XrzBZS7Ppdv7npZEVWyL5J/WXJ5Ku26FTHmi0hw++3RoPUSh/cwJRlg+2AyPMV5tXVL9MH4v/heSlhhWFTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPrOSFce; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPrOSFce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722343123; x=1753879123;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ci3N0Ni+B8dIafQ1ikIG8z/OI4u5PBAzVBNd7j0kmvA=;
  b=ZPrOSFceNKnjLojUJ/eQYBw0tOJg2hGT5Y44D85lzgmHdXiRJBug0wWS
   Py4CCpq1AVYQX3Ngr5tt8m3Pt1JkoZLQMedKALllp0+DL00B1CjB4vKVJ
   brBHJCjgRrQJOhQZz7pEw/mkCoEV7izuXSDeu8qJBz8a2GLpluy6dhk3+
   TPSDI4VaxIAr9chumFxV8UrUapcF7TtPYLW+zkpj1tt9Rjezyi8Zn+W0V
   7YLn5VN+wtA+HuDoa7ZG5EW/jwQYgSuBgDAgaBXhTmkpND/pR81mLV365
   U+Rb3QpHVGxTv4yPmazGdsFB7/VGIsXMpr1sHtObzVAsKGbx+QWMDKpcX
   Q==;
X-CSE-ConnectionGUID: 6iF/X8b6RymFB4zuxj00qQ==
X-CSE-MsgGUID: EGMCMk+sTA+qZsteAAgbrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24018943"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="24018943"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:38:37 -0700
X-CSE-ConnectionGUID: cuSyULqQSVy8AMENImUEdg==
X-CSE-MsgGUID: 2qnAlpaASpaiLA2sc3phJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54579088"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.25])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 05:38:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 30 Jul 2024 15:38:29 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Add new ACPI ID AMDI0107
In-Reply-To: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
Message-ID: <d7accb91-4cf8-f89c-ebc8-210137e19530@linux.intel.com>
References: <20240723132451.3488326-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Jul 2024, Shyam Sundar S K wrote:

> Add new ACPI ID AMDI0107 used by upcoming AMD platform to the PMF
> supported list of devices.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---

This patch 1 applied to review-ilpo (the other is still pending with an 
outstanding comment/question).

-- 
 i.

>  drivers/platform/x86/amd/pmf/core.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 2d6e2558863c..8f1f719befa3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -41,6 +41,7 @@
>  #define AMD_CPU_ID_RMB			0x14b5
>  #define AMD_CPU_ID_PS			0x14e8
>  #define PCI_DEVICE_ID_AMD_1AH_M20H_ROOT	0x1507
> +#define PCI_DEVICE_ID_AMD_1AH_M60H_ROOT	0x1122
>  
>  #define PMF_MSG_DELAY_MIN_US		50
>  #define RESPONSE_REGISTER_LOOP_MAX	20000
> @@ -249,6 +250,7 @@ static const struct pci_device_id pmf_pci_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RMB) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PS) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>  	{ }
>  };
>  
> @@ -382,6 +384,7 @@ static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>  	{"AMDI0102", 0},
>  	{"AMDI0103", 0},
>  	{"AMDI0105", 0},
> +	{"AMDI0107", 0},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_pmf_acpi_ids);
> 
