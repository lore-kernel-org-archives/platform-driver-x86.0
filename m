Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795255558;
	b=5AmywesgxXSWFIe+jfiRO6jHJx+eeNyv5IW1x+MNiHe1CCeFd6L56e+jHl6M7ihJrQ5C
	 qTeaJ/YRJt7KptokzKqjzNRRYCAvFiGVFxLIvjJ1mzD02RKul00+zbBNkDN3Z0md7zYXf
	 EOq3811Cr0D6NPAYOU45dabz1a/6/c6yGtvX+awDFjiP8FlSA6yBnDRdaXAATMgHRZ9Cs
	 SFLrbIrKyoxeE5XA+Q/RITkd5dBpsmJ+C2hWSj0usKcfiouMJOokHlujK2SGqAAnUL11b
	 aH1ZiX2ccRMyrKURA34xSGmv+a9naYXyKLzuqeXuUYW1E6gpcdT4GO4OwGXAaTgBZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795255558;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zE5eX58071rX2+3ny95L61kUwJINXoAYcP3/Wdhf/8Q=;
	b=duHDZAfpDgrqsbTZ9ETMmq3w7/1Fdecwk4Eo+ob8QVIhlRG5iZN0VjifVwJplQmOjb3Q
	 dTRd25nIxWduWt1Izd1ZOveGxoRcJkbb27zw0XW87NePEia2St0uRISrmG2FwA2ZCSFhi
	 npagRpksw9UaykmcoqqDfNKBejSw2YF1WlzVxvb6qAF1he5mfABJU0tYVmUMGr4H1GqTS
	 z6Gq8SiO9Ic8EwaVbsNzEtXgXCPim6Ty3LP6aJcgFcBBw7AH3pyymWg/mcJzAAm0Os9un
	 BSTvEWlHRsNhhmwADSNJNDqmZS4Zr8IfGd4fT0FCizMd67i6n7BfljmPZvxSeju5Vnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ND+FCYNY;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0FE606A330;
	Sat, 21 Nov 2026 10:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA0FE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ND+FCYNY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795255558; x=1826791558;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qG+vai3fUu9yq82SLlVtxqR29jLNXrTh+HjAdeNsHso=;
  b=ND+FCYNYe+fK27ugX50yXpFFOWsRi5fRAk4iax7crcKdSEb02YsUYHlJ
   SAMdRV+XSmON2NQsCyFfgjuQSgA8ydgb/XTXmkfICDCCO/TC8NaYTK2Ag
   FGfxZZOTMzvRAC7JCZhknatb5ab6EzHRg2bguhT6GdFwdpt4a9SgAo+Cb
   ju5GFy17Mom9xnLqGglzjrH5IlwiZ09jsHJE1SqcoxOAr/ZsQkuptZk9R
   6k6//9Z6Edh2Aj5C9DJ7VkqgAv41poc2PuBYcRqurdwld18FG9VioZMrA
   2GdvCqz0//uxmeGcHLT9S5sUSJPkrOItOwt4dvCdAJfxW18fM2E/uSYty
   A==;
X-CSE-ConnectionGUID: ZEOusycRRmS9uYkfm9VLeQ==
X-CSE-MsgGUID: ypTokMXqQ5CboA34s9+nNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3972586"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="3972586"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 02:05:57 -0800
X-CSE-ConnectionGUID: kfk3+Wu9TaWvjotOTxtLzQ==
X-CSE-MsgGUID: sVRUFlqfSHi/t6304uuvLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="12597887"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 21 Nov 2026 02:05:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUhyg-00000001JsZ-1trF;
	Sat, 21 Nov 2026 10:05:50 +0000
Date: Sat, 21 Nov 2026 18:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Brian Mak <bmak@nvidia.com>
Subject: Re: [PATCH 2/8] platform: dell: Move out of x86 directory
Message-ID: <202611211817.BLHa92e0-lkp@intel.com>
References: <20261121000556.173028-3-bmak@nvidia.com>
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
In-Reply-To: <20261121000556.173028-3-bmak@nvidia.com>

Hi Brian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d0f871bfb831705d9f55479f5b2b40f636ea7b16]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Mak/platform-x86-dell-Make-uart-backlight-x86-only/20261120-160547
base:   d0f871bfb831705d9f55479f5b2b40f636ea7b16
patch link:    https://lore.kernel.org/r/20261121000556.173028-3-bmak%40nvidia.com
patch subject: [PATCH 2/8] platform: dell: Move out of x86 directory
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261121/202611211817.BLHa92e0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611211817.BLHa92e0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611211817.BLHa92e0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/dell/dcdbas.c:103 function parameter 'size' not described in 'smi_data_buf_realloc'
>> Warning: drivers/platform/dell/dcdbas.c:284 function parameter 'smi_cmd' not described in 'dcdbas_smi_request'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'dev' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'attr' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'buf' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'count' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'nb' not described in 'dcdbas_reboot_notify'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'code' not described in 'dcdbas_reboot_notify'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'unused' not described in 'dcdbas_reboot_notify'
>> Warning: drivers/platform/dell/dcdbas.c:103 function parameter 'size' not described in 'smi_data_buf_realloc'
>> Warning: drivers/platform/dell/dcdbas.c:284 function parameter 'smi_cmd' not described in 'dcdbas_smi_request'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'dev' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'attr' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'buf' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:316 function parameter 'count' not described in 'smi_request_store'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'nb' not described in 'dcdbas_reboot_notify'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'code' not described in 'dcdbas_reboot_notify'
>> Warning: drivers/platform/dell/dcdbas.c:615 function parameter 'unused' not described in 'dcdbas_reboot_notify'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
