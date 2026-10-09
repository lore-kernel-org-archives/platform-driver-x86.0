Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A553CF698;
	Fri,  9 Oct 2026 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791590377; cv=none; b=FS2tWpznAezF/7UEM2dvtKQ9P7GJdScByvo1acnZY8e4mdAbhkJSX8wk+z43ROiPSmfuUih2nA3UcDoBUSIm636rS0CD0VEw/l5Pw02+ykmZnfTfWH/fyg7pLRLkGn7DxSMNnBrXYRjlLEBctCrmFgpKuzB8tNy5LSF3JBadfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791590377; c=relaxed/simple;
	bh=WNPatVzzuvKZdUZ4R5i/vvoawReUsH1sEinBqSXpmB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ts/5Ukxg3zNHIgrm9iIVNFwvutep+Ng2ktarCk+vhbdLh++EJc5lBwqAHBqmU5EbLcfT/aodPuAmDugy9Gx92oij+PerIGbQHWvgWidZCaYWxkGXMFopIcP++LvsaW6qfYN3/PQjDtdwNe9iB+FCiZuBWldwO0PKpJCukQAISas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHnGbHyJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHnGbHyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791590377; x=1823126377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WNPatVzzuvKZdUZ4R5i/vvoawReUsH1sEinBqSXpmB8=;
  b=MHnGbHyJ2q2lp22IB6zElJ5yO2fmnQu8Fo0zZkqceKPXcU+ClBCKOrs5
   w6KMLlRLGqg+a5mAWPfsS9KS8cu+c960NjZ0yQK/h6l7abYtHVyUt5m7e
   0sMFj4ANGm1yhUGIuKmh0+y6LFi/SbRSSGD4AUrtZ/XiTT6kZYre7iADq
   6MMIYxCZBYyfBfU5ch67GOQQu9H32YUUjyJXrKacgPXbZkjRmwN5XSXJ1
   R5Q6iwWU+ZGxPBbgoWXPKE5WTu1jdH3hnC4V9kCDggvlPzhSm40rBSvFD
   Y5I8aqTICTeISObdR2gATiOcg/uBM72C43+1jruNU52pZeNoXcvFggwAa
   Q==;
X-CSE-ConnectionGUID: 6Y/TODuGR9atc76EJvkIDA==
X-CSE-MsgGUID: lhL5UY0bRw2eKZEjl3poKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11930"; a="403366"
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="403366"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 16:59:36 -0700
X-CSE-ConnectionGUID: IshxscfPSGS2BR/5Wq9dCQ==
X-CSE-MsgGUID: of6C+tFjRISwct4T+GAwvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,149,1787036400"; 
   d="scan'208";a="2177749"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 09 Oct 2026 16:59:34 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFKUu-000000006Iy-09s6;
	Fri, 09 Oct 2026 23:59:32 +0000
Date: Sat, 10 Oct 2026 07:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Muralidhara M K <muralidhara.mk@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Muralidhara M K <muralidhara.mk@amd.com>
Subject: Re: [PATCH v8 1/4] platform/x86/amd/hsmp: Recognize Family 1Ah
 client platforms and hide server-only paths
Message-ID: <202610101031.PjgWVMZh-lkp@intel.com>
References: <20261009061356.3234513-2-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009061356.3234513-2-muralidhara.mk@amd.com>

Hi Muralidhara,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6c377d19d4a5116d9bec5203aa3c6c11523e7898]

url:    https://github.com/intel-lab-lkp/linux/commits/Muralidhara-M-K/platform-x86-amd-hsmp-Recognize-Family-1Ah-client-platforms-and-hide-server-only-paths/20261009-114353
base:   6c377d19d4a5116d9bec5203aa3c6c11523e7898
patch link:    https://lore.kernel.org/r/20261009061356.3234513-2-muralidhara.mk%40amd.com
patch subject: [PATCH v8 1/4] platform/x86/amd/hsmp: Recognize Family 1Ah client platforms and hide server-only paths
config: i386-buildonly-randconfig-1004-20261010 (https://download.01.org/0day-ci/archive/20261010/202610101031.PjgWVMZh-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261010/202610101031.PjgWVMZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610101031.PjgWVMZh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/x86/amd/hsmp/hsmp.c:25:
>> drivers/platform/x86/amd/hsmp/hsmp.h:48:10: error: use of undeclared identifier 'acpi_gbl_FADT'
      48 |         switch (acpi_gbl_FADT.preferred_profile) {
         |                 ^~~~~~~~~~~~~
   1 error generated.


vim +/acpi_gbl_FADT +48 drivers/platform/x86/amd/hsmp/hsmp.h

    38	
    39	/* True when the ACPI-reported PM profile indicates a client platform */
    40	static inline bool is_client_platform(void)
    41	{
    42		if (!IS_ENABLED(CONFIG_ACPI))
    43			return false;
    44	
    45		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
    46			return false;
    47	
  > 48		switch (acpi_gbl_FADT.preferred_profile) {
    49		case PM_DESKTOP:
    50		case PM_MOBILE:
    51		case PM_TABLET:
    52			return true;
    53		default:
    54			return false;
    55		}
    56	}
    57	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
