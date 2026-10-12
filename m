Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3355F36826B;
	Mon, 12 Oct 2026 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785876; cv=none; b=J9MBQsFVOilsLiCFsBn6+xgErCkp0l0nofQpF9mI/1/z1hn7zuTbqDGo0FQCxq7ASccczZ/F+Au0MVCpqc2Iu08hKK/ZrXkY3eHPQ9B4k13Oyg5AqGtbBw4rBk1DwdOTE011FvmznU9rHnkwoDo5PTFYwWjQwFNZ4xIi2uxXbUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785876; c=relaxed/simple;
	bh=oZ3QOPsy+VxetgWZo1EG+wRxp3I5AHDMksJYvUQGj3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWi1S0phn1eCY9zwQvjih9qiAR97k8HtfKaHngTU/qKin0ckRJLFbHdTK0OlF0lld1McfRtyy5LMWGJKHp44N04iVItvDv8frVpXRyQBd3AlRaqVZNLo4gvEvTXaB2H8iqwlArW2OMw9KOHwlzaDyJo84f8fPWpmZi/OxJXHeBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EMqOPxLa; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EMqOPxLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791785875; x=1823321875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oZ3QOPsy+VxetgWZo1EG+wRxp3I5AHDMksJYvUQGj3I=;
  b=EMqOPxLajyJSC6e7A3GUlru5WgUmH2T0YZ9VGJkg5zSxAv0QVNd6EUSK
   eDD6pxS/8LFwapG+gbLsREQuFgHh2Ds1O/l7aAn0KhowityByMcUTNoeF
   GaLbRvJP0ILSzzFpPqNESxUttnzXEAhu73aG6Twv+o21YjdWLWwf9maCE
   NbLaJKpUxexFbFSn0grkIFVvSo96f6y29geP+lKemfXypYcjLYsav5I2h
   6ee8ATQm1iL4EtGZ2mn40Tmu/KnMBdf3N7+iNGUo9MZ8Ij2dYP9xMQ2Mi
   jOBqhY/dCqMU4y0+cqOp+xi7bdoVkvR4Dvjskk0kfLrq9xPwStu+osEse
   Q==;
X-CSE-ConnectionGUID: hqqCrO5iSZKvpz/WfdTJKw==
X-CSE-MsgGUID: y8djZ3FETx2i4a8I/hgLAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="372058"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="372058"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2026 23:17:54 -0700
X-CSE-ConnectionGUID: 7vFgkGqGTYquOR2yNhJYLg==
X-CSE-MsgGUID: spKNAYhPTCuAT4cnrPMzcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="2643050"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 11 Oct 2026 23:17:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xG9M2-00000000B65-1eKe;
	Mon, 12 Oct 2026 06:17:46 +0000
Date: Mon, 12 Oct 2026 14:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mingyou Chen <qby140326@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
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
Message-ID: <202610121439.FWm3hssT-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on 98f039265e580291d5e76a11b2072541fbb1c393]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingyou-Chen/MAINTAINERS-Add-maintainer-entry-of-bitland-mifs-wmi-driver/20261011-215744
base:   98f039265e580291d5e76a11b2072541fbb1c393
patch link:    https://lore.kernel.org/r/20261011135748.11792-6-qby140326%40gmail.com
patch subject: [PATCH v10 5/5] platform/x86: bitland-mifs-wmi: Add quirks table
config: i386-randconfig-1006-20261012 (https://download.01.org/0day-ci/archive/20261012/202610121439.FWm3hssT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261012/202610121439.FWm3hssT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610121439.FWm3hssT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/platform/x86/bitland-mifs-wmi.c:136:1: error: expected identifier or '(' before '}' token
     136 | };
         | ^
>> drivers/platform/x86/bitland-mifs-wmi.c:100:46: warning: 'bitland_mode_map' defined but not used [-Wunused-const-variable=]
     100 | static const struct bitland_profile_mode_map bitland_mode_map = {
         |                                              ^~~~~~~~~~~~~~~~


vim +/bitland_mode_map +100 drivers/platform/x86/bitland-mifs-wmi.c

    99	
 > 100	static const struct bitland_profile_mode_map bitland_mode_map = {
   101		.balanced	= WMI_PP_BALANCED,
   102		.performance	= WMI_PP_PERFORMANCE,
   103		.quiet		= WMI_PP_QUIET,
   104		.full_speed	= WMI_PP_FULL_SPEED,
   105	};
   106	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
