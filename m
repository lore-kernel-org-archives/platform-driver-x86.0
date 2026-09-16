Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122EC3E1CFB;
	Wed, 16 Sep 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789584442; cv=none; b=DzxkI1ds7NHX9ssD1TP23QabKxZ7+o6FpNzSBGg9bc5WzFQMGAw+1fs1mrLjgHKbTsvfpEZxGcJUo0yGBFYWJVDjass7lZirMbkDp47wRBMAAkx5xJI5sC92Be+PFZ6WcYV8AwjiNvugLilozA4LRaj3ucwRwooxt4hUxwKvVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789584442; c=relaxed/simple;
	bh=5qMDvgqidgBXluYQY0L+xIczwEmBMESJQxkz6VoaILQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROOd9FQRL3ruIs5dhqXoNM0/XXsj0rtjUD1E5fwimBgiww/j//DPgTr16K0kEfuUgL33cStsBHmT/HxDqywcDljBdxd6WQPh5A+sVBhARd9bQKFIC2VZauDEgDASzVZKr4nynHy8R5G+OipkdmyOHDfJfDZVfiDmTJVIEPtKso8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esWDwsqs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esWDwsqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789584426; x=1821120426;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5qMDvgqidgBXluYQY0L+xIczwEmBMESJQxkz6VoaILQ=;
  b=esWDwsqsEBFqtSsplqDAqVuKMVqw/9/Y80e9mDVu7DFh8gIrSRzaVehH
   m9OtJjxx1qM5L33M/+vLXRhXp7qbSrVPZtFRtnUjju9pazOqwRiRr/Azf
   xHBN960xiOplqfvrznuDh1eGw10/pen3SzFPt1PLhpn9fYAJ8no01CPls
   LdWvQZS6722pqu2A7HjnZ6GOd8X+nSFrepfhUXHjGoYKT5U1opvftAa4I
   pk+4UjVlYS+c8k6GKqiq3Yke2Uf77ANynhg4Tu52gQ8N1+X4zXaez2usX
   RBc3y5Mf9//h0jdcEl9imk35lzTYdWCtEmjsbQcUjR/GRk3WIf09AamrM
   g==;
X-CSE-ConnectionGUID: sau2zAkTT0WXR+UoCWg9eg==
X-CSE-MsgGUID: ow5xCBHqR/CPlZh6a7VToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101122984"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101122984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:47:03 -0700
X-CSE-ConnectionGUID: oa6fmMu+TK2Dhrs34r+etQ==
X-CSE-MsgGUID: jiX81ywERWa811dnKHayBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272943685"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Sep 2026 11:47:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6ueo-000000006a9-1xux;
	Wed, 16 Sep 2026 18:46:58 +0000
Date: Thu, 17 Sep 2026 02:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: Asai Neko <sugar@sne.moe>, Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Asai Neko <sugar@sne.moe>
Subject: Re: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Message-ID: <202609170232.23BqcT7n-lkp@intel.com>
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>

Hi Asai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 587858367581b9c55c3690f4e63382ad622719d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Asai-Neko/platform-x86-asus-wmi-don-t-warn-when-LPS0-is-unavailable/20260916-003256
base:   587858367581b9c55c3690f4e63382ad622719d4
patch link:    https://lore.kernel.org/r/20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9%40sne.moe
patch subject: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is unavailable
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260917/202609170232.23BqcT7n-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609170232.23BqcT7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609170232.23BqcT7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/asus-wmi.c:5428:66: warning: data argument not used by format string [-Wformat-extra-args]
    5428 |                 pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/printk.h:564:37: note: expanded from macro 'pr_warn'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^
   1 warning generated.


vim +5428 drivers/platform/x86/asus-wmi.c

  5421	
  5422	static void asus_s2idle_check_register(void)
  5423	{
  5424		int ret;
  5425	
  5426		ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
  5427		if (ret && ret != -ENODEV)
> 5428			pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
  5429	}
  5430	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
