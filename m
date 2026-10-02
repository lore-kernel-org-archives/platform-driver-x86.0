Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C5742E43F
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934073; cv=none; b=ezHs+XeAOLpwmYZICVJOG8yuuHXl714UethlqykPcY5dN5XJZdB8vsWWLRI+6KdDFIfqye1ldMWVSuVLEjGpWG2XlFclLigK1FRovmkvV2yTzPlG++feDMuk/XTmMWIZ+yoU7+3wyjm4RjjFstcIqAFhSbLJiqfUKdaQMGNZVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934073; c=relaxed/simple;
	bh=cLxsEXALfmr7ij56YkUCEbQ4ufQEghw5UlA0+gWgsjE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XkoPte7MXmzN+/H9G8EY3MAq0d8MgBelYOQJWdcWIpejkHXv70jFkrlluhn0HulfxOrGnejbwr+Ht9i4X4ffg5PWEBEM7VmTKQxw8lrAxus3ea3u1pReBu+pFvSCC33wncAYdwBZuFTxubjNcIluQ75x0cooycwxfUyP+DzNL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=En5uzBgI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="En5uzBgI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790934072; x=1822470072;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cLxsEXALfmr7ij56YkUCEbQ4ufQEghw5UlA0+gWgsjE=;
  b=En5uzBgISF9Cq1SiOwpauzqOPDKFPEbJvAP4o6YemFXV8OamUXc1WY7f
   l3gQL5rYIFB8YcFJL4vuygzvT9QIHyRV3y61BEu5S13z/LG1PAg9bxhgP
   t6TvN3uw4a9TwWUW5vikvKSfpeojrMcHkzSaQ4X9WBy+PCtt1rqCBrYZg
   J4HMJmsWL4zNAOgv6VF41hjKZLEFrWDVq+Ton6tpcnfxCdJsMTUcGtaqq
   R3oYQ8qSOuDa4QTmITNaLxNLoc+DfULskcSeKqzvTFAIrsIuOPaqzaBpS
   g3rp2f32xiyzp9weq/hZXcNs6TlUz2wOHVcCSUC1Ek/jjBA7s1iL4puSQ
   w==;
X-CSE-ConnectionGUID: ulpKa+GmQSKPRFFC8dgkxA==
X-CSE-MsgGUID: pvWAVvHeS825Cg9m9nz7pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102273965"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="102273965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:41:11 -0700
X-CSE-ConnectionGUID: E7mxrtWXT3igfwDI6sy66Q==
X-CSE-MsgGUID: //wwk4muTHuxzugZ4rDxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="272616425"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.243])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 02:41:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 2 Oct 2026 12:41:05 +0300 (EEST)
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
cc: "hansg@kernel.org" <hansg@kernel.org>, 
    "srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 7.4-rc1
In-Reply-To: <645699e90b0c4f7da46cd2e95023d6beced4a4ab.camel@intel.com>
Message-ID: <ab5228db-77e9-22b0-4ca5-525a89b02b82@linux.intel.com>
References: <645699e90b0c4f7da46cd2e95023d6beced4a4ab.camel@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Sep 2026, Pandruvada, Srinivas wrote:

> Hi Ilpo,
> 
> This pull request is based on
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=for-next
> 
> as of today.
> 
> 
> I am sending pull request from my repo at kernel.org for the first
> time. Hope this works.
> 
> 
> The following changes since commit
> fe5030c8cc7156223f48530e9b49aa87c0305bcd:
> 
>   Merge branch 'platform-drivers-x86-intel-pmt' into for-next (2026-09-
> 28 14:52:09 +0300)
> 
> are available in the Git repository at:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/spandruvada/linux.git
> for-sst-v7.4.rc1
> 
> for you to fetch changes up to
> ba4bb65333654ecb71381ab87484203e21b31c65:
> 
>   tools/power/x86/intel-speed-select: v1.27 release (2026-09-28
> 13:50:31 -0700)
> 
> ----------------------------------------------------------------
> Ethan Nelson-Moore (1):
>       tools/power/x86/intel-speed-select: Correct macro name in debug
> output
> 
> Jiri Slaby (SUSE) (1):
>       tools/power/x86/intel-speed-select: Clean all the produced files
> 
> Liu Jing (1):
>       tools/power/x86/intel-speed-select: Fix signed shift UB in BIT()
> macro
> 
> Srinivas Pandruvada (2):
>       tools/power/x86/intel-speed-select: Increase wait time after SST
> PP level switch
>       tools/power/x86/intel-speed-select: v1.27 release
> 
>  tools/power/x86/intel-speed-select/Makefile         | 4 ++--
>  tools/power/x86/intel-speed-select/isst-config.c    | 4 ++--
>  tools/power/x86/intel-speed-select/isst-core-mbox.c | 2 +-
>  tools/power/x86/intel-speed-select/isst.h           | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)

Pulled into review-ilpo-next. Thanks.

-- 
 i.

