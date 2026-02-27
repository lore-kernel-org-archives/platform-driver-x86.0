Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290732BEC57;
	Fri, 27 Feb 2026 14:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201365; cv=none; b=UeL2iiOdNvg/MzuIpztzg1Xz5vt8vufayhTfwSs6QabbUF0VPDhwSNvNm8ScFttb3sEXI+rkTV+uhH0XXr5+DnIO3B5cbhk99nxRRzlnnPqKAq42gvxpeSBzE6MBFtWztKlUuAWR7gRIYchNFRz/5ZY5uMLNbJeNzd8l1N8nj3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201365; c=relaxed/simple;
	bh=6aRLxmRufY/fzync8Bbs7FQ8Cd7uaAcimDl4MrijtZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFersBQr+DRTUvPAcJf0MFAjWxcaungkzRGHS2twhpOAZYItLCYmJPg2cIIp3WGHw9EPh10HdnLcPpGQs6rkCzxFtlhsgB0DSeFOWiT3u9BVPhAu0+2+AT/u1Oc/Pq0Uw16o3IVOEqrSANkV67tnP90PK3P7ywkfank1fCJqdmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPiw8Yr8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPiw8Yr8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772201363; x=1803737363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6aRLxmRufY/fzync8Bbs7FQ8Cd7uaAcimDl4MrijtZQ=;
  b=hPiw8Yr8TzXMAsbBlKUoShz6fRHUGqy8YFR72tJQ9klMVBhfz81J44Cq
   joPzx4mGncC3MHAqXxqKGubq5RUFqcBNPYfTK+c8bQedUo/O8Kkon4OVl
   QdIuq8ViPz0ofqvy95dnWg+pYjjp8HjIO9gyCeJVjHDB/Ej+o9AakQbgr
   o9k5OVYWgex7dkBiaf/JO+ccdxyeUQnTMmGrMXZe+7RBWAa3BwSa2KVW4
   BLsDznRJZmfSKOB+Np8mN27509UKKGkdYkLr4jcxl/xXaLFJz+HdhdidA
   XYld4BCWh11Z0BjFTyZPy+OSE5dAsw3KmpihRFAhE+fc0QufozP8sQwK1
   w==;
X-CSE-ConnectionGUID: rkQ8xWprSMm1Q9cQmf7+qA==
X-CSE-MsgGUID: 5C/BdsktS1ulNjTEdW1fOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="72986502"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="72986502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 06:09:22 -0800
X-CSE-ConnectionGUID: 9rxBEm+9QpamzRb+T86+pQ==
X-CSE-MsgGUID: 7fIa+cwbQD66bavQqya4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; 
   d="scan'208";a="220156445"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2026 06:09:20 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvyWr-00000000AeV-1t49;
	Fri, 27 Feb 2026 14:09:17 +0000
Date: Fri, 27 Feb 2026 22:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: edip@medip.dev, ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
	kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Edip Hazuri <edip@medip.dev>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add keyboard backlight support
Message-ID: <202602272206.TCDNUbu9-lkp@intel.com>
References: <20260227063122.7184-2-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227063122.7184-2-edip@medip.dev>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc1 next-20260226]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/edip-medip-dev/platform-x86-hp-wmi-Add-keyboard-backlight-support/20260227-145259
base:   linus/master
patch link:    https://lore.kernel.org/r/20260227063122.7184-2-edip%40medip.dev
patch subject: [PATCH] platform/x86: hp-wmi: Add keyboard backlight support
config: i386-randconfig-006-20260227 (https://download.01.org/0day-ci/archive/20260227/202602272206.TCDNUbu9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602272206.TCDNUbu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602272206.TCDNUbu9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/platform/x86/hp/hp-wmi.ko] undefined!
>> ERROR: modpost: "led_mc_calc_color_components" [drivers/platform/x86/hp/hp-wmi.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
