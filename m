Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE793CB579;
	Sun, 23 Aug 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485803; cv=fail; b=W2xnjH8ODC9a09U96dpksCIg7x/GArNcN82/C/JGO0VeOPOS0fXoeubS9yk8zdIMp6ZD+FeZXU+9OwMW+ou3a1Fazto8YItOFYjSdfsKLuNSOxaZoEJf61hFoxi9EO3jIXRJBKbaO8zqHhdx1L5Cmpzsu5YX+xRPyzBaHAptcPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485803; c=relaxed/simple;
	bh=q6BHe7JySWAiZpoZs22HE5+mfAenPWNy7ynYENEeC2w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X8BxKU4KseRuJ2ptOLCFOGU+r9nVTzSBxbRxNORXS3s8vuNAURX+b0hxkQJZBIC7ZNSJ/XoVDAjkmZVheYws5ngvUaw0/V3urhjs1jMVTZKK9lxo/jrRq3EoYvICAENm7Xm03GpXEoYoDMsXZxk/vJ2dXUr73esr5WzR9SGcpUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knIvWoe7; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knIvWoe7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787485802; x=1819021802;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=q6BHe7JySWAiZpoZs22HE5+mfAenPWNy7ynYENEeC2w=;
  b=knIvWoe7b4G+e6k4A7pI2kvBBblZ9FJLKYKMdrfdfL+NlUzF7b48sZVE
   okkV1aEuekC5ZlwuJ10zGeIv3drdBpKIUCOoR540YWcxRYW1Y26NqjkDj
   tjyK4qn1dLuyK7kw4RfU2Kg5mj7Gkmxh7seC2r4CLzawExq8FQPwug/Rq
   lTHv0vjSVuWnGUq/5QZcVa+O99SSfnRpQg4qtqGeQdpe++hfmvQIr8/gO
   hQD0aBabTVpVrYkgE6O18kCzArPAltF38hjVIuJZs+gAtdL+hy1bOoBaQ
   TtFPxjCYYKPmJk/B7GyAdOcIrCYIaHEG1flnL40xAInLkqZtWIfKpCh7Y
   w==;
