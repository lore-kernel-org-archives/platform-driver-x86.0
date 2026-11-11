Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400140;
	b=f4ltg1e7d/njne4Ootyy59+OUHNkvxKTPfOKzc7dpqLces+vEBJzxoLKh6mH1YhB+b49
	 XtGFb2yIIqVS1lk34e0Nm9IyZA4Kpc4sMiBvTF7+k3qweZUSBNFeid6/gWQ+ZBZQC7qXa
	 Vbc3s0htPbU+6X67lgzSAAGWLzGM0KOkh3wcNK6VWg4H9BogB2aINcxZqxmQNAM6a5uOl
	 bupSjwZ4h7bTLaqmF6XqwvmDTbmBuDwcoB/8MVUJ7JH+MMD4linAlcGLsfXMVCGjRYgPR
	 RTeQXgMOiOx4PaTbVg6ZB+L02tTSfyC/6NUaFPksPQKt0fm2ucZ53Z0pa1PRxFsv0ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400140;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=2uXXxCptiBVKiV7trnfsefY6P8MdSqZYuQPA6gJbIGg=;
	b=XpXsxrPwORDR9rYio3OLRZplpYrqiMlP8zBOHyxILZsNyaM6tn0SrrKZboMCdtasDADr
	 t0wnKY3GtmxKJAZy7vIEixTa09BdvyhWU5JlpuAzOQMgKFXFuLznHx2Ml7F/ANSKEbpVD
	 C2vhm1Z9dRz67Kl4Sry3osuBWWgfSCLJywvJaJ7p3AwWegL6a6TCmYS2Aeamaz1kXWo6l
	 YZA1ohuNQQYL7eo7lNx/Ud3xmyNO92NPjz3xOt2GzuJmeLNEZ5T9fERu0adYpEAZ3TZGT
	 2bIfQELK7qMkGms6mdjPnfs262cTkJBdKYl4xfAip+D/OsSj9btL4+RU2T1hTk6l+Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VV6Ms0F/";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDE606A335;
	Wed, 11 Nov 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CDE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VV6Ms0F/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794400140; x=1825936140;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=an7Iiy5Su5gkoynIAwmzhjvcJg2aeqyxVs2OyeoTxdQ=;
  b=VV6Ms0F/R773LCmi9gqMtPjeHslZoU1292JcHAkeclrbs2pZKpjlw244
   x3GbuWcR1KFNSuINeB7KlSR0JGrBKCUT06WSa9o32oTJ4irEQC5W2zXMu
   Uib5brRNTG5lsty4ttmhwve4Mj+0L2Bk2bAvto7jw6DZ+7MykygkJm4B5
   dnZWjCra0M1tTk+I1SoD3doakP8fbSQhuUAD52bhq/c67j9tcrQUCudcl
   9aAzowKcwmb6puNx7ha5NVVzPWJ2XWVSnDvsQ1jD/a88XRM4YFoMMKCUe
   dLb4BjlVbLHFm5/iiH6DD+cYFL69fzZaM9tn54R71pDGfri4/mwNjWmBO
   A==;
X-CSE-ConnectionGUID: umqx0W9ESOKnHPos/XNqaw==
X-CSE-MsgGUID: BBmPm79wT527G1SXKOKIuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3175912"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3175912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:28:59 -0800
X-CSE-ConnectionGUID: WVJi+QieSViAYyAM5mt8GA==
X-CSE-MsgGUID: Ihd47nl9QX2JqjoS1mOu6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8572768"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.192])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:28:57 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 11 Nov 2026 14:28:53 +0200 (EET)
To: Tao Xiao <guanlan@awinic.com>
cc: Hans de Goede <hansg@kernel.org>, 
    "open list:ACPI SERIAL MULTI INSTANTIATE DRIVER" <platform-driver-x86@vger.kernel.org>, 
    open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: Do not request
 IRQ for AW88399
In-Reply-To: <20261111043759.306458-1-guanlan@awinic.com>
Message-ID: <ccd77135-cb25-d49f-7e30-1777682485e9@linux.intel.com>
References: <20261111043759.306458-1-guanlan@awinic.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Nov 2026, guanlan@awinic.com wrote:

> From: Tao Xiao <guanlan@awinic.com>

I expected problem or justification described here first, but all I got 
was what was done:
 
> Set the IRQ resource type to IRQ_RESOURCE_NONE for both instances so
> the device instantiates regardless of the ACPI interrupt description.

Was there like a problem with some device that you're trying to fix? Why 
that's not mentioned?

-- 
 i.

> Signed-off-by: Tao Xiao <guanlan@awinic.com>
> ---
>  drivers/platform/x86/serial-multi-instantiate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index ffec4f0a4992..f69ad3815c8c 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -309,8 +309,8 @@ static void smi_remove(struct platform_device *pdev)
>  
>  static const struct smi_node aw88399_hda = {
>  	.instances = {
> -		{ "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
> -		{ "aw88399-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "aw88399-hda", IRQ_RESOURCE_NONE, 0 },
> +		{ "aw88399-hda", IRQ_RESOURCE_NONE, 0 },
>  		{}
>  	},
>  	.bus_type = SMI_AUTO_DETECT,
> 
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
> 
