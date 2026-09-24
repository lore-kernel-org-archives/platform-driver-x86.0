Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5132D2E2665;
	Thu, 24 Sep 2026 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284262; cv=none; b=DiTh0zZivgvLpjRFVqYeObK8WQnAm4oO73XWbRiqHAFi5+m2z+34xxnaQ6iDmgMPyf1N5y+gtTsjy+saQhWY/E8hsoXlxpMYmh8rvKWCVf0LkcMDlRW8ZzKra3KuBYlJ9AXV8u4dypQopIdL0b46b4bGUwpDoxkQTQqmH2eqZlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284262; c=relaxed/simple;
	bh=NXthcVukq2Sri967JkGAsPjx3qpfxrwW2FT7TpDzLsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjgIbTikIW7GR/t4RXmoFF+KEBQDlsKU5F/CfAuCuE3M4klcYtpGkv7vfzHfk7J8FnvbWBvnmOzCjN0yuUnGs4hy5UzOf/NAgii9kd9sMZbFLO37a8wDxMGetqSBhppPI2gah7eU3PihTYYq33U8QvoXDNJV2KFlouS6M3pnf5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MugamcMm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MugamcMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284260; x=1821820260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NXthcVukq2Sri967JkGAsPjx3qpfxrwW2FT7TpDzLsQ=;
  b=MugamcMm/AM6QMKQwMS8tkqabxpQdlCY1fqb7CdO7EOqa8QD68Gza5eq
   kZ59E34EtPWqi8PUqBjs2sAeh2o8650zVnH0125IkHwlo1S3zCNjx2nNp
   ZYpsR323VLIAZA3U4jzS8nn0EJ3WxYOryrpRkk870kAOaM1HxpP1F2VPU
   Z1op2ysKXGeum74o3NAPECpGocWHUPgjq0DUYMMaF2QoE1Y/oxbzKPE3t
   BRgbKV+zl7geP9h4bvBqOrIo+paYztAC3p2sEJ/JnqIzMPx60j+T1QbpI
   eSlHWDPO9HcbciO/BYp0JUuYw6eDN4A0xG3fSyBRedoM4uNjyCevLC1MZ
   A==;
X-CSE-ConnectionGUID: h8djnz2hTT2E4jkP6hHrgQ==
X-CSE-MsgGUID: Kqt/m3iRSBGep0rRaH7dCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91088525"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91088525"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:10:59 -0700
X-CSE-ConnectionGUID: NJ0r/P1aR7m44gAt3jbohw==
X-CSE-MsgGUID: OvneasK5TN+lyjTUhDxDyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="302076897"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:10:57 -0700
Date: Fri, 25 Sep 2026 00:10:55 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/19] platform/x86/intel/tpmi: Include the headers
 tpmi_common.c relies on
Message-ID: <arWR3wRLuhsECqTP@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-12-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-12-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:33AM -0700, Kuppuswamy Sathyanarayanan wrote:
> tpmi_common.c uses a number of interfaces whose headers it never includes
> directly and only gets by chance through other headers:
> 
>   BIT_ULL(), GENMASK_ULL()	bits.h
>   __packed			compiler_attributes.h
>   EXPORT_SYMBOL_NS_GPL()	export.h
>   DEFINE_IDA()			idr.h
>   IORESOURCE_MEM		ioport.h
>   DEFINE_MUTEX(), mutex_lock()	mutex.h
>   seq_printf(), seq_hex_dump()	seq_file.h
>   kmalloc(), kzalloc_flex()	slab.h
>   USEC_PER_MSEC, USEC_PER_SEC	time64.h
>   uXX				types.h
> 
> Include them, so that the file does not break when an unrelated header
> stops pulling them in.
> 
> Drop io.h while at it, as iopoll.h already includes it, and sort the
> block alphabetically: debugfs.h and cleanup.h were the wrong way round.
> 
> No functional change intended.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


