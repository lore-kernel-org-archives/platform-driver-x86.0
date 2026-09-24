Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5551E39EF27;
	Thu, 24 Sep 2026 01:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790215164; cv=none; b=BCa4IX3FaC9FzEn5nKNzNyw3ycq1xtjahNpVrDhB+gUTyZZqZuTKS/bO7Yy5TOtGdvc1lWhlWd4b1DmCRnxPDvo82LcUfuYXOJdwzFoTaq9wRyP68Ckkq1DWSZXGEB9OBOkUUGZYL5GZeIXtg/YWpmJZp8DW9+GMhahfiq06BAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790215164; c=relaxed/simple;
	bh=TVRHx69X6GgaWbqjZ2+lVCyhOHXTPChxXHtl2drbFCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlQ5PAZSocDbf+Sf866jegFIGm8DX1I2qlrjQJK1uGcfeqgyofNidzWn/7HtO65cHcsmHKIJ+m0rJbEvb+ag+C8LnHIH5o3QK99d/SghnuBcZStA4qi0Fl22ugT8Qfcy4w2IB5vUAgKBMRUkxPXK9F8IEJBKqIN5W7RLMX3MOx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtaDkNMX; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtaDkNMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790215162; x=1821751162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TVRHx69X6GgaWbqjZ2+lVCyhOHXTPChxXHtl2drbFCo=;
  b=RtaDkNMXRyzvDygZvFMMF51BWBrN/TjdlKViZ60Ed94awQku0q1IoV4N
   ZdPNvsinT03lY+VwAYtVuHg6lOlqJTRxpD/zQlYFPdU984b6zjghzXwNS
   D6BXjOk+Jez2iKgO98wmzEZ4zjr6HDLpZOo+BBvPXurE9jN8+1CMB65bP
   mERZcEnI7Q42ei7m30EBSj/qH8gDTYiorvoq8JC6xKhmTihDrZPM8UPZn
   2568ojmllrxon4vshgWVJ+seLtRKnH2tXJGfKdNvgE0vuUQSOZyr553A5
   tjvQtyE/opoTc8kfv8uImUDNlOKMEGJ/MayHc0gr/39zsacSb7lLcqATv
   g==;
X-CSE-ConnectionGUID: e+/DFed1QZKLSx3fkYq8tw==
X-CSE-MsgGUID: ksXSoSxUTzCZ1nAQyJ4Cvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1481852"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1481852"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:59:21 -0700
X-CSE-ConnectionGUID: Jes9aVRwRbKu33hMBXvTtQ==
X-CSE-MsgGUID: swjtQWWdTBCYYc/QOcedFA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 18:59:18 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Yjz-00000000I5c-0xf8;
	Thu, 24 Sep 2026 01:59:15 +0000
Date: Thu, 24 Sep 2026 09:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: chipang_kao <prozac2734@gmail.com>, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: oe-kbuild-all@lists.linux.dev, corentin.chary@gmail.com,
	luke@ljones.dev, denis.benato@linux.dev, scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
Message-ID: <202609240939.vOix0FZl-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260924/202609240939.vOix0FZl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240939.vOix0FZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240939.vOix0FZl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/platform/x86/eeepc-wmi.c:25:10: fatal error: asus-wmi.h: No such file or directory
      25 | #include "asus-wmi.h"
         |          ^~~~~~~~~~~~
   compilation terminated.


vim +25 drivers/platform/x86/eeepc-wmi.c

e12e6d94db24e9 Corentin Chary 2011-02-26  24  
e12e6d94db24e9 Corentin Chary 2011-02-26 @25  #include "asus-wmi.h"
e12e6d94db24e9 Corentin Chary 2011-02-26  26  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
