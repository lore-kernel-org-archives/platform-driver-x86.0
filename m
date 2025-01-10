Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AC8212B10;
	Fri, 10 Jan 2025 19:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736538493; cv=none; b=dCZaBrZ5M2YlQK4Ju/nQfDzjh4g8CoFL3pVaK3/5wYAvqSkqNnXf/0rCt5X9Om4ajbq/bRF4Ht4PDHDxKCOe//auVHVV7ZYiUDS/U/je9a9nNYAysMS4i6qltVYWNupdLRUgTm+0FtKEPDg6+jWzo4as1BcWb6XxtgGKCdq9iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736538493; c=relaxed/simple;
	bh=B2uoWu2YutxNQd2MGDzMMlwg1kAe/fY5lY7FYE/g14g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uIVniuDQQeKoGT7T0CcOj2tm8rWvAFu8pq5PN3qFS0j7NzpmHm3anoYItKD6i9xJpa/cn1VU4v8hnt5BCAcL+289Qq7rVcVb2IS5HHtI2rDd7E6tec7uONLFDF+ZqrofKaKMzm/upFM0w54ANTCtFirtfTBliwjSd8A+dbWkESA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=afBkVIQA; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="afBkVIQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736538492; x=1768074492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B2uoWu2YutxNQd2MGDzMMlwg1kAe/fY5lY7FYE/g14g=;
  b=afBkVIQAy5nHVVJzuBIDAcIrNnMddm1jXYK3dRNZXAn2OXpamzbxbrpK
   IDXz+J71njkgCbx639GdSNEszdPFaaXAu/twasr4N98AazTwFhPgFzODp
   1YoMCXTtCVY75d+TXpezUppe0Lj0YUVMgjI0hzgC3+lT7LRL9Y8vqMC+I
   aDfFyEPVzinKCtsrh1zPzpsusTvYStzS6NYPj+Yz5QPT1DRafeCoxOUkh
   S4CEG57pfsG6EKA840BW4bnynX5Patg1UPAH5wF6MibKmJX37aAIMObAH
   DohVcSThl0UA3gyqb3W++1Xep4GMooGLUIkI9/wFRzhL14S2VCn9ce+Gd
   g==;
X-CSE-ConnectionGUID: /cU2JWtCQ9GgyNM4a6Rd6w==
X-CSE-MsgGUID: t5gZmCOeTy21bLeR/fngIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="47420416"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="47420416"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 11:46:58 -0800
X-CSE-ConnectionGUID: L8dmkOpPRuyj8p3IQ88uuw==
X-CSE-MsgGUID: knpdQz3ERfi497EaxsmdAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104334874"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jan 2025 11:46:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWKy5-000JgF-0J;
	Fri, 10 Jan 2025 19:46:53 +0000
Date: Sat, 11 Jan 2025 03:46:04 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Grisham <josh@joshuagrisham.com>, W_Armin@gmx.de,
	thomas@t-8ch.de, kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <202501110304.zYo5hX2o-lkp@intel.com>
References: <20250109220745.69977-1-josh@joshuagrisham.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109220745.69977-1-josh@joshuagrisham.com>

Hi Joshua,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Grisham/platform-x86-samsung-galaxybook-Add-samsung-galaxybook-driver/20250110-061059
base:   linus/master
patch link:    https://lore.kernel.org/r/20250109220745.69977-1-josh%40joshuagrisham.com
patch subject: [PATCH v5] platform/x86: samsung-galaxybook: Add samsung-galaxybook driver
config: i386-randconfig-014-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110304.zYo5hX2o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110304.zYo5hX2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110304.zYo5hX2o-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/samsung-galaxybook.c:759:30: error: no member named 'name' in 'struct platform_profile_handler'
     759 |         galaxybook->profile_handler.name = DRIVER_NAME;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/platform/x86/samsung-galaxybook.c:760:30: error: no member named 'dev' in 'struct platform_profile_handler'
     760 |         galaxybook->profile_handler.dev = &galaxybook->platform->dev;
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/platform/x86/samsung-galaxybook.c:764:8: error: call to undeclared function 'devm_platform_profile_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     764 |         err = devm_platform_profile_register(&galaxybook->profile_handler);
         |               ^
   drivers/platform/x86/samsung-galaxybook.c:764:8: note: did you mean 'platform_profile_register'?
   include/linux/platform_profile.h:37:5: note: 'platform_profile_register' declared here
      37 | int platform_profile_register(struct platform_profile_handler *pprof);
         |     ^
