Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A633E1206;
	Wed, 25 Mar 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448942; cv=none; b=Z8gH0uq9n6ihx2bmHFCRoiOMm8LoUnK58T68uZLjaM96cdrFtDu7eae+I4TrBHo3XsC9m2Pg8wbsxK0OT7bCQJZ6oVRCi/pkJyBck8CM5/zenB2GzTzT6pLyI+O327I5r5RPUP2LjywPjSmHHl126tb2JH55ZXsGF3QlW4FGy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448942; c=relaxed/simple;
	bh=ObVcg9Az6aWl7w8xQglDyUMIegIcZElb95yo2tp5zRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GapyhsAb1WngnIb+ahLWwxtgxlGxsh6YJsiDccibSceyhyi3eNi9nT9biG9UGKoUpf6bIglaoepmDrG5O09KqrvKZrYqRt4EESsll/2KiQHOGyBHuh8vwbI0SRouPY+Akrg9EIg0Z2Y+fsBs3dvKoMl5hAFSSG1Qxq+uDHCpXaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEdq7Vpz; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEdq7Vpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774448938; x=1805984938;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ObVcg9Az6aWl7w8xQglDyUMIegIcZElb95yo2tp5zRc=;
  b=kEdq7Vpzw6ZssYKvbeZPHclEf1fhc4qRTezBkSVXeAMW7iguhmmND5aW
   gHT93iXkGakm2BOmFoman3CzEVX9lO2GdjKAhv/O10ec7K6s5kpGJE2dw
   fslah8ZnZtOJkl4F+Nsj5E4QZawmrJzg12NBVaMqMh82nVyBlNefZ0ZvJ
   d2CKwDfN/VKSERPdUNECr3+y7y9fbyNkvRJE/zA3SH9DgQVP1AwPvLa6d
   7BF4BIIqbJA/wfVRHbZWi3GnVBuM2a0HbmPpthQzi7S85Doi7G1S4fjS0
   PtXCUssdTVLb4ASZLMDcMBCSZW0FW3Q2LGDSdjssn2t8oqj1recVlfFCV
   g==;
X-CSE-ConnectionGUID: BuXrkBa7TRWqQ0RlcDWZ+Q==
X-CSE-MsgGUID: vkGkq8YNRGGxNpxsEZ1TZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74516362"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="74516362"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 07:28:56 -0700
X-CSE-ConnectionGUID: rvY5SkghQRWufj8rC5J7Lg==
X-CSE-MsgGUID: KwG3LDSfQUGugL9HoWOxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229635308"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Mar 2026 07:28:53 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5PE2-0000000073V-2lv8;
	Wed, 25 Mar 2026 14:28:50 +0000
Date: Wed, 25 Mar 2026 22:28:48 +0800
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
Subject: Re: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
Message-ID: <202603252259.gHvJDyh3-lkp@intel.com>
References: <20260324221032.1333636-9-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324221032.1333636-9-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Move-LWMI_FAN_DIV/20260325-070851
base:   linus/master
patch link:    https://lore.kernel.org/r/20260324221032.1333636-9-derekjohn.clark%40gmail.com
patch subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
config: i386-buildonly-randconfig-006-20260325 (https://download.01.org/0day-ci/archive/20260325/202603252259.gHvJDyh3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603252259.gHvJDyh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603252259.gHvJDyh3-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "lwmi_cd_match_add_all" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
>> ERROR: modpost: "lwmi_attr_id" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
>> ERROR: modpost: "lwmi_cd00_get_data" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
ERROR: modpost: "devm_battery_hook_register" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
>> ERROR: modpost: "firmware_attributes_class" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
>> ERROR: modpost: "lwmi_cd01_get_data" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!
>> ERROR: modpost: "lwmi_cd_fan_get_data" [drivers/platform/x86/lenovo/lenovo-wmi-other.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LENOVO_WMI_TUNING
   Depends on [n]: X86_PLATFORM_DEVICES [=y] && ACPI_WMI [=y] && ACPI_BATTERY [=n]
   Selected by [m]:
   - LENOVO_WMI_GAMEZONE [=m] && X86_PLATFORM_DEVICES [=y] && ACPI_WMI [=y] && DMI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
