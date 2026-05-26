Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EBD33F8B2;
	Tue, 26 May 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779787235; cv=none; b=mLkTdQJQ8BiQkR0mfVTyvKHfky31iLv1b3KDs0jY6XFYzx3CsfZZRd7X1zfT7sPUxVPOfSVeKwcSdMrDWKM1HUoKj3FDN/2IWwpQyFc/do8vFhmV/IcUpN+kltNObNGdQg6n/eHuY+uaz2pyXfB5AuaeasFwdRICt60UqE/ZAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779787235; c=relaxed/simple;
	bh=LlxaZjVpVx7/toC9tD5/MRC5XJcUToMxeBAZlZnTLrU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cJjyJy4yosuhobIy4suBtX2sDoW7B8QWWiQN/sguOVJVh+FUI/wpp7iIgqK+GdVmqsVtZhDQq0Hott+QX78kDAru0A8t5se/MLRt5+kBt0dZU6Dj5txWzTejOIKSPSvfjVOWkiR1sliLBinU9H/GjbrVlzSygh4ZLQIw9WF3iII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAP3AlkX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAP3AlkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779787234; x=1811323234;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LlxaZjVpVx7/toC9tD5/MRC5XJcUToMxeBAZlZnTLrU=;
  b=SAP3AlkXqjPPUunM7IZIuvR5fo7ttVk31x+Bt3fgrmsgZQy1FE643jvK
   Rrvwci09I7ZdeOxq7l5JBmFFfqlqCFimKHKMSWJgOMwULovtm8ZtdVXcg
   vd1tz07Smqds6UjtK/WtNAcqhjcBNzS1GZkQyKVh7Rif+7JGKREXHls4H
   x8r+G277YeVJzgMBFUuIW23g45tqSEFBeVth17pnOTKkxHI03SCc/JrMK
   rhIMB7tllN+8VoecWq4rOmT8vtEk9XriveHULjTpBbn3CLnOZxb/mzL2X
   hLCaCYfcR9BCbWoHevyhZxAMTmZKPmYHfDVeFSIs0ZwAWqSiMKUBYMAso
   A==;
X-CSE-ConnectionGUID: PiRBOdiyQaGgU2tvLGghaA==
X-CSE-MsgGUID: gaj5S1mJRFy1vOI4JeFu9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80628686"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="80628686"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:20:33 -0700
X-CSE-ConnectionGUID: +uhghJvxSRCPEUMk7wXGWA==
X-CSE-MsgGUID: o9zjn4UdTieBxtT0qPFr1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="272179110"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.137])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 02:20:32 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 26 May 2026 12:20:27 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 02/17] tools/arch/x86/pmtctl: Add libpmtctl shared type
 enumerations
In-Reply-To: <20260526014719.2248380-3-david.e.box@linux.intel.com>
Message-ID: <c5699343-8124-a338-0438-ba21166ec7cd@linux.intel.com>
References: <20260526014719.2248380-1-david.e.box@linux.intel.com> <20260526014719.2248380-3-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 May 2026, David E. Box wrote:

> Add pmtctl_types.h to centralize shared libpmtctl type definitions used
> across both the public and internal library interfaces.
> 
> This provides a common definition point for core library-facing types,
> including device backend classification and logging verbosity levels,
> avoiding duplication across API boundaries.
> 
> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  tools/arch/x86/pmtctl/include/lib/pmtctl_types.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 tools/arch/x86/pmtctl/include/lib/pmtctl_types.h
> 
> diff --git a/tools/arch/x86/pmtctl/include/lib/pmtctl_types.h b/tools/arch/x86/pmtctl/include/lib/pmtctl_types.h
> new file mode 100644
> index 000000000000..8e3bf5a173c4
> --- /dev/null
> +++ b/tools/arch/x86/pmtctl/include/lib/pmtctl_types.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef PMTCTL_TYPES_H
> +#define PMTCTL_TYPES_H
> +
> +enum pmt_device_type {
> +	PMT_DEVICE_TELEM

Missing comma.

> +};
> +
> +enum pmtctl_log_level {
> +	PMTCTL_LOG_ERROR = 0,
> +	PMTCTL_LOG_WARN,
> +	PMTCTL_LOG_INFO,
> +	PMTCTL_LOG_DEBUG,
> +};
> +
> +#endif
> 

-- 
 i.

