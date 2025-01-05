Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787491D07BA;
	Sun,  5 Jan 2025 19:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736106320; cv=none; b=d539pEb1HSLedEeyJUSxzqmBd1FeBvZaHtUpBGFb5mtWgwxzdSDNUxlLmGDq1jOSCYrWjIdGGILMX+9WxSLgsOdnDjXNCfoeoSEg4yaNNT2yFUvpVA1sjlEPF37VYEsqppeOEgItWEPLLjNrF5C041ovRpSqSPWy/pnvJ9+jqYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736106320; c=relaxed/simple;
	bh=iBvD54JPeK5ixXvm/kmalDau6FZdHe/1SAO9TNCB+/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UMQ4CFhuWKp+VNfpXVdCMj6kIrIqwPPq4ilgGqrtV+yGRR2P/EUZPDCyWI67DzMG770n5KWwfPAQHIQFnqoSczK72HE9L7eQp5k7TFrqvMFObePhzOVaBu8hSRFYCtHzh6OEHD5nqx8oRlN4SdGy/u+5KwOu9wUIE32e+/1TEv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ze2W/mt+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ze2W/mt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736106319; x=1767642319;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iBvD54JPeK5ixXvm/kmalDau6FZdHe/1SAO9TNCB+/E=;
  b=Ze2W/mt+xfNLPqxI7rcpJ+EHKUPUpDorBofLTXwQXvwNCKOzcxCJD3Zh
   NnGuHpS2H6puj78YuYzioPxvWeGiLzawOEbQrzOdlKuLzT1qIdbsoRkxC
   mCqRGTcS2nVeVt504imYcypNRPLHEWfEFpYf9r0Xe1+oJSZ+FzUS9iZNR
   8g0lPtbn/rUwUK9hAHgDCinma8cymgrE21Hs1N4DCPp3NBsNGiUooQD9A
   Y0nBDdv95E7NMpWGv4cgkJFxAdaMzO8+0WfatD3OjgfuZa65PHMEzJxF4
   blsgDW02TSS+1bAZIatU8HsLqcJvLPxTYyJTX5+sUacXWe4WdyR2ZWt1N
   g==;
X-CSE-ConnectionGUID: cErfh2v9RaeVu2J80FZZsg==
X-CSE-MsgGUID: K1nd+Jo5R2C2SyjGc42zYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="39946019"
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="39946019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 11:45:18 -0800
X-CSE-ConnectionGUID: xSKKZzxPQ4S0keJ7S7ZZ6Q==
X-CSE-MsgGUID: ysUBLt8xRgCPJOmvi2F5Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,291,1728975600"; 
   d="scan'208";a="102140161"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 05 Jan 2025 11:45:16 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUWYj-000Bx5-1Y;
	Sun, 05 Jan 2025 19:45:13 +0000
Date: Mon, 6 Jan 2025 03:44:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ilpo.jarvinen@linux.intel.com, w_armin@gmx.de,
	mario.limonciello@amd.com, hdegoede@redhat.com,
	Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: Re: [PATCH v3 16/20] platform/x86: Add alienware-wmi.h
Message-ID: <202501060332.wvfPD58P-lkp@intel.com>
References: <20250105153019.19206-18-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105153019.19206-18-kuurtb@gmail.com>

Hi Kurt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6b228cfc52a6e9b7149cf51e247076963d6561cd]

url:    https://github.com/intel-lab-lkp/linux/commits/Kurt-Borja/platform-x86-alienware-wmi-Remove-unnecessary-check-at-module-exit/20250105-233751
base:   6b228cfc52a6e9b7149cf51e247076963d6561cd
patch link:    https://lore.kernel.org/r/20250105153019.19206-18-kuurtb%40gmail.com
patch subject: [PATCH v3 16/20] platform/x86: Add alienware-wmi.h
config: i386-buildonly-randconfig-006-20250105 (https://download.01.org/0day-ci/archive/20250106/202501060332.wvfPD58P-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501060332.wvfPD58P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501060332.wvfPD58P-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/x86/dell/alienware-wmi-base.c:17:
>> drivers/platform/x86/dell/alienware-wmi.h:9:9: warning: 'pr_fmt' macro redefined [-Wmacro-redefined]
       9 | #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
         |         ^
   include/linux/printk.h:391:9: note: previous definition is here
     391 | #define pr_fmt(fmt) fmt
         |         ^
   1 warning generated.


vim +/pr_fmt +9 drivers/platform/x86/dell/alienware-wmi.h

   > 9	#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
