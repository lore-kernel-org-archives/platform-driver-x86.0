Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D633EB1A;
	Mon, 12 Oct 2026 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789184; cv=none; b=BB73rYO5bakN8ZwiF0es7Fm1ltDhAXOEKvWXVm3UYEfPSoj5vffg9LnItt54iSTzRmm0yXybJpfcrZ89u6tBv6FuSVVxrQXW+TBqSOpwBANgEXiuG2zeOwrjhGuTW66NIpm8Odd5q7Q9MnN7zfuXNeQvl3wZ4FGT02u6WYBLEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789184; c=relaxed/simple;
	bh=yY7FYvyH3pznj2ZBnBu3oDtQjq5p2qbLcDoRRd2NEEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtcH4ohZrX6i6nxdykzODc0fPxLq/v8D+m29d4olq4emTKHgV0R7J+Hjzr9BVRxjmDJ7i7zedCO9BEJV2RKtq7ay+hMyTANIMfZoHCmw6M4CMi8WpdO3xkeELiXcZJjrOKbcTnV2tSe6WpJrEMTcmJNmlngTlom/y8sad8uHqkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgnZJUgz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgnZJUgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791789182; x=1823325182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yY7FYvyH3pznj2ZBnBu3oDtQjq5p2qbLcDoRRd2NEEk=;
  b=OgnZJUgzRV7JhVxKUcmcVqdX8X69YC/1RidFH68HPH/HM22x+WxAz/Qi
   xa15XvYWmgOP6zdT1MtV+6LSIr3m1+Q7WJhqxprOgXFygzygTKcTRdjWn
   fgvox8gHrt9/5oDldtECIfYm6g1aR8wMzV/wzhKpPvjvTOo6Vggve7k5S
   BwSGgc7TsBs+N/1cn1eo3kPPbNgHJV/w3l/iBgHgDg6chnr/XnrmQxnuO
   /gYSSQAk8z1sgWyRpSoRzqjNaBjU/ayMUUQeIBqsD/tTJ79JP2wqN1zoF
   XU9r/z7qVDY+LngDT8iF4H808tqv3bWQmnx05+vuIKP3LMYcaBBm62rcs
   Q==;
X-CSE-ConnectionGUID: U39StLvjQtu07wVngHER8Q==
X-CSE-MsgGUID: xhlRgVD1RxOsRDecLlNgqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="363958"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="363958"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 00:13:02 -0700
X-CSE-ConnectionGUID: shkb1Eh4SD+agw/q7GVb0Q==
X-CSE-MsgGUID: sbEVSBfYS7idPxHZg3vtZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="920325"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Oct 2026 00:12:57 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGADN-00000000B8n-2VTv;
	Mon, 12 Oct 2026 07:12:53 +0000
Date: Mon, 12 Oct 2026 15:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	KentoNion <kento@kekto.ru>, platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>, Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org, Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?utf-8?B?6auYIOS/iuaWhw==?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?utf-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
	=?utf-8?B?TWlsb8Wh?= Vlku <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>, Mingyou Chen <qby140326@gmail.com>
Subject: Re: [PATCH v10 5/5] platform/x86: bitland-mifs-wmi: Add quirks table
Message-ID: <202610121535.VUNgWVii-lkp@intel.com>
References: <20261011135748.11792-6-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011135748.11792-6-qby140326@gmail.com>

Hi Mingyou,

kernel test robot noticed the following build errors:

[auto build test ERROR on 98f039265e580291d5e76a11b2072541fbb1c393]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/MAINTAINERS-Add-maintainer-entry-of-bitland-mifs-wmi-driver/20261011-215744
base:   98f039265e580291d5e76a11b2072541fbb1c393
patch link:    https://lore.kernel.org/r/20261011135748.11792-6-qby140326%40gmail.com
patch subject: [PATCH v10 5/5] platform/x86: bitland-mifs-wmi: Add quirks table
config: x86_64-randconfig-1005-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121535.VUNgWVii-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121535.VUNgWVii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121535.VUNgWVii-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/bitland-mifs-wmi.c:136:1: error: extraneous closing brace ('}')
     136 | };
         | ^
   1 error generated.


vim +136 drivers/platform/x86/bitland-mifs-wmi.c

   135	
 > 136	};
   137	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
