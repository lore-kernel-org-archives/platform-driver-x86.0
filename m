Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DDE27FD56;
	Wed, 11 Feb 2026 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770829423; cv=none; b=aRB2ycXi7jMOGJpj79ZS3MPli2ksRMrQX67MJTFSNryiBy8AOxrZ3/y0QPQT491gdhZQsMstIJHb1a+NxJ8AXxjAixpwd9ANHH5fpRG1J0to1w4I85o5y/G0BnA3pi8nBXOoFha+nVweGVw4CLLSGlbxaRXZqMBNZqc88oXbXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770829423; c=relaxed/simple;
	bh=vjQ8Pcy2UpJDfcajfg1X2ExCqC7LgjKaqpwL0bvl6Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S4z+wsUQaEJXOKiLEHe4Z98BOXJ6SGgs+Ucfo8b1hnlVRP7oro7UNKyiAL5+GiOneVxPBC2CjWU415cJvgOQuUvMweZz8TVBxkoNttBm8zyS2cJj0ZcSnfbd6zQBBgsPXkzFxufqgXVpGu212akPLT5MWsxjkdvC0baJFDXuTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzcTK/px; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzcTK/px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770829423; x=1802365423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vjQ8Pcy2UpJDfcajfg1X2ExCqC7LgjKaqpwL0bvl6Xw=;
  b=EzcTK/pxHK/O1gjXEhgHcvwEZRCZAcvjYrCJogHdYb/7quctt8RUKoM8
   Kk2ia/R/rMj2ksr/kibR6HCEWs8DbTPySPaxRgpcwE8yKLLYL5dUz7kk5
   SSuiGjIH3CHaUjzzcNgjVoW6JShAaGrwP0eUDtqO/UtIOSWcjbmTj9wei
   FoI2XWN/B5+J9tF7PExRFC1Grkfqqlepd/FKEgSkGkSjfHYLFCP0mMU2A
   9CFquidu71OhNOiIE9bXIys3p5+nm7J3IT9Chtshx/c+/t6wXwMriUZsc
   abgKcBHxg73x/Ds66D7nX3n5LINEmndb+Z1+BOlHQ00Bef7C4WrofIlo0
   A==;
X-CSE-ConnectionGUID: 3rhvSP1ETSuSxdMMJSoqRw==
X-CSE-MsgGUID: EB8SPYZKQpmJD7NoCwiPJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71697378"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="71697378"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 09:03:43 -0800
X-CSE-ConnectionGUID: AkCbdv6AQEyDP9aYDxMjTw==
X-CSE-MsgGUID: KtqoMgmiSzCC8UjI1Tottw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="211341357"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Feb 2026 09:03:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqDco-00000000qBc-0NzN;
	Wed, 11 Feb 2026 17:03:38 +0000
Date: Thu, 12 Feb 2026 01:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Message-ID: <202602120036.rVaXQsI0-lkp@intel.com>
References: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211092640.3231-1-atharvatiwarilinuxdev@gmail.com>

Hi Atharva,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19 next-20260211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/apple-gmux-preserve-brightness-using-EFI/20260211-173626
base:   linus/master
patch link:    https://lore.kernel.org/r/20260211092640.3231-1-atharvatiwarilinuxdev%40gmail.com
patch subject: [PATCH v3] apple-gmux: preserve brightness using EFI
config: x86_64-randconfig-011-20260211 (https://download.01.org/0day-ci/archive/20260212/202602120036.rVaXQsI0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120036.rVaXQsI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120036.rVaXQsI0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/apple-gmux.c: In function 'gmux_shutdown':
>> drivers/platform/x86/apple-gmux.c:1058:13: warning: unused variable 'brightness' [-Wunused-variable]
    1058 |         u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
         |             ^~~~~~~~~~


vim +/brightness +1058 drivers/platform/x86/apple-gmux.c

  1054	
  1055	static void gmux_shutdown(struct pnp_dev *pnp)
  1056	{
  1057		struct apple_gmux_data *gmux_data = pnp_get_drvdata(pnp);
> 1058		u16 brightness = (u16)gmux_get_brightness(gmux_data->bdev);
  1059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
