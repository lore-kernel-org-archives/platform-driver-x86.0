Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2B32A3EC;
	Tue, 16 Dec 2025 04:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765860203; cv=none; b=H3DBZAk2+fLgo6r+8xBXL8yMfDpAhEeJkJfdj9GzbgKtqF8eouOF97NZbJObVjsDT0zXBxWEJuddNEUyKnAmwlhYcfTBt83AqO1IbVh+QkXE9FAKtjtBR06eUEvXrG0NXeRR/e9e/bokR6845JvTYkuU3AtPS/P9KvUI6hlezns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765860203; c=relaxed/simple;
	bh=tCQyFbP6HwuBTTsuM4oZ8IA1MF2btjhmh5O5Tdkr270=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uxe/LFaF31nm9/lUpYKZkduQR06unSWzlEBuMkpTbSRn+JcJ3fl+q2wg14z2b2okYlP06lRDuJ5XLKG0QG3KLXTLKFzkml25Pf4XwRlsEJnOOKxkUTe8UhTeYk19oabW1tUchDz5UxhTVN65K6n2cRUGMQKzHnJBYmw08ZFmpeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFqF3Rm8; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFqF3Rm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765860199; x=1797396199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tCQyFbP6HwuBTTsuM4oZ8IA1MF2btjhmh5O5Tdkr270=;
  b=gFqF3Rm8EBIkDO4DXkalyASZ6FfzDd/L2ld+TpwgoyLlJRZ1KfgRVmvq
   iNX8B/AcYehVn/CgKc0iFRYGROQthJVq68cJ3CtyBTFL506LB4RfH+QJl
   WbS/iQ4vU0G5VE88Yg3KnFubv07JoWszqbclrgcn9qzpXXaCejVkWOGJn
   zCR+6HcByJ13hIwlNWW73nJM6aHE3J7Olbg/GR48KL8WVMbOT2AVVAN4U
   hn9CuZmmG1CUFblZ1mdxoa4xqV0WNdC5EhFCy2uV6L3Bh8OX89TB6NKhx
   BmsacmKW7p1mBPSQ1s8h2Cewb3tCXi1dsE4C1c5AwMkLM6vKpz/Ps9qFv
   g==;
X-CSE-ConnectionGUID: 5czA+sq0QMOw9lWkLGbyYw==
X-CSE-MsgGUID: VqNWM6YSS6OK/4/f75ytLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70351211"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="70351211"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 20:43:15 -0800
X-CSE-ConnectionGUID: gEN7vG00QMuiS8XEz/7qJw==
X-CSE-MsgGUID: sdKCnweMTimvP0N0R5NGEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="197963452"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 15 Dec 2025 20:43:13 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVMty-0000000031A-1wQJ;
	Tue, 16 Dec 2025 04:43:10 +0000
Date: Tue, 16 Dec 2025 05:42:13 +0100
From: kernel test robot <lkp@intel.com>
To: Nitin Joshi <nitjoshi@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, njoshi1@lenovo.com,
	Nitin Joshi <nitjoshi@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display
 details of damaged device.
Message-ID: <202512160557.9va36P2F-lkp@intel.com>
References: <20251210151133.7933-2-nitjoshi@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210151133.7933-2-nitjoshi@gmail.com>

Hi Nitin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.19-rc1 next-20251216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
base:   linus/master
patch link:    https://lore.kernel.org/r/20251210151133.7933-2-nitjoshi%40gmail.com
patch subject: [PATCH v2 2/2] platform/x86: thinkpad_acpi: Add sysfs to display details of damaged device.
reproduce: (https://download.01.org/0day-ci/archive/20251216/202512160557.9va36P2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160557.9va36P2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Hardware damage detection capability
   ----------------- [docutils]
   Documentation/admin-guide/laptops/thinkpad-acpi.rst:1604: ERROR: Unexpected indentation. [docutils]
>> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1605: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_zone.h
   WARNING: No kernel-doc for file ./include/linux/pstore_zone.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h
   ERROR: Cannot find file ./include/linux/pstore_blk.h


vim +1605 Documentation/admin-guide/laptops/thinkpad-acpi.rst

  1598	
  1599	        cat /sys/devices/platform/thinkpad_acpi/hwdd_detail
  1600	
  1601	This value displays location of damaged device having 1 line per damaged "item".
  1602	For example:
  1603	if no damage is detected:
  1604	  No damage detected
> 1605	if damage detected:
  1606	  TYPE-C: Base, Right side, Center port
  1607	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
