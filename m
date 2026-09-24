Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C99D4E13FD;
	Thu, 24 Sep 2026 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284474; cv=none; b=I0BKdsoFWp2RLeC2Zcb7eROhgHdKitdKvrJsxCeRoC9GUcCXtMOdxhtEj+KaJVuCpMsa7VrIAxNs+MsqhpWRZVVxCe6J2mzr5Vu52v5k7q8wqpFos/NalDIEVC8chqMcceqKhnxSjkErwgpGYxWrzg/WYI/n8hdx5OJTzm7ttsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284474; c=relaxed/simple;
	bh=p5F2ufXiXxSq8JXJebLRRQpnP9zI07UTZOpl2WgvkU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8PkvO97LXUzKFaQellBWnX9CGNVVTqfi9E4zQtupoGesmA7nlx9jp93WtIE128TcG2+mCqth7hnKvM5ZZsbfcSvBUIArk9gqGQWoUthqyy0xE3jqCke+sqOn1DcRoZj07f/Djo+TNTi6xayRzuIwk0xcEsvHutlXC51dzcGLn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzTJ2ohD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzTJ2ohD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790284471; x=1821820471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p5F2ufXiXxSq8JXJebLRRQpnP9zI07UTZOpl2WgvkU4=;
  b=fzTJ2ohDOopUoNHCROt6PRJ5zP3rwZoscqlveSKWIGclc8Y7si7PosDa
   nsGUY+VLmcO29JiMSmAVUn86jeoJO6zyyyFfSxeynZZ4tkeMHEut1PKxQ
   Hf92/F0Y1UGycMKTn2x4tunh/KXdWMRW9ZExNl227B9eF4Tfp1lsOt1W2
   BZMGGKddWes7LuQL7ubK6llmKeJYFZF28+z0NmFpe1aXCIFdXOcKKXT6e
   wg+II4ZakgSIxoySZMZh5sPspbgWsLwHzGsvjPe7Jz1PR6xl5wv5mQZXE
   nLRn6tUHruWcBI5+bXFAPyh4zMBibGcpY4OEd6L5XEeH+lAVA3n+H/CU0
   g==;
X-CSE-ConnectionGUID: vE72Yj/3R3GyJ6CmfFy8lQ==
X-CSE-MsgGUID: 9ckEcgfOR5iIwIpn1T46sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90937663"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="90937663"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:14:28 -0700
X-CSE-ConnectionGUID: xQ42FdkCTBqrrVgUoiPjtA==
X-CSE-MsgGUID: VrvdUoNyQ/WO2RTBHy/5RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278863085"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.199])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:14:26 -0700
Date: Fri, 25 Sep 2026 00:14:24 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David E Box <david.e.box@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/19] platform/x86/intel/tpmi: Use
 DEFINE_SHOW_STORE_ATTRIBUTE() for mem_write
Message-ID: <arWSsClUs_6fOo9s@ashevche-desk.local>
References: <20260924182342.212709-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20260924182342.212709-17-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924182342.212709-17-sathyanarayanan.kuppuswamy@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 24, 2026 at 11:23:38AM -0700, Kuppuswamy Sathyanarayanan wrote:
> The mem_write debugfs file open handler and file_operations are written
> out by hand, which is what DEFINE_SHOW_STORE_ATTRIBUTE() exists for. Use
> it, and rename the write callback to mem_write_write() to match the name
> the macro derives.
> 
> The other two files in this driver already come from
> DEFINE_SHOW_ATTRIBUTE(), so this also gives mem_write the
> .owner = THIS_MODULE that the open coded file_operations was missing.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


