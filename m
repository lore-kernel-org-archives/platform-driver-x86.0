Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795768417;
	b=gsSTODISmso4Ag4kLvB8cN56BsUNhC0aWvwixZ6NvsckQfD+92h0Gj/8yaEPkQQ+wI0K
	 17Vddxqlx/KS98GE5o3RvtWsY8StUGwnkogWeSsd1IOEe2oU1TYWazQiaFq8iv3jdKIaD
	 94ioaGTtrcc6zrSsZsd45gdAsw3THMreQBQY0JmoOwseGWSv4Om0SUIPHP2ay9NP9yNNj
	 xm2IHmuZpUFSOq0h3BLZSoPd1oA9Zvy6M8MRqOKY/PChc9fSE6t3MVaefQB8HoqJ0LYL4
	 3v54hac5NbqOpTyeoZ2FPLDLWC2blL23r+QZrhYDz+RPrRD13wRWsI3obKnBI4uOCpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795768417;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2adoUAJE2urbAHUCjcZJHR3qU6oXeqmDWStaP03rNfU=;
	b=R488kVxYTxXY4G/kxOy99CH1QQPDEkopzpW74BuTaswiPH2Pw5G2g0g0JhDcRJkg5u8x
	 R8Hqnqex4nN/EGoOGH34HCd9mv7AeVm6883ZvM2U1n/8yHta9Dpb88ry+cxMVxo/M9qhE
	 3zIculF2QZ6P+xpsc5bjQPOSBtPfREGQ97hEKlK0xFbhul3Y8AKBSdrLwMdAXGmkdknP3
	 Jrf097eTEPzgWKVlDr1g7mx5ES3fVPuxGe26OuukfN7IHAW+rCQpoc+mOjB9/QAg/UDVU
	 s7/3YSYiPeMLXbv1SOFqykV2/nFOF6yUjkGvK7bW5bqFe4bR+BJg4M7nJPFh/4BIXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hw0K3LRk;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC1B606A32E;
	Fri, 27 Nov 2026 08:33:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABC1B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Hw0K3LRk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795768417; x=1827304417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qO1CBDql5BdqV/ZAEf8Juo9+US4w1SccOa1RJtgkBvo=;
  b=Hw0K3LRktsAXAnM+ZnBN7Vz4D8gAn9BtPX3Rl7LlvKwYdB11YOiDxeJd
   S3u+F0OjS6iW2f9nVpfaBdsb9uLDT6WIAGt7kGK8UVltv3N9xzQ6T720y
   WM88QlhCt3JyBEcg1sdBcU3CsGUIr+P8VbeSblBGDNVgRSmD4xLqkDdzV
   C18HJ1DalGbou+U03xrnQPKDfdz6r54kivoGcxMHdRZzAJBKw2TTfFnIs
   rEEhPeEma6GdrYkHQ2WVxX5nm5GHzWuxgv+nFy3sXYn9JgXJPPVCLGG2E
   sNoeVNB/3rC/1uHydCwc1Rs83pRvqS5ReDKBxe/yuhbO+jZbkx0o9Ihze
   w==;
X-CSE-ConnectionGUID: DqA+4HhuROq9L6Ug2mVdag==
X-CSE-MsgGUID: DuLImOJdTvKsGWLVCpeX5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4587772"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4587772"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 00:33:36 -0800
X-CSE-ConnectionGUID: syHLHn8XT/ejptysGfyUHg==
X-CSE-MsgGUID: BJ2OY1R6TP2HtUrSTCXDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="12132628"
Received: from igk-lkp-server01.igk.intel.com (HELO e79648c3b81b) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2026 00:33:18 -0800
Received: from kbuild by e79648c3b81b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWrO8-0000000000r-44cZ;
	Fri, 27 Nov 2026 08:33:00 +0000
Date: Fri, 27 Nov 2026 09:32:04 +0100
From: kernel test robot <lkp@intel.com>
To: Alan Pluto <alanpluto@163.com>, platform-driver-x86@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, i@rong.moe, W_Armin@gmx.de,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw
 GetDataByPackage interface
Message-ID: <20261127084625.fhboKKCu-lkp@intel.com>
References: <20261123061120.18740-1-alanpluto@163.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123061120.18740-1-alanpluto@163.com>

Hi Alan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc4 next-20261126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alan-Pluto/platform-x86-lenovo-wmi-other-Add-raw-GetDataByPackage-interface/20261123-141120
base:   linus/master
patch link:    https://lore.kernel.org/r/20261123061120.18740-1-alanpluto%40163.com
patch subject: [PATCH v2] platform/x86: lenovo-wmi-other: Add raw GetDataByPackage interface
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261127/20261127084625.fhboKKCu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127084625.fhboKKCu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:823: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:256: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:279: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:317: ERROR: Unknown target name: "permission flags". [docutils]
   Documentation/userspace-api/landlock:832: ./include/uapi/linux/landlock.h:352: ERROR: Unknown target name: "permission flags". [docutils]
>> Documentation/wmi/devices/lenovo-wmi-other.rst:37: WARNING: Title underline too short.


vim +37 Documentation/wmi/devices/lenovo-wmi-other.rst

    35	
    36	GetDataByPackage diagnostics
  > 37	~~~~~~~~~~~~~~~~~~~~~~~~~~~
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
