Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECCB3BADB5
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779361337; cv=none; b=bqR4q7SLUHrVeT2qlvzrB8JnkkezUh4BTFuthbd6i56jy+5j6kpmeLDNxmZlgnWRwMYX+PZL0XUbJjBVLaJgnAyY2+CTWdyhL21WO6FBEEOw5iz7dwbzlllWIbMlH1nSDMlOyPPgVHH/uN+5ZuDcKmOGdWNWmNck/qpgdLKOnfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779361337; c=relaxed/simple;
	bh=NDrLz6D6bWrjmRolYxVqa1PogLFIceLXB31B0RcQOcM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=rQEVv+c619RroEHAaKJbly+dgk4mVDXch1bBqBGnCadJVZbn2l7WhBOwEeo3tf33MyCQU8EhMTpfDiIci1xAnjOkj0KuxD3+eBwHV2585Tt0na3zUluTwHh+53F9XtOQ3VeFDdogVqjhxgX+dIzpnAta2IojGPdF/atjiNOvFGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZKmdbrl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZKmdbrl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779361333; x=1810897333;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=NDrLz6D6bWrjmRolYxVqa1PogLFIceLXB31B0RcQOcM=;
  b=fZKmdbrlJ7OaEoBcRo+Hbyqq30gNHY5u2/XL0vxqIO/lmWuMRryPbn17
   01vt0RJiYueGqUWz5LtNYD1SLCVdraJDFJUuY7I44m19cb2N9FYiI24UC
   q5EgB7RVD7Hr0zBKlTuYBf/EZYpM+7IB4la3tNCQyf3nI3tvo3i8Zl/LU
   2oAgZGDXFECMGLeXBJ9do6FQ7FqUPSa3jOgxdiaSSK01mViZH7kR/WdOw
   IVAdMX7iwh1Thq8jnKjm+K2YKJGtG1rujj9rCptb4KQHfklU+63yYdllT
   USwI3anogLv09GfjZ5BgYKPMwsjIeF2jwWf+Wo15b+qFmiIxYa6SggFuE
   A==;
X-CSE-ConnectionGUID: nyjjY8hhSWyUcRTbl91Sjg==
X-CSE-MsgGUID: CJ3sNge/S1iq/7lcIeKHgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80331905"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="80331905"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:02:07 -0700
X-CSE-ConnectionGUID: aH6SUCm3TAOKDPzS09scKQ==
X-CSE-MsgGUID: j1R1czXURHyqEDGPbYgPpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="239644357"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.98])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 04:02:04 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 21 May 2026 14:02:01 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 5/8] platform/x86/amd/pmf: Move debug helper functions
 to UAPI header
In-Reply-To: <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
Message-ID: <393119ac-3a30-9baa-da10-a123969b4c96@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-6-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> These debug helper functions convert enumerated values to appropriate
> message and can be useful for userspace tools and other kernel components
> that need to interpret AMD PMF state values.
> 
> By making them inline functions in the UAPI header, they become available
> to both kernel and userspace without code duplication. Also, prefix the
> function names with amd_pmf_.
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/spc.c | 61 ++----------------------------
>  include/uapi/linux/amd-pmf.h       | 57 ++++++++++++++++++++++++++++
>  2 files changed, 60 insertions(+), 58 deletions(-)


> diff --git a/include/uapi/linux/amd-pmf.h b/include/uapi/linux/amd-pmf.h
> index 54baf015e4c1..a8c715bee9cc 100644
> --- a/include/uapi/linux/amd-pmf.h
> +++ b/include/uapi/linux/amd-pmf.h
> @@ -115,6 +115,63 @@ enum amd_pmf_platform_type {
>  	AMD_PMF_PTYPE_INVALID = 0xf,
>  };
>  
> +/* Retrieve the platform type as a string */
> +static inline const char *amd_pmf_get_pt(unsigned int platform_type)

> +/* Retrieve the laptop placement as a string */
> +static inline const char *amd_pmf_get_lp(unsigned int device_state)

> +/* Retrieve the slider position as a string */
> +static inline const char *amd_pmf_get_sp(unsigned int state)

"pt", "lp", and "sp" are not particularly descriptive. I know they get a 
bit longer if you expand them but it'd be huge win for code readability 
still.

-- 
 i.

