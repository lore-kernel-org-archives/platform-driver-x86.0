Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B163CAE80;
	Thu, 26 Mar 2026 10:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520916; cv=none; b=UpPuwltrbOGBZCZ4HohnND5O6dFjbyKsZNkAn2Gu4lNG1eBa2Sg+MjgIrmmm96rV6w31ucyJAna6wEZfsiUu7XTKeZxCW9Y5HuLQaDccbEjVahB4CXVa07p+dKpDEQaP8sGVsfCzeoOx3ucpxqyh2xIlv+T85xjz9qBpsFJFtE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520916; c=relaxed/simple;
	bh=Dpgh3Ro0JuDIQ5unVbnnfu9slKd+vUn4mifubIshLYg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uUYQ0ROcYmaXihQdlEnEHaA74qpNkQE2s8GbjOKF+VFjLoYaFvqoT0RdmXBgcNv/UcwCbjVnEGrWNlcop/5Bn4LBTMkjK7u4W9KXHa1F6as4TLYh2QUKCb017e4ifzkcgnj4RnzGZVTtDGYI+n17CvhQO3DbK5D/I9Stoda4Mho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI/WZT8y; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI/WZT8y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774520915; x=1806056915;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Dpgh3Ro0JuDIQ5unVbnnfu9slKd+vUn4mifubIshLYg=;
  b=AI/WZT8yBYHLO4THj5ph6nuTISydpcwY3mbNKsvcfXUZnl6k/PuK/C+g
   tfxeUd+mO0KYmYz6bqVO/aneRLif3xD7m+lEtxFCAflXYs6oJDfZKnsIG
   a21fF/H/IfY3qm0lk0aQsJyhZyZ2Xtqfm+D/Wenpai6WxLoFQNKBn0avf
   sAYa7oWZntLEx2TNhLILYuX8jPYxnlthR0Bqp5IXyvmUTFMgqNfbvm1v5
   AXAQqjdaS9Z1OaHBPw69FKK+MUpqGCfJJr5TNhFqp1y7S967W7z1abUoo
   AGIYp8OAD92m27ZcVWp9g5a8bwXFKCWADofFxIf/Pb6l1qFObNUYuIWbq
   w==;
X-CSE-ConnectionGUID: rxOEvov+QGCqdI8364eZGg==
X-CSE-MsgGUID: ee6v/lMvRJKlXd21OuqVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="93153831"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="93153831"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:28:35 -0700
X-CSE-ConnectionGUID: jA6jowc9R9Gk6N+wqXn8mA==
X-CSE-MsgGUID: Dvi+KOqzSeKN8pcJJGcjUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="224898060"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.32])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:28:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 26 Mar 2026 12:28:29 +0200 (EET)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel/tpmi: Use 32 bit aligned address for
 debugfs mem write
In-Reply-To: <20260325193048.3417349-1-srinivas.pandruvada@linux.intel.com>
Message-ID: <dc63e2ae-0773-8ee0-6b73-55eec4bbd673@linux.intel.com>
References: <20260325193048.3417349-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Mar 2026, Srinivas Pandruvada wrote:

> The memory write feature supports 32-bit writes to any TPMI offset.
> However, future hardware generations may not allow writes to non-32-bit
> aligned addresses due to hardware optimizations.
> 
> Since all TPMI addresses are 64-bit aligned and correspond to 64-bit
> registers, enforce 32-bit alignment for write operations.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/intel/vsec_tpmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
> index 98846e88d3d0..b70232d8ba58 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -479,6 +479,9 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
>  	addr = array[2];
>  	value = array[3];
>  
> +	if (addr % sizeof(u32))

Please use !IS_ALIGNED() instead (remember to check if you also need to 
add an include).

> +		return -EINVAL;
> +
>  	if (punit >= pfs->pfs_header.num_entries) {
>  		ret = -EINVAL;
>  		goto exit_write;
> 

-- 
 i.