X-CSE-ConnectionGUID: VjMZJhk7RSWHqDgvP3X85A==
X-CSE-MsgGUID: WMOd/nqvTCq0gGIxMk85Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11883"; a="91634898"
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="91634898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:50:02 -0700
X-CSE-ConnectionGUID: TVDYSEYnTa6DE1hs9htnHg==
X-CSE-MsgGUID: I+5uXsYLTzugYLRnpuGQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,238,1779174000"; 
   d="scan'208";a="263499194"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2026 04:50:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:50:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 04:50:00 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 04:50:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2bGYXf3d9ioBf7jTbVoeuWNMKyqGhipcPkicL+tuO+vxWS4T8p5dZuyrykBi0F6YrZWTLwZBLF1h29TsjUPkolA9IBsvQNrGv0fjaCQhSsNxgSH05RxS5mDLR89CY8gQ6jOceElqc7MS3pHyFvp2CQgabI88ZyLbLlyu0cUX9ENvg+1acXDO725AR5PCmsptHAaEbMUM5QUeMm/K9hiZ5cc384ACu6AGKWDNHz6aHADnwsA/y/PbKYaphMp2k3D+DMwQf3EYlWTjOM2n4rNEJWHi3YXP5M2bmdArUVeGmFz4RZOziqY52Fu8cj/L5CtVrXc24TxepQx8dZsAPMayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9HggqmGp4kk6PbRJVA+vOYH7V8bQst7Uee6M4xcNS1U=;
 b=U8zYTGP97pzqegMWDQetJZfiVofRJGPj0GCi7m9i0OVh3J2E66Ep3KIMhYOPQEsMpwOZd36kr62W1QUBZemDsKo9/v7nKUOrStx0oAWQAunpQT9BqnoIF5BxIPrd/7WgQCNbeUIT0B3ElaNdqBasnE9LgsxsqnrIuPwgmabb6lSoac2hU20tYE4uND+DzA/w9D410DSu285vbzkoPWkBtfLWKWP0KsOSbEAg9g3raS7yTR/wY4ItzeLqCsz38aQX1mgjlokdhpf+dqbqGGSYuTzpgp7qfrawu/W14yrMgUqwvsg+psDnRUv59N4n44mqas57sN2/FWlm+NLcr0BA4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by MW3PR11MB4730.namprd11.prod.outlook.com (2603:10b6:303:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Sun, 23 Aug
 2026 11:49:57 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 11:49:57 +0000
Date: Sun, 23 Aug 2026 19:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: <kento@kekto.ru>, <platform-driver-x86@vger.kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, <hansg@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <W_Armin@gmx.de>, <qby140326@gmail.com>,
	<foxido@foxido.dev>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	KentoNion <mrKentoNion@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424
 thin-ultrabook perf-mode quirk
Message-ID: <202608231529.3fyLjqpt-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260816215825.289356-1-kento@kekto.ru>
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|MW3PR11MB4730:EE_
X-MS-Office365-Filtering-Correlation-Id: de787d1a-07de-4264-5080-08df010ca7be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|56012099006|10067099003|18002099003|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: x3lRrX888YyOKoZbXCl6Re0pIeS+ihDFh2zi2ktJJ8Ohm7YAkCD6wcgTfP/ZFqJ5O2GfkxrO5AVh+wF7Q+z+4BLl4VrlxIbgMWtOhkP5oPycduWMRAK0goaujFsglyd5jQLarT3ihFcVVzyF4vCMu6+xllXje1C9BY+5naJJCZ9UScbjhDnDrolCNDHpaVYG2E+OUHLLAEoj/NTZ9MFMSpRVUQ7Pp+feosAqJGkXk+v/wC0pu+QluLgpQaYZLzURgAkqPi9H1lU0dvzfROl4qa+VJM6kNOT3/P7aTd5bb04uRMsyKbzrgDAEp/AnBnVcZcp47ZO8DcASgNFHCO+h6hB82k8THNwB0xgvThkaDwp1NXltLNi6xiHU6yqL9rwe8z9mzxdB5BLXCkOrv/pupkIWVGkq8uomJ6BF0YZD7ssKB/+dfsfa0c0kCUWcxuoMW+94avaAE/SG+aF4fDgx1zrukYV3+CENRp5Ce/iw40+wDSKvMS0FtMHdGNPDK9qzCC4s6Nrjhr3Rlf2jHn9jjGmy7GZ+ufvK0WXk0bn2PYJLbT8t0hKEObgr7GIh6iTc/k6z31s17fuVEGh4rjkyFoSxNE9Eh0bvREpsIHixe5G9xtDq82+6KnY1g11Jg4e1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(56012099006)(10067099003)(18002099003)(11063799006)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5dqgNYFmJPQ9nysM7Srb7EInF6QdeqgrFLACeMi+b8JBPo9gcR3+8e21DqCr?=
 =?us-ascii?Q?ExqMsn0VuxOeZXyQuWoDt9KFe8AZC87VgLeFSNWWZTpySrVyE0YX8VDciAeN?=
 =?us-ascii?Q?bnUaMBY2ZcQeHHUvuntmcem3E8BNXXyWvog03eAQYhrg8hSp3lY1TudmKtiC?=
 =?us-ascii?Q?kxrkfSswZ+9hLPfI2sVUKJq1qSG5kMntYt1z8vuXiRqmxtcEiYwAp/3H5qdJ?=
 =?us-ascii?Q?1dw8haVmQupwzPobwsWGIGswbh2lzU9fdboJPO7k86ULOwkR26Hyk1LVVJTK?=
 =?us-ascii?Q?bzVLH6zLQzEdeIXiPQezHkAOcbbiXbjctrOQoCsfkUgc0oMeIgZpw4ls9bUM?=
 =?us-ascii?Q?l6MxsUpNxeBY7M3RyPQH5G3ifAQGSId54m5IitstLnnv/WaexhoFNr3qFOMs?=
 =?us-ascii?Q?St2Jy5bO8cJ1zk186VDCrwbhnloH9adHeUFb7c+DeQw/u9SgQvN21Kb/qsTE?=
 =?us-ascii?Q?vG/gf2MlZpepI1EA+sbzCZYIJTjVvsYc90BqlkBev13+385GQ9R/t3g/J+f5?=
 =?us-ascii?Q?O2b4MzsFwVE7i2AAt7Sm0DWRIWxf5jE22/ivwoVBPV9k/BaCs7g8fmU2Y3cC?=
 =?us-ascii?Q?HYQjYI1f2lOGMz4Ws/44XkvgD0SiS4j9Ob/0eNg/aZTeTCRhkPPQH7lc7xKd?=
 =?us-ascii?Q?HwACxBg6tBKZE6XYHXcOBeLhpUSTfQtfew/y+oa3lqTtBGjTLO2FMT/WNl8Z?=
 =?us-ascii?Q?JoFY7ryvCG2uONt0Hwz8T8BXNDTRh6mKlCL3P0pi9+bNuGx3W377wbXdcbv9?=
 =?us-ascii?Q?Au7hAIRulUBm+nMGbSaZVmif3o/w7aYkUbr5gaFmD/KrKRUlk18+FmgTSCJa?=
 =?us-ascii?Q?21Hupv974hoThJr7iwqeAaN+yKinrKx8/uy8Y6MTVANII+8o4FcCV/mjpxGK?=
 =?us-ascii?Q?+ysK9dUPRxKKkIKZ8iFQFlTwni6Tie8gIbZ2GHpZ84uUv9/dDYIlnoz3gPaM?=
 =?us-ascii?Q?q0UVBRQtnI/LxtXCmpz1VRrBODB5eSqgJiIp8PEJGj2u1LgUUajB52nFm5RZ?=
 =?us-ascii?Q?UEFFJfo2KuKceLVeh7EMJ1520FRC4NCh/G1uCE/sdiWdpQRjHa8MUvwqKiSh?=
 =?us-ascii?Q?AgRPpLl3AJwcIjMcDXjzE55v4GIha5TvXYdKpBie5YCR1S1EXyPyXkK6V48F?=
 =?us-ascii?Q?dkV4ZeZVS3UKlm/bw8xviDJsrAmn/vSKwehG/lduwBnBsnNr8cHMtjSPaZFY?=
 =?us-ascii?Q?eb+myX9zsXRvN3iJiacOm7ASc00JzZgX7Au27Zn6upwVkYyuPv01PWN+Paud?=
 =?us-ascii?Q?Sx2yOyAIfbRcL3EEdDmndBOfzK6a1NFOnwUZ1WRA8Uljjmbw7XetC1n2BdPN?=
 =?us-ascii?Q?/KmL1jHLM1fzjT+TYCnw+oKY4KbI+ZmdxXJN7Z4fCL4u4noYtkelFBP+QARN?=
 =?us-ascii?Q?WBKdNr9uo62bXU/CmZvIJMpgt8TyIBr3wYJaRu+vX3p9JOkjlUMAXuP51s2Z?=
 =?us-ascii?Q?EHeKORJESpXtKUTP5bC57OZbQROB4zB6xuiDamg/tP+CiCbvcw3DftMa2kQ5?=
 =?us-ascii?Q?4Bkr3fQMtpe6ZE18H+9R0PnBJwnjsmPlNXIS3F7Jv13bUdscDvZSgmiSWCWU?=
 =?us-ascii?Q?qlSJfPrid3e5kUaB/IYTlASLZs793ej2CY763aZl+3h1gHxrsNtLeEc/Qzmo?=
 =?us-ascii?Q?IqIj40j2r0Jg4GPvmBcHztWeUy+cFBy+z/4g1XPTV5EH4K1D8uKImzLhprFj?=
 =?us-ascii?Q?APPhiDS0v9auhKbmgsQryDXEfOJbjMqrY25CXyhJKcTiAHppMEdDu90EtwZT?=
 =?us-ascii?Q?XW7fHnjRGw=3D=3D?=
X-Exchange-RoutingPolicyChecked: NVmT1NTMFx40aFDNTXzagnoNx5zHl6Mcc7zhmRfR5XGHK3oOqYMIYB46ojyXL2wmxfNMA8Omp1x70kglwWeC4m8xYukiGdCDhpcNr73W7zv5FRB4eIKL8flA7QQ9swKgxCw9b3Vdr6CKFri2F5c71crucNGOpFjeG86G+AvTDenQH98qLNi2rUEVaN/Fod1nPlFqOF3FNcWPQLc+k/T9Z3KXumwO+W3c7yTY5xyVNH8w6cWr45Rp4oluXFfwyYiWV7TJBj+cJVXUzy538wlmuT388RAVsq8q1zFYY2501Zdlg1YDlnflnDITcIb/oyU+f3QFLHFrlKeWufe3uyXa3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: de787d1a-07de-4264-5080-08df010ca7be
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 11:49:57.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvhdpH+ziC5uIQ47NZzeydvUuEsduIGlXJnY7Sa3yxVbRn82Lk0wJUEIczz/8Iee92EoIUw/6zBLPMMljz+cCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4730
X-OriginatorOrg: intel.com

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kento-kekto-ru/platform-x86-bitland-mifs-wmi-add-TM2424-thin-ultrabook-perf-mode-quirk/20260817-005825
base:   linus/master
patch link:    https://lore.kernel.org/r/20260816215825.289356-1-kento%40kekto.ru
patch subject: [PATCH] platform/x86: bitland-mifs-wmi: add TM2424 thin-ultrabook perf-mode quirk
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260823/202608231529.3fyLjqpt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260823/202608231529.3fyLjqpt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608231529.3fyLjqpt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/bitland-mifs-wmi.c:743:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     743 |         &dev_attr_gpu_mode.attr,
         |         ^
   drivers/platform/x86/bitland-mifs-wmi.c:744:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     744 |         &dev_attr_kb_mode.attr,
         |         ^
   drivers/platform/x86/bitland-mifs-wmi.c:745:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     745 |         &dev_attr_fan_boost.attr,
         |         ^


vim +/const +743 drivers/platform/x86/bitland-mifs-wmi.c

dc1ec4fa86b2b8 Mingyou Chen 2026-03-23  741  
8bbb6b46df1cec KentoNion    2026-08-17  742  static struct attribute *laptop_attrs[] = {
dc1ec4fa86b2b8 Mingyou Chen 2026-03-23 @743  	&dev_attr_gpu_mode.attr,
dc1ec4fa86b2b8 Mingyou Chen 2026-03-23  744  	&dev_attr_kb_mode.attr,
dc1ec4fa86b2b8 Mingyou Chen 2026-03-23  745  	&dev_attr_fan_boost.attr,
dc1ec4fa86b2b8 Mingyou Chen 2026-03-23  746  	NULL,
dc1ec4fa86b2b8 Mingyou Chen 2026-03-23  747  };
8bbb6b46df1cec KentoNion    2026-08-17  748  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
