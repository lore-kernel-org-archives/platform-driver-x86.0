Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B9731A567;
	Sun,  1 Mar 2026 15:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772378900; cv=none; b=EFbZaWCRJfhVoPX4TyS6sHB1RDplPhRVCFHujr3XT4qwUoXMgt5McrkV9PddS4sCt5f1vS85bkVRSAaeBCLa+VKE/ety0CdLVRpY1ga38scjvbsrNi79ZL4sdrTp4U9pDLr9jGOtxuSX9TwejQP4aqhpAKhf6QXho/l2+dUQQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772378900; c=relaxed/simple;
	bh=RsvUPthWA/MTUCpG/0kXMnn6bWz5sxvytb3HH++IFqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTplwOQ2yKx+cBIQs0lhSEiziqT4m/gEh27Oz+UJLMLUNWPZ7F7Onp06b9PQGe0JILFP93vkiP1teOuXVfejO7Hjpv9n81LTnhd9INIUbvPv35yWlGkMqh6COSy61+BAu+Bhsd4qBvfOcW7CWcG53KBFW3t3+C6g6U8eUMd8GaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7fZFJkm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7fZFJkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772378898; x=1803914898;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RsvUPthWA/MTUCpG/0kXMnn6bWz5sxvytb3HH++IFqA=;
  b=P7fZFJkm7fmhM4eg1VQkA2+ORqP1ANhae7p4wqCZ9mh98PEN25oZ4gd7
   Fj53apaEwRyoIsxtmchGqeRNej+jA+GLrGgy9ig14JnRbcF7ItWjbzqoJ
   70Chz+YBt03biTVH8m9hsSh78+Vqf0B2xfLusbNTCyG+RXLtkhY+4dQD1
   4CCGam+shja0LG98dVew0FO9P9pChSwAVOF2j9DIrojgZ7Vpqj8qyL/G3
   RTMGG3E3Lk78HJXWhADCJPK+TOBoqPit1v2IiPBfQTVkumRL/BVOSCKbL
   o3SJ98zFFzxRbJO9xfG8FHpXLU/gki4d0I8nBcVXKrCbUxU7qRVUOTDcX
   w==;
X-CSE-ConnectionGUID: k2YUiBRIT5KH7pq++dtQsA==
X-CSE-MsgGUID: twrxAEanQLqZk1OMppgsaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84036170"
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="84036170"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2026 07:28:17 -0800
X-CSE-ConnectionGUID: 1NouxMwOTgKBzk5rrNe+FA==
X-CSE-MsgGUID: IzNIf5Y2Tr6D3YPI6K2jQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,318,1763452800"; 
   d="scan'208";a="217505437"
Received: from lkp-server01.sh.intel.com (HELO 59784f1c7b2a) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Mar 2026 07:28:15 -0800
Received: from kbuild by 59784f1c7b2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwiiK-000000001Wr-0HPM;
	Sun, 01 Mar 2026 15:28:12 +0000
Date: Sun, 1 Mar 2026 23:27:16 +0800
From: kernel test robot <lkp@intel.com>
To: edip@medip.dev, ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
	kuba@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Edip Hazuri <edip@medip.dev>
Subject: Re: [PATCH v3 2/2] platform/x86: hp-wmi: Add missing LED Kconfig
 dependencies
Message-ID: <202603012320.cgNlkkjB-lkp@intel.com>
References: <20260228122143.119571-4-edip@medip.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228122143.119571-4-edip@medip.dev>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/edip-medip-dev/platform-x86-hp-wmi-Add-missing-LED-Kconfig-dependencies/20260228-202855
base:   linus/master
patch link:    https://lore.kernel.org/r/20260228122143.119571-4-edip%40medip.dev
patch subject: [PATCH v3 2/2] platform/x86: hp-wmi: Add missing LED Kconfig dependencies
config: x86_64-rhel-9.4 (attached as .config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260301/202603012320.cgNlkkjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603012320.cgNlkkjB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: recursive dependency detected!
   symbol LEDS_CLASS depends on NEW_LEDS
   symbol NEW_LEDS is selected by SENSORS_APPLESMC
   symbol SENSORS_APPLESMC depends on HWMON
   symbol HWMON is selected by HP_WMI
   symbol HP_WMI depends on LEDS_CLASS
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
