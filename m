Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794432421;
	b=fl8R0qQf4kDYhdomwdIlV1m3vW3fcc0XxsKEizRfIKvuPMIPpx4Kn3MohI+8Macal08H
	 fWwUbZ7bYOagdiMIzHiHa7flyLMHDkgW5UAbFZkYSlCFhNj4SkdVYwlBaNTYPetoEdhR2
	 Eq+KcbrNo5uHLnUOstTH9gSxJdTQNlF5d30iaMA4YG06mKlvrowBATEYTDnUUvoB8I0M/
	 Gh5YE0hYuqeNsr/bdtovFa5QNpBAQGcd0fWj7g7G4/APNkJd9nipJTRUqWA5J8g+hYODR
	 3JG35Kg8jh7N2KGNpPYOxhRN9433BosmNuvF2qWDUfFZ5Bq/4fOMRoE4kEwuk4kDneg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794432421;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=u3+WvINjN2a5BUb9f0DV7gLMYKgjXRf58f/0Rul7fNs=;
	b=28IZOujMZDJtKJslwEkFvwJIgVTl4mf+pYZxY61NpaQkjAHNKa1Ro4ra8F4ph1BNa/s6
	 s4Cx55z5meicW9pHLsrz/p/+UQ07pp7UQOiUPXSqLa5eu3bvHsWlqK7dv84ThTAigwaSD
	 F2DW7wHr7X2r/X/T8LGpyv1kGC3JGoUvYalFOShY5M0Z3FXxKic1Fy7iruMz3U1gyTdn9
	 CVtaS+fb9XtR8Gd2OBeajHWIHXsn6Zzv9g5uQsrU7HJm2C5l8pHvqw6F9Wkm7p2eDXH3K
	 eOt3TVS8kEEVKWOwjnvw7WwX9y7LUL/x5jopVi3zL3YV8EmVHpvWp+a+eeqbB8kFY8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eRMhAtog;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D83B606A327;
	Wed, 11 Nov 2026 21:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D83B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eRMhAtog
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794432421; x=1825968421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=udo0vbSSWRcZX5jnygNE5yspGvO38rys8qMq0Qol2qQ=;
  b=eRMhAtogkROicWvxg4GAxhDeskRrfcmsvYw0t7UqVSRDaiJt/cG4vfzu
   mqzvLUPVP2bsI3oZTnJ6XT9AiDxKb2tD9/Z4ZBYQHm9okInsccbrFT5oK
   SGK7uFY0pCaNqoC7toWq46YNNJi+1biFCWV95VABcZPw19LkQiLs50nua
   dTLYtiF20hu1FsErPYmViIM+Ci5qBate816neyvpWtR6Ga4DehmspdJd9
   Yc0Infj5ao5RLphemRU9ac1DGK8nIEc7/3z//+PlQR3ty3ry2J9TQ1NtW
   Qs9QVgCcf3ZP2rgqM/ec8x7yyi9xzkQcTnMNQVutKjt0nW3KION4Rw4y1
   g==;
X-CSE-ConnectionGUID: LnpyCwfRRyGOuAYTJ2ue1w==
X-CSE-MsgGUID: ArRDj02gTAWjIgK1zgtAJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3130230"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3130230"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 13:27:00 -0800
X-CSE-ConnectionGUID: F/bCdLjURl+jFqe5qLJuAg==
X-CSE-MsgGUID: JmvdEdEoSDC7srVHgqdwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8382267"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2026 13:26:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRFqI-00000000zmN-3ZEF;
	Wed, 11 Nov 2026 21:26:54 +0000
Date: Thu, 12 Nov 2026 05:26:35 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Marshall <pm@petermarshall.ca>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: Re: [PATCH] platform/surface: platform_profile: handle fan standby
 state
Message-ID: <202611120527.xw8ZORYY-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261112/202611120527.xw8ZORYY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120527.xw8ZORYY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611120527.xw8ZORYY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/surface/surface_platform_profile.c:267:6: warning: variable 'status' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     267 |         if (tpd->has_fan) {
         |             ^~~~~~~~~~~~
   drivers/platform/surface/surface_platform_profile.c:273:9: note: uninitialized use occurs here
     273 |         return status;
         |                ^~~~~~
   drivers/platform/surface/surface_platform_profile.c:267:2: note: remove the 'if' if its condition is always true
     267 |         if (tpd->has_fan) {
         |         ^~~~~~~~~~~~~~~~~
   drivers/platform/surface/surface_platform_profile.c:263:12: note: initialize the variable 'status' to silence this warning
     263 |         int status;
         |                   ^
         |                    = 0
   1 warning generated.


vim +267 drivers/platform/surface/surface_platform_profile.c

   259	
   260	static int surface_platform_profile_pm_prepare(struct device *dev)
   261	{
   262		struct ssam_platform_profile_device *tpd;
   263		int status;
   264	
   265		tpd = dev_get_drvdata(dev);
   266	
 > 267		if (tpd->has_fan) {
   268			status = ssam_fan_state_set(tpd->sdev, SSAM_FAN_STATE_STANDBY);
   269			if (status)
   270				dev_err(&tpd->sdev->dev, "pm: fan standby notification failed");
   271		}
   272	
   273		return status;
   274	}
   275	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
