Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAA727B32C;
	Fri, 20 Mar 2026 02:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773974529; cv=none; b=XKk6WHKOGbxF5IRgvsqBCv8ij4Rkoaq/cE7tv2EeF3jnG9re+LDUv+CoH0CpQ6d4pQKRmHJ4EUiSd6YqZ0RQ/cH79W0f50U67PAlY7oOiVmYToUdNpmBh4jit1z7e5ZYUWXoxYvcDXgZR5sWEDhG1aCj/jdvrM4zIE4oA3LTYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773974529; c=relaxed/simple;
	bh=W6zx62+sodyofF1NBjLkJY7GQAvhi3jFltkvnMV32Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCUbAPwkv4BgOeOLGUQT801Z56tTyc6BlLBv9gxD019FEM2GG8nu4AesqPA1EMF4YCTDoBWp1TL/MgMicbHnGbZMD1VMGKvWbY15Z20Ml9XjlxPae9uVDN7gx5DvkRASe5417kk0Btd62NvYTUMiSKAfZrqRZ47X+29yDSfAcBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZ52z1ma; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZ52z1ma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773974526; x=1805510526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W6zx62+sodyofF1NBjLkJY7GQAvhi3jFltkvnMV32Eg=;
  b=mZ52z1maHZjjVWoofrIooMbM//N/Cn1QDXHTW+OhebphZhHWucWRlmrk
   dojG7iHZRBDr6pvLoH4s1T3ZMMVJvbYDnGxYbA2ljVdYBn9+RU6ZLWDEl
   t73npSv3oj20vAt/kTkb5vTpJ3Tndc1EG12SnJ+kZxtMqGo+cZmt9hYns
   rLqwBrQwTxbZT5m0TUrEp2vRDMZBbbvdDmE3cGXS83wWSSwl3C+yY8DWI
   lJP+mL8BiIvyn2NMHBmCUuBPEFZvfeTDjD/sWKPzt57DfpSNDDT4yfhUf
   S+8BdxTRUuREWmBNvR5VQqJ1CcJEKuDb8ECYo3wk8MSzs8jkmnhXRMhfk
   Q==;
X-CSE-ConnectionGUID: YMadPUimQiy4lNOszeHpEQ==
X-CSE-MsgGUID: YMDLU1A9Tl+TaWr0YX7vYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74946806"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74946806"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:42:06 -0700
X-CSE-ConnectionGUID: g+hk/UxXTfyAjEwquQb/Jg==
X-CSE-MsgGUID: N8ucO9h8RIyyv/KwDaQGSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="225098471"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2026 19:42:03 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Pm7-000000001sX-2EIL;
	Fri, 20 Mar 2026 02:40:04 +0000
Date: Fri, 20 Mar 2026 10:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org, brgl@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3] platform/x86: meraki-mx100: use real software node
 references
Message-ID: <202603201042.shIkStw0-lkp@intel.com>
References: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-meraki-swnodes-v3-1-15501a52300e@oss.qualcomm.com>

Hi Bartosz,

kernel test robot noticed the following build errors:

[auto build test ERROR on b84a0ebe421ca56995ff78b66307667b62b3a900]

url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/platform-x86-meraki-mx100-use-real-software-node-references/20260316-165120
base:   b84a0ebe421ca56995ff78b66307667b62b3a900
patch link:    https://lore.kernel.org/r/20260316-meraki-swnodes-v3-1-15501a52300e%40oss.qualcomm.com
patch subject: [PATCH v3] platform/x86: meraki-mx100: use real software node references
config: i386-buildonly-randconfig-002-20260320 (https://download.01.org/0day-ci/archive/20260320/202603201042.shIkStw0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603201042.shIkStw0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603201042.shIkStw0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "lpc_ich_gpio_swnode" [drivers/platform/x86/meraki-mx100.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
