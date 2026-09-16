Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB13311968;
	Wed, 16 Sep 2026 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582467; cv=none; b=VYIFQ0oBCPrOa074iinoz1xeeupvf5OY9ynhINrTyfNbIbW5xLxhUdAl6OL9IqhA7AyRh6evKKyv2o89vzKp8qQnvI2HIL34Q13JZa39NiE+n2asfGXr8P46E5m7qAl4QsnodW9qrQErxUqo3fbrXUviD1FluisSLsn2qg4zEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582467; c=relaxed/simple;
	bh=r45PeIbjPkk6N3Hj7iguNRFQ37wAo6M615DnQc/zxBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n8Sh5tZG4DJ4sHx/JwrMc/mGBcgnO78ijna5JXTOD05qHRteJ52XHc948pD+DmattLcrdrx6BD39KXcvywr3nSjiKDIhwkm6BHi8pqeolzLiDFBNspxBt5sbkV9IzEiY1W35uFxmnS6OscmL5va4qw8nnCoJJy4bPsmf+yX7XaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVv0Ndb1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVv0Ndb1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789582461; x=1821118461;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r45PeIbjPkk6N3Hj7iguNRFQ37wAo6M615DnQc/zxBs=;
  b=fVv0Ndb1VuUV1q98J2AOyL38WiLLdcRXX9BCjD4az/mcx3+l3bUxaus3
   zpsfkt6P76PFoltlRycervWoppmmG5Llr1vavpRD8pFBN5w6rsOu70b4B
   72Qj91PcwNIKm5igAgXgW4i/gIgf+HZs88itl/lkPcVmvhioyTdrwf4hN
   7H2iDi7b+CPk0zmdittwRID0LEUx2Yt7Y8Bij0iiFOzNZXhR8ulDQaveT
   Q4jPsYOzC5E/nRHD9IALhKnbgF2LdHYzNNfgb9iOgg+LfHQW7DjwmMUwO
   wiQGxrbs26UuhDaflGq7Ccbto+Bb0Dv4OOhRHAHbybVeqUHFgrVy0paYU
   g==;
X-CSE-ConnectionGUID: uEF7xBkeRDCjF/XyxHMNkQ==
X-CSE-MsgGUID: 70AEauH7QiKca47iStRKkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100632543"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100632543"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:14:00 -0700
X-CSE-ConnectionGUID: XEhmu1rIQdW/HBplDvfIbA==
X-CSE-MsgGUID: 5MYNZ5GtTviMHy//vW3MTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1636980"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 16 Sep 2026 11:13:59 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6u8p-000000006XR-2RQ6;
	Wed, 16 Sep 2026 18:13:55 +0000
Date: Thu, 17 Sep 2026 02:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Asai Neko <sugar@sne.moe>, Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, Asai Neko <sugar@sne.moe>
Subject: Re: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Message-ID: <202609170237.IYNujwsM-lkp@intel.com>
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>

Hi Asai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 587858367581b9c55c3690f4e63382ad622719d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Asai-Neko/platform-x86-asus-wmi-don-t-warn-when-LPS0-is-unavailable/20260916-003256
base:   587858367581b9c55c3690f4e63382ad622719d4
patch link:    https://lore.kernel.org/r/20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9%40sne.moe
patch subject: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is unavailable
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260917/202609170237.IYNujwsM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609170237.IYNujwsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609170237.IYNujwsM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from drivers/platform/x86/asus-wmi.c:16:
   drivers/platform/x86/asus-wmi.c: In function 'asus_s2idle_check_register':
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:564:16: note: in expansion of macro 'KERN_WARNING'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   drivers/platform/x86/asus-wmi.c:5428:17: note: in expansion of macro 'pr_warn'
    5428 |                 pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
         |                 ^~~~~~~
--
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:195,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/barrier.h:5,
                    from include/linux/list.h:11,
                    from include/linux/resource_ext.h:9,
                    from include/linux/acpi.h:14,
                    from asus-wmi.c:16:
   asus-wmi.c: In function 'asus_s2idle_check_register':
>> include/linux/kern_levels.h:5:25: warning: too many arguments for format [-Wformat-extra-args]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:564:9: note: in expansion of macro 'printk'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:12:25: note: in expansion of macro 'KERN_SOH'
      12 | #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:564:16: note: in expansion of macro 'KERN_WARNING'
     564 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~~~~
   asus-wmi.c:5428:17: note: in expansion of macro 'pr_warn'
    5428 |                 pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
         |                 ^~~~~~~


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
