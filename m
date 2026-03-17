Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E489D36EAA9;
	Tue, 17 Mar 2026 23:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773791218; cv=none; b=L94uCma14U8WDc+++7DISC+29Qg5mx3/JG9prDrvMn7fJnbR8bZ5tcILuFFElrt0Gg19/yj8zOCsFaqjWUeGykSz/PDp+UgFeK0qIcjxBIpBPhp5O7IqzTEnM22qSbJx8EFfPrvAXKUunMO1saaJZdJz45pM0j+ccH46/RDEzyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773791218; c=relaxed/simple;
	bh=FQzltm8VRbLHlAi0zXQNpzMJqko0iAfBE+XyTUOtrEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzJJWlm70NylL2mJdyZdytw1eGWK6cBHu8MsBAKy+a2bNmCRGmp4Ctm1cmf5ZKqeqwlQSR+amPskmQT346l3bFVDaJw4oqW6wXKY0E8crRTRWjA3jUUXM7NN748I07pr0RrQELW6UhjuEM8lhuYmGo7GibMUN5iGUf3tonCjcx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ROSTIgEt; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ROSTIgEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773791217; x=1805327217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FQzltm8VRbLHlAi0zXQNpzMJqko0iAfBE+XyTUOtrEg=;
  b=ROSTIgEty0VMLkjWnjJ6auw4bhlGGwCSeFs9ZhbkpicUHLIJMY16I/vG
   NF/BdK6wqlkfbQY++YH5Ub3GH7L9yenvq12YwIMsYi1w6+tfw2TNgyc3V
   ovuPiigwWUpVtN+mP7zNRxo3yo6u63v/O/hp+dbKt9FTVw3FiIv3m7wVX
   iqJL2f/ZPQ3NQBNnzOcYMp5RdK6GM6a3agqgRgM2h/JrdXmwaJe6GfGQ4
   llRz6H3qKDSN1PU/+vFah9ntpNZJtVW8+ILUM5QCvmcy3xOcfCBAV68JZ
   ifO4aGQr7kxq32CHZ3ikunO1ETsJbC6ImMdnNPGHNOmwSl9HR8BSt3td4
   w==;
X-CSE-ConnectionGUID: 10FNbW33R/OX0KoPtWXciw==
X-CSE-MsgGUID: NkO2bQjbSVuGy+qFghvmgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92409666"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92409666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 16:46:56 -0700
X-CSE-ConnectionGUID: t24x8uh7Q5yY7ACc22FInA==
X-CSE-MsgGUID: SWtBYYJHTd+Ij/wNw7IqXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="247011460"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Mar 2026 16:46:53 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2e7f-000000002BJ-0Eri;
	Tue, 17 Mar 2026 23:46:51 +0000
Date: Wed, 18 Mar 2026 07:46:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
Message-ID: <202603180742.oHHUR1NX-lkp@intel.com>
References: <20260312031032.3467565-9-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312031032.3467565-9-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc4 next-20260317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260312-111508
base:   linus/master
patch link:    https://lore.kernel.org/r/20260312031032.3467565-9-derekjohn.clark%40gmail.com
patch subject: [PATCH v4 8/8] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
config: x86_64-randconfig-003-20260317 (https://download.01.org/0day-ci/archive/20260318/202603180742.oHHUR1NX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180742.oHHUR1NX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180742.oHHUR1NX-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_battery_hook_register" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
