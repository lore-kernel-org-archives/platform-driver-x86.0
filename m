Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B34366561
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456593; cv=none; b=SpCu+LZ83i3FReg21W1n77hhAuT8g5pI2kbFa0KzIr1EadibutStNQj+e7YJm0+BoOhSI79eR6/xaqI8GSYYvrd3BbixkzrEHItDJZRK9SNcAIjIoYvmew96M6WAezYGdS9SBKdiN3Ela4fKCxNbs4V9JoK7pGCfinqNmIV9LP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456593; c=relaxed/simple;
	bh=l4Z9I4uuPYgTpGpIB9PecgoFcV0ssbcrwo212AOG1S4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e7Gw5sKDFKygREu67LXN68xmsNxzNRdrnOCFBbNKNtrRS9QZqCK+J9YvrukGLnNIVk9Broyg9TOncKOOyoX3LSAMm7YA7VZYxuzidDqk2CNRoSnqrWTBOpi+TN6G66mnM6NvvzDGioNc1sW3aXSy5QV/nha9piuG5HQKw8HnFLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nudyuXpN; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nudyuXpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779456592; x=1810992592;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=l4Z9I4uuPYgTpGpIB9PecgoFcV0ssbcrwo212AOG1S4=;
  b=nudyuXpNmWNNg5x/T1qhZGCRtaPF5DejfKaTssOY0oByhPGZCpC8NDLP
   MkaWUaZKMDXkaGfnN6JJgHcZA9KElcOUAhECR2UPPgIb3M/l8eAnPXvr3
   LKEp/JissEq+EV1dv6qPsrH2zWsOwfHcMKzrNwb2oaG0ZYf9HVwPsLAbk
   18L18bNTewrZC+MwIeTeXGraW8kdr6DUsoOFcqRkky1z0tCjJfr0clOCF
   lHPGcTeatGtIpomouGuNrBAKa4MmFpDLUkOEc2nFc/3Y2cjlvVj4alw2z
   EZ5z2IcB2jgON4IF1dm5XPZkXBHesIHJQ4LvafECr5KYWHX+o6BlCYRUs
   Q==;
X-CSE-ConnectionGUID: 7KkZhkWVTD+ghQSsyzBfFg==
X-CSE-MsgGUID: MAJftLwwQT6gMO33mR2Z7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="97961157"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="97961157"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:29:51 -0700
X-CSE-ConnectionGUID: m7Bv6K0BTby8tbJSo+4F9g==
X-CSE-MsgGUID: TUpDhdcZScCB5dwuBuTTyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="239883349"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:29:49 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:29:45 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 3/8] platform/x86/amd/pmf: Add feature discovery
 support to util interface
In-Reply-To: <20260520185424.770772-4-Shyam-sundar.S-k@amd.com>
Message-ID: <ea203013-1685-5638-a322-0ba72285da27@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-4-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Add feature discovery capability to the util layer interface, allowing
> userspace tools to query which PMF features are supported and enabled
> on the current platform.
> 
> The following features can now be queried through the
> /dev/amdpmf_interface ioctl:
> *  Auto Mode: Automatic power profile switching based on system activity
> *  Static Power Slider: User-selectable power profiles
> *  Policy Builder (Smart PC): Action based policy management
> *  Dynamic Power Slider AC: Adaptive power profiles when on AC power
> *  Dynamic Power Slider DC: Adaptive power profiles when on battery
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  include/uapi/linux/amd-pmf.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index d29a4abe1145..38ab5362fe62 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -34,9 +34,19 @@
>  
>  #define AMD_PMF_BIOS_PARAMS_MAX		10
>  
> +/* AMD PMF feature flags - bitmask indicating supported features */
> +#define AMD_PMF_FEAT_AUTO_MODE			BIT(0)
> +#define AMD_PMF_FEAT_STATIC_POWER_SLIDER	BIT(1)
> +#define AMD_PMF_FEAT_POLICY_BUILDER		BIT(2)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_AC	BIT(3)
> +#define AMD_PMF_FEAT_DYNAMIC_POWER_SLIDER_DC	BIT(4)

Sashiko notes you lack an include for BIT().

> +
>  struct amd_pmf_info {
>  	__u64 size;
>  
> +	/* Feature info */
> +	__u32 features_supported;
> +
>  	/* Power and state info */
>  	__u32 platform_type;
>  	__u32 power_source;
> 

-- 
 i.

