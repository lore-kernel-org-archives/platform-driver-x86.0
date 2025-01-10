Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EFD20A5C8;
	Fri, 10 Jan 2025 21:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736545517; cv=none; b=AGOoWhkaZot98QWy+E9gzAr8SoAYZTqNlQeywekB2DPLEVwAEuyZYSRKyN9prOqmNaMMRJ/e2Q0U8xonAsOyULnrmtQ9WYLaoeeH5kWsF08SfzA4mDnwoOZejzHMWO9MqFRAwsOtAYvmj9pYMfQ+OEvRkYi+38isYNBXdZ0KftA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736545517; c=relaxed/simple;
	bh=xJ9ceeeueJluSqw8A81wHH2lzb+kbQCceW1Q4h1ZH1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vw7aXA9+fngT7dBY77GZbDsP1KnJcQtOxkESvmcVpUP1widLqsy1wxZuU9DyQaijo1EFKrddTKnpkjWz6cYyAHC5gf+x1g4AdovWNOY/RZ3SzkTURCa2+1FRqyb2Xlu5Sp6FiiUR2hq6ZFNhu2GBd3rNuDIGaF1w/ObaT4nvqN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TM+4UqQE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TM+4UqQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736545515; x=1768081515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xJ9ceeeueJluSqw8A81wHH2lzb+kbQCceW1Q4h1ZH1Y=;
  b=TM+4UqQECH0JkDC1knHYhs7xXNxYldiXKL/rkmcOzNtBLIFmxTnp/Wmo
   x6ya+LC4QPWCem6bOP1jRH5fVIAXb+juSJq4gvb+LZAiwOct3gmPfyxOb
   xtzCUOkGEbUNNTUQtepsyQ+skf6GRup2TI4IoEPKA7E3DFV5qjAZNUsDn
   Awkfk9e9ewvEPXZiMAoFH7Y0IQ0q9rmFZ5X+px5PH/RqmesUXdE10gY+J
   w4ilbKUiLJN+QvXS15OUtYdqKu911ZWg9Qdh5r+s8bzD1G1r/A4OmBMu8
   d1PK44SZ9GPrfcK9DCMklVeU3b7eq74xtGFExsKIqyLB0HkpjYG+TdsS3
   Q==;
X-CSE-ConnectionGUID: 2/DYJ1ZUQqe6ipfXWduLoA==
X-CSE-MsgGUID: IFtC5L9lSa+mmkrkOP/X8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="24460188"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="24460188"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 13:45:13 -0800
X-CSE-ConnectionGUID: HramPdvaShmQkYBvamrh9Q==
X-CSE-MsgGUID: ZRGQhrpJRAWJ07uqz520og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127134376"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2025 13:45:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWMoX-000JmR-0N;
	Fri, 10 Jan 2025 21:45:09 +0000
Date: Sat, 11 Jan 2025 05:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Grisham <josh@joshuagrisham.com>, W_Armin@gmx.de,
	thomas@t-8ch.de, kuurtb@gmail.com, ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Joshua Grisham <josh@joshuagrisham.com>
Subject: Re: [PATCH v5] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
Message-ID: <202501110509.FukyduTN-lkp@intel.com>
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
config: x86_64-randconfig-077-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110509.FukyduTN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110509.FukyduTN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110509.FukyduTN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_profile_init':
   drivers/platform/x86/samsung-galaxybook.c:759:36: error: 'struct platform_profile_handler' has no member named 'name'
     759 |         galaxybook->profile_handler.name = DRIVER_NAME;
         |                                    ^
   drivers/platform/x86/samsung-galaxybook.c:760:36: error: 'struct platform_profile_handler' has no member named 'dev'
     760 |         galaxybook->profile_handler.dev = &galaxybook->platform->dev;
         |                                    ^
   drivers/platform/x86/samsung-galaxybook.c:764:15: error: implicit declaration of function 'devm_platform_profile_register'; did you mean 'platform_profile_register'? [-Werror=implicit-function-declaration]
     764 |         err = devm_platform_profile_register(&galaxybook->profile_handler);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               platform_profile_register
   In file included from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:14,
                    from drivers/platform/x86/samsung-galaxybook.c:14:
   drivers/platform/x86/samsung-galaxybook.c: In function 'galaxybook_fw_attr_init':
>> drivers/platform/x86/samsung-galaxybook.c:1057:33: error: 'fw_attr' is a pointer; did you mean to use '->'?
    1057 |         sysfs_attr_init(&fw_attr.display_name);
         |                                 ^
   include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |          ^~~~
   drivers/platform/x86/samsung-galaxybook.c:1063:33: error: 'fw_attr' is a pointer; did you mean to use '->'?
    1063 |         sysfs_attr_init(&fw_attr.current_value);
         |                                 ^
   include/linux/sysfs.h:55:10: note: in definition of macro 'sysfs_attr_init'
      55 |         (attr)->key = &__key;                           \
         |          ^~~~
   cc1: some warnings being treated as errors


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