>> drivers/platform/x86/samsung-galaxybook.c:1057:26: error: member reference type 'struct galaxybook_fw_attr *' is a pointer; did you mean to use '->'?
    1057 |         sysfs_attr_init(&fw_attr.display_name);
         |                          ~~~~~~~^
         |                                 ->
   include/linux/sysfs.h:55:3: note: expanded from macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |          ^~~~
>> drivers/platform/x86/samsung-galaxybook.c:1057:2: error: no member named 'key' in 'struct kobj_attribute'
    1057 |         sysfs_attr_init(&fw_attr.display_name);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:55:10: note: expanded from macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |         ~~~~~~  ^
   drivers/platform/x86/samsung-galaxybook.c:1063:26: error: member reference type 'struct galaxybook_fw_attr *' is a pointer; did you mean to use '->'?
    1063 |         sysfs_attr_init(&fw_attr.current_value);
         |                          ~~~~~~~^
         |                                 ->
   include/linux/sysfs.h:55:3: note: expanded from macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |          ^~~~
   drivers/platform/x86/samsung-galaxybook.c:1063:2: error: no member named 'key' in 'struct kobj_attribute'
    1063 |         sysfs_attr_init(&fw_attr.current_value);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/sysfs.h:55:10: note: expanded from macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |         ~~~~~~  ^
   7 errors generated.


vim +1057 drivers/platform/x86/samsung-galaxybook.c

  1031	
  1032	static int galaxybook_fw_attr_init(struct samsung_galaxybook *galaxybook,
  1033					   const enum galaxybook_fw_attr_id fw_attr_id,
  1034					   int (*get_value)(struct samsung_galaxybook *galaxybook,
  1035							    bool *value),
  1036					   int (*set_value)(struct samsung_galaxybook *galaxybook,
  1037							    const bool value))
  1038	{
  1039		struct galaxybook_fw_attr *fw_attr;
  1040		struct attribute **attrs;
  1041		int err;
  1042	
  1043		fw_attr = devm_kzalloc(&galaxybook->platform->dev, sizeof(*fw_attr), GFP_KERNEL);
  1044		if (!fw_attr)
  1045			return -ENOMEM;
  1046	
  1047		attrs = devm_kcalloc(&galaxybook->platform->dev, NUM_FW_ATTR_ENUM_ATTRS + 1,
  1048				     sizeof(*attrs), GFP_KERNEL);
  1049		if (!attrs)
  1050			return -ENOMEM;
  1051	
  1052		attrs[0] = &fw_attr_type.attr;
  1053		attrs[1] = &fw_attr_default_value.attr;
  1054		attrs[2] = &fw_attr_possible_values.attr;
  1055		attrs[3] = &fw_attr_display_name_language_code.attr;
  1056	
> 1057		sysfs_attr_init(&fw_attr.display_name);
  1058		fw_attr->display_name.attr.name = "display_name";
  1059		fw_attr->display_name.attr.mode = 0444;
  1060		fw_attr->display_name.show = display_name_show;
  1061		attrs[4] = &fw_attr->display_name.attr;
  1062	
  1063		sysfs_attr_init(&fw_attr.current_value);
  1064		fw_attr->current_value.attr.name = "current_value";
  1065		fw_attr->current_value.attr.mode = 0644;
  1066		fw_attr->current_value.show = current_value_show;
  1067		fw_attr->current_value.store = current_value_store;
  1068		attrs[5] = &fw_attr->current_value.attr;
  1069	
  1070		attrs[6] = NULL;
  1071	
  1072		fw_attr->galaxybook = galaxybook;
  1073		fw_attr->fw_attr_id = fw_attr_id;
  1074		fw_attr->attr_group.name = galaxybook_fw_attr_name[fw_attr_id];
  1075		fw_attr->attr_group.attrs = attrs;
  1076		fw_attr->get_value = get_value;
  1077		fw_attr->set_value = set_value;
  1078	
  1079		err = sysfs_create_group(&galaxybook->fw_attrs_kset->kobj, &fw_attr->attr_group);
  1080		if (err)
  1081			return err;
  1082	
  1083		return devm_add_action_or_reset(&galaxybook->platform->dev,
  1084						galaxybook_fw_attr_remove, fw_attr);
  1085	}
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
