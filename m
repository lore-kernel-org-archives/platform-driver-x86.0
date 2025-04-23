Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51712701B6
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Apr 2025 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410764; cv=none; b=cenIHtDqCfuSolTdyc6UGn9SIPMLrjxrloZ+RcI/x2b830x0bwNFARgmEi5EvAyPKcF7L0fEGOQUZSVrj5HdajP+PfHQMjUFTL/jv/7DSHMeapC+cGbUdeW7xLLqflQQFps8CRAZexU3fXtrxrx5GJoOXKiX6qwFVI4AAtYAL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410764; c=relaxed/simple;
	bh=80elhIY07VdNOXYzi5clapquVttT4kQyTY8unwXLmd8=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RW3ACbpHE4ehDJYW4iNhlZ53GRgd+FsbybVB0X2YDi2O0BS1siCp7JFX7Ri1RM2ooHUO4ynpA6VMC5bKsYZlDXLcYjrnHVB16HbHCG+dAzUI2szTi4F0SAvOXYVhHK18DY8sYCMiXQkLEO0hnE7pj/cSwFAKlq9xEuUIb4wOYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aYYu1O9t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aYYu1O9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745410762; x=1776946762;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=80elhIY07VdNOXYzi5clapquVttT4kQyTY8unwXLmd8=;
  b=aYYu1O9tLISPdOEoL3u3XSkRLQFop4oZJeecNzgeEVJnxj59LgAXutyZ
   ArVa821pKBEhFudsTRCe1iu9ay//4OAYtYhvIhJpblNiU9G/axlMQOKxC
   vMI/hbGFvcVk2VBXRCmdxFpzS/tDm9qrjO+Sd/NWizLzzAG2oxIBlj+8q
   vcWm5tbK7QAl2l6m3dKeRpWFo5A2BFlYYPMH8neXHvxu3JKQk8UBYJ0aZ
   Et3aAZeD0BvLoACj+mdvE6aOUFIiunzeM4TIQl0eOBuhiQvxKqkvB4Ae7
   0bryulhIioW3orQ7hzDxIxIBZ3h535tN964nEHlzGA/bo4msQ/R3OoMCi
   A==;
X-CSE-ConnectionGUID: zt4AI7OnQ4GNgLk7OBhwoQ==
X-CSE-MsgGUID: izGK7Ha7SrSlDhb8enpfIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46119985"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46119985"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:19:22 -0700
X-CSE-ConnectionGUID: VHVj/A8tQ+uvJOqtZijHFg==
X-CSE-MsgGUID: nZZGvnxgRKGNo8wdrPTxCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="136377227"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.36])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 05:19:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 23 Apr 2025 15:19:17 +0300 (EEST)
To: Mario Limonciello <superm1@kernel.org>
cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com, 
    Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/2] drivers/platform/x86/amd: pmf: Handle bad policies
 in amd_pmf_get_pb_data()
In-Reply-To: <20250423121202.3736094-3-superm1@kernel.org>
Message-ID: <169663ff-6038-baf5-c872-2d485cf02ab5@linux.intel.com>
References: <20250423121202.3736094-1-superm1@kernel.org> <20250423121202.3736094-3-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 23 Apr 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If a policy is passed into amd_pmf_get_pb_data() that causes the engine
> to fail to start there is a memory leak. Check for invalid policies as
> well as an error in amd_pmf_start_policy_engine() and free the memory in
> the failure path.
> 
> Fixes: 10817f28e5337 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 41ab9eca5ff13..3c399dc1bfcca 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -377,12 +377,23 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	dev->policy_buf = new_policy_buf;
>  	dev->policy_sz = length;
>  
> +	/* Check if the policy binary is valid */
> +	if (!memchr_inv(dev->policy_buf, 0xff, dev->policy_sz)) {

Since you're adding an explaning comment into two places, it very much 
looks you want a reasonably named helper instead for this so there's no 
need for such comments.

> +		ret = -EINVAL;
> +		goto cleanup;
> +	}
> +
>  	amd_pmf_hex_dump_pb(dev);
>  	ret = amd_pmf_start_policy_engine(dev);
>  	if (ret < 0)
> -		return ret;
> +		goto cleanup;

Isn't this an independent fix that should be in its own patch?

>  
>  	return length;
> +
> +cleanup:
> +	kfree(dev->policy_buf);
> +	dev->policy_buf = NULL;
> +	return ret;
>  }
>  
>  static const struct file_operations pb_fops = {
> 

-- 
 i.

