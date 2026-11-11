Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406507;
	b=syGqxFt2btH8YVkK/jk8MOIUxp3W3NCXFOUNc4QS42ODy3izSVl/OusMh3kVs6Hq+sv2
	 ADQ9ldfCx5JSk1lQ1Yu2plOx/G9j6j1tSp+x+y7UENVTh89buT/oh+Nf+1zhVP8kORjsy
	 ZVrxdhmyOXj5p6H4RqeDADfLAaJvrrEn6tC9+POt80VgrmVY8wLIy/YEFSHtRqxkVVCly
	 q5nXGq5O3jKMrHNiBLvMnEigkdj5LXCGYOONAiT2KvyFGP4md1TBNJ2CNQhL32Vio4Jo7
	 unwI2uc/TjV7S+ar1SzY4d9AnP96xQ84ihmwQRslJTk7H+Ob1EQvfycbpGyLDj0wgjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=J3Tue/ZLHAgSzuWbvVH0tsrTuJrMXHztDIZMIkXXHcI=;
	b=NqDFdTQ6teMwJbkcsrSd8tuRYdhFBO9qQki2vdI52WOm1/IhJFtoytrh2hnCU+BXc/Bc
	 JwkgzrgVyeBLs4+9OoheudoAptNWirPMo2MGE4q30vU4AjYAzMZVcqHEsfGecl1nHbyHb
	 qxPziZ1OGhJaR6kYI+EQi2CXtpGbdIPo/G/cuvSh/WbU35vreThZQOCsa9tFyNzjdCbFU
	 RPevFisfv+JWt8ydS6b/WU/Jh1ysUL8ZoNskbug6je9/Lt9X2B6Cho26FWX+65akuSqX3
	 CAwWQGb1DyXC9vyLg62n3UaFrdzPOQEDHfyACEvphm1dBlorenfsLmoOg7zVUplK/9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=my2wfBC7;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB08606A331;
	Wed, 11 Nov 2026 14:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADB08606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=my2wfBC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794406506; x=1825942506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eKKzkAz4Zsnjbeu0gBKUfPz+wZ8ad4WChmT3hoPCUNo=;
  b=my2wfBC79niO93Odpt9DyquoEXEheroOH5weSkUR4Iej6C/IiHt3vUrW
   qv+gcNPSHry7rIRUqAjduUFUef5GjrtU0xiUKGlU0EeHFW6Zw/Uad39LT
   jDs545vWk0OkpQAIGPFdVauZaFSIYLlRCypQpX/q7llEpyJLCUCPaJOiS
   Lbu8GLFtXXpwYFeiT6y35LXGvma/XfmA5dMdAgpwQFhb0Qt8BfDOnbN88
   P2WW2pVx+1OfFpff+BEsMtV25rYHXx+o45bpu2a+xJipmF1mpP+ALVBC6
   wAEKLXwJYkSXfFTezDTleDaBqRwVM07TYR9PhtLTDfj9o+eXhdC8lt/qo
   g==;
X-CSE-ConnectionGUID: l478hWuPT9OaFHHKDLLj/g==
X-CSE-MsgGUID: zl/jchOwRZKsJYqVWwPBSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3175605"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3175605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:14:58 -0800
X-CSE-ConnectionGUID: 0rS2UZD0TXOhrUP5jCAB3w==
X-CSE-MsgGUID: lOTieGtfRRmELSBLwF7gxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8424150"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Nov 2026 06:14:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xR96E-00000000yzb-0hkb;
	Wed, 11 Nov 2026 14:14:54 +0000
Date: Wed, 11 Nov 2026 22:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Marshall <pm@petermarshall.ca>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH] platform/surface: platform_profile: handle fan standby
 state
Message-ID: <202611112200.LGfh2iNB-lkp@intel.com>
References: <20261111020916.3557508-2-pm@petermarshall.ca>
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
In-Reply-To: <20261111020916.3557508-2-pm@petermarshall.ca>

Hi Peter,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.4-rc2 next-20261110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Marshall/platform-surface-platform_profile-handle-fan-standby-state/20261110-210916
base:   linus/master
patch link:    https://lore.kernel.org/r/20261111020916.3557508-2-pm%40petermarshall.ca
patch subject: [PATCH] platform/surface: platform_profile: handle fan standby state
config: i386-randconfig-1013-20261111 (https://download.01.org/0day-ci/archive/20261111/202611112200.LGfh2iNB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112200.LGfh2iNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611112200.LGfh2iNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/surface/surface_platform_profile.c:103:12: warning: 'ssam_fan_state_set' defined but not used [-Wunused-function]
     103 | static int ssam_fan_state_set(struct ssam_device *sdev, enum ssam_fan_state s)
         |            ^~~~~~~~~~~~~~~~~~


vim +/ssam_fan_state_set +103 drivers/platform/surface/surface_platform_profile.c

   102	
 > 103	static int ssam_fan_state_set(struct ssam_device *sdev, enum ssam_fan_state s)
   104	{
   105		const u8 state = s;
   106	
   107		return ssam_retry(__ssam_fan_state_set, sdev->ctrl, &state);
   108	}
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
