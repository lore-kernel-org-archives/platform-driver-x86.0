Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD90636F90D;
	Thu, 24 Sep 2026 02:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217145; cv=none; b=EXHwxneVA+kks5hn3Ohqx/3Swcok3RrI3qmHMpPdUjoO0gGXL1ml+Dh9I3EUguXrd09fVraiHzL8XnHVTDukL37Bd4ufbxo6zbZ7Z9vuxZmFbSi7jhVYWJ++IkMMd2LIE0bhdJsTJM5xtjkMjPz/Wq2AeuFMd1gLkkK/Hr/yJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217145; c=relaxed/simple;
	bh=FcT9a8+2Ifutp/eEWwjAZ3UYN5Zk29/z4aCva7SlL/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFOQJeuWcijoqwIG2CLNC1q+0ZxSZsMfzsIlI8yBfz53NzvILyHrj5wYqNWf5Y9Axk4wODKF2CnUiK+Ynk2rEvQ/Sr1lIxkKjYi6q5G7iIA0Lz7NAJhkEfwkLLrKwVKuUXal+k/D4BPm/nTz97H5FTJCz6cjxkw42OjDM1lg5jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdqSsK8a; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdqSsK8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790217144; x=1821753144;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcT9a8+2Ifutp/eEWwjAZ3UYN5Zk29/z4aCva7SlL/Y=;
  b=mdqSsK8aa+hNUnMjeKBYkVytJbyfidP5ZLrz8QVQTBCsyq7lOOGIBBw4
   fLK24PWyB40PkSluoLdFp4dF/+UahTtZaTPaZI1xNaf0j6IcxYc4beFg+
   Q1ipH794f7mTU1bRjd37lqINQje+nRkrfpsh2MMOCXKtOpsO13W1mQ4wD
   mB4r2oN8806oz4ieEHYYqLWuxZuhrkw/vgEzvYFm1oObydxGnsouqd/Ln
   0EW6I8xJdSYsumvT8pLUqqfdT/r/Y4hoLpR2qtVISG4Ty1ua+gGpi4c+y
   AEUPIrnFcNpYBXA6qWdxQTagl/dS8mj0FxCkDI3qxhqNKJU5H24xK6iE8
   A==;
X-CSE-ConnectionGUID: 0SKM7UbrQOSC8dLUfgaj0A==
X-CSE-MsgGUID: 95mvwqHTTgW2G7zyTWqXXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101630717"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="101630717"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:32:23 -0700
X-CSE-ConnectionGUID: 1Wa/XYHfT9KwaHLrPbD0ug==
X-CSE-MsgGUID: mTES//UuQ0+CVr8yLXNR8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="270381501"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2026 19:32:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ZFw-00000000I74-1p1d;
	Thu, 24 Sep 2026 02:32:16 +0000
Date: Thu, 24 Sep 2026 10:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: chipang_kao <prozac2734@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
	scardracs@disroot.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, chipang_kao <chipang_kao@asus.com>
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
Message-ID: <202609241003.pdNIa1YN-lkp@intel.com>
References: <20260922032157.120188-1-chipang_kao@asus.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922032157.120188-1-chipang_kao@asus.com>

Hi chipang_kao,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/chipang_kao/platform-wmi-Move-ASUS-platform-drivers-from-x86-to-wmi-asus/20260922-112157
base:   linus/master
patch link:    https://lore.kernel.org/r/20260922032157.120188-1-chipang_kao%40asus.com
patch subject: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260924/202609241003.pdNIa1YN-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241003.pdNIa1YN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241003.pdNIa1YN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/eeepc-wmi.c:25:10: fatal error: 'asus-wmi.h' file not found
      25 | #include "asus-wmi.h"
         |          ^~~~~~~~~~~~
   1 error generated.


vim +25 drivers/platform/x86/eeepc-wmi.c

e12e6d94db24e90 Corentin Chary 2011-02-26  24  
e12e6d94db24e90 Corentin Chary 2011-02-26 @25  #include "asus-wmi.h"
e12e6d94db24e90 Corentin Chary 2011-02-26  26  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
