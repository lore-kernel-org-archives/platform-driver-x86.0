Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBE315D5B;
	Fri, 13 Feb 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771023594; cv=none; b=s58BuJsGl5XzyUCTEAwul+QmMc2aT6MXpBy0rejQ/MrdfChXLZr0Lsrc/2mi/JuqRoADggsRGiaQ98NVzkof4J2lhQ1GEniEADsbRpkYHuZq5yK6sUTb5dvAeIl0D6T3LHKV1CP2UQ3EajE88Ab2diq8ZyCFDjY0jsUGC6Oaifk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771023594; c=relaxed/simple;
	bh=qML0Nd8SpJXbFma6GrKZKUPrYJ8nJ5+enIlspLn7Q7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqqIR0IedHCz5dCDWvkKTYcYZ7L5Z2mJbHPrK1q8NMEepzPe6y2dy0US9UY5VHngmqbJF0i/kasdyWtelQDGvJN9dYeGXifxVaUi9slJpBui7sm4zgboM9C58Yr71OxR3dLnsWzDFTKYOgAUIztZgnCcOkenQ8l/PUvMvG0GMxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WnA2EIGF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WnA2EIGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771023593; x=1802559593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qML0Nd8SpJXbFma6GrKZKUPrYJ8nJ5+enIlspLn7Q7g=;
  b=WnA2EIGFk6FSGMrlSWyCdp0WKZRJLkZxwgXj2QQbBzejSyn94nCde6bF
   TITNoY5iSHtBjwU5nz7QxJafyEbVfGUbHd3fEiGNeBO3ybiE1CSufc60/
   zwMJt03Fa8jVh/OJu5/VJmstNws+lp7XEpfuYw3Q/DHD2CzBuI4D8Ri0J
   lTCd7BbyTGsZVIuFhIcKkRBEzW/VSsLxTmMchTcx1nOp06wQlzU0FPz0K
   TgMhe4zLkWgNqZVqx4GvLzUnEsPA4oCiVZvqmNiTOyYQPDh/dQRuC61Ts
   qcmlF+7efdCsmWiGm43ULfxXbizqeCH+k+ywOcr+CYe8EYcCFyGBmYTvl
   w==;
X-CSE-ConnectionGUID: eQEZFJNjTMSUYELjfzM2Fw==
X-CSE-MsgGUID: imfjEkRbSNaHTCOrmqiVMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="97672928"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="97672928"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 14:59:52 -0800
X-CSE-ConnectionGUID: eSKSbor3TJS5yO0yvEpiVg==
X-CSE-MsgGUID: 0Kw5WoMOSwen17rfTMT4Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="213151501"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Feb 2026 14:59:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr28Z-00000000vsy-1Oow;
	Fri, 13 Feb 2026 22:59:47 +0000
Date: Sat, 14 Feb 2026 06:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting.
Message-ID: <202602140643.fEZnDqbv-lkp@intel.com>
References: <20260213081243.794288-6-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213081243.794288-6-derekjohn.clark@gmail.com>

Hi Derek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20260212]
[cannot apply to linus/master v6.19 v6.19-rc8 v6.19-rc7 v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Derek-J-Clark/platform-x86-lenovo-wmi-other-Add-LWMI_ATTR_ID-Macro/20260213-161603
base:   next-20260212
patch link:    https://lore.kernel.org/r/20260213081243.794288-6-derekjohn.clark%40gmail.com
patch subject: [PATCH 5/5] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
config: i386-randconfig-003-20260213 (https://download.01.org/0day-ci/archive/20260214/202602140643.fEZnDqbv-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140643.fEZnDqbv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140643.fEZnDqbv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/platform/x86/lenovo/wmi-other.c:600 function parameter 'data' not described in 'lwmi_psy_ext_get_prop'
>> Warning: drivers/platform/x86/lenovo/wmi-other.c:600 expecting prototype for lwmi_psy_prop_is_writeable(). Prototype was for lwmi_psy_ext_get_prop() instead
>> Warning: drivers/platform/x86/lenovo/wmi-other.c:641 expecting prototype for lwmi_psy_prop_is_writeable(). Prototype was for lwmi_psy_ext_set_prop() instead
>> Warning: drivers/platform/x86/lenovo/wmi-other.c:745 function parameter 'handle' not described in 'lwmi_acpi_match'
>> Warning: drivers/platform/x86/lenovo/wmi-other.c:745 function parameter 'handle' not described in 'lwmi_acpi_match'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
