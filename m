Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0662ED84C;
	Sun, 25 Jan 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769362595; cv=none; b=S0r3fcVIw+jWB7WxxaKEhRGDXlF6Auyx6B0fvd8oGBtnyGSTy3W7IY7AQH+QG/oSQGMlw4Tx5IcfAYt5tDv6qUGa5VbQ3BLPXfXL+vPWRmmfokVFBOFZfJehIITXGhJvKEr7gzZZhjyjBJdaEKHrYxBn+tw/HtGQoFQgJMR/KS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769362595; c=relaxed/simple;
	bh=nv1wxSrtm7P0hycmz56kHy70Z0Tg3BIJ1VNF0ACAFoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC8XFFPc3W6J3M6uHu4+V4mUEWlt9VswzlpDCUqRlvWVIrFwVGDo77BXCMBIrkmGAfnbqp3GOLyGIOOYluSivNCFPvkZzzFLaVrBWue2yUlZOyNIVmzas/NTiVpOQleQFVuCXlO/5oJibPzcc2bXHFXXC5NluaaJPEGmxC2mz9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkMCYLBn; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkMCYLBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769362594; x=1800898594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nv1wxSrtm7P0hycmz56kHy70Z0Tg3BIJ1VNF0ACAFoE=;
  b=LkMCYLBnu9sfAKTGPw4OG4BmdhF5MZKp3pAQKPPfdy0jkiSbJM+AZHbs
   +H9TvXIJXT9Q5bIQ4qdfn5oAv8elpnVDjRij7Sr8tFrcqfgbuWkw5ebx2
   4aSyPgmlHO0Y2/ymbcBRNaSLFco8YycIrd82NTx+qxlfzzDG9cP7Vas5T
   yQrU9DkJLD7OScYSDIMnxF6miajGIKA+CAI7cuty9o5h25xcg2JlcBM+F
   YAmt74ndRA9q94M0ZS3qxmwsLlgwhT/EB8xMFSa53cHPG7PRzqFCzFzMJ
   hNz1fXDSdCC8k03QRu0Tv0rTx7CafruIfQRVdM5lWgwKUSONchr8ahROB
   A==;
X-CSE-ConnectionGUID: XDDtU7crTcGOjxDB0sk0zA==
X-CSE-MsgGUID: 507+2jLASVeWQA8Qqbc+9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73137748"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="73137748"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:36:33 -0800
X-CSE-ConnectionGUID: ehcMsMgnQ2Oyiy3lgNVKug==
X-CSE-MsgGUID: Dny8s/5ORwO1xDUdrwvm6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="238139627"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Jan 2026 09:36:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk42F-00000000WJ4-0Wiz;
	Sun, 25 Jan 2026 17:36:27 +0000
Date: Mon, 26 Jan 2026 01:35:49 +0800
From: kernel test robot <lkp@intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>,
	thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
	irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev,
	"David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <202601260115.T3rBZhUE-lkp@intel.com>
References: <20260123025108.3772255-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123025108.3772255-5-david.e.box@linux.intel.com>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/David-E-Box/platform-x86-intel-vsec-Refactor-base_addr-handling/20260123-105437
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260123025108.3772255-5-david.e.box%40linux.intel.com
patch subject: [PATCH v4 4/6] platform/x86/intel/vsec: Switch exported helpers from pci_dev to device
config: x86_64-randconfig-074-20251025 (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260115.T3rBZhUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260115.T3rBZhUE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
>> drivers/gpu/drm/xe/xe_vsec.h:13:30: error: 'struct device' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
      13 | int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
         |                              ^~~~~~
   cc1: all warnings being treated as errors


vim +13 drivers/gpu/drm/xe/xe_vsec.h

    11	
    12	void xe_vsec_init(struct xe_device *xe);
  > 13	int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t user_offset, u32 count);
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
