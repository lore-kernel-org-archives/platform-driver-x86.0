Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E7B145A05;
	Sun, 15 Feb 2026 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771168846; cv=none; b=Qu6Tf9NmFCS6wz+rxtd6zSOZJ8JGEg8RPMf4i7yOTigGmCDRgnztd7FpWnruLyzIItWGXJxY29zKhe5CATWjMJ5zH0N4wV0H0zr6WgCNsXIJjiPw0d2VsuMffZC3AywMvWc+2IN85idbeNIuWokzV9jLlIABM4ei9Ogu21pqaOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771168846; c=relaxed/simple;
	bh=1vWLvK4Ti2M5mar8kUI+eDTU+U63QnCsglu5a2D4eRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5xw+F4P30PUA/TikA08NgN46t/zvsmSXT2BU8YTFKD48fJ9Q7TqYHqBeS7luwsvA/7t153SNxsQ1w+S8+DGYPOc5Bp2sCZq9+PublbSW5ZnqlcOU/BLlqyPfspEuQqU8IVz24GX8GP9OxLPTeycEclQ0BC/0ckK4miVOTg8GG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFO2NCo7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFO2NCo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771168844; x=1802704844;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1vWLvK4Ti2M5mar8kUI+eDTU+U63QnCsglu5a2D4eRI=;
  b=TFO2NCo7sJ08fY655KsT57g3blDdImFgkD4fnk6EbBXRuy2ntIs8zpGx
   Au0SORiv52zEXXeJxgaRTvU98gXt5QYeQigG+qoRUcMhYajolWpJAJVpn
   f8/eCxUZc2hHPKvMulemW5Esi4b/kEIGW0jOeAm3qsDoOk/BdmoWOB7Uk
   c8H7kGL70LhiVm3zAA63MHXmien1jNxVYl+LJIQos1/mSiXX6DckOGc7j
   yosnTtfj2j6MGpvVlApkigtnUuyx1k3KycJlXE78Fq/5PEUxkiYIyW2OP
   e6h9f3qZh4n1hWMqxvdNx+oG85slUHgjnT67STiunKmjM5DkQ5dXdqmB4
   w==;
X-CSE-ConnectionGUID: n/9F+o/sQsKPV8ggEePtMQ==
X-CSE-MsgGUID: 7JFyEytXTDi87QHD5Ni6yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="74875570"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="74875570"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 07:20:43 -0800
X-CSE-ConnectionGUID: GQTEggcNSZCiHfeUdl95YA==
X-CSE-MsgGUID: 0ZNtW5S8SRqOp1R6h5L+JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="218363807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2026 07:20:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrdvJ-00000000yqy-3Hhr;
	Sun, 15 Feb 2026 15:20:37 +0000
Date: Sun, 15 Feb 2026 23:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting.
Message-ID: <202602152344.7wTkiRM4-lkp@intel.com>
References: <20260215061339.2842486-7-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215061339.2842486-7-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on 5a5203a45b063a594e89a2aeaf9e4923893a5b4c]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Add-LWMI_ATTR_ID-Macro/20260215-141750
base:   5a5203a45b063a594e89a2aeaf9e4923893a5b4c
patch link:    https://lore.kernel.org/r/20260215061339.2842486-7-derekjohn.clark%40gmail.com
patch subject: [PATCH v2 6/6] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
config: x86_64-buildonly-randconfig-006-20260215 (https://download.01.org/0day-ci/archive/20260215/202602152344.7wTkiRM4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602152344.7wTkiRM4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602152344.7wTkiRM4-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `lwmi_om_master_bind':
>> wmi-other.c:(.text+0x4fbcbab): undefined reference to `devm_battery_hook_register'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
