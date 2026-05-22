Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDB942317A
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2026 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457501; cv=none; b=W08lpinjX6OJuhLYSvixvhy2Wl6hiN4SPpVbtqgxY5mcclH6XcoWnjDmX9EfVa4xzmZf+zUxm3iu5HNCWBh1SerGU4+/oU2AzCUcdvFLY7toahNeQQPtVAHOQwimxz2XBCVUPQcw5HbHROYLEd/9HyqH17NmDVh+pejnDphLHmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457501; c=relaxed/simple;
	bh=LeV+J9wiCCTf5BVXc2UcfBxi6zS1alt6DxCoJ6cglug=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WT9ULUoGrj4w1dB7y8wzmlgTfNkJNoiy7qu/ocySCyWnrO10qQ7yYJ9HDrqyOT2j0BLr2FlHTqppRFhuxjFIKTd+Cyhgqj7ubhX96i6XxgH8fjxemiMUsLJcC/OJJDgo6K84XjTc4Q5vjtAJ+yX7yJtMUf3mQb8vz/FCYKLJsrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IKjPcxlH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IKjPcxlH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779457493; x=1810993493;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LeV+J9wiCCTf5BVXc2UcfBxi6zS1alt6DxCoJ6cglug=;
  b=IKjPcxlHANwrmdyC6AqUfTjzeqKaDL+nFgor7KayHLsSb6+uADsmvLJD
   1PhfPHG3QHnS2VT9YVuzgS7hwZzTU0qLRC/9wH2HOOPOz/ItBXGnbPpRI
   K1kc6whZ7WmUDEme3TixwVELYrRgjQYx2b/COKNq3F/WwjN+cYmWUU1XD
   dWtC4SOps3HlqrethftfLg94mpNbEcmI5/JidR2aSqni2/WcCk5SYB0DW
   vkT0XLINmP/oBQXMFr4tMq4FOcyHDV/el5PODJZFZFD0o9JwCVMbxbGIO
   4EpK3UtMQJelfMoPI/+ugm7v/nLvmUID/+LJq/3P5CzLYArU5D2g7rTA4
   w==;
X-CSE-ConnectionGUID: aJgQBr5pS8OOXaAUgF4Elw==
X-CSE-MsgGUID: CpznLpWjTAytBIEXtr5ucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91855335"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91855335"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:44:47 -0700
X-CSE-ConnectionGUID: t9MHnqCFQ5O80+mo9JFGlg==
X-CSE-MsgGUID: csuwY1nkTwyR2C6gIwTOyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="237877224"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:44:44 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 22 May 2026 16:44:41 +0300 (EEST)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    mario.limonciello@amd.com, Sanket.Goswami@amd.com
Subject: Re: [PATCH v5 6/8] platform/x86/amd/pmf: Implement util layer ioctl
 handler
In-Reply-To: <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
Message-ID: <36e6fdaa-86b0-a636-68a4-7ffe30ffd02d@linux.intel.com>
References: <20260520185424.770772-1-Shyam-sundar.S-k@amd.com> <20260520185424.770772-7-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 May 2026, Shyam Sundar S K wrote:

> Implement the ioctl handler for the util layer character device. This
> support adds the actual functionality to populate PMF metrics from the
> TA shared memory buffer and return them to userspace.
> 
> The implementation includes:
> - amd_pmf_populate_data() to extract metrics from TA shared memory
> - amd_pmf_set_ioctl() to handle userspace ioctl requests
> - Size negotiation for forward/backward compatibility
> - Feature-based population of struct fields
> 
> Co-developed-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/util.c | 90 ++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/util.c b/drivers/platform/x86/amd/pmf/util.c
> index 0052f0b6a7a5..eb9a02e135a9 100644
> --- a/drivers/platform/x86/amd/pmf/util.c
> +++ b/drivers/platform/x86/amd/pmf/util.c
> @@ -19,9 +19,97 @@
>  static struct amd_pmf_dev *pmf_dev_handle;
>  static DEFINE_MUTEX(pmf_util_lock);
>  
> +static int amd_pmf_populate_data(struct amd_pmf_dev *pdev, struct amd_pmf_info *info)
> +{
> +	struct ta_pmf_shared_memory *ta_sm = NULL;
> +	struct ta_pmf_enact_table *in = NULL;
> +	int idx;
> +
> +	if (!pdev || !info)
> +		return -EINVAL;
> +
> +	ta_sm = pdev->shbuf;
> +	in = &ta_sm->pmf_input.enact_table;

Please check sashiko's report on unconditionally dereferencing shbuf (vs 
smart pc not supported).

There may be validity in many of the other issues sashiko notes as well, 
you can look the rest yourself (but please don't think it would always 
be right).


-- 
 i.

